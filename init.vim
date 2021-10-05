"--------Khoa Nguyen's vim configuration--------""

" Don't try to be vi compatible
set nocompatible

"--------Load vim configuration files--------"
if has('win64') || has('win32')
  source ~/vimfiles/plugins.vim
  source ~/vimfiles/confv/plugins.conf.vim
  source ~/vimfiles/confv/cc.conf.vim
  source ~/vimfiles/confv/java.conf.vim
  source ~/vimfiles/confv/python.conf.vim
else
  source ~/.config/nvim/plugins.vim
  source ~/.config/nvim/confv/plugins.conf.vim
  source ~/.config/nvim/confv/cc.conf.vim
  source ~/.config/nvim/confv/java.conf.vim
  source ~/.config/nvim/confv/python.conf.vim
endif
"--------End Load vim configuration files--------"

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
colorscheme gruvbox
let g:rehash256=1
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

" Re-size split windows using arrow keys
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Remap switch buffers keys
nmap <leader>bn :bn<CR>
nmap <leader>bp :bp<CR>
nmap <leader>bd :bd<CR>
nmap <leader>bb :buffers<CR>:b<space>

" Search current marked text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" set default python version
let g:syntastic_python_python_exec='python3'

" GUI settings
if has('gui_running')
  " Cursor
  set guicursor+=i:blinkwait700-blinkon400-blinkoff250
  set guioptions-=T
  if has('win64') || has('win32')
    set guifont=Consolas:h10
  else
    set guifont=Fira\ Code:h14
  endif
endif
"------End general configuration------"

