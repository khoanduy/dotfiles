return {
  'stevearc/oil.nvim',
  opts = {},
  config = function()
    require('oil').setup({
      view_options = {
        show_hidden = true,
        natural_order = false,
      },
    })
  end
}
