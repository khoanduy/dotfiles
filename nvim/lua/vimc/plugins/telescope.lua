require('telescope').setup({
  ['ui-select'] = {
    require('telescope.themes').get_cursor {}
  },
  defaults = {
    layout_config = {
      vertical = {
        width = 0.5,
      },
    },
  },
  pickers = {
    buffers = {
      theme = 'dropdown',
      ignore_current_buffer = true,
      sort_lastused = true
    },
  },
})

require('telescope').load_extension('ui-select')
