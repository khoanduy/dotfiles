" Re-map leader key
let mapleader = ' '

" Plugin definitions
call plug#begin()

" List your plugins here
" Make sure you use single quotes

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Keymaps reminder
Plug 'folke/which-key.nvim'

" End plugin definitions
call plug#end()

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Enable filetype detection
filetype plugin on
filetype indent on

" Add numbers to each line on the left-hand side.
set number
set ruler
set hidden

" Auto copy indent and auto read file change
set autoindent
set autoread

" Program to use for the :grep command
set grepprg=rg\ --vimgrep\ --hidden
set path+=**

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

" Load Lua configuration files
lua require('alabaster')
lua require('keymaps')
