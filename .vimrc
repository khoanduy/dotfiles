" ----------------------- "
" ----- Init set-up ----- "
" ----------------------- "

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable ALE completion, must be set before ALE is loaded
let g:ale_completion_enabled=1

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Colorscheme
Plug 'nanotech/jellybeans.vim'

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Parentheses, brackets, quotes, tags, and more
Plug 'tpope/vim-surround'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Shows git diff markers in the sign column
Plug 'airblade/vim-gitgutter'

" A solid language pack for Vim
Plug 'sheerun/vim-polyglot'

" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" ---------------------------- "
" ----- General settings ----- "
" ---------------------------- "

" Re-map leader key
nnoremap <space> <nop>
let mapleader=' '

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
set hidden

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
set splitbelow

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap
set nocp

" Searching
set incsearch
set hlsearch
set matchpairs+=<:>
set ignorecase
set smartcase

" Enable mouse interaction
set ma
set mouse=a

" Limit command height to 1 line
set cmdheight=1
set nopaste

" Show several useful info
set showcmd
set noshowmode
set showmatch

" Get rid of scratch buffer
set completeopt-=preview

" Enable auto completion menu after pressing TAB.
set wildmenu
set wildmode=list:longest

" Set the commands to save in history default number is 20.
set history=10000

" -------------- "
" ----- UI ----- "
" -------------- "

" Colorscheme
set termguicolors
set background=dark
let g:jellybeans_use_term_italics=0
let g:jellybeans_use_gui_italics=0
colorscheme jellybeans

" Set statusline last status
set laststatus=2
set statusline=%1*
set statusline+=\ 
set statusline+='
set statusline+=%{StatuslineMode()}
set statusline+=:
set statusline+=\ 
set statusline+=%2*
set statusline+=%f
set statusline+=\ 
set statusline+=%=
set statusline+=%2*
set statusline+=%m
set statusline+=\ 
set statusline+=%3*
set statusline+=%y
set statusline+=\ 
set statusline+=%5*
set statusline+=-
set statusline+=\ 
set statusline+=%4*
set statusline+=%{strlen(&fenc)?&fenc:'none'}
set statusline+=\|
set statusline+=%l
set statusline+=:
set statusline+=%L
set statusline+=\ 
set statusline+=%2*

" Custom statusline segment color
hi User1 ctermbg=NONE ctermfg=lightgreen guibg=NONE guifg=lightgreen
hi User2 ctermbg=NONE ctermfg=lightcyan guibg=NONE guifg=lightcyan
hi User3 ctermbg=NONE ctermfg=lightyellow guibg=NONE guifg=lightyellow
hi User4 ctermbg=NONE ctermfg=lightgrey guibg=NONE guifg=lightgrey
hi User5 ctermbg=NONE ctermfg=lightblue guibg=NONE guifg=lightblue

" Set inactive status line style
hi StatusLineNC ctermbg=NONE ctermfg=grey guibg=NONE guifg=grey

" Get current mode
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

" ------------------- "
" ----- Mapping ----- "
" ------------------- "

" Dismiss hightlight
nnoremap <esc><esc> <esc>:noh<cr>

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
vnoremap <leader>/ y/\V<c-r>=escape(@",'/\')<cr><cr>

" Copy marked text/paste to/from global register
vnoremap <leader>y "+y
nnoremap <leader>p "+p

" Open git client
nnoremap <leader>G :!lazygit<cr><cr>
" ALE go to
nnoremap <silent> gd :ALEGoToDefinition<cr>
nnoremap <silent> gD :ALEGoToTypeDefinition<cr>
nnoremap <silent> gi :ALEGoToImplementation<cr>
" ALE actions
nnoremap <leader>ah :ALEHover<cr>
nnoremap <leader>ar :ALEFileRename<cr>
nnoremap <leader>ac :ALECodeAction<cr>
nnoremap <leader>af :ALEFixSuggest<cr>

" --------------------- "
" ----- Utilities ----- "
" --------------------- "

" Netrw config and mapping
hi! link netrwMarkFile Search
highlight CursorLine ctermbg=NONE guibg=NONE
let g:netrw_liststyle=0

" Sync current directory and browsing directory
" This solves the problem with the 'move' command
let g:netrw_keepdir=0

" A better copy command
let g:netrw_localcopydircmd='cp -r'

" Toggle netrw and focus file
nnoremap <leader>e :Explore<cr>
nnoremap <leader>E :Explore %:p:h<cr>

" Remap key inside netrw buffer
function! NetrwMapping()
  " cancel browsing
  nmap <buffer> <silent> E :Rexplore<cr>

  " Go back in history
  nmap <buffer> H u

  " Go up a directory
  nmap <buffer> h -^

  " Go down a directory / open file
  nmap <buffer> l <CR>

  " Toggle the mark on a file
  nmap <buffer> x mf

  " Unmark all files
  nmap <buffer> X mu

  " Create a file
  nmap <buffer> a %:w<cr>:buffer #<cr>

  " Copy marked files
  nmap <buffer> y mc

  " Move marked files
  nmap <buffer> p mm

  " Set the directory under the cursor as the current target
  nmap <buffer> t mtfq

  " Show the list of marked files
  nmap <buffer> ex :echo join(netrw#Expose('netrwmarkfilelist'), "\n")<cr>

  " Show the current target directory
  nmap <buffer> et :echo 'Target:' . netrw#Expose('netrwmftgt')<cr>
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup end

" --------------------------------- "
" ----- Plugin configuration ------ "
" --------------------------------- "

" Fzf config
let g:fzf_vim={}
let g:fzf_vim.preview_window=[]
let g:fzf_layout={ 'window': { 'width': 0.6, 'height': 0.6 } }

" Fzf mapping
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>F :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>/ :Rg<cr>
" Let :grep use ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Don't let GitGutter set sign backgrounds
let g:gitgutter_set_sign_backgrounds=1
highlight SignColumn ctermbg=NONE guibg=NONE

" Custom ALE sign symbol
let g:ale_sign_error='✖'
let g:ale_sign_info='●'
let g:ale_sign_warning='▲'

" Custom ALE sign color
highlight ALEErrorSign ctermfg=red guifg=red
highlight ALEInfoSign ctermfg=lightblue guifg=lightblue
highlight ALEWarningSign ctermfg=yellow guifg=yellow

" Disable ALE virtual text
let g:ale_virtualtext_cursor='disabled'

" Custom ALE completion symbols
let g:ale_completion_symbols = {
\ 'text': 'ɕ',
\ 'method': '◎',
\ 'function': '◯',
\ 'constructor': '⚙',
\ 'field': '◍',
\ 'variable': '✦',
\ 'class': '◆',
\ 'interface': '◇',
\ 'module': '▧',
\ 'property': '◉',
\ 'unit': 'v',
\ 'value': 'v',
\ 'enum': 't',
\ 'keyword': 'v',
\ 'snippet': 'v',
\ 'color': 'v',
\ 'file': 'v',
\ 'reference': 'v',
\ 'folder': 'v',
\ 'enum_member': 'm',
\ 'constant': 'm',
\ 'struct': 't',
\ 'event': 'v',
\ 'operator': 'f',
\ 'type_parameter': 'p',
\ '<default>': 'v'
\ }

" Enable ALE suggestions
let g:ale_lsp_suggestions=1

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit=1

" Custom ALE linters and LSPs
let g:ale_linters = {
\ 'python': ['pyright', 'ruff'],
\ 'java': ['javac'],
\ }
