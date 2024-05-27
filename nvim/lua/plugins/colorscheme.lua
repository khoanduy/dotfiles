return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require('tokyonight').setup({
      style = 'storm',
      lualine_bold = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    })
    vim.cmd.colorscheme 'tokyonight'
  end
}
