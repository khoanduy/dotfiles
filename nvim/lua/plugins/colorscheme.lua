return {
  'RRethy/base16-nvim',
  lazy = false,
  opts = {},
  config = function()
    require('base16-colorscheme').with_config({
      telescope = false,
      telescope_borders = false,
      indentblankline = false,
    })

    vim.cmd.colorscheme 'base16-default-dark'
  end
}
