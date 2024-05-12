-- Mappings' config --
local whichkey = require('which-key')
local fzf = require('fzf-lua')
local utils = require('vimc.utils')

-- Define mapping groups
whichkey.register({
  f = { fzf.files, 'Find files' },
  F = { fzf.git_files, 'Find files (include ignored files)' },
  b = { fzf.buffers, 'Buffer list', silent = false },
  B = { utils.show_git_annotate, 'Show current line blame' },
  r = { ':e<cr>', 'Reload current buffer from disk', silent = false },
  y = { '"+y', 'Copy marked text to global register', mode = 'v', silent = false },
  p = { '"+p', 'Paste marked text from global register', silent = false },
  e = { ':Oil<cr>', 'Toggle file explorer' },
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
  ['/'] = { fzf.live_grep, 'Grep pattern within project' },
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
  c = {
    name = 'Java custom commands',
    i = {
      ':!tmux new-window -n "mvn-install" "mvn -N flyway:migrate && mvn clean install -T 5"<cr><cr>',
      'Clean and install project using Maven',
      silent = false
    },
    t = { utils.run_maven_test, 'Run current test using Maven', silent = false, expr = true },
  },
  d = {
    name = 'DAP commands',
    s = {
      require('jdtls.dap').setup_dap_main_class_configs,
      'Setup DAP main class configs',
      silent = false
    },
    t = {
      require('dapui').toggle,
      'Toggle DAP UI'
    },
    b = { ':DapToggleBreakpoint<cr>', 'Toggle DAP Breakpoint' },
    c = { ':DapContinue<cr>', 'Debug continue' },
    i = { ':DapUIStepInto<cr>', 'Debug step into' },
    o = { ':DapUIStepOut<cr>', 'Debug step out' },
    v = { ':DapUIStepOver<cr>', 'Debug step over' },
    q = { ':DapTerminate<cr>', 'Debug terminate' },
  },
  t = {
    name = 'Testing commands',
    c = {
      require('jdtls').test_class,
      'Run current test file',
      silent = false
    },
    m = {
      require('jdtls').test_nearest_method,
      'Run current test method',
      silent = false
    }
  }
}, { prefix = '\\' })
-- End mappings' config --
