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

-- List plugins
return require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }

  -- Utilities
  use {
    'preservim/nerdcommenter',
    config = function()
      vim.g.NERDSpaceDelims = 1
      vim.g.NERDCompactSexyComs = 1
    end
  }

  use {
    'airblade/vim-gitgutter',
    config = function()
      vim.g.gitgutter_max_signs = 2000
    end
  }

  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {}
    end
  }

  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-surround' }
  use { 'jiangmiao/auto-pairs' }

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

  use {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup {
        icons = true,
        fold_open = '⦣',
        fold_closed = '⦢',
        indent_lines = false,
        signs = {
          error = '✘',
          warning = '❢',
          hint = '✔',
          information = '✦'
        },
        use_diagnostic_signs = false
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

  use { 'rust-lang/rust.vim' }

  -- LSP and DAP
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('null-ls').setup {}
    end,
  }

  -- UI
  use {
    'arcticicestudio/nord-vim',
    config = function()
      vim.cmd([[ colorscheme nord ]])
    end
  }

  use {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('which-key').setup {
        color_icons = true,
        default = true
      }
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-project.nvim'
    },
    config = function()
      require('telescope').setup {
        ['ui-select'] = {
          require('telescope.themes').get_cursor {}
        },
        pickers = {
          find_files = {
            theme = 'dropdown'
          },
          git_files = {
            theme = 'dropdown'
          },
          buffers = {
            theme = 'dropdown'
          }
        },
        extensions = {
          file_browser = {
            hijack_netrw = true,
            theme = 'ivy',
          },
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
      require('telescope').load_extension('file_browser')
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
            { 'mode', separator = { left = '' }, right_padding = 2 },
          },
          lualine_b = { 'branch' },
          lualine_c = { 'filename', 'diagnostics' },
          lualine_x = { 'diff', 'encoding', 'filetype' },
          lualine_y = { 'location' },
          lualine_z = {
            { 'progress', separator = { right = '' }, left_padding = 2 }
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

  use { 'kdheepak/lazygit.nvim' }

  -- Fun stuff
  use {
    'andweeb/presence.nvim',
    config = function()
      require('presence'):setup({
        auto_update        = true,
        neovim_image_text  = 'The One True Text Editor',
        main_image         = 'neovim',
        log_level          = nil,
        debounce_timeout   = 10,
        enable_line_number = true,
        blacklist          = {},
        buttons            = true,
        file_assets        = {},
        show_time          = true,

        editing_text        = 'Editing %s',
        file_explorer_text  = 'Browsing %s',
        git_commit_text     = 'Committing changes',
        plugin_manager_text = 'Managing plugins',
        reading_text        = 'Reading %s',
        workspace_text      = 'Working on %s',
        line_number_text    = 'Line %s out of %s',
      })
    end
  }
end)
--------End plugins config--------
