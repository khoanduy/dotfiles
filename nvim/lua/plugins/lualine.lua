return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'RRethy/base16-nvim'
  },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = false,
        component_separators = '-',
        section_separators = { left = '|', right = '|' },
        always_divide_middle = false,
        globalstatus = true,
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

    vim.cmd.highlight('Statusline ctermbg=none guibg=none')
    vim.cmd.highlight('StatuslineNC ctermbg=none guibg=none')

    vim.cmd.highlight('lualine_c_normal ctermbg=none guibg=none')
    vim.cmd.highlight('lualine_c_command ctermbg=none guibg=none')
    vim.cmd.highlight('lualine_c_inactive ctermbg=none guibg=none')
  end
}
