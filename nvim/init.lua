----- General settings -----
vim.loader.enable()

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Background
vim.opt.background = "dark"
vim.cmd.colorscheme "default"

-- No temporary files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.wrap = false
vim.opt.errorbells = false

-- Default indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true

-- File stats
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true

-- Program to use for the :grep command
vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"

-- Load configuration files --
require("khoa.config.lazy")
require("khoa.config.keymaps")
require("khoa.lsp")

-- Highlights
-- vim.cmd.highlight("Normal cterm=NONE guibg=NONE")
vim.cmd.highlight("CursorLine cterm=bold term=bold")
vim.cmd.highlight("Statusline cterm=NONE guibg=darkgrey guifg=black")
vim.cmd.highlight("StatuslineNC guibg=grey guifg=black")
vim.cmd.highlight("VertSplit cterm=NONE guifg=darkgrey")
