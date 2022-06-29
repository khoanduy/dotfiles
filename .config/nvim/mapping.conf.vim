"------Mappings config------"
" Set leader key
let mapleader=','

" Remap C-w prefix
nnoremap <leader>w <C-w>

" Re-size split windows using arrow keys
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Remap switch buffers keys
nmap <leader>bn :bn<CR>
nmap <leader>bp :bp<CR>
nmap <leader>bd :bd<CR>
nmap <leader>bw :bw<CR>
nmap <leader>bb :buffers<CR>:b<space>
nmap <leader>bl :Buffers<CR>

" Remap terminal escape key
tnoremap <leader>te <C-\><C-n>

" Search current marked text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
"------End mappings config------"
