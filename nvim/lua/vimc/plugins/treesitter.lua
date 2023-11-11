require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'c',
    'cpp',
    'rust',
    'lua',
    'python',
    'java',
    'toml',
    'html',
    'css',
    'javascript',
    'json',
    'yaml',
    'dockerfile',
    'proto',
    'markdown',
    'http',
    'cmake',
    'make',
    'go',
    'sql',
    'vim'
  },
  sync_install = false,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  textobjects = {
    enable = true,
  },
  refactor = {
    highlight_definitions = {
      enable = true,
    },
    highlight_current_scope = {
      enable = false,
    },
  }
})
