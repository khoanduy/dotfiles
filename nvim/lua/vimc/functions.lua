-- Functions definition --
local M = {}

function M.show_git_annotate()
  local line = vim.fn.line('.')
  local file = vim.fn.expand('%:p')
  local format = ' | cut -d\' \' -f1,2,3 | tr \'(\' \' \''
  local result = vim.fn.system('git annotate -L ' .. line .. ',' .. line .. ' ' .. file .. format)
  vim.api.nvim_out_write(result)
end

function M.create_terminal()
  vim.api.nvim_command('botright split terminal')
  vim.api.nvim_command('terminal')
  vim.api.nvim_win_set_height(0, 10)

  vim.api.nvim_set_option_value('number', false, { buf = 0 })
  vim.api.nvim_set_option_value('relativenumber', false, { buf = 0 })
end

return M
-- End functions definition --
