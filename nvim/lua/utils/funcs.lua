-- Utils functions --
local M = {}

function M.show_git_annotate()
  local line = vim.fn.line('.')
  local file = vim.fn.expand('%:p')
  local format = ' | cut -d\' \' -f1,2,3 | tr \'(\' \' \''
  local result = vim.fn.system('git annotate -L ' .. line .. ',' .. line .. ' ' .. file .. format)
  vim.api.nvim_out_write(result)
end

function M.run_maven_test()
  if vim.bo.filetype ~= 'java' then
    return ':echo "Not a Java file!"\n'
  end

  local p = vim.fn.expand('%:.')
  local s = '/'
  local ss = {}
  for str in string.gmatch(p, '([^'..s..']+)') do
    table.insert(ss, str)
  end

  local m = table.remove(ss, 1)
  local t = table.concat(ss, '.', 4):sub(1, -6)
  return ':!tmux new-window -n "mvn-test" "mvn test -Dtest=' .. t .. ' -pl :' .. m .. ' -am -DfailIfNoTests=false"'
end

return M
-- End functions definition --
