return {
  "justinmk/vim-sneak",
  init = function()
    vim.cmd([[
      let g:sneak#label = 1
      map f <Plug>Sneak_s
      map F <Plug>Sneak_S
    ]])
  end
}
