require('telescope').setup({
  ['ui-select'] = {
    require('telescope.themes').get_cursor {}
  },
  defaults = {
    layout_strategy = 'center',
    layout_config = {
      anchor = 'N',
      width = 0.5,
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
