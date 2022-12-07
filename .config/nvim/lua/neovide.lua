vim.opt.guifont = { "JetBrains Mono NL", "h13" }
vim.cmd([[
  if exists("g:neovide")
    let g:neovide_hide_mouse_when_typing = v:false
    let g:neovide_fullscreen = v:true
    let g:neovide_input_macos_alt_is_meta = v:true
  endif
]])
