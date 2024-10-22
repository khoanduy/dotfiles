require('oil').setup({
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
    -- Sort file names in a more intuitive order for humans. Is less performant,
    -- so you may want to set to false if you work with large directories.
    natural_order = false,
  },
})
