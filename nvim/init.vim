set noswf title noml wcm=<C-z> ut=256
set ignorecase smartcase showmatch sb nu rnu
set list wop+=fuzzy spr ts=4 sw=0 et
let &showbreak = '+++ '

" :find command should search files
func! s:findfiles(cmdarg, _cmdcomp) abort
	let l:out = systemlist('rg --files -. -L -S -g=!.git 2>/dev/null')
	if v:shell_error != 0 | return [] | endif
	return empty(a:cmdarg) ? l:out : matchfuzzy(l:out, a:cmdarg)
endfunc
set findfunc=s:findfiles
nmap <Space>f :find 
nmap <Space>F :find <C-r><C-w><C-z>

" browse buffers/files
nmap <Space>o <Cmd>ls t<CR>:buffer 
nmap - <Cmd>Explore<CR>
au FileType netrw nmap <buffer> <C-c> <Cmd>Rex<CR>

" extend vim grep abilities with ripgrep
set grepprg=grep\ -HIrn\ $*
if executable('rg')
	set grepprg=rg\ --vimgrep\ --hidden\ -n\ $*
endif " use [--no-ignore] for wildcard
nmap <Space>g :grep! -i ''<Left>
nmap <Space>G :grep! '<C-r><C-w>'
vmap <Space>g "0y:grep! '<C-r>0'<Left>

" yank/paste to/from system clipboard
" all motions work the same as normal [y]
nmap <Space>y "+y
xmap <Space>y "+y
nmap <Space>p "+p
xmap <Space>p "+p
nmap <Space>P "+P

" open the quickfix window whenever a qf command is executed
au QuickFixCmdPost [^l]* cwindow
au FileType vim setl ts=8 noet
au FileType help,qf nmap <buffer> q <Cmd>silent! close<CR>

if has('nvim')
	au TextYankPost * silent! lua vim.hl.on_yank{timeout=128}
	lua vim.filetype.add{pattern={['.*%.log.*']='messages'}, extension={psql='sql'}}

	" unload redundant providers
	let g:loaded_node_provider = 0
	let g:loaded_perl_provider = 0
	let g:loaded_ruby_provider = 0
	let g:loaded_python3_provider = 0
	let g:loaded_matchit = 1
	set completeopt+=menuone,noselect
	set undofile inccommand=split

	" load lua stuff
	lua require'lsconf'
	lua require'diffsign'
endif
