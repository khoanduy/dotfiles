" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Re-map leader key
nnoremap <space> <nop>
let g:mapleader=' '

" ----- General settings -----
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Enable type file detection
filetype on
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on
filetype plugin indent on

" Turn syntax highlighting on.
syntax enable

" Add numbers to each line on the left-hand side.
set number
set relativenumber
set ruler
set hidden

" Auto copy indent and auto read file change
set autoindent
set autoread

" Allow backspacing over listed items and belloff
set backspace=indent,eol,start
set belloff=all

" Scan to put in completion
set complete=.,w,b,u,t

" Sequence of letters which describes how automatic formatting is to be done
set formatoptions=tcqj

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

" Enable mouse interaction
set mouse=a
set mousemodel=popup_setpos

" Limit command height to 1 line
set cmdheight=1
set nopaste

" Show several useful info
set showcmd
set showmode
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
set wildcharm=<c-z>

" wildmenu settings
set wildmenu

" Set the commands to save in history default number is 20.
set history=10000
set ttyfast

" Set statusline last status and background
set laststatus=2
set background=dark

" ----- Highlights -----
" Highlight marked files in the same way search matches are
hi! link netrwMarkFile Search

" Set basic highlight groups
hi Normal cterm=NONE ctermbg=NONE
hi CursorLine cterm=bold term=bold
hi Statusline cterm=NONE ctermbg=grey ctermfg=black
hi StatuslineNC ctermfg=darkgrey
hi VertSplit cterm=NONE ctermfg=grey

" Pmenu highlight
hi Pmenu ctermbg=grey ctermfg=black
hi PmenuSel ctermbg=darkgrey ctermfg=white
hi PmenuSbar ctermbg=grey
hi PmenuThumb ctermbg=grey

" ----- Keymaps -----
" Remap switch region keys
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Remap switch region keys within terminal
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l

" Re-size split windows using arrow keys
nnoremap <silent> <up> :resize -2<cr>
nnoremap <silent> <right> :vertical resize +2<cr>
nnoremap <silent> <down> :resize +2<cr>
nnoremap <silent> <left> :vertical resize -2<cr>

" Dismiss highlight and insert esc
nnoremap <silent> H :noh<cr>
inoremap <silent> jk <esc>

" Move selected visual block by J and K
vnoremap <silent> J :m '>+1<cr>gv=gv
vnoremap <silent> K :m '<-2<cr>gv=gv

" Navigate through quickfix list
nnoremap <silent> ]q :cnext<cr>zz
nnoremap <silent> [q :cprev<cr>zz

" Open netrw at current dir
nnoremap - :Explore<cr>

" netrw keymap
function! s:netrw_keymaps()
  nnoremap <buffer> x :Rexplore<cr>
endfunction

augroup netrw_mapping
  autocmd!
  autocmd FileType netrw call <sid>netrw_keymaps()
augroup END

" Search current marked text
vnoremap // y/\V<c-r>=escape(@",'/\')<cr><cr>

" Copy marked text/paste to/from global register
nnoremap <leader>Y "+Y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p

" Dir/File keymaps
nnoremap <leader>d :!mkdir -p %:h<c-z>
nnoremap <leader>c :!cp %<c-z> %:h<c-z>
nnoremap <leader>C :!cp -rp %:h<c-z> %:h<c-z>
nnoremap <leader>m :!mv %<c-z> %:h<c-z>

" Search and replace
nnoremap <leader>r :%s/<c-r><c-w>//g<left><left>
vnoremap <leader>r "6y<esc>:%s/<c-r>6//g<left><left>

" Open the quickfix window whenever a quickfix command is executed
autocmd! QuickFixCmdPost [^l]* cwindow

