"--------Khoa Nguyen's vim configuration--------""

" Don't try to be vi compatible
set nocompatible

"--------Load vim configuration files--------"
if has("win64") || has("win32")
  source ~/vimfiles/plugins.vim
  source ~/vimfiles/vimcfg/plugins.conf.vim
  source ~/vimfiles/vimcfg/cpp.conf.vim
  source ~/vimfiles/vimcfg/java.conf.vim
  source ~/vimfiles/vimcfg/python.conf.vim
else
  source ~/.vim/plugins.vim
  source ~/.vim/vimcfg/plugins.conf.vim
  source ~/.vim/vimcfg/cpp.conf.vim
  source ~/.vim/vimcfg/java.conf.vim
  source ~/.vim/vimcfg/python.conf.vim
endif
"--------End Load vim configuration files--------"

"------General configuration------"

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" For plug-ins to load correctly.
filetype plugin indent on

" Set leader key
let mapleader=","

" Turn on syntax highlighting
syntax on
set hidden
set nowrap
set showmatch
set nobackup
set noswapfile

" Set modifiable
set ma
set mouse=a

" Display options
set showmode
set showcmd

" Theme, color scheme
syntax enable
set background=light
set t_Co=256
highlight Normal ctermbg=NONE
highlight Normal guibg=NONE
let g:rehash256=1

" Fixes common backspace problems
set backspace=indent,eol,start

" Set autoindent
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
set relativenumber

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Font
if has("win64") || has("win32")
  :set guifont=Fixedsys:h14
else
  :set guifont=Fira\ Code:h14
endif

" Belloff
:set belloff=all

" Cursor
set guicursor+=i:blinkwait700-blinkon400-blinkoff250

" Highlight while searching
set incsearch
set hlsearch

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
"------End general configuration------"

