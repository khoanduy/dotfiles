vim.cmd([[
  set laststatus=3
  set statusline=
  set statusline+=%2*
  set statusline+=%=
  set statusline+=%5*
  set statusline+=%{get(b:,'gitsigns_status','')}
  set statusline+=\ 
  set statusline+=%2*
  set statusline+=%f
  set statusline+=\ 
  set statusline+=%2*
  set statusline+=%m
  set statusline+=\ 
  set statusline+=%3*
  set statusline+=%y
  set statusline+=\ 
  set statusline+=%4*
  set statusline+=%{strlen(&fenc)?&fenc:'none'}
  set statusline+=\|
  set statusline+=%l
  set statusline+=:
  set statusline+=%L
  set statusline+=\ 
  set statusline+=%2*
  set statusline+=\ 
  set statusline+=%1*
  set statusline+=%{StatuslineMode()}
  set statusline+=\ 
  hi User1 ctermbg=NONE ctermfg=lightgreen guibg=NONE guifg=lightgreen
  hi User2 ctermbg=NONE ctermfg=lightcyan guibg=NONE guifg=lightcyan
  hi User3 ctermbg=NONE ctermfg=lightyellow guibg=NONE guifg=lightyellow
  hi User4 ctermbg=NONE ctermfg=grey guibg=NONE guifg=grey
  hi User5 ctermbg=NONE ctermfg=lightred guibg=NONE guifg=lightred
  function! StatuslineMode()
    let l:mode=mode()
    if l:mode==#'n'
      return 'NORMAL'
    elseif l:mode==?'v'
      return 'VISUAL'
    elseif l:mode==#'i'
      return 'INSERT'
    elseif l:mode==#'R'
      return 'REPLACE'
    elseif l:mode==?'s'
      return 'SELECT'
    elseif l:mode==#'t'
      return 'TERMINAL'
    elseif l:mode==#'c'
      return 'COMMAND'
    elseif l:mode==#'!'
      return 'SHELL'
    endif
  endfunction
]])
