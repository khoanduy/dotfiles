local M = {}

function M.get_java_module(path)
  local dirs = {}
  local mpos = 0
  for dir in string.gmatch(path, "([^".. "/" .."]+)") do
    if (dir == 'src') then
      break
    else
      mpos = mpos + 1
      table.insert(dirs, dir)
    end
  end

  local name = table.concat(dirs, '/')
  local sed_cmd = string.format("sed -n 's/<artifactId>\\(.*\\)<\\/artifactId>/\\1/p' %s/pom.xml | head -%d", name, mpos)
  local modules = vim.fn.system(sed_cmd)

  local lines = {}
  for line in string.gmatch(modules, "([^".. "\n" .."]+)") do
    local trimmed = line:gsub("%s+", "")
    table.insert(lines, trimmed)
  end
  
  return lines[#lines]
end

function M.run_maven_test(args)
  local file_name = vim.fn.expand("%:t")
  local pane = vim.fn.system(string.format("tmux list-windows | grep '%s' | awk -F: '{print $1}'", file_name))

  if tostring(pane) ~= "" then
    vim.api.nvim_command(string.format("!tmux respawn-window -t %s", pane))
    return
  end

  if args == nil then
    vim.api.nvim_command('echo "Please specify \'\' if you don\'t want to use extra args"')
    return
  end

  local path = vim.fn.expand("%:p")
  local cwd = vim.fn.getcwd()
  path = path:gsub(cwd .. "/", "")

  local dirs = {}
  local is_test_file = false
  for dir in string.gmatch(path, "([^".. "/" .."]+)") do
    if is_test_file and dir ~= 'java' then
      table.insert(dirs, dir)
    end

    if dir == 'test' then
      is_test_file = true
    end
  end

  if not is_test_file then
    return
  end

  local test_class = table.concat(dirs, ".")
  test_class = test_class:sub(1, -6)
  local module = M.get_java_module(path)

  local command = string.format(
    '!tmux new-window -n "%s" -d "mvn test -T 1C %s -pl :%s -Dtest=%s -Dic.configurationFile=%s/configuration.properties -Dlogback.configurationFile=%s/logback-dev.xml -DskipTests=false -Dgroups=small,medium"',
    dirs[#dirs], tostring(args), module, test_class, cwd, cwd)

  vim.api.nvim_command(command)
end

return M
