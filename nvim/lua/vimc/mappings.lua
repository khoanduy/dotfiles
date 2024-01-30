-- Mappings' config --
local funcs = require('vimc/functions')
local whichkey = require('which-key')

-- Set leader key
vim.g.mapleader = '\\'

-- Define mapping groups
whichkey.register({
  b = {
    name = 'Buffer',
    n = { ':bn<cr>', 'Switch to next buffer', silent = false },
    N = { ':bp<cr>', 'Switch to previous buffer', silent = false },
    d = { ':bd<cr>', 'Delete current buffer', silent = false },
    D = { ':bd!<cr>', 'Force delete current buffer', silent = false },
    b = { require('telescope.builtin').buffers, 'Buffer list', silent = false },
    p = { ':echo @%<cr>', 'Show current buffer\'s full path', silent = false },
    c = { ':noh<cr>', 'Clear highlights', silent = false },
    r = { ':e<cr>', 'Reload current buffer from disk', silent = false },
  },
  f = {
    name = 'Find, Filter, Preview, Pick',
    f = { require('telescope.builtin').find_files, 'Find files' },
    F = { require('telescope.builtin').git_files, 'Find files (include ignored files)' },
    a = { require('telescope.builtin').live_grep, 'Grep pattern within project' },
    b = { require('telescope.builtin').current_buffer_fuzzy_find, 'Fuzzy find current buffer' },
  },
  c = { require('telescope.builtin').commands, 'Command list' },
  e = {
    name = 'File Explorer',
    t = { ':NvimTreeToggle<cr>', 'Toggle file explorer' },
    f = { ':NvimTreeFindFile<cr>', 'Locate current file in file explorer' },
    F = { ':NvimTreeFocus<cr>', 'Focus file explorer' },
    c = { ':NvimTreeCollapse<cr>', 'Collapse all folders in file explorer' },
  },
  t = {
    name = 'Terminal',
    t = { ':ToggleTerm<cr>', 'Show terminal' },
    t = { [[<c-\><c-n>:ToggleTerm<cr>]], 'Hide terminal', mode = 't' },
    a = { ':ToggleTermToggleAll<cr>', 'Show all terminals' },
    a = { [[<C-\><C-n>:ToggleTermToggleAll<cr>]], 'Hide all terminals', mode = 't' },
    s = { ':ToggleTermSendCurrentLine<cr>', 'Send current line to terminal' },
    s = { ':ToggleTermSendVisualSelection<cr>', 'Send current marked text to terminal', mode = 'v' },
  },
}, { prefix = '<leader>' })

-- Remap switch region keys
vim.keymap.set('n', '<c-h>', '<c-w>h', { silent = true })
vim.keymap.set('n', '<c-j>', '<c-w>j', { silent = true })
vim.keymap.set('n', '<c-k>', '<c-w>k', { silent = true })
vim.keymap.set('n', '<c-l>', '<c-w>l', { silent = true })

vim.keymap.set('t', '<c-h>', [[<c-\><c-n><c-w>h]], { silent = true })
vim.keymap.set('t', '<c-j>', [[<c-\><c-n><c-w>j]], { silent = true })
vim.keymap.set('t', '<c-k>', [[<c-\><c-n><c-w>k]], { silent = true })
vim.keymap.set('t', '<c-l>', [[<c-\><c-n><c-w>l]], { silent = true })

-- Re-size split windows using arrow keys
vim.keymap.set('n', '<up>', ':resize -2<cr>', { silent = true })
vim.keymap.set('n', '<down>', ':resize +2<cr>', { silent = true })
vim.keymap.set('n', '<left>', ':vertical resize +2<cr>', { silent = true })
vim.keymap.set('n', '<right>', ':vertical resize -2<cr>', { silent = true })

-- Remap terminal escape key
vim.keymap.set('t', '<leader>e', [[<c-\><c-n>]], {
  desc = 'Escape terminal mode',
  silent = true
})

vim.keymap.set('t', '<leader>d', [[<c-\><c-n>:bd!<cr>]], {
  desc = 'Delete current terminal completely',
  silent = true
})

-- Search current marked text
vim.keymap.set('v', '//', [[y/\V<C-R>=escape(@",'/\')<cr><cr>]], { desc = 'Search current marked text' })

-- Remap write and quit
vim.keymap.set('n', '<space>w', ':w<cr>', { desc = 'Save buffer' })
vim.keymap.set('n', '<space>q', ':q<cr>', { desc = 'Quit buffer' })
vim.keymap.set('n', '<space>Q', ':qa<cr>', { desc = 'Quit all buffers' })

-- Copy marked text/paste to/from global register
vim.keymap.set('v', '<space>y', '"+y', { desc = 'Copy marked text to global register' })
vim.keymap.set('n', '<space>p', '"+p', { desc = 'Paste marked text from global register' })

-- Remap split
vim.keymap.set('n', '<space>v', '<c-w>v', {
  desc = 'Split buffer vertically',
  silent = true
})
vim.keymap.set('n', '<space>s', '<c-w>s', {
  desc = 'Split buffer horizontally',
  silent = true
})

vim.keymap.set('n', '<space>a', funcs.show_git_annotate, {
  desc = 'Show git annotate of current line',
  silent = true
})

-- LazyGit
vim.keymap.set('n', '<space>g', ':LazyGit<cr>', {
  desc = 'Open git client',
  silent = true
})
-- End mappings' config --
