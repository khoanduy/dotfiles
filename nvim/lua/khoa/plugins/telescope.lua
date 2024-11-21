require("telescope").setup({
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      anchor = "CENTER",
      width = 0.9,
      height = 0.9,
      preview_cutoff = 0,
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    git_files = {
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy",
    },
    grep_string = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy",
      ignore_current_buffer = true,
      sort_lastused = true
    },
  }
})
