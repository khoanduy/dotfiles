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

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true, direction = 'float' })
function _lazygit_toggle()
  lazygit:toggle()
end -- lazygit terminal
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', {noremap = true, silent = false})

-- CoC
api.nvim_set_keymap('i', '<C-space>', 'coc#refresh()', {expr = true, noremap = true, silent = true})

api.nvim_set_keymap('n', '[l', '<Plug>(coc-diagnostic-prev)', {expr = false, noremap = false, silent = true})
api.nvim_set_keymap('n', ']l', '<Plug>(coc-diagnostic-next)', {expr = false, noremap = false, silent = true})

api.nvim_set_keymap('n', 'gd', ':call CocActionAsync("jumpDefinition", "vsplit")<CR>', {expr = false, noremap = false, silent = true})
api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {expr = false, noremap = false, silent = true})
api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {expr = false, noremap = false, silent = true})
api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {expr = false, noremap = false, silent = true})

api.nvim_set_keymap('n', '<leader>lf', '<Plug>(coc-format)', {expr = false, noremap = false})
api.nvim_set_keymap('v', '<leader>lf', '<Plug>(coc-format-selected)', {expr = false, noremap = false})

-- Telescope
api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>fg', ':Telescope git_files<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>fp', ':Telescope live_grep<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>fc', ':Telescope current_buffer_fuzzy_find<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>fz', ':Telescope fzf<CR>', {expr = false, noremap = true})
api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', {expr = false, noremap = true})
--------End mappings config--------
