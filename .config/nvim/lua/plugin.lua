--------Plugins config--------

-- Install Packer
local packer_url = 'https://github.com/wbthomason/packer.nvim'
local dest_path = os.getenv('HOME') .. '/.local/share/nvim/site/pack/packer/start/packer.nvim'
packer_bootstrap = vim.fn.system({ 'git', 'clone', '--depth', '1', packer_url, dest_path })

-- Plugin autocompile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin.lua source <afile> | PackerCompile
  augroup end
]])

-- Plugin installation
return require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }

  -- Utilities
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {}
    end
  }

  use {
    'chipsenkbeil/distant.nvim',
    config = function()
      require('distant').setup {
        ['*'] = require('distant.settings').chip_default()
      }
    end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
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
      }
    end
  }

  use {
    'kylechui/nvim-surround',
    config = function()
      require("nvim-surround").setup {}
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup {
        size = 15,
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        direction = 'horizontal',
        close_on_exit = true,
      }
    end
  }

  -- Programming language
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'cpp', 'rust', 'lua', 'python', 'java',
          'toml', 'html', 'css', 'javascript', 'json', 'yaml', 'dockerfile',
          'proto', 'markdown', 'http', 'cmake', 'make', 'go', 'sql', 'vim' },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  }

  -- UI
  use {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd([[ colorscheme tokyonight-moon ]])
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-project.nvim'
    },
    config = function()
      require('telescope').setup {
        ['ui-select'] = {
          require('telescope.themes').get_cursor {}
        },
        pickers = {
          find_files = {
            theme = 'ivy'
          },
          git_files = {
            theme = 'ivy'
          },
          buffers = {
            theme = 'ivy'
          },
          live_grep = {
            theme = 'ivy'
          },
          current_buffer_fuzzy_find = {
            theme = 'ivy'
          }

        },
        extensions = {
          project = {
            hidden_files = true,
            theme = 'dropdown',
            order_by = 'asc',
            search_by = 'title',
            sync_with_nvim_tree = true,
          }
        }
      }
      require('telescope').load_extension('ui-select')
      require('telescope').load_extension('project')
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '🔥', right = '»' },
          section_separators = { left = '', right = '' },
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
      }
    end
  }

  use {
    'petertriho/nvim-scrollbar',
    config = function()
      require('scrollbar').setup()
    end
  }

  use { 'kdheepak/lazygit.nvim' }
end)
--------End plugins config--------
