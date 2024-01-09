require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '»', right = 'ȶ' },
    section_separators = { left = 'ǂ', right = 'ǂ' },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'branch' },
    lualine_c = { 'filename', 'diagnostics' },
    lualine_x = { 'diff', 'encoding', 'filetype' },
    lualine_y = { 'location' },
    lualine_z = {
      { 'progress', separator = { right = '' }, left_padding = 2 }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})
