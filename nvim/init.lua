---------Khoa Nguyen's vim/neovim configuration---------

-- General configuration --
vim.api.nvim_command('set nocompatible')
vim.g.diagnostics_enabled = true

-- Encoding
vim.opt.encoding = 'utf-8'
vim.cmd([[
  set termencoding=utf-8
  set fileencodings=utf-8
  lang en_US.UTF-8
]])

-- No temporary files
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.wrap = false
vim.opt.errorbells = false

-- Display options
vim.opt.showmode = true
vim.opt.showcmd = true

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.copyindent = true

-- Default indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true

-- File stats
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.cmd([[
  set matchpairs+=<:>
]])

-- UI
vim.cmd([[
  set ma
  set mouse=a
  syntax enable
  set termguicolors
]])

-- Get rid of scratch buffer
vim.cmd([[ set completeopt-=preview ]])

-- Ensure lazy.nvim and load plugins --
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
require('lazy').setup('plugin')

-- Load configuration files --
require('mapping')
require('command')
require('lsp')
---------End configuration---------
