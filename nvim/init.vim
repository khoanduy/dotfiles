" ----- General settings -----
" Add numbers to each line on the left-hand side.
set number
set relativenumber

" Set default indentation
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround

" Do not save temporary files.
set nobackup
set noswapfile
set nowrap

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10
set splitbelow

" Searching
set matchpairs+=<:>
set ignorecase
set smartcase

" Limit command height to 1 line
set cmdheight=1
set nopaste

" Show several useful info
set showmode
set showmatch

" The cursor is kept in the same column
set nostartofline

" Custom fillchars
set fillchars=vert:\|

" Get rid of scratch buffer
set completeopt-=preview

" Program to use for the :grep command
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden

" Disable netrw
let g:loaded_netrwPlugin=1
let g:loaded_netrw=1

" Re-map leader key
let g:mapleader=' '

" ----- Load config files -----
source $XDG_CONFIG_HOME/nvim/vimscript/plugins.vim
source $XDG_CONFIG_HOME/nvim/vimscript/keymaps.vim
lua require("khoa.lsp")
