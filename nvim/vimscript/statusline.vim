" Non-global statusline
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
