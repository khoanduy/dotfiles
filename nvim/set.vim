" ----- General settings -----
" Encoding
set termencoding=utf-8

" Enable type file detection
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on
filetype plugin indent on

" Add numbers to each line on the left-hand side.
set number
set relativenumber

" Program to use for the :grep command
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden

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

" Limit command height to 1 line
set cmdheight=1
set nopaste

" Show several useful info
set showmode
set showmatch

" The cursor is kept in the same column
set nostartofline

" Get rid of scratch buffer
set completeopt-=preview

" Enable auto completion menu after pressing TAB.
set wildmode=full
set wildcharm=<c-z>

" Set background
set background=dark

" ----- Highlights -----
" Set basic highlight groups
hi Normal cterm=NONE term=NONE guibg=NONE
hi CursorLine cterm=bold term=bold
hi Statusline cterm=NONE guibg=black guibg=darkgrey
hi StatuslineNC guibg=grey guifg=black
hi VertSplit cterm=NONE guifg=grey

" Pmenu highlight
hi Pmenu guibg=grey guifg=lightgrey
hi PmenuSel guibg=darkgrey guifg=black
hi PmenuSbar guibg=grey
hi PmenuThumb guibg=grey

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
nnoremap <silent> gq :cclose<cr>

" Close help and quickfix
autocmd FileType help,fugitive,fugitiveblame
\ nnoremap <silent> <buffer> x :q<cr>

" Search current marked text
vnoremap // y/\V<c-r>=escape(@",'/\')<cr><cr>

" Copy marked text/paste to/from global register
nnoremap <leader>Y "+Y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p

" Native fuzzy find
nnoremap <leader>e :find **/*
nnoremap <leader>/ :grep ''<left>
vnoremap <silent> <leader>/ "5y:grep! '<c-r>5'<cr><cr>
nnoremap <silent> <leader>s :grep! '<c-r>+'<cr><cr>
nnoremap <leader>G :set grepprg=<c-z>

" Dir/File keymaps
nnoremap <leader>d :!mkdir -p %:h<c-z>
nnoremap <leader>c :!cp %<c-z> %:h<c-z>
nnoremap <leader>C :!cp -rp %:h<c-z> %:h<c-z>
nnoremap <leader>m :!mv %<c-z> %:h<c-z>

" Search and replace
nnoremap <leader>r :%s/<c-r><c-w>//g<left><left>
vnoremap <leader>r "6y<esc>:%s/<c-r>6//g<left><left>

" Vim session keymaps
function! s:mks_cur_repo()
  if &ft == 'fugitive' || &ft == ''
    return
  endif

  let name = join(split(tolower(getcwd()), '[/]')[2:], '-')
  echo name
  execute(':mks! ' . $HOME . '/.vimsess' . '/' . name . '.vim')
endfunction
autocmd! BufLeave <buffer> call <sid>mks_cur_repo()
autocmd! VimLeave * call <sid>mks_cur_repo()
nnoremap <leader>S :source $HOME/.vimsess/*.vim<c-z>

" Create tags file
function! s:gen_tags() 
  execute('!tmux new-window -n "ctags" -d "tmux setw -t ctags remain-on-exit off; ctags -R '
  \ . getcwd() . '"')
endfunction
nnoremap <silent> <leader>T :call <sid>gen_tags()<cr><cr>

" Run command in a separate tmux window
function! s:run_cmd_in_tmux_within_cwd(cmd) 
  execute('!tmux new-window -n "' . a:cmd . '" -d "cd '
  \ . getcwd() . '; ' . a:cmd . '"')
endfunction
nnoremap <leader>x :call <sid>run_cmd_in_tmux_within_cwd("")<left><left>

" Open the quickfix window whenever a quickfix command is executed
autocmd! QuickFixCmdPost [^l]* cwindow

" Don't let GitGutter set sign backgrounds
let g:gitgutter_set_sign_backgrounds=1
hi SignColumn ctermbg=NONE guibg=NONE

" ----- Language specific config -----
" Get current Java module
function! s:get_java_module()
  let path = substitute(expand('%:p'), getcwd() . '/', '', '')
  let dirs = split(path, '[/]')
  let mpos = index(dirs, 'src')

  let name = join(dirs[:mpos - 1], '/')
  let module = split(system("sed -n 's/<artifactId>\\(.*\\)<\\/artifactId>/\\1/p' "
  \ . name . "/pom.xml | head -" . mpos), '\n')[-1]

  let module = substitute(module, '\s\+$', '', '')
  let module = substitute(module, '^\s\+', '', '')

  return module
endfunction

" Maven run current test buffer
function! s:run_maven_test()
  let pane = system("tmux list-windows \| grep '" . expand('%:t') . "' \| awk -F: '{print $1}'")
  if pane > 0
    return '!tmux respawn-window -t ' . pane
  endif

  let path = substitute(expand('%:p'), getcwd() . '/', '', '')
  let dirs = split(path, '[/]')

  if index(dirs, 'test') < 0
    return
  endif

  let tpos = index(dirs, 'test') + 2
  let test_class = join(dirs[tpos:], '.')[:-6]
  let module = s:get_java_module()

  return '!tmux new-window -n "' . dirs[-1] . '" -d "mvn test -T 1C -pl :'
  \ . module . ' -Dtest=' . test_class . ' -Dic.configurationFile='
  \ . getcwd() . '/configuration.properties -Dlogback.configurationFile='
  \ . getcwd() . '/logback-dev.xml -DskipTests=false -Dgroups=small,medium"'
endfunction
autocmd FileType java nnoremap <expr> gt ':' . <sid>run_maven_test()

