" ----------------------------
" ----- General settings -----
" ----------------------------

" Re-map leader key
nnoremap <space> <nop>
let mapleader=' '

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
lang en_US.UTF-8

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

" Set default indentation
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround
" Do not save temporary files.
set nobackup
set noswapfile

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" Searching
set incsearch
set hlsearch
set matchpairs+=<:>
set ignorecase
set smartcase

" Enable mouse interaction
set ma
set mouse=a

" Show several useful info
set showcmd
" set showmode
set showmatch

" Get rid of scratch buffer
set completeopt-=preview

" Enable auto completion menu after pressing TAB.
set wildmenu
set wildmode=list:longest

" Set the commands to save in history default number is 20.
set history=1000

" --------------------
" ----- vim-plug -----
" --------------------
call plug#begin()
" Make sure you use single quotes

Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()

" ---------------------
" ----- Utilities -----
" ---------------------

" Netrw config and mapping
let g:netrw_keepdir=0
let g:netrw_winsize=100
let g:netrw_banner=0
let g:netrw_localcopydircmd='cp -r'
hi! link netrwMarkFile Search

" Toggle netrw and focus file
nnoremap <leader>e :Explore<cr>
nnoremap <leader>E :Explore %:p:h<cr>

" Remap key inside netrw buffer
function! NetrwMapping()
  " cancel browsing
  nmap <buffer> qq <c-^>
  " go back in history
  nmap <buffer> H u
  " go up a dir
  nmap <buffer> h -^
  " open a dir or file
  nmap <buffer> l <cr>
  " toggle dotfiles
  nmap <buffer> . gh
  " add file
  nmap <buffer> a %:w<cr>:buffer #<cr>
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

" fzf config and mapping
let g:fzf_vim={}
let g:fzf_vim.preview_window=[]
let g:fzf_layout={ 'window': { 'width': 0.6, 'height': 0.6 } }

nnoremap <leader>f :Files<cr>
nnoremap <leader>F :GFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>_ :Rg<cr>

" Get git status of current buffer
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

" --------------
" ----- UI -----
" --------------

" Colorscheme
autocmd VimEnter * hi Normal ctermbg=none
set background=dark
let g:gruvbox_transparent_bg='1'
let g:gruvbox_italic='0'
colorscheme gruvbox

" Custom statusline
set laststatus=2
set statusline=
set statusline+=%2*
set statusline+=%=
set statusline+=%f
set statusline+=\ 
set statusline+=%2*
set statusline+=%m
set statusline+=\ 
set statusline+=%3*
set statusline+=%y
set statusline+=\ 
set statusline+=%4*
set statusline+=%{strlen(&fenc)?&fenc:'none'}
set statusline+=\|
set statusline+=%l
set statusline+=:
set statusline+=%L
set statusline+=\ 
set statusline+=%2*
set statusline+=\ 
set statusline+=%1*
set statusline+=%{StatuslineMode()}
set statusline+=\ 

hi User1 ctermbg=NONE ctermfg=lightgreen guibg=NONE guifg=lightgreen
hi User2 ctermbg=NONE ctermfg=lightcyan guibg=NONE guifg=lightcyan
hi User3 ctermbg=NONE ctermfg=lightyellow guibg=NONE guifg=lightyellow
hi User4 ctermbg=NONE ctermfg=grey guibg=NONE guifg=grey
" hi User5 ctermbg=NONE ctermfg=lightred guibg=NONE guifg=lightred

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#'n'
    return 'NORMAL'
  elseif l:mode==?'v'
    return 'VISUAL'
  elseif l:mode==#'i'
    return 'INSERT'
  elseif l:mode==#'R'
    return 'REPLACE'
  elseif l:mode==?'s'
    return 'SELECT'
  elseif l:mode==#'t'
    return 'TERMINAL'
  elseif l:mode==#'c'
    return 'COMMAND'
  elseif l:mode==#'!'
    return 'SHELL'
  endif
endfunction

" Don't let GitGutter set sign backgrounds
let g:gitgutter_set_sign_backgrounds=1
highlight SignColumn ctermbg=none

" -------------------
" ----- Mapping -----
" -------------------

" Remap c-w prefix
nnoremap <silent> <leader>w <c-w>

" Remap switch region keys
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l

" Re-size split windows using arrow keys
nnoremap <silent> <up> :resize -2<cr>
nnoremap <silent> <down> :resize +2<cr>
nnoremap <silent> <left> :vertical resize +2<cr>
nnoremap <silent> <right> :vertical resize -2<cr>

" Remap indent keys
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" Search current marked text
vnoremap // y/\V<c-r>=escape(@",'/\')<cr><cr>

" Turn off highlight
nnoremap <silent> \| :noh<cr>

" Copy marked text/paste to/from global register
vnoremap <leader>y "+y
nnoremap <leader>p "+p

" Split tmux pane below
nnoremap <leader>T :!tmux split-window -p 25 'zsh'<cr><cr>

" Open git client
nnoremap <leader>G :!tmux setw remain-on-exit off && tmux split-window -h -p 65 'lazygit'<cr><cr>
