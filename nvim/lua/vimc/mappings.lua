-- Mappings' config --
local whichkey = require('which-key')
local fzflua = require('fzf-lua')

-- Define mapping groups
whichkey.register({
  f = { fzflua.files, 'Find files' },
  F = { fzflua.git_files, 'Find files (include ignored files)' },
  b = { fzflua.buffers, 'Buffer list', silent = false },
  B = { ':Gitsigns toggle_current_line_blame<cr>', 'Toggle current lien blame' },
  r = { ':e<cr>', 'Reload current buffer from disk', silent = false },
  p = { '"+p', 'Paste marked text from global register', silent = false },
  e = { ':NvimTreeToggle<cr>', 'Toggle file explorer' },
  E = { ':NvimTreeFindFile<cr>', 'Locate current file in file explorer' },
  T = { ':!tmux split-window -p 25 \'zsh\'<cr><cr>', 'Open terminal' },
  G = {
    ':!tmux setw remain-on-exit off && tmux split-window -h -p 65 \'lazygit\'<cr><cr>',
    'Open git client'
  },
  w = {
    name = 'Window',
    v = { '<c-w>v', 'Split buffer vertically' },
    h = { '<c-w>s', 'Split buffer horizontally' },
  }
}, { prefix = '<leader>' })

whichkey.register({
  y = { '"+y', 'Copy marked text to global register', mode = 'v', silent = false },
  T = { [[<c-\><c-n>:bd!<cr>]], 'Close terminal', mode = 't' },
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
vim.keymap.set('n', '<leader>/', fzflua.live_grep_native, { desc = 'Grep pattern within project' })
vim.keymap.set('v', '<leader>/', [[y/\V<C-R>=escape(@",'/\')<cr><cr>]], {
  desc = 'Search current marked text'
})

-- Remap indent keys
vim.keymap.set('v', '<', '<gv', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })
-- End mappings' config --
