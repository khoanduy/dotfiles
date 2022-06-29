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
api.nvim_set_keymap('t', '<leader>te', [[<C-\><C-n>]], {expr = false, noremap = true})

-- Search current marked text
api.nvim_set_keymap('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], {expr = false, noremap = true})

-- NVIM tree
api.nvim_set_keymap('n', '<leader>nt', ':NvimTreeToggle<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>ns', ':NvimTreeFocus<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>nf', ':NvimTreeFindFile<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>nc', ':NvimTreeCollapse<CR>', {expr = false, noremap = true})

-- Toggleterm
api.nvim_set_keymap('n', '<leader>tt', ':ToggleTerm<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('t', '<leader>tt', [[<C-\><C-n>:ToggleTerm<CR>]], {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>ts', ':ToggleTermSendCurrentLine<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('v', '<leader>ts', ':ToggleTermSendVisualSelection<CR>', {expr = false, noremap = true})

-- CoC
api.nvim_set_keymap('i', '<silent> <C-space>', 'coc#refresh()', {expr = true, noremap = true})

api.nvim_set_keymap('n', '<silent> [c', '<Plug>(coc-diagnostic-prev)', {expr = false, noremap = false})
api.nvim_set_keymap('n', '<silent> ]c', '<Plug>(coc-diagnostic-next)', {expr = false, noremap = false})

api.nvim_set_keymap('n', '<silent> gd', ':call CocActionAsync("jumpDefinition", "vsplit")<CR>', {expr = false, noremap = false})
api.nvim_set_keymap('n', '<silent> gy', '<Plug>(coc-type-definition)', {expr = false, noremap = false})
api.nvim_set_keymap('n', '<silent> gi', '<Plug>(coc-implementation)', {expr = false, noremap = false})
api.nvim_set_keymap('n', '<silent> gr', '<Plug>(coc-references)', {expr = false, noremap = false})

api.nvim_set_keymap('n', '<leader>fb', '<Plug>(coc-format)', {expr = false, noremap = false})
api.nvim_set_keymap('v', '<leader>fb', '<Plug>(coc-format-selected)', {expr = false, noremap = false})
--------End mappings config--------
