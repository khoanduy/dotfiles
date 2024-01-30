require('nvim-tree').setup({
  auto_reload_on_write = true,
  update_cwd = true,
  view = {
    adaptive_size = false,
    number = false,
    relativenumber = false,
    preserve_window_proportions = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = '╰',
      },
    },
    group_empty = true,
    icons = {
      show = {
        file = false,
        folder = true,
        git = true,
        folder_arrow = false,
      },
      glyphs = {
        default = 'ɕ',
        symlink = 'ȴ',
        folder = {
          default = 'ɕ',
          open = 'ɕ',
          empty = 'ɕ',
          empty_open = 'ɕ',
          symlink = 'ȴ',
          symlink_open = 'ȴ',
        },
        git = {
          unstaged = '◇',
          staged = '◆',
          unmerged = '❢',
          renamed = '◎',
          untracked = '✦',
          deleted = '◯',
          ignored = '◌',
        },
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
