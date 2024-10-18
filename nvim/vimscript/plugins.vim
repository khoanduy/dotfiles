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
lua require('oil').setup()
nnoremap <silent> - :Oil<cr>

" Colorscheme
colorscheme tokyonight-storm

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
