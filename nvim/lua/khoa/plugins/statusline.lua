return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = require("tokyonight.colors").setup()
    local white = "#ffffff"
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = {
          normal = { a = { fg = colors.cyan or white, bg = nil },
            b = { fg = colors.magenta or white, bg = nil },
            c = { fg = colors.fg or white, bg = nil },
            x = { fg = colors.fg or white, bg = nil },
            y = { fg = colors.fg or white, bg = nil },
            z = { fg = colors.fg or white, bg = nil },
          },
          insert = {
            a = { fg = colors.green or white, bg = nil },
            b = { fg = colors.magenta or white, bg = nil },
            c = { fg = colors.fg or white, bg = nil },
            x = { fg = colors.fg or white, bg = nil },
            y = { fg = colors.fg or white, bg = nil },
            z = { fg = colors.fg or white, bg = nil },
          },
          command = {
            a = { fg = colors.yellow or white, bg = nil },
            b = { fg = colors.magenta or white, bg = nil },
            c = { fg = colors.fg or white, bg = nil },
            x = { fg = colors.fg or white, bg = nil },
            y = { fg = colors.fg or white, bg = nil },
            z = { fg = colors.fg or white, bg = nil },
          },
          visual = {
            a = { fg = colors.red or white, bg = nil },
            b = { fg = colors.magenta or white, bg = nil },
            c = { fg = colors.fg or white, bg = nil },
            x = { fg = colors.fg or white, bg = nil },
            y = { fg = colors.fg or white, bg = nil },
            z = { fg = colors.fg or white, bg = nil },
          },
          terminal = {
            a = { fg = colors.purple or white, bg = nil },
            b = { fg = colors.magenta or white, bg = nil },
            c = { fg = colors.fg or white, bg = nil },
            x = { fg = colors.fg or white, bg = nil },
            y = { fg = colors.fg or white, bg = nil },
            z = { fg = colors.fg or white, bg = nil },
          },
          inactive = {
            a = { fg = colors.fg_gutter or white, bg = nil },
            b = { fg = colors.fg_gutter or white, bg = nil },
            c = { fg = colors.fg_gutter or white, bg = nil },
            x = { fg = colors.fg_gutter or white, bg = nil },
            y = { fg = colors.fg_gutter or white, bg = nil },
            z = { fg = colors.fg_gutter or white, bg = nil },
          },
        },
        component_separators = { },
        section_separators = { },
        always_divide_middle = true,
        always_show_tabline = false,
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "diagnostics" },
        lualine_y = { "location" },
        lualine_z = { "filetype" }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
      },
    }
  end
}
