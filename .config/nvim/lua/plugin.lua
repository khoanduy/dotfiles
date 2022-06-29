--------Plugins config--------

-- Install Packer
local packer_url = 'https://github.com/wbthomason/packer.nvim'
local dest_path = os.getenv('HOME')..'/.local/share/nvim/site/pack/packer/start/packer.nvim'
packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', packer_url, dest_path})

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

  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {
        sort_by = 'case_sensitive',
        view = {
          adaptive_size = true,
          mappings = {
            list = {
              { key = 'u', action = 'dir_up' },
            },
          },
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
      }
    end
  }

  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-surround' }
  use { 'jiangmiao/auto-pairs' }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup {
        size = 20,
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = '3',
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
    'rust-lang/rust.vim',
    config = function()
      vim.g.rustfmt_autosave = 1
    end
  }

  -- Language Server Protocol
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      vim.g.coc_global_extensions = { 'coc-docker', 'coc-rust-analyzer', 'coc-pyright',
        'coc-sql', 'coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json',
        'coc-prettier'}
    end
  }

  -- UI
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require('catppuccin').setup{
        term_colors = true
      }
      vim.g.catppuccin_flavour = 'latte'
      vim.cmd([[ colorscheme catppuccin ]])
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'auto',
          component_separators = { left = '|', right = '|'},
          section_separators = { left = '::', right = '- '},
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = false,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {}
      }
    end
  }

  -- Bot
  use { 'github/copilot.vim' }
end)
--------End plugins config--------
