--------Mappings config--------
local g = vim.g
local api = vim.api

-- Set leader key
g.mapleader = ','

-- Remap C-w prefix
api.nvim_set_keymap('n', '<leader>w', '<C-w>', {expr = false, noremap = true})

-- Re-size split windows using arrow keys
api.nvim_set_keymap('n', '<Up>', ':resize -2<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<Down>', ':resize +2<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<Left>', ':vertical resize +2<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<Right>', ':vertical resize -2<CR>', {expr = false, noremap = true})

-- Remap switch buffers keys
api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', {expr = false, noremap = false})
api.nvim_set_keymap('n', '<leader>bp', ':bp<CR>', {expr = false, noremap = false})
api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', {expr = false, noremap = false})
api.nvim_set_keymap('n', '<leader>bw', ':bw<CR>', {expr = false, noremap = false})
api.nvim_set_keymap('n', '<leader>bb', ':buffers<CR>:b<space>', {expr = false, noremap = false})
api.nvim_set_keymap('n', '<leader>bl', ':Buffers<CR>', {expr = false, noremap = false})

-- Remap terminal escape key
api.nvim_set_keymap('t', '<leader>t[', [[<C-\><C-n>]], {expr = false, noremap = true})

-- Search current marked text
api.nvim_set_keymap('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], {expr = false, noremap = true})
--------End mappings config--------
