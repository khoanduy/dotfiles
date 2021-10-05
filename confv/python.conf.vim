"------Python configuration------"
" Set leader key
let mapleader=','

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 shiftwidth=4 et

" Jedi-vim config
autocmd FileType python nnoremap <buffer> <leader>gd :call jedi#goto()<CR>
autocmd FileType python nnoremap <buffer> <leader>ga :call jedi#goto_assignments()<CR>
autocmd FileType python nnoremap <buffer> <leader>dm :call jedi#show_documentation()<CR>
"------End Python configuration------"

