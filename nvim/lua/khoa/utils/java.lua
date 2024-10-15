local M = {}

function get_java_module()
  local path = vim.fn.expand('%:p')
  local cwd = vim.fn.getcwd()
  path = path:gsub(cwd .. "/", "")
  local dirs = vim.split(path, '/')
  local mpos = vim.fn.index(dirs, 'src')

  local name = table.concat(vim.list_slice(dirs, 1, mpos - 1), '/')
  local sed_command = string.format("sed -n 's/<artifactId>\(.*\)<\/artifactId>/\1/p' %s/pom.xml | head -%d", name, mpos)
  local module = vim.fn.system(sed_command)
  local module_lines = vim.split(module, '\n')
  module = module_lines[#module_lines]

  module = module:gsub('%s+$', '')  -- Trim trailing whitespace
  module = module:gsub('^%s+', '')  -- Trim leading whitespace

  return module
end

function M.run_maven_test()
  local file_name = vim.fn.expand("%:t")
  local pane = vim.fn.system(string.format("tmux list-windows | grep '%s' | awk -F: '{print $1}'", file_name))

  if tonumber(pane) > 0 then
    return string.format("!tmux respawn-window -t %s", pane)
  end

  local path = vim.fn.expand("%:p")
  local cwd = vim.fn.getcwd()
  path = path:gsub(cwd .. "/", "")
  local dirs = vim.split(path, "/")

  if not vim.tbl_contains(dirs, "test") then
    return
  end

  local test_pos = vim.fn.index(dirs, "test") + 2
  local test_class = table.concat(vim.list_slice(dirs, test_pos + 1), ".")
  test_class = test_class:sub(1, -7)
  local module = get_java_module()  -- Assuming get_java_module() is a defined function in Lua

  return string.format('!tmux new-window -n "%s" -d "mvn test -T 1C -pl :%s -Dtest=%s -Dic.configurationFile=%s/configuration.properties -Dlogback.configurationFile=%s/logback-dev.xml -DskipTests=false -Dgroups=small,medium"',
    dirs[#dirs], module, test_class, cwd, cwd)
end

return M
