local M = {}

function M.make_conf()
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local default = {
    on_attach = function(client, bufnr)
      -- Enable completion triggered
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {
        desc = 'Go to declaration',
        buffer = bufnr
      })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
        desc = 'Go to definition',
        buffer = bufnr
      })
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {
        desc = 'Go to implementation',
        buffer = bufnr
      })
      vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, {
        desc = 'Go to type definition',
        buffer = bufnr
      })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, {
        desc = 'Go to references',
        buffer = bufnr
      })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {
        desc = 'Rename symbols',
        buffer = bufnr
      })
      vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, {
        desc = 'LSP code action',
        buffer = bufnr
      })
      vim.keymap.set('v', '<leader>a', vim.lsp.buf.range_code_action, {
        desc = 'LSP code action',
        buffer = bufnr
      })
      vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, {
        desc = 'Re-format current buffer',
        buffer = bufnr
      })
      vim.keymap.set('v', '<leader>fm', vim.lsp.buf.format, {
        desc = 'Re-format current block',
        buffer = bufnr
      })
      vim.keymap.set('n', '<leader>hl', vim.lsp.buf.hover, {
        desc = 'Hover current line',
        buffer = bufnr
      })
      vim.keymap.set('n', '<leader>hh', vim.lsp.buf.signature_help, {
        desc = 'Show signature help',
        buffer = bufnr
      })
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
