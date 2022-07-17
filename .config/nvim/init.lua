---------Khoa Nguyen's vim/neovim configuration---------

-- Load configuration files-----
require('plugin')
require('mapping')
require('command')
require('lsp')
-----End load configuration files-----

-- Variables
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local api = vim.api

api.nvim_command('set nocompatible')
g.diagnostics_enabled = true

-- Encoding
opt.encoding = 'utf-8'
cmd([[
  set termencoding=utf-8
  set fileencodings=utf-8
  lang en_US.UTF-8
]])

-- No temporary files
opt.smartcase = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.wrap = false
opt.errorbells = false

-- Display options
opt.showmode = true
opt.showcmd = true

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.copyindent = true

-- Default indentation
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.shiftround = true

-- File stats
opt.number = true
opt.cursorline = true
opt.ruler = true
opt.splitbelow = true
opt.splitright = true

-- Searching
opt.incsearch = true
opt.hlsearch = true
cmd([[
  set matchpairs+=<:>
]])

-- UI
cmd([[
  set ma
  set mouse=a
  syntax enable
  set termguicolors
]])

-- Get rid of scratch buffer
cmd([[ set completeopt-=preview ]])
---------End configuration---------
