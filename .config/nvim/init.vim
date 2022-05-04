"--------Khoa Nguyen's vim configuration--------""

" Don't try to be vi compatible
set nocompatible

"--------Load nvim configuration files--------"
source ~/.config/nvim/plugin.conf.vim
source ~/.config/nvim/neovide.conf.vim
"--------End Load nvim configuration files--------"

"------General configuration------"

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" For plug-ins to load correctly.
filetype plugin indent on

" Set leader key
let mapleader=','

" Turn on syntax highlighting
syntax on
set hidden
set nowrap
set showmatch
set nobackup nowritebackup
set noswapfile

" Set modifiable
set ma
set mouse=a

" Display options
set showmode
set showcmd

" Theme, color scheme
syntax enable
set background=dark
set termguicolors
colorscheme gruvbox
let g:airline_theme='gruvbox'

" Fixes common backspace problems
set backspace=indent,eol,start

" Set indentation
set autoindent
set smartindent
set copyindent

" Set default indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

" Show line numbers
set number
set cursorline

" Show file stats
set ruler
set splitbelow splitright

" Encoding
set encoding=utf-8

" Bell off
set belloff=all

" Use tags
set tags=tags

" Highlight while searching
set incsearch
set hlsearch

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

nnoremap <leader>w <C-w>

" Re-size split windows using arrow keys
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Remap switch buffers keys
nmap <leader>bn :bn<CR>
nmap <leader>bp :bp<CR>
nmap <leader>bd :bd<CR>
nmap <leader>bw :bw<CR>
nmap <leader>bb :buffers<CR>:b<space>

" Remap terminal escape key
tnoremap <leader>t[ <C-\><C-n>

" Search current marked text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
"------End general configuration------"

