require('telescope').setup({
  ['ui-select'] = {
    require('telescope.themes').get_cursor {}
  },
  pickers = {
    find_files = {
      theme = 'ivy'
    },
    git_files = {
      theme = 'ivy'
    },
    buffers = {
      theme = 'ivy',
      ignore_current_buffer = true,
      sort_lastused = true
    },
    live_grep = {
      theme = 'ivy'
    },
    current_buffer_fuzzy_find = {
      theme = 'ivy'
    }
  },
  extensions = {
    project = {
      hidden_files = true,
      theme = 'dropdown',
      order_by = 'asc',
      search_by = 'title',
      sync_with_nvim_tree = true,
    }
  }
})

require('telescope').load_extension('ui-select')
require('telescope').load_extension('project')
