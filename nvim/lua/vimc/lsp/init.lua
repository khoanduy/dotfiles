-- LSP config --
local lspconfig = require('lspconfig')

local servers = {
  'rust_analyzer',
  'pyright',
  'sqlls',
  'ansiblels',
  'bashls',
  'jsonls',
  'yamlls',
  'taplo',
  'html',
  'cssls',
  'tsserver',
  'dockerls',
  'lua_ls',
  'marksman',
}

require('mason').setup({
  ui = {
    icons = {
      server_installed = '✔',
      server_pending = '◔',
      server_uninstalled = '✖'
    }
  },
})

require('mason-lspconfig').setup {
  ensure_installed = servers,
  automatic_installation = true,
}

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- LSP servers' default config
local config = require('vimc/lsp/common').make_conf()
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(config)
end

-- nvim-cmp setup
require('cmp').setup(require('vimc/lsp/common').nvim_cmp_conf())

-- Diagnostic sign symbols
vim.lsp.handlers['textDocument/publishDiagnostics'] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      prefix = '●',
      spacing = 2,
    },
    update_in_insert = false,
    severity_sort = true,
  })

vim.fn.sign_define('DiagnosticSignError', {
  text = '✖',
  texthl = 'DiagnosticSignError',
  numhl = 'DiagnosticSignError',
})
vim.fn.sign_define('DiagnosticSignWarning', {
  text = '▲',
  texthl = 'DiagnosticSignWarning',
  numhl = 'DiagnosticSignWarning',
})
vim.fn.sign_define('DiagnosticSignInformation', {
  text = '●',
  texthl = 'DiagnosticSignInformation',
  numhl = 'DiagnosticSignInformation',
})
vim.fn.sign_define('DiagnosticSignHint', {
  text = '✱',
  texthl = 'DiagnosticSignHint',
  numhl = 'DiagnosticSignHint',
})
-- End LSP config --
