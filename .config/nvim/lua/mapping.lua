--------Mappings config--------
local g = vim.g
local api = vim.api

-- Set leader key
g.mapleader = ','

-- Remap C-w prefix
api.nvim_set_keymap('n', '<leader>w', '<C-w>', {expr = false, noremap = true})

-- Remap switch region keys
api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {expr = false, noremap = true, silent = true})
api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {expr = false, noremap = true, silent = true})
api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {expr = false, noremap = true, silent = true})
api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {expr = false, noremap = true, silent = true})

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

-- Remap terminal escape key
api.nvim_set_keymap('t', '<leader>e', [[<C-\><C-n>]], {expr = false, noremap = true})

-- Search current marked text
api.nvim_set_keymap('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], {expr = false, noremap = true})

-- NVIM tree
api.nvim_set_keymap('n', '<leader>nt', ':NvimTreeToggle<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>nf', ':NvimTreeFocus<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>nF', ':NvimTreeFindFile<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>nc', ':NvimTreeCollapse<CR>', {expr = false, noremap = true})

-- Toggleterm
api.nvim_set_keymap('n', '<leader>tt', ':ToggleTerm<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('t', '<leader>tt', [[<C-\><C-n>:ToggleTerm<CR>]], {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>ts', ':ToggleTermSendCurrentLine<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('v', '<leader>ts', ':ToggleTermSendVisualSelection<CR>', {expr = false, noremap = true})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true, direction = 'float' })
function _lazygit_toggle()
  lazygit:toggle()
end -- lazygit terminal
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', {noremap = true, silent = false})

-- Telescope
api.nvim_set_keymap('n', '<leader>fF', ':Telescope find_files<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>ff', ':Telescope git_files<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>fa', ':Telescope live_grep<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>bb', ':Telescope buffers<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>hf', ':Telescope help_tags<CR>', {expr = false, noremap = true})
--------End mappings config--------
