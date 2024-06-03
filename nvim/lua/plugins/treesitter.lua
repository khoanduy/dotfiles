return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
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
      },
      sync_install = false,
      highlight = {
        enable = true,
        disable = { 'help' }
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
  end
}
