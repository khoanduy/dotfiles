" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Re-map leader key
nnoremap <space> <nop>
let mapleader = ' '

" Plugin definitions
call plug#begin()

" List your plugins here
" Make sure you use single quotes

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" A Vim plugin which shows git diff markers in the sign column
Plug 'airblade/vim-gitgutter'

" End plugin definitions
call plug#end()

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Enable type file detection
filetype on
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax enable

" Add numbers to each line on the left-hand side.
set number
set ruler
set hidden

" Auto copy indent and auto read file change
set autoindent
set autoread

" Program to use for the :grep command
" set grepprg=rg\ --vimgrep\ --hidden
" set path+=**

" Set default indentation
set expandtab
set smarttab
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
set incsearch
set hlsearch
set matchpairs+=<:>
set ignorecase
set smartcase

" Limit command height to 1 line
set cmdheight=1
set nopaste

" Show several useful info
set showcmd
set showmatch

" The cursor is kept in the same column
set nostartofline

" This option controls the behavior when switching between buffers
set switchbuf=uselast
set tabpagemax=50

" Get rid of scratch buffer
set completeopt-=preview
set ttimeout
set ttimeoutlen=50

" Enable auto completion menu after pressing TAB.
set wildmode=full
set wildignore=*.o,*~,*.a,*.so,*.pyc,*.swp,.git/,*.class,*/target/*,.idea/
set wildignore+=*/Library/*,*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/.DS_Store
set wildoptions=pum,tagfile
set wildmenu

" Set the commands to save in history default number is 20.
set history=10000
set ttyfast

" Colorscheme
set background=light

" Set statusline last status
set laststatus=2

" Highlight marked files in the same way search matches are
hi! link netrwMarkFile Search

" Remap switch region keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remap switch region keys within terminal
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Re-size split windows using arrow keys
nnoremap <silent> <up> :resize -2<CR>
nnoremap <silent> <down> :resize +2<CR>
nnoremap <silent> <left> :vertical resize +2<CR>
nnoremap <silent> <right> :vertical resize -2<CR>

" Search current marked text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" Print current file path
nnoremap <leader>I :echo @%<CR>

" Copy marked text/paste to/from global register
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Open netrw at current dir
nnoremap - :Explore<CR>

" Load colorscheme
lua require('alabaster')

" Fuzzy finding
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<CR>

" Show git blame of the current line
nnoremap <leader>B :lua require('utils').show_git_annotate()<CR>
