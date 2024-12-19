-- General settings
vim.loader.enable()

-- Add numbers to each line on the left-hand side.
vim.o.number = true

-- Set default indentation
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true

-- Do not save temporary files.
vim.o.backup = false
vim.o.swapfile = false
vim.o.wrap = false

-- Do not let cursor scroll below or above N number of lines when scrolling.
vim.o.scrolloff = 10
vim.o.splitbelow = true

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Limit command height to 1 line
vim.o.cmdheight = 1
vim.o.paste = false

-- Show several useful info
vim.o.showmode = true
vim.o.showmatch = true

-- The cursor is kept in the same column
vim.o.startofline = false

-- Get rid of scratch buffer
vim.cmd([[
  set background=dark
  set completeopt-=preview
]])

-- Program to use for the :grep command
vim.o.grepprg = "rg --vimgrep --smart-case --hidden"

-- Set include path for C/C++ development on MacOS
vim.o.path = vim.o.path .. "/Library/Developer/CommandLineTools/usr/include"
vim.o.path = vim.o.path .. "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
vim.o.path = vim.o.path .. "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1"

-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Load configs
require("khoa.lazy")
require("khoa.lsp")
vim.cmd('source $XDG_CONFIG_HOME/nvim/keymaps.vim')

-- Set basic highlight groups
vim.cmd([[
  highlight! Normal cterm=NONE ctermbg=NONE
  highlight! CursorLine cterm=bold term=bold
  highlight! Statusline cterm=NONE ctermbg=grey ctermfg=black
  highlight! StatuslineNC ctermfg=lightgrey ctermbg=darkgrey
  highlight! VertSplit cterm=NONE ctermfg=grey
  highlight! SignColumn ctermbg=NONE
]])
