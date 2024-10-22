" ----- Plugin definitions -----
call plug#begin()

" List your plugins here
" Make sure you use single quotes

" Find, Filter, Preview, Pick. All lua, all the time.
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" The undo history visualizer for Vim
Plug 'mbbill/undotree'

" Neovim file explorer: edit your filesystem like a buffer
Plug 'stevearc/oil.nvim'

" A clean, dark Neovim theme
Plug 'folke/tokyonight.nvim'

" LSP support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'mfussenegger/nvim-jdtls'

" ----- End plugin definitions -----
call plug#end()

" Oil nvim
lua require('khoa.plugins.oil')
" Oil keymaps
augroup oil_config
  autocmd!
  nnoremap <silent> - :Oil<cr>
  autocmd FileType oil nnoremap <silent> <buffer> <c-h> <c-w>h
  autocmd FileType oil nnoremap <silent> <buffer> <c-j> <c-w>j
  autocmd FileType oil nnoremap <silent> <buffer> <c-k> <c-w>k
  autocmd FileType oil nnoremap <silent> <buffer> <c-l> <c-w>l
augroup END

" Colorscheme
lua require('khoa.plugins.colorscheme')
colorscheme tokyonight-night

" Disable some background
hi! Statusline ctermbg=NONE guibg=NONE
hi! StatuslineNC ctermbg=NONE guibg=NONE
hi! Pmenu ctermbg=NONE guibg=NONE

" Treesitter
lua require('khoa.plugins.treesitter')

" Telescope
lua require('khoa.plugins.telescope')

" Telescope keymaps
nnoremap <leader>f :lua require('telescope.builtin').find_files()<cr>
vnoremap <leader>f "0y:lua require('telescope.builtin').find_files({ search_file = '<c-r>0' })<cr>
nnoremap <leader>F :lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>s :lua require('telescope.builtin').find_files({ no_ignore = true, hidden = true, search_file = '<c-r>"' })
nnoremap <leader>b :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>o :lua require('telescope.builtin').resume()<cr>
nnoremap <leader>g :lua require('telescope.builtin').live_grep()<cr>
vnoremap <leader>g "1y:lua require('telescope.builtin').grep_string({ search = '<c-r>1' })<cr>
nnoremap <leader>/ :lua require('telescope.builtin').grep_string({ search = '<c-r>"' })

" Telescope highlights
hi! TelescopeNormal ctermbg=NONE guibg=NONE
hi! TelescopePromptBorder ctermbg=NONE guibg=NONE
hi! TelescopePromptTitle ctermbg=NONE guibg=NONE
hi! TelescopeBorder ctermbg=NONE guibg=NONE
hi! TelescopeTitle ctermbg=NONE guibg=NONE

" Diagnostic highlights
" hi! DiagnosticVirtualTextError ctermbg=NONE guibg=NONE
" hi! DiagnosticVirtualTextHint ctermbg=NONE guibg=NONE
" hi! DiagnosticVirtualTextInfo ctermbg=NONE guibg=NONE
" hi! DiagnosticVirtualTextWarn ctermbg=NONE guibg=NONE
