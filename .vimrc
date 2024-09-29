vim9script

# Disable compatibility with vi which can cause unexpected issues.
set nocompatible

# Re-map leader key
nnoremap <Space> <Nop>
g:mapleader = ' '

# -----
# Plugin definitions
call plug#begin()

# List your plugins here
# Make sure you use single quotes

# A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

# A Vim plugin which shows git diff markers in the sign column
Plug 'airblade/vim-gitgutter'

# A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

# comment stuff out
Plug 'tpope/vim-commentary'

# Delete/change/add parentheses/quotes/XML-tags/much more with ease
Plug 'tpope/vim-surround'

# Combine with netrw to create a delicious salad dressing
Plug 'tpope/vim-vinegar'

# :eyes: "/@/ctrl-r
Plug 'junegunn/vim-peekaboo'

# A Vim plugin that manages your tag files
Plug 'ludovicchabant/vim-gutentags'

# Check syntax in Vim asynchronously and fix files
Plug 'dense-analysis/ale'

# Personal Wiki for Vim
Plug 'vimwiki/vimwiki'

# End plugin definitions
call plug#end()
# -----

# Encoding
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8

# Enable type file detection
filetype on
filetype plugin on

# Load an indent file for the detected file type.
filetype indent on
filetype plugin indent on

# Turn syntax highlighting on.
syntax enable

# Add numbers to each line on the left-hand side.
set number
set ruler
set hidden

# Auto copy indent and auto read file change
set autoindent
set autoread

# Allow backspacing over listed items and belloff
set backspace=indent,eol,start
set belloff=all

# Scan to put in completion
set complete=.,w,b,u,t

# Sequence of letters which describes how automatic formatting is to be done
set formatoptions=tcqj

# Program to use for the :grep command
set grepprg=rg\ --vimgrep\ --hidden
set path+=**

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
set nowrap

# Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10
set splitbelow

# Searching
set incsearch
set hlsearch
set matchpairs+=<:>
set ignorecase
set smartcase

# Enable mouse interaction
set mouse=a
set mousemodel=popup_setpos

# Limit command height to 1 line
set cmdheight=1
set nopaste

# Show several useful info
set showcmd
set showmode
set showmatch

# The cursor is kept in the same column
set nostartofline

# This option controls the behavior when switching between buffers
set switchbuf=uselast
set tabpagemax=50

# Get rid of scratch buffer
set completeopt-=preview
set ttimeout
set ttimeoutlen=50

# Enable auto completion menu after pressing TAB.
set wildmode=full
set wildignore=*.o,*~,*.a,*.so,*.pyc,*.swp,.git/,*.class,*/target/*,.idea/
set wildignore+=*/Library/*,*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/.DS_Store
set wildoptions=pum,tagfile
set wildmenu

# Set the commands to save in history default number is 20.
set history=10000
set ttyfast

# Set statusline last status and background
set laststatus=2
set background=light

# Highlight marked files in the same way search matches are
hi! link netrwMarkFile Search

# Set basic highlight groups
hi Normal cterm=NONE ctermbg=NONE
hi CursorLine cterm=bold term=bold
hi Statusline cterm=NONE ctermbg=grey ctermfg=black guibg=grey guifg=black
hi StatuslineNC ctermfg=lightgrey guifg=lightgrey
hi VertSplit cterm=NONE ctermfg=grey guifg=grey

# Remap switch region keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

# Remap switch region keys within terminal
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

# Re-size split windows using arrow keys
nnoremap <silent> <up> :resize -2<CR>
nnoremap <silent> <down> :resize +2<CR>
nnoremap <silent> <left> :vertical resize +2<CR>
nnoremap <silent> <right> :vertical resize -2<CR>

# Remap insert mode escape key
inoremap <silent> jk <ESC>

# Search current marked text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

# Print current file path
nnoremap <leader>I :echo @%<CR>

# Copy marked text/paste to/from global register
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

# -----
# Vim session keymaps
def MksCurrentRepo(): void
  var name = join(split(tolower(getcwd()), '[/]')[2 : ], '-')
  execute('silent :mks! ' .. $HOME .. '/vimsessions' .. '/' .. name .. '.vim')
enddef
nnoremap <leader>s <ScriptCmd>MksCurrentRepo()<CR>
nnoremap <leader>S :source $HOME/vimsessions/

# Maven run current test, only apply to Java files
def RunMavenTest(): void
  var folders = split(@%, '[/]')

  if index(folders, 'test') < 0
    echo 'Not a test file!'
    return
  endif

  var module = folders[0] != 'src' ? folders[0] : ''
  var test_class = join(folders[4 : ], '.')[ : -6 ]

  execute('silent !mvn test -pl :' ..
    module .. ' -Dtest=' .. test_class .. ' -DskipTests=false')
enddef
autocmd FileType java nnoremap <leader>T <ScriptCmd>RunMavenTest()<CR>

# Don't let GitGutter set sign backgrounds
g:gitgutter_set_sign_backgrounds = 1
hi SignColumn ctermbg=NONE guibg=NONE

# Fzf config
g:fzf_vim = {}
g:fzf_vim.preview_window = []
g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

# Fuzzy finding
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<CR>

# Diable ALE's LSP functionality
g:ale_disable_lsp = 1
g:ale_virtualtext_cursor = 'disabled'

# Custom ALE sign symbol
g:ale_sign_error = '✖'
g:ale_sign_info = '●'
g:ale_sign_warning = '▲'

# Custom ALE sign color
hi ALEErrorSign ctermfg=red guifg=red
hi ALEInfoSign ctermfg=blue guifg=blue
hi ALEWarningSign ctermfg=yellow guifg=yellow

# User Markdown for vimwiki
g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]
g:vimwiki_global_ext = 0
g:vimwiki_ext2syntax = {}
# -----

defcompile
