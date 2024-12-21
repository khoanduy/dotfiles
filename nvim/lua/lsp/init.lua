-- LSP config
local lspconfig = require("lspconfig")
local servers = { "clangd", "gopls", "pyright", "lua_ls", "ts_ls" }
local lspcommon = require("lsp.common")

-- Mason
require("mason").setup({})
require("mason-lspconfig").setup {
  ensure_installed = servers,
  automatic_installation = true,
}

-- Diagnostic
vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- LSP servers default config
local config = lspcommon.make_config()
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(config)
end

-- nvim-cmp setup
require("cmp").setup(lspcommon.nvim_cmp_config())

-- Diagnostic sign symbols
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      prefix = "◍",
      spacing = 2,
    },
    update_in_insert = false,
    severity_sort = true,
  })

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✖",
      [vim.diagnostic.severity.WARN] = "▲",
      [vim.diagnostic.severity.INFO] = "●",
      [vim.diagnostic.severity.HINT] = "◆",
    }
  }
})
