return {
  'pappasam/papercolor-theme-slim',
  lazy = false,
  config = function()
    vim.cmd 'set background=light'
    vim.cmd.colorscheme 'PaperColorSlim'
  end
}
