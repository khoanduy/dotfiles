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

function M.run_maven_test(args, method)
  local file_name = vim.fn.expand("%:t")
  local pane = vim.fn.system(string.format("tmux list-windows | grep '%s' | awk -F: '{print $1}'", file_name))

  if pane ~= "" then
    vim.api.nvim_command("!tmux respawn-window -t " .. pane)
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

  local win_name = dirs[#dirs]
  local module = M.get_java_module(path)
  local test_class = table.concat(dirs, ".")
  test_class = test_class:sub(1, -6)

  if method ~= nil and method ~= "" then
    local func = method:gsub("%s+", "")
    test_class = string.format("%s\\#%s", test_class, func)
    win_name = string.format("%s-%s", win_name, func)
  end

  local command = '!tmux new-window -n "' .. win_name .. '" -d "mvn test ' ..
    tostring(args) .. ' -pl :' .. module .. ' -Dtest=' .. test_class .. 
    ' -DskipTests=false -Dgroups=small,medium"'

  vim.api.nvim_command(command)
end

return M
