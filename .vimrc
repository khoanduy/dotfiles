" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Re-map leader key
nnoremap <space> <nop>
let g:mapleader=' '

" Install plugins for mac only
if has('mac')
  " ----- Plugin definitions -----
  call plug#begin()

  " List your plugins here
  " Make sure you use single quotes

  " A command-line fuzzy finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " A Git wrapper so awesome, it should be illegal
  Plug 'tpope/vim-fugitive'

  " comment stuff out
  Plug 'tpope/vim-commentary'

  " Delete/change/add parentheses/quotes/XML-tags/much more with ease
  Plug 'tpope/vim-surround'

  " A Vim plugin which shows git diff markers in the sign column
  Plug 'airblade/vim-gitgutter'

  " Modern database interface for Vim
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
  Plug 'kristijanhusak/vim-dadbod-completion'

  " ----- End plugin definitions -----
  call plug#end()
endif

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
set noshowmode
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
set wildoptions=pum,tagfile
set wildcharm=<c-z>

" wildmenu settings
set wildignore=*.o,*~,*.a,*.so,*.pyc,*.swp,.git/,*.class,*/target/*,*/build/*,.idea/
set wildignore+=*/Library/*,*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/.DS_Store
set wildmenu

" Set include path for C/C++ development on MacOS
if has('mac')
  set path+=/Library/Developer/CommandLineTools/usr/include
  set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include
  set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1
endif

" Program to use for the :grep command
if executable('rg') > 0
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
endif

" Set the commands to save in history default number is 20.
set history=10000
set ttyfast

" Set statusline last status and background
set background=light
set notermguicolors
set laststatus=2

" Statusline
set statusline=
set statusline+=\ 
set statusline+=
set statusline+=\ 
set statusline+=%f
set statusline+=\ 
set statusline+=(
set statusline+=mode:
set statusline+=%{mode()}
set statusline+=)
set statusline+=\ 
set statusline+=%m
set statusline+=%=
set statusline+=%l
set statusline+=\:
set statusline+=%c
set statusline+=\ 
set statusline+=%y
set statusline+=\ 

" ----- Highlights -----
" Highlight marked files in the same way search matches are
hi! link netrwMarkFile Search

" Set basic highlight groups
highlight! Normal cterm=NONE ctermbg=NONE
highlight! CursorLine cterm=bold
highlight! Statusline cterm=NONE ctermbg=lightgrey
highlight! StatuslineNC cterm=NONE ctermbg=grey ctermfg=darkgrey
highlight! VertSplit cterm=NONE ctermfg=lightgrey
" highlight! SignColumn ctermbg=NONE

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

" Dismiss highlight
nnoremap <silent> H :noh<cr>

" Remap scroll
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Navigate through quickfix list
nnoremap <silent> ]q :cnext<cr>zz
nnoremap <silent> [q :cprev<cr>zz

" Open netrw at current dir
nnoremap - :Explore<cr>

" Quick exit some filetypes
autocmd! FileType help,qf,diff,fugitive,fugitiveblame,dbout nnoremap <silent> <buffer> q :q<CR>
autocmd! FileType netrw nnoremap <silent> <buffer> x :Rexplore<cr>

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

" Fuzzy find
nnoremap <leader>f :find **/*
vnoremap <leader>f "0y:find **/<c-r>0*<c-z>
nnoremap <leader>F :e <c-z>
nnoremap <leader>b :b <c-z>
nnoremap <leader>g :grep ''<left>
vnoremap <leader>g "0y:grep '<c-r>0'<left>
nnoremap <leader>G :set grepprg=<c-z>
nnoremap <leader>s :grep '<c-r>+'<left>

" Search and replace
nnoremap <leader>r :%s/<c-r><c-w>//g<left><left>
vnoremap <leader>r "5y<esc>:%s/<c-r>5//g<left><left>

" Open the quickfix window whenever a quickfix command is executed
autocmd! QuickFixCmdPost [^l]* cwindow

" Plugins config mac only
if has('mac')
  " Fzf options
  let g:fzf_vim = {}
  let g:fzf_vim.preview_window = ['right:35%']
  let g:fzf_layout = { 'down': '41%' }
  " Fzf keymaps
  augroup fzf_keymaps
    autocmd!
    nnoremap <leader>f :Files<cr>
    nnoremap <leader>F :GFiles<cr>
    nnoremap <leader>b :Buffers<cr>
    nnoremap <leader>j :Jumps<cr>
    nnoremap <leader>m :Marks<cr>
    nnoremap <leader>g :Rg<cr>
    vnoremap <leader>f "0y":Files <c-r>0<cr>
    vnoremap <leader>g "0y:Rg <c-r>0<cr>
  augroup END
  " Fzf highlight groups
  highlight! fzf1 ctermfg=grey ctermbg=NONE
  highlight! fzf2 ctermfg=grey ctermbg=NONE
  highlight! fzf3 ctermfg=grey ctermbg=NONE

  " GitGutter options
  let g:gitgutter_set_sign_backgrounds = 1
  " GitGutter keymaps
  augroup gitgutter_keymaps
    autocmd!
    nmap ]h <Plug>(GitGutterNextHunk)
    nmap [h <Plug>(GitGutterPrevHunk)
  augroup END
  " GitGutter highlight groups
  highlight! link SignColumn LineNr
  highlight GitGutterAdd ctermfg=darkgreen
  highlight GitGutterChange ctermfg=darkyellow
  highlight GitGutterDelete ctermfg=darkred

  " Dadbod UI keymap
  nnoremap <leader>db :DBUIToggle<CR>
endif
