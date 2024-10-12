" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Re-map leader key
nnoremap <space> <nop>
let g:mapleader=' '

" ----- Plugin definitions -----
call plug#begin()

" List your plugins here
" Make sure you use single quotes

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" :eyes: "/@/ctrl-r
Plug 'junegunn/vim-peekaboo'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" surround.vim: Delete/change/add parentheses/quotes/XML-tags/much more with ease
Plug 'tpope/vim-surround'

" commentary.vim: comment stuff out
Plug 'tpope/vim-commentary'

" repeat.vim: enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'

" vinegar.vim: Combine with netrw to create a delicious salad dressing
Plug 'tpope/vim-vinegar'

" A Vim plugin which shows git diff markers in the sign column
Plug 'airblade/vim-gitgutter'

" The undo history visualizer for VIM
Plug 'mbbill/undotree'

" Check syntax in Vim asynchronously and fix files
" Plug 'dense-analysis/ale'

" ----- End plugin definitions -----
call plug#end()

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

" Program to use for the :grep command
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden

" tags lookup
set tags=./tags;,tags;

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

" wildmenu settings
set wildmenu
set wildignore=*.o,*~,*.a,*.so,*.pyc,*.swp,.git/,*.class,*/target/*,.idea/
set wildignore+=*/Library/*,*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/.DS_Store

" Set the commands to save in history default number is 20.
set history=10000
set ttyfast

" Set statusline last status and background
set laststatus=2
set background=light

" ----- Highlights -----
" Highlight marked files in the same way search matches are
hi! link netrwMarkFile Search

" Set basic highlight groups
hi Normal cterm=NONE ctermbg=NONE
hi CursorLine cterm=bold term=bold
hi Statusline cterm=NONE ctermbg=grey ctermfg=black
hi StatuslineNC ctermfg=lightgrey
hi VertSplit cterm=NONE ctermfg=grey guifg=grey

" Pmenu highlight
hi Pmenu ctermbg=lightmagenta ctermfg=black
hi PmenuSel ctermbg=darkgrey ctermfg=white
hi PmenuSbar ctermbg=lightmagenta
hi PmenuThumb ctermbg=lightgrey

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
nnoremap <silent> <down> :resize +2<cr>
nnoremap <silent> <left> :vertical resize +2<cr>
nnoremap <silent> <right> :vertical resize -2<cr>

" Open netrw at current dir
nnoremap - :Explore<cr>

" netrw keymap
function! s:netrw_keymaps()
  nnoremap <buffer> <leader>q :Rexplore<cr>
endfunction

augroup netrw_mapping
  autocmd!
  autocmd Filetype netrw call <sid>netrw_keymaps()
augroup END

" Search current marked text
vnoremap // y/\V<c-r>=escape(@",'/\')<cr><cr>

" Copy marked text/paste to/from global register
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Dir/File keymaps
nnoremap <leader>d :!mkdir -p %:h<c-z>
nnoremap <leader>c :!cp %<c-z> %:h<c-z>
nnoremap <leader>C :!cp -rp %:h<c-z> %:h<c-z>
nnoremap <leader>m :!mv %<c-z> %:h<c-z>

" Vim session keymaps
function! s:mks_cur_repo()
  if &ft == 'fugitive' || &ft == ''
    return
  endif

  let name = join(split(tolower(getcwd()), '[/]')[2:], '-')
  echo name
  execute(':mks! ' . $HOME . '/vimsessions' . '/' . name . '.vim')
endfunction
autocmd! BufLeave <buffer> call <sid>mks_cur_repo()
autocmd! VimLeave * call <sid>mks_cur_repo()
nnoremap <leader>S :source $HOME/vimsessions/*.vim<c-z>

" Create tags file
function! s:gen_tags() 
  execute('!tmux new-window -n "ctags" -d "tmux setw -t ctags remain-on-exit off; ctags -R '
    \ . getcwd() . '"')
endfunction
nnoremap <silent> <leader>t :call <sid>gen_tags()<cr> | silent redraw!

" Open the quickfix window whenever a quickfix command is executed
autocmd QuickFixCmdPost [^l]* cwindow

" Don't let GitGutter set sign backgrounds
let g:gitgutter_set_sign_backgrounds=1
hi SignColumn ctermbg=NONE guibg=NONE

" ----- Plugins config -----
" Fzf config
let g:fzf_vim={}
let g:fzf_vim.preview_window=[]
let g:fzf_layout={ 'window': { 'width': 0.8, 'height': 0.8 } }

" Fuzzy finding
nnoremap <leader>f :Files<cr>
nnoremap <silent> <leader>e :find **/*
nnoremap <leader>F :GFiles<cr>
nnoremap <leader>b :Buffers<cr>
vnoremap <leader>b "1y:Buffers <c-r>1<cr>
nnoremap <leader>/ :Rg<cr>
vnoremap <leader>/ "5y:Rg <c-r>5<cr>
vnoremap <leader>s :Rg <c-r>"<cr>
nnoremap <silent> <leader>g :grep ''<left>
nnoremap <leader>G :set grepprg=<c-z>

" Enable ALE completion
let g:ale_disable_lsp=1
let g:ale_completion_enabled=0
let g:ale_virtualtext_cursor='disabled'

" Custom ALE sign symbol
let g:ale_sign_error='✖'
let g:ale_sign_info='●'
let g:ale_sign_warning='▲'

" Custom ALE sign color
hi ALEErrorSign ctermfg=red guifg=red
hi ALEInfoSign ctermfg=blue guifg=blue
hi ALEWarningSign ctermfg=yellow guifg=yellow

" Toggle Undotree
nnoremap <leader>u :UndotreeToggle<cr>

" ----- Language specific config -----
" Maven run current test, only apply to Java files
function! s:run_maven_test()
  let dirs = split(@%, '[/]')

  if index(dirs, 'test') < 0
    echo 'Not a test file!'
    return
  endif

  let module = dirs[0] != 'src' ? dirs[0] : ''
  let test_class = join(dirs[4:], '.')[:-6]

  execute('!tmux new-window -n "' . dirs[-1] . '" -d "mvn test -pl :'
    \ . module . ' -Dtest=' . test_class . ' -DskipTests=false"')
endfunction
autocmd FileType java nnoremap <leader>T :call <sid>run_maven_test()<cr> | silent redraw!

" Java linting
function! s:java_lint()
  if executable('fd') == 1
    let out = system('fd --no-ignore --type d target ' . getcwd())
  else
    let out = system('find ' . getcwd() . ' -type d -name target')
  endif

  let out = substitute(out, '\n$', '', '')
  let classpath = join(split(out, '\n'), '/*:')

  execute('make! -cp "' . classpath .'/*" %')
endfunction
autocmd FileType java nnoremap <silent> <leader>L :call <sid>java_lint()<cr> | silent redraw!

" Trigger linting on buffer save
autocmd FileType python nnoremap <silent> <leader>L :make! %<cr> | silent redraw!
