--------Mappings config--------

-- Set leader key
g.mapleader = ','

-- Mapping options
local nenrs = { expr = false, noremap = true, silent = true }
local nenrns = { expr = false, noremap = true, silent = false }
local ners = { expr = false, noremap = false, silent = true }

-- Remap C-w prefix
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', nenrs)

-- Remap switch region keys
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', nenrs)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', nenrs)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', nenrs)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', nenrs)

vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-n><C-w>h]], nenrs)
vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-n><C-w>j]], nenrs)
vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-n><C-w>k]], nenrs)
vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-n><C-w>l]], nenrs)

-- Re-size split windows using arrow keys
vim.api.nvim_set_keymap('n', '<Up>', ':resize -2<CR>', nenrns)
vim.api.nvim_set_keymap('n', '<Down>', ':resize +2<CR>', nenrns)
vim.api.nvim_set_keymap('n', '<Left>', ':vertical resize +2<CR>', nenrns)
vim.api.nvim_set_keymap('n', '<Right>', ':vertical resize -2<CR>', nenrns)

-- Remap switch buffers keys
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<CR>', nenrns)
vim.api.nvim_set_keymap('n', '<leader>bN', ':bp<CR>', nenrns)
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', nenrns)
vim.api.nvim_set_keymap('n', '<leader>bw', ':bw<CR>', nenrns)
vim.api.nvim_set_keymap('n', '<leader>bW', ':bw!<CR>', nenrns)

vim.api.nvim_set_keymap('t', '<leader>bw', [[<C-\><C-n>:bw!<CR>]], nenrns)

-- Remap terminal escape key
vim.api.nvim_set_keymap('t', '<leader>e', [[<C-\><C-n>]], ners)

-- Show current file path and open file
vim.api.nvim_set_keymap('n', '<space>d', ':echo @%<CR>', ners)

-- No highlight
vim.api.nvim_set_keymap('n', '|', ':noh<CR>', nenrs)
vim.api.nvim_set_keymap('n', '<space>r', ':e<CR>', nenrns)

-- Search current marked text
vim.api.nvim_set_keymap('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], nenrns)

-- Copy marked text/paste to/from global register
vim.api.nvim_set_keymap('v', '<space>y', '"+y', nenrns)
vim.api.nvim_set_keymap('n', '<space>p', '"+p', nenrns)

-- Remap write and quit
vim.api.nvim_set_keymap('n', '<space>q', ':q<CR>', nenrns)
vim.api.nvim_set_keymap('n', '<space>w', ':w<CR>', nenrns)

-- Remap split
vim.api.nvim_set_keymap('n', '<space>v', '<C-w>v', nenrs)
vim.api.nvim_set_keymap('n', '<space>h', '<C-w>s', nenrs)

-- NVIM tree
vim.api.nvim_set_keymap('n', '<leader>nt', ':NvimTreeToggle<CR>', nenrs)
vim.api.nvim_set_keymap('n', '<leader>nf', ':NvimTreeFocus<CR>', nenrs)
vim.api.nvim_set_keymap('n', '<leader>nF', ':NvimTreeFindFile<CR>', nenrs)
vim.api.nvim_set_keymap('n', '<leader>nc', ':NvimTreeCollapse<CR>', nenrs)

-- Trouble
vim.api.nvim_set_keymap('n', '<leader>x', ':TroubleToggle<CR>', nenrs)

-- Toggleterm
vim.api.nvim_set_keymap('n', '<leader>T', ':ToggleTerm<CR>', nenrs)
vim.api.nvim_set_keymap('t', '<leader>T', [[<C-\><C-n>:ToggleTerm<CR>]], nenrs)
vim.api.nvim_set_keymap('n', '<leader>tt', ':ToggleTermToggleAll<CR>', nenrs)
vim.api.nvim_set_keymap('t', '<leader>tt', [[<C-\><C-n>:ToggleTermToggleAll<CR>]], nenrs)

vim.api.nvim_set_keymap('n', '<leader>ts', ':ToggleTermSendCurrentLine<CR>', nenrns)
vim.api.nvim_set_keymap('v', '<leader>ts', ':ToggleTermSendVisualSelection<CR>', nenrns)

-- LazyGit
vim.api.nvim_set_keymap('n', '<leader>g', ':LazyGit<CR>', nenrs)

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>fF', ':Telescope find_files<CR>', nenrs)
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope git_files<CR>', nenrs)
vim.api.nvim_set_keymap('n', '<leader>fa', ':Telescope live_grep<CR>', nenrs)
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<CR>', nenrs)
vim.api.nvim_set_keymap('n', '<leader>fc', ':Telescope ', nenrns)
vim.api.nvim_set_keymap('n', '<leader>hh', ':Telescope help_tags<CR>', nenrs)
vim.api.nvim_set_keymap('n', '<leader>bb', ':Telescope buffers<CR>', nenrs)

-- Github Copilot
vim.cmd[[imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true

-- nvim-dap
vim.api.nvim_set_keymap('n', '<leader>dp', [[:lua require'dap'.toggle_breakpoint()<CR>]], nenrns)
vim.api.nvim_set_keymap('n', '<leader>dc', [[:lua require'dap'.continue()<CR>]], nenrns)
vim.api.nvim_set_keymap('n', '<leader>ds', [[:lua require'dap'.step_over()<CR>]], nenrns)
vim.api.nvim_set_keymap('n', '<leader>dS', [[:lua require'dap'.step_into()<CR>]], nenrns)

-- Dadbod UI
vim.api.nvim_set_keymap('n', '<leader>db', ':DBUIToggle<CR>', nenrs)
vim.api.nvim_set_keymap('n', '<leader>da', ':DBUIAddConnection<CR>', nenrns)
--------End mappings config--------
