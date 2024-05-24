return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local theme = require('lualine.themes.tokyonight')
    theme.normal.c.bg = nil
    require('lualine').setup {
      options = {
        theme = theme,
        icons_enabled = false,
        component_separators = '-',
        section_separators = { left = '|', right = '|' },
        always_divide_middle = false,
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '|' }, right_padding = 1 } },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { '%=' },
        lualine_x = { },
        lualine_y = { 'encoding', 'filetype' },
        lualine_z = {
          { 'location', separator = { right = '|' }, left_padding = 1 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = { },
        lualine_c = { },
        lualine_x = { },
        lualine_y = { },
        lualine_z = { 'location' },
      },
    }
  end
}
