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
local ok, lazy = pcall(require, 'lazy')
if not ok then
  vim.api.nvim_out_write('lazy is just installed, please restart neovim')
  return
end

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = ' '

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
    'kylechui/nvim-surround',
    version = '*',
    config = function()
      require('nvim-surround').setup()
    end
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  require('vimc/plugins/nvim-tree'),

  -- Programming language
  require('vimc/plugins/treesitter'),
  'folke/neodev.nvim',
  'rust-lang/rust.vim',

  -- LSP and DAP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
    },
  },
  {
    'mfussenegger/nvim-jdtls',
    ft = 'java',
    dependencies = {
      'mfussenegger/nvim-dap'
    }
  },
  require('vimc/plugins/nvim-dap-ui'),

  -- UI
  require('vimc/plugins/telescope'),
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
    config = function()
      require('ibl').setup({
        scope = {
          show_start = false,
          show_end = false,
        },
      })
    end
  },
  {
    'folke/trouble.nvim',
    opts = {
      icons = false,
      fold_open = '◇',
      fold_closed = '◆',
      indent_lines = false,
      signs = {
          error = '✖',
          warning = '▲',
          hint = '✱',
          information = '●'
      },
      use_diagnostic_signs = false
    },
  },
})

-- Load custom statusline
require('vimc/plugins/statusline')

-- Base16 default dark
require('vimc/plugins/colorscheme').setup({
    base00 = '#181818', base01 = '#282828', base02 = '#383838', base03 = '#585858',
    base04 = '#b8b8b8', base05 = '#d8d8d8', base06 = '#e8e8e8', base07 = '#f8f8f8',
    base08 = '#ab4642', base09 = '#dc9656', base0A = '#f7ca88', base0B = '#a1b56c',
    base0C = '#86c1b9', base0D = '#7cafc2', base0E = '#ba8baf', base0F = '#a16946'
})
-- End plugins' configuration --
