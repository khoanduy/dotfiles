return {
  "nvim-telescope/telescope.nvim", tag = "0.1.8",
  -- or                          , branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require('telescope').setup({
      defaults = {
        layout_strategy = 'vertical',
        layout_config = {
          anchor = 'CENTER',
          width = 0.9,
          height = 0.9,
          preview_cutoff = 0,
        },
      },
      pickers = {
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true
        },
      }
    })

    vim.cmd.highlight('TelescopeNormal ctermbg=none guibg=none')
    vim.cmd.highlight('TelescopePromptBorder ctermbg=none guibg=none')
    vim.cmd.highlight('TelescopePromptTitle ctermbg=none guibg=none')
    vim.cmd.highlight('TelescopeBorder ctermbg=none guibg=none')
    vim.cmd.highlight('TelescopeTitle ctermbg=none guibg=none')

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("v", "<leader>f", function()
        vim.cmd('normal! "1y')
        local pattern = vim.fn.getreg('1')
        builtin.find_files({ search_file = pattern })
      end, { desc = "Telescope find files including ignored and hidden files" })
    vim.keymap.set("n", "<leader>F", builtin.git_files, { desc = "Telescope git files" })
    vim.keymap.set("n", "<leader>s", function() builtin.find_files({ no_ignore = true, hidden = true }) end,
      { desc = "Telescope find files including ignored and hidden files" })
    vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("v", "<leader>g", function()
        vim.cmd('normal! "0y')
        local pattern = vim.fn.getreg('5')
        builtin.grep_string({ search = pattern })
      end, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>t", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>o", builtin.resume, { desc = "Resume previous picker" })
  end
}
