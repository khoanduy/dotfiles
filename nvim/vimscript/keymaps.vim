" Remap switch region keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remap switch region keys within terminal
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l

" Re-size split windows using arrow keys
nnoremap <silent> <Up> :resize -2<CR>
nnoremap <silent> <Right> :vertical resize +2<CR>
nnoremap <silent> <Down> :resize +2<CR>
nnoremap <silent> <Left> :vertical resize -2<CR>

" Dismiss highlight
nnoremap <silent> H :noh<CR>

" Move selected visual block by J and K
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv

" Remap scroll
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Navigate through quickfix list
nnoremap <silent> ]q :cnext<CR>zz
nnoremap <silent> [q :cprev<CR>zz

" Search current marked text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" Copy marked text/paste to/from global register
nnoremap <leader>Y "+Y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p

" Search and replace
nnoremap <leader>r :%s/<C-r><C-w>//g<Left><Left>
vnoremap <leader>r "5y<Esc>:%s/<C-r>5//g<Left><Left>

" Open the quickfix window whenever a quickfix command is executed
autocmd! QuickFixCmdPost [^l]* cwindow

" Quick exit some filetypes
autocmd! FileType help,qf,diff,fugitive,fugitiveblame,undotree,dbout nnoremap <silent> <buffer> q :q<CR>

" Run maven test
augroup java_config
  autocmd!
  autocmd FileType java nnoremap gt :lua require('utils.java').run_maven_test('-T 1C')<left><left>
  autocmd FileType java vnoremap gt "1y:lua require('utils.java').run_maven_test('-T 1C', '<c-r>1')
augroup END
