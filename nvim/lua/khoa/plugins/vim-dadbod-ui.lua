return {
  "kristijanhusak/vim-dadbod-ui",
  opts = {},
  after = "folke/which-key.nvim",
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion"
  },
  config = function()
    local wk = require("which-key")
    wk.add({ { "<leader>db", "<Cmd>DBUIToggle<CR>", desc = "Open DB Browser" }, })
  end
}
