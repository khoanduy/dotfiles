return {
  "lewis6991/gitsigns.nvim",
  after = "folke/which-key.nvim",
  config = function()
    require('gitsigns').setup({ numhl = true })

    -- Keymaps
    local wk = require("which-key")
    wk.add({
      { "]h", "<Cmd>Gitsigns next_hunk<CR>", desc = "Next hunk" },
      { "[h", "<Cmd>Gitsigns prev_hunk<CR>", desc = "Prev hunk" },
      { "<leader>hp", "<Cmd>Gitsigns preview_hunk_inline<CR>", desc = "Prev hunk inline" },
      { "<leader>hs", "<Cmd>Gitsigns stage_hunk<CR>", desc = "Stage changes" },
      { "<leader>hS", "<Cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo stage changes" },
      { "<leader>hu", "<Cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
    })
  end
}
