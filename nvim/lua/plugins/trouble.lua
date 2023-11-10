require('trouble').setup({
  icons = true,
  fold_open = '⦣',
  fold_closed = '⦢',
  indent_lines = false,
  signs = {
    error = '✘',
    warning = '❢',
    hint = '✔',
    information = '✦'
  },
  use_diagnostic_signs = false
})
