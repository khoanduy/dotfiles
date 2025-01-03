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

if has("nvim")
  " ----- Plugin definitions -----
  call plug#begin()

  " List your plugins here
  " Make sure you use single quotes

  " A command-line fuzzy finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Nvim Treesitter configurations and abstraction layer
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  " Neovim file explorer: edit your filesystem like a buffer
  Plug 'stevearc/oil.nvim'

  " A Git wrapper so awesome, it should be illegal
  Plug 'tpope/vim-fugitive'

  " Git integration for buffers
  Plug 'lewis6991/gitsigns.nvim'

  " Modern database interface for Vim
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
  Plug 'kristijanhusak/vim-dadbod-completion'

  " Neovim plugin for GitHub Copilot
  Plug 'github/copilot.vim'

  " ----- End plugin definitions -----
  call plug#end()
endif

" Turn syntax highlighting on.
syntax enable

" Add numbers to each line on the left-hand side.
set number
set relativenumber
set ruler
set hidden

" Show invisible characters
set list
" Set the characters for the invisibles
set listchars=tab:›\ ,eol:¬,trail:⋅
set showbreak=↪

" Auto copy indent and auto read file change
set autoindent
set autoread

" Allow backspacing over listed items and belloff
set backspace=indent,eol,start
set belloff=all
set visualbell

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
set scrolloff=50
set splitbelow
set splitright
set title

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
set wildcharm=<c-z>

" wildmenu settings
set wildmenu
if has('unix')
  set wildoptions=pum,tagfile
  set wildignore=*.o,*~,*.a,*.so,*.pyc,*.swp,.git/,*.class,*/target/*,*/build/*,.idea/
  set wildignore+=*/Library/*,*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/.DS_Store

  " Set include path for C/C++ development on MacOS
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
set background=dark
set notermguicolors

" Statusline
set laststatus=2

" Colorscheme
if has('unix')
  colorscheme habamax
endif

" ----- Highlights -----
" Highlight marked files in the same way search matches are
hi! link netrwMarkFile Search

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
nmap - :Explore<cr>

" Quick exit some filetypes
autocmd! FileType help,qf nnoremap <silent> <buffer> q :q<CR>
autocmd! FileType netrw nnoremap <silent> <buffer> x :Rexplore<cr>

" Search current marked text
vnoremap // y/\V<c-r>=escape(@",'/\')<cr><cr>

" Copy marked text/paste to/from global register
nnoremap <leader>Y "+Y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p

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

if has("nvim")
  " Disable netrw
  let g:loaded_netrwPlugin=1
  let g:loaded_netrw=1

  " Quick exit some filetypes
  autocmd! FileType diff,fugitive,fugitiveblame,dbout nnoremap <silent> <buffer> q :q<CR>

  " Fzf options
  let g:fzf_vim = {}
  let g:fzf_vim.preview_window = ['right:35%']
  let g:fzf_layout = { 'down': '41%' }
  " Fzf keymaps
  augroup fzf_keymaps
    autocmd!
    nnoremap <leader>f :Files<CR>
    nnoremap <leader>F :GFiles<CR>
    nnoremap <leader>b :Buffers<CR>
    nnoremap <leader>j :Jumps<CR>
    nnoremap <leader>m :Marks<CR>
    nnoremap <leader>g :Rg<CR>
    vnoremap <leader>f "0y":Files <C-r>0<CR>
    vnoremap <leader>g "0y:Rg <C-r>0<CR>
  augroup END
  " Fzf highlight groups
  highlight! fzf1 ctermfg=grey ctermbg=NONE
  highlight! fzf2 ctermfg=grey ctermbg=NONE
  highlight! fzf3 ctermfg=grey ctermbg=NONE

  " GitSigns options
  lua require('gitsigns').setup({ numhl = true })
  " GitSigns keymaps
  augroup gitsigns_keymaps
    autocmd!
    nnoremap <silent> ]h :Gitsigns next_hunk<CR>
    nnoremap <silent> [h :Gitsigns prev_hunk<CR>
    nnoremap <silent> <leader>hp :Gitsigns preview_hunk_inline<CR>
    nnoremap <silent> <leader>hs :Gitsigns stage_hunk<CR>
    nnoremap <silent> <leader>hS :Gitsigns undo_stage_hunk<CR>
    nnoremap <silent> <leader>hu :Gitsigns reset_hunk<CR>
  augroup END

  " Oil options
lua << EOF
require("oil").setup({
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
    -- Sort file names in a more intuitive order for humans. Is less performant,
    -- so you may want to set to false if you work with large directories.
    natural_order = false,
  },
})
EOF
  " Oil keymaps
  augroup oil_keymaps
    autocmd!
    nnoremap <silent> - :Oil<CR>
    autocmd FileType oil nnoremap <silent> <buffer> <C-h> <C-w>h
    autocmd FileType oil nnoremap <silent> <buffer> <C-j> <C-w>j
    autocmd FileType oil nnoremap <silent> <buffer> <C-k> <C-w>k
    autocmd FileType oil nnoremap <silent> <buffer> <C-l> <C-w>l
  augroup END

  " Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "cpp", "java", "python", "javascript", "json", "html", "css", "proto", "dockerfile",
      "toml", "yaml", "go", "sql", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  -- ignore_install = { "javascript" },

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

  " Dadbod UI keymap
  nnoremap <leader>db :DBUIToggle<CR>

  " Copilot settings
  let g:copilot_enabled = 0
  let g:copilot_no_tab_map = v:true
  inoremap <silent><script><expr> <C-e> copilot#Accept('\<CR>')
endif

" Set basic highlight groups
highlight! CursorLine cterm=bold
highlight! VertSplit cterm=NONE ctermbg=NONE ctermfg=grey
