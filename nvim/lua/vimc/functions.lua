-- Functions definition --
local M = {}

function M.show_git_annotate()
  local line = vim.fn.line('.')
  local file = vim.fn.expand('%:p')
  local format = ' | cut -d\' \' -f1,2,3 | tr \'(\' \' \''
  local result = vim.fn.system('git annotate -L ' .. line .. ',' .. line .. ' ' .. file .. format)
  vim.api.nvim_out_write(result)
end

return M
-- End functions definition --
