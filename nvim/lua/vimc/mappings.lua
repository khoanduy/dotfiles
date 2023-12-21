-- Mappings' config --

-- Set leader key
vim.g.mapleader = ','

-- Remap C-w prefix
vim.keymap.set('n', '<leader>w', '<C-w>', {
  desc = 'Remap C-w prefix',
  expr = false,
  noremap = true,
  silent = true
})

-- Remap switch region keys
vim.keymap.set('n', '<C-h>', '<C-w>h', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { expr = false, noremap = true, silent = true })

vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { expr = false, noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { expr = false, noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { expr = false, noremap = true, silent = true })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { expr = false, noremap = true, silent = true })

-- Re-size split windows using arrow keys
vim.keymap.set('n', '<Up>', ':resize -2<CR>', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<Down>', ':resize +2<CR>', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<Left>', ':vertical resize +2<CR>', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<Right>', ':vertical resize -2<CR>', { expr = false, noremap = true, silent = true })

-- Remap switch buffers keys
vim.keymap.set('n', '<leader>bn', ':bn<CR>', {
  desc = 'Switch to next buffer',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>bN', ':bp<CR>', {
  desc = 'Switch to previous buffer',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>bd', ':bd<CR>', {
  desc = 'Delete current buffer',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>bD', ':bd<CR>', {
  desc = 'Force delete current buffer',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>bw', ':bw<CR>', {
  desc = 'Delete current buffer completely',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>bW', ':bw!<CR>', {
  desc = 'Force delete current buffer completely',
  expr = false,
  noremap = true,
  silent = true
})

vim.keymap.set('t', '<leader>bw', [[<C-\><C-n>:bw!<CR>]], {
  desc = 'Delete current terminal completely',
  expr = false,
  noremap = true,
  silent = true
})

-- Remap terminal escape key
vim.keymap.set('t', '<leader>e', [[<C-\><C-n>]], {
  desc = 'Escape terminal mode',
  expr = false,
  noremap = false,
  silent = true
})

-- Show current buffer's path
vim.keymap.set('n', '<space>d', ':echo @%<CR>', {
  desc = 'Show current buffer\'s full path',
  expr = false,
  noremap = false,
  silent = true
})

-- No highlight
vim.keymap.set('n', '|', ':noh<CR>', { expr = false, noremap = true, silent = true })
vim.keymap.set('n', '<space>r', ':e<CR>', {
  desc = 'Reload current buffer from disk',
  expr = false,
  noremap = true,
  silent = true
})

-- Search current marked text
vim.keymap.set('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], {
  desc = 'Search current marked text',
  expr = false,
  noremap = true,
  silent = false
})

-- Remap write and quit
vim.keymap.set('n', '<space>w', ':w<CR>', {
  desc = 'Save buffer',
  expr = false,
  noremap = true,
  silent = false
})
vim.keymap.set('n', '<space>q', ':q<CR>', {
  desc = 'Quit buffer',
  expr = false,
  noremap = true,
  silent = false
})
vim.keymap.set('n', '<space>Q', ':qa<CR>', {
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
vim.keymap.set('n', '<space>v', '<C-w>v', {
  desc = 'Split buffer vertically',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<space>h', '<C-w>s', {
  desc = 'Split buffer horizontally',
  expr = false,
  noremap = true,
  silent = true
})

-- Show git annotate of current line
function show_git_annotate()
  local line = vim.fn.line('.')
  local file = vim.fn.expand('%:p')
  local format = ' | cut -d\' \' -f1,2,3 | tr \'(\' \' \''
  local result = vim.fn.system('git annotate -L ' .. line .. ',' .. line .. ' ' .. file .. format)
  vim.api.nvim_out_write(result)
end
vim.keymap.set('n', '<space>b', [[:lua show_git_annotate()<CR>]], {
  desc = 'Show git annotate of current line',
  expr = false,
  noremap = true,
  silent = true
})

-- NVIM tree
vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<CR>', {
  desc = 'Toggle nvim tree',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>nf', ':NvimTreeFocus<CR>', {
  desc = 'Focus nvim tree',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>nF', ':NvimTreeFindFile<CR>', {
  desc = 'Locate current file in nvim tree',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>nc', ':NvimTreeCollapse<CR>', {
  desc = 'Collapse all folders in nvim tree',
  expr = false,
  noremap = true,
  silent = true
})

-- Toggleterm
vim.keymap.set('n', '<leader>T', ':ToggleTerm<CR>', {
  desc = 'Show terminal',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('t', '<leader>T', [[<C-\><C-n>:ToggleTerm<CR>]], {
  desc = 'Hide terminal',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('n', '<leader>tt', ':ToggleTermToggleAll<CR>', {
  desc = 'Show all terminals',
  expr = false,
  noremap = true,
  silent = true
})
vim.keymap.set('t', '<leader>tt', [[<C-\><C-n>:ToggleTermToggleAll<CR>]], {
  desc = 'Hide all terminals',
  expr = false,
  noremap = true,
  silent = true
})

vim.keymap.set('n', '<leader>ts', ':ToggleTermSendCurrentLine<CR>', {
  desc = 'Send current line to terminal',
  expr = false,
  noremap = true,
  silent = false
})
vim.keymap.set('v', '<leader>ts', ':ToggleTermSendVisualSelection<CR>', {
  desc = 'Send current marked text to terminal',
  expr = false,
  noremap = true,
  silent = false
})

-- LazyGit
vim.keymap.set('n', '<leader>g', ':LazyGit<CR>', {
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
