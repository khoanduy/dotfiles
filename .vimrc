"--------Khoa Nguyen's vim configuration--------""

" Don't try to be vi compatible
set nocompatible

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
" set termguicolors
set background=dark cursorline
syntax enable
set t_Co=256
highlight Normal ctermbg=NONE
highlight Normal guibg=NONE
let g:rehash256=1

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
set relativenumber

" Show file stats
set ruler
set splitbelow splitright

" Encoding
set encoding=utf-8
set spell spelllang=en_us

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

" Search current marked text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

autocmd FileType c setlocal tabstop=2 shiftwidth=2 softtabstop=2 shiftwidth=2 et
autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2 shiftwidth=2 et

autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4 shiftwidth=4 et
autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 shiftwidth=4 et
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 shiftwidth=4 et

autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 shiftwidth=2 et
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2 shiftwidth=2 et
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2 shiftwidth=2 et
"------End general configuration------"

