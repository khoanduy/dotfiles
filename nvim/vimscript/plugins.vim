" ----- Plugin definitions -----
call plug#begin()

" List your plugins here
" Make sure you use single quotes

" Find, Filter, Preview, Pick. All lua, all the time.
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Neovim file explorer: edit your filesystem like a buffer
Plug 'stevearc/oil.nvim'

" autopairs for neovim written in lua
Plug 'windwp/nvim-autopairs'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Delete/change/add parentheses/quotes/XML-tags/much more with ease
Plug 'tpope/vim-surround'

" Git integration for buffers
Plug 'lewis6991/gitsigns.nvim'

" The undo history visualizer for Vim
Plug 'mbbill/undotree'

" LSP support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'mfussenegger/nvim-jdtls'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'

" Snippets
Plug 'L3MON4D3/LuaSnip'

" Neovim plugin for GitHub Copilot
Plug 'github/copilot.vim'

" ----- End plugin definitions -----
call plug#end()

" Oil setup
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
set background=light
set notermguicolors
colorscheme vim

" GitSigns setup
lua require('gitsigns').setup({ numhl = true })
" GitSigns keymap
augroup gitsigns_config
  autocmd!
  nnoremap <silent> ]h :Gitsigns next_hunk<cr>
  nnoremap <silent> [h :Gitsigns prev_hunk<cr>
  nnoremap <silent> <leader>hp :Gitsigns preview_hunk_inline<cr>
  nnoremap <silent> <leader>hs :Gitsigns stage_hunk<cr>
  nnoremap <silent> <leader>hS :Gitsigns undo_stage_hunk<cr>
  nnoremap <silent> <leader>hu :Gitsigns reset_hunk<cr>
augroup END

" Treesitter
lua require('khoa.plugins.treesitter')

" Telescope
lua require('khoa.plugins.telescope')

" Telescope keymaps
nnoremap <leader>f :lua require('telescope.builtin').find_files()<cr>
vnoremap <leader>f "0y:lua require('telescope.builtin').find_files({ search_file = '<c-r>0' })<cr>
nnoremap <leader>F :lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>s :lua require('telescope.builtin').find_files({ no_ignore = true, hidden = true })
nnoremap <leader>S :lua require('telescope.builtin').find_files({ no_ignore = true, hidden = true, search_file = '<c-r>+' })<cr>
nnoremap <leader>b :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>o :lua require('telescope.builtin').resume()<cr>
nnoremap <leader>g :lua require('telescope.builtin').live_grep()<cr>
vnoremap <leader>g "0y:lua require('telescope.builtin').grep_string({ search = '<c-r>0' })<cr>

" Autopairs setup
lua require("nvim-autopairs").setup {}
