"--------Khoa Nguyen's vim configuration--------""

" Don't try to be vi compatible
set nocompatible

"--------Load nvim configuration files--------"
source ~/.config/nvim/plugin.conf.vim
source ~/.config/nvim/mapping.conf.vim
source ~/.config/nvim/command.conf.vim
"--------End Load nvim configuration files--------"

"------General configuration------"

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" For plug-ins to load correctly.
filetype plugin indent on

" Syntax highlighting, no temporary files and no bell
syntax enable
set hidden
set nowrap
set showmatch
set nobackup
set nowritebackup
set noswapfile
set belloff=all

" Set modifiable
set ma
set mouse=a

" Display options
set showmode
set showcmd

" Interface
if !has('mac')
  set termguicolors
endif

" Fixes common backspace problems
set backspace=indent,eol,start

" Indentation
set autoindent
set smartindent
set copyindent

" Default indentation
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftwidth=2
set shiftround

" Show file stats
set number
set cursorline
set ruler
set splitbelow
set splitright

" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8
lang en_US.UTF-8

" Highlight while searching
set incsearch
set hlsearch

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
"------End general configuration------"
