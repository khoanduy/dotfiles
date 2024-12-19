return {
  "stevearc/oil.nvim",
  ---@module "oil"
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  after = "folke/which-key.nvim",
  config = function()
    require("oil").setup({
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        -- Sort file names in a more intuitive order for humans. Is less performant,
        -- so you may want to set to false if you work with large directories.
        natural_order = false,
      },
    })

    -- Keymaps
    local wk = require("which-key")
    wk.add({ { "-", "<Cmd>Oil<CR>", desc = "Open File Browser" }, })
    vim.cmd([[
      autocmd FileType oil nnoremap <silent> <buffer> <C-h> <C-w>h
      autocmd FileType oil nnoremap <silent> <buffer> <C-j> <C-w>j
      autocmd FileType oil nnoremap <silent> <buffer> <C-k> <C-w>k
      autocmd FileType oil nnoremap <silent> <buffer> <C-l> <C-w>l
    ]])
  end
}
