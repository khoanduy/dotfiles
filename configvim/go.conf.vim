"------Go language config------"
" Set leader key
let mapleader=","

autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 shiftwidth=4 noet

" Highlight funcs, fields, methods, structs, etc.
let g:go_highlight_build_constraints=1
let g:go_highlight_extra_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_structs=1
let g:go_highlight_types=1

" Auto highlight same variable
" let g:go_auto_sameids=1
"
" Auto import dependencies
let g:go_fmt_command="goimports"
" Show type info
let g:go_auto_type_info=1

" Go mapping
autocmd FileType go nmap <leader>gd <Plug>(go-def)
autocmd FileType go nmap <leader>gr <Plug>(go-run)
autocmd FileType go nmap <leader>gt <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file=expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
" Go debug mapping
autocmd FileType go nmap <leader>db <Plug>(go-debug-breakpoint)
autocmd FileType go nmap <leader>dn <Plug>(go-debug-next)
autocmd FileType go nmap <leader>ds <Plug>(go-debug-step)
autocmd FileType go nmap <leader>do <Plug>(go-debug-stepout)
autocmd FileType go nmap <leader>dc <Plug>(go-debug-continue)
autocmd FileType go nmap <leader>dp <Plug>(go-debug-print)
"------End Go config------"

