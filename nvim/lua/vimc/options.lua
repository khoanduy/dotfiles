-- General settings --
-- Encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- No temporary files
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.wrap = false
vim.opt.errorbells = false

-- Display options
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.showmatch = true

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.copyindent = true

-- Default indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true

-- File stats
vim.opt.number = true
vim.opt.cursorline = false
vim.opt.ruler = false
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Mouse support
vim.opt.mouse = 'a'

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- End general settings --
