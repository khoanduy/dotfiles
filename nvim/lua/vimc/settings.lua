-- General settings --
vim.api.nvim_command('set nocompatible')
vim.g.diagnostics_enabled = true

-- Encoding
vim.opt.encoding = 'utf-8'
vim.cmd([[
  set termencoding=utf-8
  set fileencodings=utf-8
  lang en_US.UTF-8
]])

-- No temporary files
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.wrap = false
vim.opt.errorbells = false

-- Display options
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.showmatch = true

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.copyindent = true

-- Default indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true

-- File stats
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.cmd([[
  set matchpairs+=<:>
]])

-- UI
vim.cmd([[
  set ma
  set mouse=a
  syntax enable
  set termguicolors
]])

-- Style statusline
vim.cmd([[
  set laststatus=2
  set statusline=
  set statusline+=%1*
  set statusline+=\ 
  set statusline+=%{StatuslineMode()}
  set statusline+=\ 
  set statusline+=%3*
  set statusline+=\ 
  set statusline+=%F
  set statusline+=\ 
  set statusline+=%m
  set statusline+=%=
  set statusline+=%2*
  set statusline+=%{b:gitbranch}
  set statusline+=\ 
  set statusline+=%3*
  set statusline+=%{strlen(&fenc)?&fenc:'none'}
  set statusline+=\|
  set statusline+=%l
  set statusline+=:
  set statusline+=%L
  set statusline+=\ 
  set statusline+=%2*
  set statusline+=%y

  hi User1 ctermbg=NONE ctermfg=lightgreen guibg=NONE guifg=lightgreen
  hi User2 ctermbg=NONE ctermfg=lightcyan guibg=NONE guifg=lightcyan
  hi User3 ctermbg=NONE ctermfg=grey guibg=NONE guifg=grey

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

  function! StatuslineGitBranch()
    let b:gitbranch=''
    if &modifiable
      try
        let l:dir=expand('%:p:h')
        let l:gitrevparse = system('git -C '.l:dir.' rev-parse --abbrev-ref HEAD')
        if !v:shell_error
          let b:gitbranch='('.substitute(l:gitrevparse, '\n', '', 'g').') '
        endif
      catch
      endtry
    endif
  endfunction

  augroup GetGitBranch
    autocmd!
    autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
  augroup END
]])

-- Get rid of scratch buffer
vim.cmd([[ set completeopt-=preview ]])
-- End general settings --
