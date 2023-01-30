--------Mappings config--------

-- Set leader key
vim.g.mapleader = ','

-- Mapping options
local nenrs = { expr = false, noremap = true, silent = true }
local nenrns = { expr = false, noremap = true, silent = false }
local ners = { expr = false, noremap = false, silent = true }
local enrs = { expr = true, noremap = true, silent = true }

-- Remap C-w prefix
vim.keymap.set('n', '<leader>w', '<C-w>', nenrs)

-- Remap switch region keys
vim.keymap.set('n', '<C-h>', '<C-w>h', nenrs)
vim.keymap.set('n', '<C-j>', '<C-w>j', nenrs)
vim.keymap.set('n', '<C-k>', '<C-w>k', nenrs)
vim.keymap.set('n', '<C-l>', '<C-w>l', nenrs)

vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], nenrs)
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], nenrs)
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], nenrs)
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], nenrs)

-- Re-size split windows using arrow keys
vim.keymap.set('n', '<Up>', ':resize -2<CR>', nenrns)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', nenrns)
vim.keymap.set('n', '<Left>', ':vertical resize +2<CR>', nenrns)
vim.keymap.set('n', '<Right>', ':vertical resize -2<CR>', nenrns)

-- Remap switch buffers keys
vim.keymap.set('n', '<leader>bn', ':bn<CR>', nenrns)
vim.keymap.set('n', '<leader>bN', ':bp<CR>', nenrns)
vim.keymap.set('n', '<leader>bd', ':bd<CR>', nenrns)
vim.keymap.set('n', '<leader>bw', ':bw<CR>', nenrns)
vim.keymap.set('n', '<leader>bW', ':bw!<CR>', nenrns)

vim.keymap.set('t', '<leader>bw', [[<C-\><C-n>:bw!<CR>]], nenrns)

-- Remap terminal escape key
vim.keymap.set('t', '<leader>e', [[<C-\><C-n>]], ners)

-- Show current file path and open file
vim.keymap.set('n', '<space>d', ':echo @%<CR>', ners)

-- No highlight
vim.keymap.set('n', '|', ':noh<CR>', nenrs)
vim.keymap.set('n', '<space>r', ':e<CR>', nenrns)

-- Search current marked text
vim.keymap.set('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], nenrns)

-- Remap write and quit
vim.keymap.set('n', '<space>w', ':w<CR>', nenrns)
vim.keymap.set('n', '<space>q', ':q<CR>', nenrns)
vim.keymap.set('n', '<space>Q', ':qa<CR>', nenrns)

-- Copy marked text/paste to/from global register
vim.keymap.set('v', '<space>y', '"+y', nenrns)
vim.keymap.set('n', '<space>p', '"+p', nenrns)

-- Remap split
vim.keymap.set('n', '<space>v', '<C-w>v', nenrs)
vim.keymap.set('n', '<space>h', '<C-w>s', nenrs)

-- NVIM tree
vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<CR>', nenrs)
vim.keymap.set('n', '<leader>nf', ':NvimTreeFocus<CR>', nenrs)
vim.keymap.set('n', '<leader>nF', ':NvimTreeFindFile<CR>', nenrs)
vim.keymap.set('n', '<leader>nc', ':NvimTreeCollapse<CR>', nenrs)

-- Trouble
vim.keymap.set('n', '<leader>x', ':TroubleToggle<CR>', nenrs)

-- Toggleterm
vim.keymap.set('n', '<leader>T', ':ToggleTerm<CR>', nenrs)
vim.keymap.set('t', '<leader>T', [[<C-\><C-n>:ToggleTerm<CR>]], nenrs)
vim.keymap.set('n', '<leader>tt', ':ToggleTermToggleAll<CR>', nenrs)
vim.keymap.set('t', '<leader>tt', [[<C-\><C-n>:ToggleTermToggleAll<CR>]], nenrs)

vim.keymap.set('n', '<leader>ts', ':ToggleTermSendCurrentLine<CR>', nenrns)
vim.keymap.set('v', '<leader>ts', ':ToggleTermSendVisualSelection<CR>', nenrns)

-- LazyGit
vim.keymap.set('n', '<leader>g', ':LazyGit<CR>', nenrs)

-- Telescope
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').commands, nenrns)
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, nenrns)
vim.keymap.set('n', '<leader>fF', require('telescope.builtin').git_files, nenrns)
vim.keymap.set('n', '<leader>fa', require('telescope.builtin').live_grep, nenrns)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').current_buffer_fuzzy_find, nenrns)
vim.keymap.set('n', '<leader>ht', require('telescope.builtin').help_tags, nenrns)
vim.keymap.set('n', '<leader>bb', require('telescope.builtin').buffers, nenrns)
vim.keymap.set('n', '<leader>pp', require('telescope').extensions.project.project, nenrns)

-- Copilot
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-E>', [[copilot#Accept('<CR>')]], enrs)
vim.keymap.set('i', '<C-S>', [[<Plug>(copilot-suggest)]], nenrns)
vim.keymap.set('i', '<C-J>', [[<Plug>(copilot-next)]], nenrns)
vim.keymap.set('i', '<C-K>', [[<Plug>(copilot-previous)]], nenrns)

-- nvim-dap
vim.keymap.set('n', '<leader>dp', [[:lua require'dap'.toggle_breakpoint()<CR>]], nenrns)
vim.keymap.set('n', '<leader>dc', [[:lua require'dap'.continue()<CR>]], nenrns)
vim.keymap.set('n', '<leader>ds', [[:lua require'dap'.step_over()<CR>]], nenrns)
vim.keymap.set('n', '<leader>dS', [[:lua require'dap'.step_into()<CR>]], nenrns)
--------End mappings config--------
