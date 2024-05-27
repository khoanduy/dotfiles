return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  config = function()
    require('nvim-tree').setup({
      auto_reload_on_write = true,
      update_cwd = true,
      view = {
        adaptive_size = false,
        preserve_window_proportions = true,
        cursorline = false,
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
          symlink_arrow = ' » ',
          show = {
            file = true,
            folder = true,
            git = true,
            folder_arrow = false,
          },
          glyphs = {
            default = '⇝',
            symlink = '↝',
            folder = {
              default = '◼',
              open = '◧',
              empty = '⊟',
              empty_open = '◻',
              symlink = '↬',
              symlink_open = '↝',
            },
            git = {
              unstaged = '◔',
              staged = '●',
              unmerged = '⊙',
              renamed = '➜',
              untracked = '○',
              deleted = '◍⃠⃠⃠',
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
  end
}
