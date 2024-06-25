vim9script

# ----------------------- #
# ----- Init set-up ----- #
# ----------------------- #

# Disable compatibility with vi which can cause unexpected issues.
set nocompatible

####################################
## EXCLUDED PART ON REMOTE SERVER ##

# ----------------------------- #
# ----- Plugin definition ----- #
# ----------------------------- #

call plug#begin()
# The default plugin directory will be as follows:
#   - Vim (Linux/macOS): '~/.vim/plugged'
#   - Vim (Windows): '~/vimfiles/plugged'
#   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
# You can specify a custom plugin directory by passing it as the argument
#   - e.g. `call plug#begin('~/.vim/plugged')`
#   - Avoid using standard Vim directory names like 'plugin'

# Make sure you use single quotes

# A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

# Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

# Parentheses, brackets, quotes, tags, and more
Plug 'tpope/vim-surround'

# Shows git diff markers in the sign column
Plug 'airblade/vim-gitgutter'

# Asynchronous Lint Engine
Plug 'dense-analysis/ale'

# Call plug#end to update &runtimepath and initialize the plugin system.
# - It automatically executes `filetype plugin indent on` and `syntax enable`
call plug#end()
# You can revert the settings after the call like so:
#   filetype indent off   # Disable file-type-specific indentation
#   syntax off            # Disable syntax highlighting

## END EXCLUDED PART ON REMOTE SERVER ##
########################################

#----------------------------#
#----- General settings -----#
#----------------------------#

# Re-map leader key
nnoremap <space> <nop>
g:mapleader = ' '

# Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

# Enable type file detection
filetype on
filetype plugin on

# Load an indent file for the detected file type.
filetype indent on

# Turn syntax highlighting on.
syntax enable

# Add numbers to each line on the left-hand side.
set number
set relativenumber
set ruler
set hidden

# Auto copy indent and auto read file change
set autoindent
set autoread

# Allow backspacing over listed items and belloff
set backspace=indent,eol,start
set belloff=all

# List of string that can start a comment line
set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,fb:•
set commentstring=

# Scan to put in completion
set complete=.,w,b,u,t
set define=

# Sequence of letters which describes how automatic formatting is to be done
set formatoptions=tcqj

# Program to use for the :grep command
set grepprg=rg\ --vimgrep\ -uu
set path=.,,

# Set default indentation
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround

# Do not save temporary files.
set nobackup
set noswapfile

# Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10
set splitbelow
set sidescroll=1

# Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap
set nocp

# Searching
set incsearch
set hlsearch
set matchpairs+=<:>
set ignorecase
set smartcase

# Pattern to be used to find an include command
set include=
set nojoinspaces

# The characters specified by this option are included in file names and path names
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~,=
set nolangremap

# Enable mouse interaction
set mouse=a
set mousemodel=popup_setpos

# Limit command height to 1 line
set cmdheight=1
set nopaste

# Show several useful info
set showcmd
set noshowmode
set showmatch

# Strings to use in list mode
set listchars=tab:>\ ,trail:-,nbsp:+
set nrformats=bin,hex

# Changes the effect of the :mksession command
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal

# The cursor is kept in the same column
set nostartofline

# Filenames for the tag command
set tags=./tags;,tags

# This option controls the behavior when switching between buffers
set switchbuf=uselast
set tabpagemax=50

# Get rid of scratch buffer
set completeopt-=preview
set ttimeout
set ttimeoutlen=50

# Changes the effect of the :mkview command
set viewoptions=folds,cursor,curdir

# Enable auto completion menu after pressing TAB.
set wildmenu
set wildmode=list:longest

# Set the commands to save in history default number is 20.
set history=10000
set ttyfast

# Colorscheme
set background=dark

# Set statusline last status
set laststatus=2

# ------------------- #
# ----- Keymaps ----- #
# ------------------- #

# Remap c-w prefix
nnoremap <silent> <leader>w <c-w>

# Remap switch region keys
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l

# Re-size split windows using arrow keys
nnoremap <silent> <up> :resize -2<cr>
nnoremap <silent> <down> :resize +2<cr>
nnoremap <silent> <left> :vertical resize +2<cr>
nnoremap <silent> <right> :vertical resize -2<cr>

# Search current marked text
vnoremap // y/\V<c-r>=escape(@",'/\')<cr><cr>

