return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = {
        layout_strategy = 'vertical',
        layout_config = {
          anchor = 'CENTER',
          width = 0.8,
          height = 0.8,
          preview_cutoff = 0,
        },
      },
      pickers = {
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true
        },
      }
    })
    vim.cmd.highlight('TelescopeNormal ctermbg=none guibg=none')
    vim.cmd.highlight('TelescopePromptBorder ctermbg=none guibg=none')
    vim.cmd.highlight('TelescopePromptTitle ctermbg=none guibg=none')
    vim.cmd.highlight('TelescopeBorder ctermbg=none guibg=none')
    vim.cmd.highlight('TelescopeTitle ctermbg=none guibg=none')
  end
}
