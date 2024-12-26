" ----- Plugin definitions -----
call plug#begin()

" List your plugins here
" Make sure you use single quotes

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Neovim file explorer: edit your filesystem like a buffer
Plug 'stevearc/oil.nvim'

" Git integration for buffers
Plug 'lewis6991/gitsigns.nvim'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Delete/change/add parentheses/quotes/XML-tags/much more with ease
Plug 'tpope/vim-surround'

" The undo history visualizer for Vim
Plug 'mbbill/undotree'

" Modern database interface for Vim
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

" LSP support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'mfussenegger/nvim-jdtls'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

" Neovim plugin for GitHub Copilot
Plug 'github/copilot.vim'

" ----- End plugin definitions -----
call plug#end()

" Colorscheme
set background=light
set notermguicolors
colorscheme vim

" Treesitter
lua require('plugins.treesitter')

" Oil options
lua require('plugins.oil')
" Oil keymaps
augroup oil_keymaps
  autocmd!
  nnoremap <silent> - :Oil<CR>
  autocmd FileType oil nnoremap <silent> <buffer> <C-h> <C-w>h
  autocmd FileType oil nnoremap <silent> <buffer> <C-j> <C-w>j
  autocmd FileType oil nnoremap <silent> <buffer> <C-k> <C-w>k
  autocmd FileType oil nnoremap <silent> <buffer> <C-l> <C-w>l
augroup END

" Fzf options
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right:35%']
let g:fzf_layout = { 'down': '41%' }
" Fzf keymaps
augroup fzf_keymaps
  autocmd!
  nnoremap <leader>f :Files<CR>
  nnoremap <leader>F :GFiles<CR>
  nnoremap <leader>b :Buffers<CR>
  nnoremap <leader>j :Jumps<CR>
  nnoremap <leader>m :Marks<CR>
  nnoremap <leader>g :Rg<CR>
  vnoremap <leader>f "0y":Files <C-r>0<CR>
  vnoremap <leader>g "0y:Rg <C-r>0<CR>
augroup END

" GitSigns options
lua require('gitsigns').setup({ numhl = true })
" GitSigns keymaps
augroup gitsigns_keymaps
  autocmd!
  nnoremap <silent> ]h :Gitsigns next_hunk<CR>
  nnoremap <silent> [h :Gitsigns prev_hunk<CR>
  nnoremap <silent> <leader>hp :Gitsigns preview_hunk_inline<CR>
  nnoremap <silent> <leader>hs :Gitsigns stage_hunk<CR>
  nnoremap <silent> <leader>hS :Gitsigns undo_stage_hunk<CR>
  nnoremap <silent> <leader>hu :Gitsigns reset_hunk<CR>
augroup END

" Undotree toggle keymap
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" Dadbod UI keymap
nnoremap <leader>db :DBUIToggle<CR>

" Copilot settings
let g:copilot_enabled = 0
let g:copilot_no_tab_map = v:true
inoremap <silent><script><expr> <C-e> copilot#Accept('\<CR>')
