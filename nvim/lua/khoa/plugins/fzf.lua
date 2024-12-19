return {
  "junegunn/fzf.vim",
  dependencies = { "junegunn/fzf", build = "./install --bin" },
  after = "folke/which-key.nvim",
  config = function()
    -- Options
    vim.cmd([[
      let g:fzf_vim = {}
      let g:fzf_vim.preview_window = ["right:35%"]
      let g:fzf_layout = { "down": "41%" }
    ]])

    -- Keymaps
    local wk = require("which-key")
    wk.add({
      { "<leader>f", "<Cmd>Files<CR>", desc = "Find Files" },
      { "<leader>F", "<Cmd>GFiles<CR>", desc = "Find Git Files" },
      { "<leader>b", "<Cmd>Buffers<CR>", desc = "Select Buffers" },
      { "<leader>j", "<Cmd>Jumps<CR>", desc = "Jumplist" },
      { "<leader>m", "<Cmd>Marks<CR>", desc = "Marklist" },
      { "<leader>g", "<Cmd>Rg<CR>", desc = "Live Grep" },
      { "<leader>f", '"0y:Files <C-r>0<CR>', desc = "Find Files match selected text", mode = "v" },
      { "<leader>g", '"0y:Rg <C-r>0<CR>', desc = "Grep selected text", mode = "v" },
    })

    -- Highlight groups
    vim.api.nvim_set_hl(0, "fzf1", { fg = "grey", bg = "NONE" })
    vim.api.nvim_set_hl(0, "fzf2", { fg = "grey", bg = "NONE" })
    vim.api.nvim_set_hl(0, "fzf3", { fg = "grey", bg = "NONE" })
  end
}
