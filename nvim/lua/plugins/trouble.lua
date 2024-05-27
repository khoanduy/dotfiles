return {
  'folke/trouble.nvim',
  opts = {
    icons = false,
    fold_open = '◇',
    fold_closed = '◆',
    indent_lines = false,
    signs = {
        error = '✖',
        warning = '▲',
        hint = '✱',
        information = '●'
    },
    use_diagnostic_signs = true
  },
}
