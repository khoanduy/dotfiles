local M = {}
local whichkey = require('which-key')

function M.make_conf()
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local default = {
    on_attach = function(_, bufnr)
      -- Enable completion triggered
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      whichkey.register({
        g = {
          name = 'LSP goto',
          d = { vim.lsp.buf.definition, 'Go to definition', buffer = bufnr },
          D = { vim.lsp.buf.declaration, 'Go to declaration', buffer = bufnr },
          i = { vim.lsp.buf.implementation, 'Go to implementation', buffer = bufnr },
          y = { vim.lsp.buf.type_definition, 'Go to type definition', buffer = bufnr },
          r = { vim.lsp.buf.references, 'Go to references', buffer = bufnr },
        }
      })

      whichkey.register({
        a = { vim.lsp.buf.code_action, 'LSP code action', buffer = bufnr },
        r = { vim.lsp.buf.rename, 'Rename symbols', buffer = bufnr },
        m = { vim.lsp.buf.format, 'Re-format current buffer', buffer = bufnr },
        k = { vim.lsp.buf.hover, 'Hover current line', buffer = bufnr },
        h = { vim.lsp.buf.signature_help, 'Show signature help', buffer = bufnr },
      }, { prefix = '<leader>' })

      whichkey.register({
        a = { vim.lsp.buf.code_action, 'LSP code action', mode = 'v', buffer = bufnr },
        m = { vim.lsp.buf.format, 'Re-format current block', mode = 'v', buffer = bufnr },
      }, { prefix = '<leader>' })
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
      ['<c-d>'] = cmp.mapping.scroll_docs(-5),
      ['<c-u>'] = cmp.mapping.scroll_docs(5),
      ['<c-space>'] = cmp.mapping.complete(),
      ['<tab>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<c-n>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<c-p>'] = cmp.mapping(function(fallback)
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
