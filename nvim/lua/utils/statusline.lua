-- Thanks to this blog https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html with some customization
-- A table that defines the string name for each output of vim.api.nvim_get_mode().mode
local modes = {
  ['n'] = 'NORMAL',
  ['no'] = 'NORMAL',
  ['v'] = 'VISUAL',
  ['V'] = 'VISUAL LINE',
  [''] = 'VISUAL BLOCK',
  ['s'] = 'SELECT',
  ['S'] = 'SELECT LINE',
  [''] = 'SELECT BLOCK',
  ['i'] = 'INSERT',
  ['ic'] = 'INSERT',
  ['R'] = 'REPLACE',
  ['Rv'] = 'VISUAL REPLACE',
  ['c'] = 'COMMAND',
  ['cv'] = 'VIM EX',
  ['ce'] = 'EX',
  ['r'] = 'PROMPT',
  ['rm'] = 'MOAR',
  ['r?'] = 'CONFIRM',
  ['!'] = 'SHELL',
  ['t'] = 'TERMINAL',
}

-- Get current mode
local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format('%s', modes[current_mode]):upper()
end

-- Custom file path
local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.:h')
  if fpath == '' or fpath == '.' then
      return ' '
  end

  return string.format(' %%<%s/', fpath)
end

-- Custom file name
local function filename()
  local fname = vim.fn.expand '%:t'
  if fname == '' then
      return ''
  end
  return fname .. ' '
end

-- Display LSP
local function lsp()
  local count = {}
  local levels = {
    errors = 'Error',
    warnings = 'Warn',
    info = 'Info',
    hints = 'Hint',
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ''
  local warnings = ''
  local hints = ''
  local info = ''

  if count['errors'] ~= 0 then
    errors = ' %#LspDiagnosticsSignError#✖ ' .. count['errors']
  end
  if count['warnings'] ~= 0 then
    warnings = ' %#LspDiagnosticsSignWarning#▲ ' .. count['warnings']
  end
  if count['info'] ~= 0 then
    info = ' %#LspDiagnosticsSignInformation#● ' .. count['info']
  end
  if count['hints'] ~= 0 then
    hints = ' %#LspDiagnosticsSignHint#✱ ' .. count['hints']
  end

  return errors .. warnings .. hints .. info .. '%#Normal#'
end

-- Custom file type
local function filetype()
  return ' %m ' .. string.format('[%s]', vim.bo.filetype):lower()
end

-- Line info
local function lineinfo()
  if vim.bo.filetype == 'alpha' then
    return ''
  end
  return ' %{strlen(&fenc)?&fenc:\'none\'} | %l:%c '
end

-- Build the statusline
Statusline = {}

Statusline.active = function()
  return table.concat {
    '%#Stress#',
    '  ',
    mode(),
    '%#Normal#',
    filepath(),
    filename(),
    '%=',
    lsp(),
    filetype(),
    lineinfo(),
  }
end

function Statusline.inactive()
  return '%#Blur# ' .. filepath() .. filename() .. '%=%L '
end

function Statusline.short()
  return '%#Blur# %y '
end

-- Highlight groups
vim.cmd.highlight('Statusline ctermbg=NONE ctermfg=black guibg=NONE guifg=#444444')
vim.cmd.highlight('StatuslineNC ctermbg=NONE ctermfg=grey guibg=NONE guifg=#878787')
vim.cmd.highlight('Normal ctermbg=NONE guibg=NONE')
vim.cmd.highlight('Stress cterm=bold ctermbg=NONE gui=bold guibg=NONE')
vim.cmd.highlight('Blur ctermbg=NONE ctermfg=grey guibg=NONE guifg=#878787')

-- Set LSP highlight color groups
vim.cmd.highlight('LspDiagnosticsSignError ctermbg=NONE ctermfg=red guibg=NONE guifg=#af0000')
vim.cmd.highlight('LspDiagnosticsSignWarning ctermbg=NONE ctermfg=yellow guibg=NONE guifg=#d75f00')
vim.cmd.highlight('LspDiagnosticsSignInformation ctermbg=NONE ctermfg=blue guibg=NONE guifg=#005f87')
vim.cmd.highlight('LspDiagnosticsSignHint ctermbg=NONE ctermfg=green guibg=NONE guifg=#008700')

-- Apply statusline
vim.opt.laststatus = 3
vim.api.nvim_create_augroup('statusline', { clear = false })

vim.api.nvim_create_autocmd({'BufEnter', 'WinEnter'}, {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'oil' then
      vim.o.statusline = Statusline.short()
    else
      vim.o.statusline = Statusline.active()
    end
  end,
  group = 'statusline',
})

vim.api.nvim_create_autocmd({'BufLeave', 'WinLeave'}, {
  pattern = '*',
  callback = function()
    vim.o.statusline = Statusline.inactive()
  end,
  group = 'statusline',
})