# Print current file path
nnoremap <leader>I :echo @%<cr>

# Copy marked text/paste to/from global register
vnoremap <leader>y "+y
nnoremap <leader>p "+p

# Difftool kemaps
nnoremap <leader>dp :diffput 2<cr>
nnoremap <leader>dl :diffget 1<cr>
nnoremap <leader>dr :diffget 3<cr>

# Show current line git annotate
def g:ShowGitAnnotate(): void
  var line = line('.')
  var file = expand('%:p')
  var format = " | cut -d' ' -f1,2,3 | tr '(' ' '"
  echo system('git annotate -L ' .. line .. ',' .. line .. ' ' .. file .. format)
enddef
nnoremap <leader>B :call ShowGitAnnotate()<cr>

# -------------- #
# ----- UI ----- #
# -------------- #

# Mode dictionary
const modes = {
  'n': 'NORMAL',
  'no': 'NORMAL',
  'v': 'VISUAL',
  'V': 'VISUAL LINE',
  '': 'VISUAL BLOCK',
  's': 'SELECT',
  'S': 'SELECT LINE',
  '': 'SELECT BLOCK',
  'i': 'INSERT',
  'ic': 'INSERT',
  'R': 'REPLACE',
  'Rv': 'VISUAL REPLACE',
  'c': 'COMMAND',
  'cv': 'VIM EX',
  'ce': 'EX',
  'r': 'PROMPT',
  'rm': 'MOAR',
  'r?': 'CONFIRM',
  '!': 'SHELL',
  't': 'TERMINAL',
}

# Custom statusline
def g:DefaultSl(): string
  var sl = ' '
  sl ..= modes[mode()]
  sl ..= ': '
  sl ..= '%t'
  sl ..= ' '
  sl ..= '%m'
  sl ..= '%='
  sl ..= '%y'
  sl ..= ' - '
  sl ..= '%l'
  sl ..= '|'
  sl ..= '%c'
  sl ..= ' '
  return sl
enddef
set statusline=%!DefaultSl()

# Set basic highlight groups
hi Normal cterm=NONE ctermbg=NONE
hi Statusline cterm=NONE ctermbg=grey ctermfg=black guibg=grey guifg=black
hi StatuslineNC ctermfg=darkgray guifg=darkgray
hi VertSplit cterm=NONE ctermfg=grey guifg=grey

####################################
## EXCLUDED PART ON REMOTE SERVER ##

# --------------------------------- #
# ----- Plugin configuration ------ #
# --------------------------------- #

# Don't let GitGutter set sign backgrounds
g:gitgutter_set_sign_backgrounds = 1
hi SignColumn ctermbg=NONE guibg=NONE

# Fzf config
g:fzf_vim = {}
g:fzf_vim.preview_window = []
g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

# Fzf mapping
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>F :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>/ :Rg<cr>

# Enable ALE completion, must be set before ALE is loaded
g:ale_completion_enabled = 1

# Disable ALE LSP suggestions
g:ale_disable_lsp = 1

# Custom ALE sign symbol
g:ale_sign_error = '✖'
g:ale_sign_info = '●'
g:ale_sign_warning = '▲'

# Custom ALE linters and LSPs
g:ale_linters_explicit = 1
g:ale_linters  =  {
  'java': ['javac'],
  'python': ['ruff'],
  'javascript': ['eslint'],
}

# Custom ALE sign color
hi ALEErrorSign ctermfg=red guifg=#af0000
hi ALEInfoSign ctermfg=blue guifg=#0087af
hi ALEWarningSign ctermfg=yellow guifg=#ffaf00

# ALE go to
nnoremap <silent> gd :ALEGoToDefinition<cr>
nnoremap <silent> gD :ALEGoToTypeDefinition<cr>
nnoremap <silent> gi :ALEGoToImplementation<cr>

# ALE actions
nnoremap <leader>a :ALECodeAction<cr>
nnoremap <leader>r :ALEFileRename<cr>
nnoremap <leader>k :ALEHover<cr>
nnoremap <leader>x :ALEFixSuggest<cr>
nnoremap <leader>i :ALEImport<cr>
vnoremap <leader>s y:ALESymbolSearch <c-r>"<cr>

# Open git client
nnoremap <leader>G :!lazygit<cr><cr>

## END EXCLUDED PART ON REMOTE SERVER ##
########################################

defcompile
