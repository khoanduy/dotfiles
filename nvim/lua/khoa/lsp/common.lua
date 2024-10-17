local M = {}

function M.make_config()
  local default = {
    on_attach = function(_, bufnr)
      -- Enable completion triggered
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions

      -- Go to keymaps
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Go to definition", buffer = bufnr })
      vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "Go to declaration", buffer = bufnr })
      vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, { desc = "Go to implementation", buffer = bufnr })
      vim.keymap.set("n", "gy", function() vim.lsp.buf.type_definition() end, { desc = "Go to type definition", buffer = bufnr })
      vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, { desc = "Go to references", buffer = bufnr })

      -- LSP actions
      vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, { desc = "LSP code action", buffer = bufnr })
      vim.keymap.set("v", "<leader>a", function() vim.lsp.buf.code_action() end, { desc = "LSP code action", buffer = bufnr })
      vim.keymap.set("n", "<leader>R", function() vim.lsp.buf.rename() end, { desc = "Rename symbols", buffer = bufnr })
      vim.keymap.set("n", "gm", function() vim.lsp.buf.format() end, { desc = "Re-format current buffer", buffer = bufnr })
      vim.keymap.set("v", "gm", function() vim.lsp.buf.format() end, { desc = "Re-format current buffer", buffer = bufnr })

      -- LSP info
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "Hover current line", buffer = bufnr })
      vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.signature_help() end, { desc = "Show signature help", buffer = bufnr })
    end,
    root_dir = function()
      return vim.fn.getcwd()
    end,
  }
  return default
end

return M
