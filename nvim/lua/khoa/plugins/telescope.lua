return {
  "nvim-telescope/telescope.nvim", tag = "0.1.8",
  -- or                          , branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>F", builtin.git_files, { desc = "Telescope git files" })
    vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>t", builtin.help_tags, { desc = "Telescope help tags" })
  end
}
