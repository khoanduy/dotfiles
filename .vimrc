" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Re-map leader key
nnoremap <space> <nop>
let g:mapleader=' '

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

" Program to use for the :grep command
set grepprg=rg\ --vimgrep\ --hidden

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
set wildoptions=pum,tagfile
set wildmenu
set wildignore=*.o,*~,*.a,*.so,*.pyc,*.swp,.git/,*.class,*/target/*,.idea/
set wildignore+=*/Library/*,*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/.DS_Store

" Set the commands to save in history default number is 20.
set history=10000
set ttyfast

" Set statusline last status and background
set laststatus=2
set background=light

" Highlight marked files in the same way search matches are
hi! link netrwMarkFile Search

" Set basic highlight groups
hi Normal cterm=NONE ctermbg=NONE
hi CursorLine cterm=bold term=bold
hi Statusline cterm=NONE ctermbg=grey ctermfg=black guibg=grey guifg=black
hi StatuslineNC ctermfg=lightgrey guifg=lightgrey
hi VertSplit cterm=NONE ctermfg=grey guifg=grey

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
nnoremap <silent> <down> :resize +2<cr>
nnoremap <silent> <left> :vertical resize +2<cr>
nnoremap <silent> <right> :vertical resize -2<cr>

" Add mapping for auto closing
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<cr> {<cr>}<esc>O

" Open netrw at current dir
nnoremap - :Explore<cr>

" Search current marked text
vnoremap // y/\V<c-r>=escape(@",'/\')<cr><cr>

" Copy marked text/paste to/from global register
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Vim session keymaps
function! s:mks_cur_repo()
  let name = join(split(tolower(getcwd()), '[/]')[2:], '-')
  echo name
  execute(':mks! ' . $HOME . '/vimsessions' . '/' . name . '.vim')
endfunction
nnoremap <leader>s :call <sid>mks_cur_repo()<cr>
nnoremap <leader>S :source $HOME/vimsessions/*.vim<c-z>

" Maven run current test, only apply to Java files
function! s:run_maven_test()
  let dirs = split(@%, '[/]')

  if index(dirs, 'test') < 0
    echo 'Not a test file!'
    return
  endif

  let module = dirs[0] != 'src' ? dirs[0] : ''
  let test_class = join(dirs[4:], '.')[:-6]

  execute('!mvn test -pl :' . module . ' -Dtest=' . test_class . ' -DskipTests=false')
endfunction
autocmd FileType java nnoremap <leader>T :call <sid>run_maven_test()<cr>

" Open the quickfix window whenever a quickfix command is executed
autocmd QuickFixCmdPost [^l]* cwindow

" Fuzzy finding
nnoremap <leader>f :find **/*
nnoremap <leader>b :buffer *<c-z>
nnoremap <leader>g :grep ''<left>
nnoremap <leader>G :set grepprg=<c-z>

" Java lint
autocmd FileType java setlocal makeprg=javac\ %
autocmd FileType java compiler javac

" Python lint
autocmd FileType python setlocal makeprg=pylint\ --output-format=parseable
autocmd FileType python compiler pylint

" Linting
" autocmd BufWritePost *.java,*.py silent make! <afile> | silent redraw!
