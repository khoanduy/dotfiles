-- LSP config --
local lspconfig = require('lspconfig')

local servers = {
  'pyright',
  'jdtls',
  'rust_analyzer',
  'sqlls',
  'bashls',
  'html',
  'cssls',
  'tsserver',
  'lua_ls',
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

-- LSP servers' default config
local config = require('lsp/common').make_conf()
for _, lsp in ipairs(servers) do
  if lsp ~= 'jdtls' then
    lspconfig[lsp].setup(config)
  end
end

-- nvim-cmp setup
require('cmp').setup(require('lsp/common').nvim_cmp_conf())

-- Diagnostic sign symbols
vim.lsp.handlers['textDocument/publishDiagnostics'] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = true,
    update_in_insert = false,
    signs = true,
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
