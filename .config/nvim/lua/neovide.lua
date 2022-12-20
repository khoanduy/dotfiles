vim.opt.guifont = { "SauceCodePro Nerd Font", "h13" }
vim.cmd([[
  if exists("g:neovide")
    let g:neovide_hide_mouse_when_typing = v:false
    let g:neovide_fullscreen = v:false
    let g:neovide_input_macos_alt_is_meta = v:true
  endif
]])