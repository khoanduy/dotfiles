require('nvim-tree').setup({
  auto_reload_on_write = true,
  update_cwd = true,
  view = {
    adaptive_size = false,
    number = false,
    relativenumber = false,
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = '└',
        edge = '│',
        none = ' ',
      },
    },
    group_empty = true,
    icons = {
      show = {
        file = true,
        folder = true,
        git = true,
        folder_arrow = false,
      }
    }
  },
  filters = {
    dotfiles = false,
  },
  update_focused_file = {
    enable = false,
  },
  git = {
    enable = true,
    ignore = false,
  },
})
