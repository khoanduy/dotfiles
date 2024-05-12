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
    'airblade/vim-gitgutter',
    config = function()
      vim.api.nvim_exec([[
        let g:gitgutter_set_sign_backgrounds=1
        hi SignColumn ctermbg=NONE guibg=NONE
      ]], false)
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
  require('vimc/plugins/oil'),

  -- Programming language
  require('vimc/plugins/treesitter'),
  'folke/neodev.nvim',

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
  {
    'pappasam/papercolor-theme-slim',
    config = function()
      vim.cmd[[ set background=light ]]
      vim.cmd.colorscheme 'PaperColorSlim'
    end
  },
  {
    'ibhagwan/fzf-lua',
    config = function()
      require('fzf-lua').setup({'max-perf'})
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
-- End plugins' configuration --
