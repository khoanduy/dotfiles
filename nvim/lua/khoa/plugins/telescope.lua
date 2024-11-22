require("telescope").setup({
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      width = 0.81,
      height = 0.81,
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
      layout_config = {
        height = 0.41,
      },
    },
    git_files = {
      theme = "ivy",
      layout_config = {
        height = 0.41,
      },
    },
    live_grep = {
      theme = "ivy",
      layout_config = {
        height = 0.41,
      },
    },
    grep_string = {
      theme = "ivy",
      layout_config = {
        height = 0.41,
      },
    },
    buffers = {
      theme = "ivy",
      ignore_current_buffer = true,
      sort_lastused = true,
      layout_config = {
        height = 0.41,
      },
    },
  }
})
