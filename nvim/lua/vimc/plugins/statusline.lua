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
  return string.format(' \'%s:', modes[current_mode]):upper()
end

-- Add custom color for each mode
local function update_mode_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = '%#StatusLineAccent#'
  if current_mode == 'n' then
      mode_color = '%#StatuslineAccent#'
  elseif current_mode == 'i' or current_mode == 'ic' then
      mode_color = '%#StatuslineInsertAccent#'
  elseif current_mode == 'v' or current_mode == 'V' or current_mode == '' then
      mode_color = '%#StatuslineVisualAccent#'
  elseif current_mode == 'R' then
      mode_color = '%#StatuslineReplaceAccent#'
  elseif current_mode == 'c' then
      mode_color = '%#StatuslineCmdLineAccent#'
  elseif current_mode == 't' then
      mode_color = '%#StatuslineTerminalAccent#'
  end
  return mode_color
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
  return ' %m ' .. string.format(' [%s]', vim.bo.filetype):lower()
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
    '%#Statusline#',
    update_mode_colors(),
    mode(),
    '%#Normal# ',
    filepath(),
    filename(),
    '%#Normal#',
    '%=',
    lsp(),
    filetype(),
    lineinfo(),
  }
end

function Statusline.inactive()
  return ' %F'
end

function Statusline.short()
  return '%#StatusLineNC#'
end

-- Apply statusline
vim.api.nvim_exec([[
  set laststatus=3

  " Set active and inactive status line style
  hi StatusLine ctermbg=NONE ctermfg=white guibg=NONE guifg=white
  hi Normal ctermbg=NONE guibg=NONE
  hi StatusLineNC ctermbg=NONE ctermfg=grey guibg=NONE guifg=#d8d8d8

  " Set mode highlight color groups
  hi StatuslineAccent ctermbg=NONE ctermfg=cyan guibg=NONE guifg=#86c1b9
  hi StatuslineInsertAccent ctermbg=NONE ctermfg=green guibg=NONE guifg=#a1b56c
  hi StatuslineVisualAccent ctermbg=NONE ctermfg=magenta guibg=NONE guifg=#ba8baf
  hi StatuslineReplaceAccent ctermbg=NONE ctermfg=red guibg=NONE guifg=#ab4642
  hi StatuslineCmdLineAccent ctermbg=NONE ctermfg=yellow guibg=NONE guifg=#f7ca88
  hi StatuslineTerminalAccent ctermbg=NONE ctermfg=white guibg=NONE guifg=#d8d8d8

  " Set LSP highlight color groups
  hi LspDiagnosticsSignError ctermbg=NONE ctermfg=red guibg=NONE guifg=#ab4642
  hi LspDiagnosticsSignWarning ctermbg=NONE ctermfg=yellow guibg=NONE guifg=#f7ca88
  hi LspDiagnosticsSignInformation ctermbg=NONE ctermfg=cyan guibg=NONE guifg=#86c1b9
  hi LspDiagnosticsSignHint ctermbg=NONE ctermfg=green guibg=NONE guifg=#a1b56c

  augroup statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
