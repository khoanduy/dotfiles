-- Mappings' config --
local funcs = require('vimc/functions')

-- Set leader key
vim.g.mapleader = ','

-- Remap C-w prefix
vim.keymap.set('n', '<leader>w', '<c-w>', {
  desc = 'Remap c-w prefix',
  expr = false,
  noremap = true,
  silent = true
})

-- Remap switch region keys
vim.keymap.set('n', '<c-h>', '<c-w>h', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<c-j>', '<c-w>j', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<c-k>', '<c-w>k', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<c-l>', '<c-w>l', { expr = false, noremap = true, silent = true })

vim.keymap.set('t', '<c-h>', [[<c-\><c-n><c-w>h]], { expr = false, noremap = true, silent = true })
vim.keymap.set('t', '<c-j>', [[<c-\><c-n><c-w>j]], { expr = false, noremap = true, silent = true })
vim.keymap.set('t', '<c-k>', [[<c-\><c-n><c-w>k]], { expr = false, noremap = true, silent = true })
vim.keymap.set('t', '<c-l>', [[<c-\><c-n><c-w>l]], { expr = false, noremap = true, silent = true })

-- Re-size split windows using arrow keys
vim.keymap.set('n', '<up>', ':resize -2<cr>', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<down>', ':resize +2<cr>', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<left>', ':vertical resize +2<cr>', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<right>', ':vertical resize -2<cr>', { expr = false, noremap = true, silent = true })

-- Remap switch buffers keys
vim.keymap.set('n', '<leader>bn', ':bn<cr>', {
  desc = 'Switch to next buffer',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>bN', ':bp<cr>', {
  desc = 'Switch to previous buffer',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>bd', ':bd<cr>', {
  desc = 'Delete current buffer',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>bD', ':bd<cr>', {
  desc = 'Force delete current buffer',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>bw', ':bw<cr>', {
  desc = 'Delete current buffer completely',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>bW', ':bw!<cr>', {
  desc = 'Force delete current buffer completely',
  expr = false,
  noremap = true,
  silent = true
})

vim.keymap.set('t', '<leader>bw', [[<C-\><C-n>:bw!<cr>]], {
  desc = 'Delete current terminal completely',
  expr = false,
  noremap = true,
  silent = true
})

-- Remap terminal escape key
vim.keymap.set('t', '<esc>', [[<c-\><c-n>]], {
  desc = 'Escape terminal mode',
  expr = false,
  noremap = false,
  silent = true
})

-- Show current buffer's path
vim.keymap.set('n', '<space>d', ':echo @%<cr>', {
  desc = 'Show current buffer\'s full path',
  expr = false,
  noremap = false,
  silent = true
})

-- No highlight
vim.keymap.set('n', '|', ':noh<cr>', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<space>r', ':e<cr>', {
  desc = 'Reload current buffer from disk',
  expr = false,
  noremap = true,
  silent = true
})

-- Search current marked text
vim.keymap.set('v', '//', [[y/\V<C-R>=escape(@",'/\')<cr><cr>]], {
  desc = 'Search current marked text',
  expr = false,
  noremap = true,
  silent = false
})

-- Remap write and quit
vim.keymap.set('n', '<space>w', ':w<cr>', {
  desc = 'Save buffer',
  expr = false,
  noremap = true,
  silent = false
})
vim.keymap.set('n', '<space>q', ':q<cr>', {
  desc = 'Quit buffer',
  expr = false,
  noremap = true,
  silent = false
})
vim.keymap.set('n', '<space>Q', ':qa<cr>', {
  desc = 'Quit all buffers',
  expr = false,
  noremap = true,
  silent = false
})

-- Copy marked text/paste to/from global register
vim.keymap.set('v', '<space>y', '"+y', {
  desc = 'Copy marked text to global register',
  expr = false,
  noremap = true,
  silent = false
})
vim.keymap.set('n', '<space>p', '"+p', {
  desc = 'Paste marked text from global register',
  expr = false,
  noremap = true,
  silent = false
})

-- Remap split
vim.keymap.set('n', '<space>v', '<c-w>v', {
  desc = 'Split buffer vertically',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<space>h', '<c-w>s', {
  desc = 'Split buffer horizontally',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<space>H', ':botright split<cr>', {
  desc = 'Split buffer horizontally from bottom right',
  expr = false,
  noremap = true,
  silent = true
})

vim.keymap.set('n', '<space>a', funcs.show_git_annotate, {
  desc = 'Show git annotate of current line',
  expr = false,
  noremap = true,
  silent = true
})

-- NVIM tree
vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<cr>', {
  desc = 'Toggle nvim tree',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>nf', ':NvimTreeFocus<cr>', {
  desc = 'Focus nvim tree',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>nF', ':NvimTreeFindFile<cr>', {
  desc = 'Locate current file in nvim tree',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>nc', ':NvimTreeCollapse<cr>', {
  desc = 'Collapse all folders in nvim tree',
  expr = false,
  noremap = true,
  silent = true
})

-- Toggleterm
vim.keymap.set('n', '<leader>T', ':ToggleTerm<cr>', {
  desc = 'Show terminal',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('t', '<leader>T', [[<c-\><c-n>:ToggleTerm<cr>]], {
  desc = 'Hide terminal',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>tt', ':ToggleTermToggleAll<cr>', {
  desc = 'Show all terminals',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('t', '<leader>tt', [[<C-\><C-n>:ToggleTermToggleAll<cr>]], {
  desc = 'Hide all terminals',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>ts', ':ToggleTermSendCurrentLine<cr>', {
  desc = 'Send current line to terminal',
  expr = false,
  noremap = true,
  silent = false
})
vim.keymap.set('v', '<leader>ts', ':ToggleTermSendVisualSelection<cr>', {
  desc = 'Send current marked text to terminal',
  expr = false,
  noremap = true,
  silent = false
})

-- LazyGit
vim.keymap.set('n', '<leader>g', ':LazyGit<cr>', {
  desc = 'Open git client',
  expr = false,
  noremap = true,
  silent = true
})

-- Telescope
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').commands, {
  desc = 'Open command list',
  expr = false,
  noremap = true,
  silent = false
})
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {
  desc = 'Find files in current project',
  expr = false,
  noremap = true,
  silent = false
})
vim.keymap.set('n', '<leader>fF', require('telescope.builtin').git_files, {
  desc = 'Find files (include ignored files) in current project',
  expr = false,
  noremap = true,
  silent = false
})
vim.keymap.set('n', '<leader>fa', require('telescope.builtin').live_grep, {
  desc = 'Find text in current project',
  expr = false,
  noremap = true,
  silent = false
})
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').current_buffer_fuzzy_find, {
  desc = 'Find text in current buffer',
  expr = false,
  noremap = true,
  silent = false
})
vim.keymap.set('n', '<leader>bb', require('telescope.builtin').buffers, {
  desc = 'Open buffer list',
  expr = false,
  noremap = true,
  silent = false
})
vim.keymap.set('n', '<leader>pp', require('telescope').extensions.project.project, {
  desc = 'Open project list',
  expr = false,
  noremap = true,
  silent = false
})
-- End mappings' config --
