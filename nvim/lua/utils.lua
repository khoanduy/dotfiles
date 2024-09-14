local M = {}

function M.show_git_annotate()
  local line = vim.fn.line('.')
  local file = vim.fn.expand('%:p')
  local format = " | cut -d' ' -f1,2,3 | tr '(' ' '"
  print(vim.fn.system('git annotate -L ' .. line .. ',' .. line .. ' ' .. file .. format))
end

function M.run_maven_test()
  local folders = vim.split(vim.fn.expand('%'), '/')

  if vim.fn.index(folders, 'test') < 0 then
    print('Not a test file!')
    return
  end

  local module = folders[1] ~= 'src' and folders[1] or ''
  local test_class = table.concat(vim.list_slice(folders, 5), '.'):sub(1, -7)

  vim.cmd('silent !mvn test -pl :' .. module .. ' -Dtest=' .. test_class .. ' -DskipTests=false')
end

return M
