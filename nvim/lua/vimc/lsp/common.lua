local M = {}

function M.make_conf()
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local default = {
    on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap = true, silent = false, buffer = bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', '<leader>hv', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<leader>hb', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<leader>ba', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<leader>br', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<leader>bl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', '<C-a>', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('v', '<C-a>', vim.lsp.buf.range_code_action, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, bufopts)
      vim.keymap.set('v', '<leader>fm', vim.lsp.buf.format, bufopts)
    end,
    capabilities = capabilities,
    root_dir = function()
      return vim.fn.getcwd()
    end,
  }

  return default
end

function M.nvim_cmp_conf()
  local luasnip = require('luasnip')
  local cmp = require('cmp')
  return {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-5),
      ['<C-f>'] = cmp.mapping.scroll_docs(5),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<Tab>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<C-n>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<C-p>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  }
end

return M
