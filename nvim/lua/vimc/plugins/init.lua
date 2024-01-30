-- Plugins' configuration --

-- Ensure lazy.nvim and load plugins
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ','

local ok, lazy = pcall(require, 'lazy')
if not ok then
  vim.api.nvim_out_write('lazy is just installed, please restart neovim')
  return
end

lazy.setup({
  -- Utilities
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 200
      require('which-key').setup()
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    config = function()
      require('vimc/plugins/nvim-tree')
    end
  },
  {
    'kylechui/nvim-surround',
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('vimc/plugins/toggleterm')
    end
  },

  'editorconfig/editorconfig-vim',

  -- Programming language
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      require('vimc/plugins/treesitter')
    end
  },

  'rust-lang/rust.vim',

  -- LSP and DAP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',

  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',

  'mfussenegger/nvim-dap',
  'mfussenegger/nvim-jdtls',

  -- UI
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = 'moon',
        styles = {
          comments = {
            italic = false,
          },
          keywords = {
            italic = false,
          },
          sidebars = 'transparent',
          floats = 'transparent',
        },
        hide_inactive_statusline = true,
      })
      vim.cmd([[ colorscheme tokyonight ]])
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      require('vimc/plugins/telescope')
    end
  },

  'kdheepak/lazygit.nvim',
})

-- End plugins' configuration --
