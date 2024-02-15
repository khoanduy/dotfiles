require('telescope').setup({
  ['ui-select'] = {
    require('telescope.themes').get_cursor {}
  },
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      anchor = 'CENTER',
      width = 0.68,
      height = 0.8,
      preview_cutoff = 0,
    },
  },
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true
    },
  },
})

require('telescope').load_extension('ui-select')
