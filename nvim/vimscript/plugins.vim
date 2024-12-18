" ----- Plugin definitions -----
call plug#begin()

" List your plugins here
" Make sure you use single quotes

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" The missing motion for Vim
Plug 'justinmk/vim-sneak'

" Neovim file explorer: edit your filesystem like a buffer
Plug 'stevearc/oil.nvim'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'

" Delete/change/add parentheses/quotes/XML-tags/much more with ease
Plug 'tpope/vim-surround'

" Git integration for buffers
Plug 'lewis6991/gitsigns.nvim'

" autopairs for neovim written in lua
Plug 'windwp/nvim-autopairs'

" The undo history visualizer for Vim
Plug 'mbbill/undotree'

" Personal Wiki for Vim
Plug 'vimwiki/vimwiki'

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
Plug 'saadparwaiz1/cmp_luasnip'

" Snippets
Plug 'L3MON4D3/LuaSnip'

" A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins.
Plug 'folke/tokyonight.nvim'

" Neovim plugin for GitHub Copilot
Plug 'github/copilot.vim'

" ----- End plugin definitions -----
call plug#end()

" Oil setup
lua require('khoa.plugins.oil')
" Oil keymaps
augroup oil_keymaps
  autocmd!
  nnoremap <silent> - :Oil<CR>
  autocmd FileType oil nnoremap <silent> <buffer> <C-h> <C-w>h
  autocmd FileType oil nnoremap <silent> <buffer> <C-j> <C-w>j
  autocmd FileType oil nnoremap <silent> <buffer> <C-k> <C-w>k
  autocmd FileType oil nnoremap <silent> <buffer> <C-l> <C-w>l
augroup END

" Colorscheme
set background=dark
lua require("tokyonight").setup({ style = "night" })
colorscheme tokyonight

" GitSigns setup
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

" Treesitter
lua require('khoa.plugins.treesitter')

" Fzf settings
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right:35%']
let g:fzf_layout = { 'down': '41%' }
" Fzf highlight groups
highlight! fzf1 guifg=grey ctermfg=grey guibg=NONE ctermbg=NONE
highlight! fzf2 guifg=grey ctermfg=grey guibg=NONE ctermbg=NONE
highlight! fzf3 guifg=grey ctermfg=grey guibg=NONE ctermbg=NONE
" Fuzzy finder keymaps
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

" Undotree toggle keymap
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" Vimwiki setup
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/vimwiki/',
 \ 'syntax': 'markdown', 'ext': 'md'}]
" Vimwiki keymap
nnoremap <leader>wk :VimwikiIndex<CR>

" Autopairs setup
lua require("nvim-autopairs").setup {}

" Vim-sneak label
let g:sneak#label = 1
" Vim-sneak keymaps
augroup vim_sneak_keymaps
  autocmd!
  map f <Plug>Sneak_s
  map F <Plug>Sneak_S
augroup END

" Dadbod UI keymap
nnoremap <leader>db :DBUIToggle<CR>

" Copilot settings
let g:copilot_enabled = 0
let g:copilot_no_tab_map = v:true
inoremap <silent><script><expr> <C-e> copilot#Accept('\<CR>')
