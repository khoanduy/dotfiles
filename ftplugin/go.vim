" Indentation
setlocal noexpandtab
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

" Enable ALE LSP
let g:ale_disable_lsp=0
let g:ale_completion_enabled=1

" LSP keymaps
nmap gd :ALEGoToDefinition<cr>
nmap gi :ALEGoToImplementation<cr>
nmap gy :ALEGoToTypeDefinition<cr>
