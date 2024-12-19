" Add numbers to each line on the left-hand side.
set number
set laststatus=3

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
set smartcase

" Limit command height to 1 line
set cmdheight=1
set nopaste

" Show several useful info
set noshowmode
set showmatch

" The cursor is kept in the same column
set nostartofline

" Dark and get rid of scratch buffer
set background=dark
set completeopt-=preview

" Program to use for the :grep command
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden

" Set include path for C/C++ development on MacOS
set path+=/Library/Developer/CommandLineTools/usr/include
set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include
set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1

" Disable netrw
let g:loaded_netrwPlugin=1
let g:loaded_netrw=1
