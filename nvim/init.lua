----- khoanduy's neovim configuration -----
vim.loader.enable()

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
  vim.api.nvim_out_write('Lazy is just installed, please restart neovim')
  return
end

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = ' '

-- Load all files in lua/plugins folder
lazy.setup('plugins')

-- Load configuration files --
require('options')
require('keymaps')
require('lsp')
----- End configuration -----
