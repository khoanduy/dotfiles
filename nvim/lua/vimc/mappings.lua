-- Mappings' config --
local whichkey = require('which-key')
local fzflua = require('fzf-lua')
local utils = require('vimc.utilities')

-- Define mapping groups
whichkey.register({
  f = { fzflua.files, 'Find files' },
  F = { fzflua.git_files, 'Find files (include ignored files)' },
  b = { fzflua.buffers, 'Buffer list', silent = false },
  B = { ':Gitsigns toggle_current_line_blame<cr>', 'Toggle current lien blame' },
  r = { ':e<cr>', 'Reload current buffer from disk', silent = false },
  y = { '"+y', 'Copy marked text to global register', mode = 'v', silent = false },
  p = { '"+p', 'Paste marked text from global register', silent = false },
  e = { ':NvimTreeToggle<cr>', 'Toggle file explorer' },
  E = { ':NvimTreeFindFile<cr>', 'Locate current file in file explorer' },
  T = { ':!tmux split-window -l 12 "zsh"<cr><cr>', 'Open terminal' },
  G = {
    ':!tmux setw remain-on-exit off && tmux split-window -h -l 120 "lazygit"<cr><cr>',
    'Open git client'
  },
  q = { ':q<cr>', 'Quit current buffer' },
  Q = { ':qa<cr>', 'Quit all buffers' },
  C = { ':qa!<cr>', 'Quit all buffers without saving' },
  s = { ':w<cr>', 'Save current buffer' },
  d = { vim.diagnostic.open_float, 'Open diagnostic float' },
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
  ['/'] = { fzflua.live_grep_native, 'Grep pattern within project' },
}, { prefix = '<leader>' })

whichkey.register({
  T = { [[<c-\><c-n>:bd!<cr>]], 'Close terminal', mode = 't' },
  ['/'] = { [[y/\V<C-R>=escape(@",'/\')<cr><cr>]], 'Search current marked text', mode = 'v' },
}, { prefix = '<leader>' })

whichkey.register({
  d = { vim.diagnostic.goto_prev, 'Prev diagnostic' },
}, { prefix = '[' })

whichkey.register({
  d = { vim.diagnostic.goto_next, 'Next diagnostic' },
}, { prefix = ']' })

whichkey.register({
  ['<esc><esc>'] = { '<esc>:noh<cr>', 'Dismiss highlight' },
  ['<c-h>'] = { '<c-w>h', 'Switch to left region' },
  ['<c-j>'] = { '<c-w>j', 'Switch to bottom region' },
  ['<c-k>'] = { '<c-w>k', 'Switch to top region' },
  ['<c-l>'] = { '<c-w>l', 'Switch to right region' },
  ['<up>'] = { ':resize -2<cr>', 'Decrease vertical size' },
  ['<down>'] = { ':resize +2<cr>', 'Increase vertical size' },
  ['<left>'] = { ':vertical resize +2<cr>', 'Left horizontal resize' },
  ['<right>'] = { ':vertical resize -2<cr>', 'Right horizontal resize' },
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
  j = {
    name = 'Java custom commands',
    i = {
      ':!tmux new-window -n "mvn-install" "mvn -N flyway:migrate && mvn clean install -T 5"<cr><cr>',
      'Clean and install project using Maven',
      silent = false
    },
    t = { utils.run_maven_test, 'Run current test using Maven', silent = false, expr = true },
  }
}, { prefix = '\\' })
-- End mappings' config --
