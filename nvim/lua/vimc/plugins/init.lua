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
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    config = function()
      require('vimc/plugins/nvim-tree')
    end
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    config = function()
      require("nvim-surround").setup()
    end
  },

  -- Programming language
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      require('vimc/plugins/treesitter')
    end
  },
  'nvim-treesitter/nvim-treesitter-textobjects',
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
      require('vimc/plugins/colorscheme')
      vim.cmd([[ colorscheme tokyonight ]])
    end
  },
  'ibhagwan/fzf-lua',
})

-- Load custom plugins
require('vimc/plugins/statusline')
-- End plugins' configuration --
