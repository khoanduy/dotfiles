-- Mappings' config --
local whichkey = require('which-key')

-- Set leader key
vim.g.mapleader = ' '

-- Define mapping groups
whichkey.register({
  b = { require('telescope.builtin').buffers, 'Buffer list', silent = false },
  r = { ':e<cr>', 'Reload current buffer from disk', silent = false },
  y = { '"+y', 'Copy marked text to global register', silent = false },
  p = { '"+p', 'Paste marked text from global register', silent = false },
  -- p = { ':echo @%<cr>', 'Show current buffer\'s full path', silent = false },
  f = { require('telescope.builtin').find_files, 'Find files' },
  F = { require('telescope.builtin').git_files, 'Find files (include ignored files)' },
  e = { ':NvimTreeToggle<cr>', 'Toggle file explorer' },
  E = { ':NvimTreeFindFile<cr>', 'Locate current file in file explorer' },
  T = { ':ToggleTerm<cr>', 'Show terminal' },
  G = { ':LazyGit<cr>', 'Open git client' },
  w = {
    name = 'Window',
    v = { '<c-w>v', 'Split buffer vertically' },
    h = { '<c-w>s', 'Split buffer horizontally' },
  }
}, { prefix = '<leader>' })

whichkey.register({
  T = { [[<c-\><c-n>:ToggleTerm<cr>]], 'Hide terminal', mode = 't' },
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

vim.keymap.set('n', '|', ':noh<cr>', { desc = 'Clear highlights' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').live_grep, { desc = 'Grep pattern within project' })
vim.keymap.set('v', '//', [[y/\V<C-R>=escape(@",'/\')<cr><cr>]], {
  desc = 'Search current marked text'
})
-- End mappings' config --
