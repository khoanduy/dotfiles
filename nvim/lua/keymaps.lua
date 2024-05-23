-- Mappings' config --
local whichkey = require('which-key')
local telescope = require('telescope.builtin')
local utils = require('utils')

-- Define mapping groups
whichkey.register({
  f = { telescope.find_files, 'Find files' },
  F = { telescope.git_files, 'Find files (include ignored files)' },
  b = { telescope.buffers, 'Buffer list', silent = false },
  B = { ':Gitsigns toggle_current_line_blame<cr>', 'Toggle line blame' },
  r = { ':e<cr>', 'Reload current buffer from disk', silent = false },
  y = { '"+y', 'Copy marked text to global register', mode = 'v', silent = false },
  p = { '"+p', 'Paste marked text from global register', silent = false },
  e = { ':Oil<cr>', 'Toggle file explorer' },
  T = { ':!tmux split-window -l 12 "zsh"<cr><cr>', 'Open terminal' },
  G = {
    ':!tmux setw remain-on-exit off && tmux split-window -h -l 120 "lazygit"<cr><cr>',
    'Open git client'
  },
  d = { vim.diagnostic.open_float, 'Open diagnostic float' },
  D = { telescope.diagnostics, 'List diagnostics for all open buffers' },
  x = { ':TroubleToggle<cr>', 'Open trouble lists' },
  i = {
    name = 'nvimdiff',
    p = { ':diffput 2<cr>', 'Put current change to middle' },
    l = { ':diffget 1<cr>', 'Get left changes' },
    r = { ':diffget 3<cr>', 'Get right changes' },
  },
  w = {
    name = 'Window',
    v = { '<c-w>v', 'Split buffer vertically' },
    h = { '<c-w>s', 'Split buffer horizontally' },
  },
  ['/'] = { telescope.live_grep, 'Grep pattern within project' },
}, { prefix = '<leader>' })

whichkey.register({
  ['<c-h>'] = { '<c-w>h', 'Switch to left region' },
  ['<c-j>'] = { '<c-w>j', 'Switch to bottom region' },
  ['<c-k>'] = { '<c-w>k', 'Switch to top region' },
  ['<c-l>'] = { '<c-w>l', 'Switch to right region' },
  ['<up>'] = { ':resize -2<cr>', 'Decrease vertical size' },
  ['<down>'] = { ':resize +2<cr>', 'Increase vertical size' },
  ['<left>'] = { ':vertical resize +2<cr>', 'Left horizontal resize' },
  ['<right>'] = { ':vertical resize -2<cr>', 'Right horizontal resize' },
  ['~'] = { ':noh<cr>', 'Dismiss highlights' },
  ['//'] = { [[y/\V<C-R>=escape(@",'/\')<cr><cr>]], 'Search current marked text', mode = 'v' },
  ['/'] = { telescope.grep_string, 'Grep current marked text within project', mode = 'v' },
  gR = { function() require('trouble').toggle('lsp_references') end, 'LSP references troubles' },
})

whichkey.register({
  jk = { '<esc>', 'Insert mode escape key', mode = 'i' },
  ['<c-h>'] = { [[<c-\><c-n><c-w>h]], 'Switch to left region', mode = 't' },
  ['<c-j>'] = { [[<c-\><c-n><c-w>j]], 'Switch to bottom region', mode = 't' },
  ['<c-k>'] = { [[<c-\><c-n><c-w>k]], 'Switch to top region', mode = 't' },
  ['<c-l>'] = { [[<c-\><c-n><c-w>l]], 'Switch to right region', mode = 't' },
})

whichkey.register({
  c = {
    name = 'Java custom commands',
    i = {
      ':!tmux new-window -n "mvn-install" "mvn -N flyway:migrate && mvn clean install -T 5"<cr><cr>',
      'Clean and install project using Maven',
      silent = false
    },
    t = { utils.run_maven_test, 'Run current test using Maven', silent = false, expr = true },
  },
}, { prefix = '\\' })
-- End mappings' config --
