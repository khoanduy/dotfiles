" ** General settings ** "

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
lang en_US.UTF-8

" Enable type file detection
filetype on
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number
set relativenumber
set ruler

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Set default indentation
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround
" Do not save temporary files.
set nobackup
set noswapfile

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" Searching
set incsearch
set hlsearch
set matchpairs+=<:>
set ignorecase
set smartcase

" Enable mouse interaction
set ma
set mouse=a

" Show several useful info
set showcmd
set showmode
set showmatch

" Get rid of scratch buffer
set completeopt-=preview

" Enable auto completion menu after pressing TAB.
set wildmenu
set wildmode=list:longest

" Set the commands to save in history default number is 20.
set history=1000

" ** Mapping ** "

" Re-map leader key
let mapleader=","

" Remap c-w prefix
nnoremap <silent> <leader>w <c-w>

" Remap switch region keys
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l

" Re-size split windows using arrow keys
nnoremap <silent> <up> :resize -2<cr>
nnoremap <silent> <down> :resize +2<cr>
nnoremap <silent> <left> :vertical resize +2<cr>
nnoremap <silent> <right> :vertical resize -2<cr>

" Search current marked text
vnoremap // y/\V<c-r>=escape(@",'/\')<cr><cr>

" Turn off highlight
nnoremap <silent> \| :noh<cr>

" Copy marked text/paste to/from global register
vnoremap <space>y "+y
nnoremap <space>p "+p
