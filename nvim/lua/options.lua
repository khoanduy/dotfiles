----------------------
-- General settings --
----------------------

-- Encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Background
vim.opt.background = 'light'

-- No temporary files
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.wrap = false
vim.opt.errorbells = false

-- Display options
vim.opt.showmode = true
vim.opt.showmatch = true

-- Indentation
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
vim.opt.ruler = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Mouse support
vim.opt.mouse = 'a'

-- Enable auto completion menu after pressing TAB.
vim.opt.wildmode = 'full'
vim.opt.wildignore = vim.opt.wildignore + '*.o,*~,*.pyc,*/.DS_Store'
vim.opt.wildignore = vim.opt.wildignore + '*/Library/*,*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*'
vim.opt.wildignore = vim.opt.wildignore + '*/target/*'

-- Program to use for the :grep command
vim.opt.grepprg = 'rg --vimgrep --hidden'
vim.opt.path = vim.opt.path + '**'

-- vim.cmd.highlight('Normal cterm=NONE ctermbg=NONE')
-- vim.cmd.highlight('CursorLine cterm=bold term=bold')
-- vim.cmd.highlight('Statusline cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkgray guifg=white')
-- vim.cmd.highlight('StatuslineNC ctermfg=grey guifg=grey')
-- vim.cmd.highlight('VertSplit cterm=NONE ctermfg=darkgray guifg=darkgray')

--------------------------
-- End general settings --
--------------------------
