return {
  { "tpope/vim-fugitive" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  },
  { "mbbill/undotree" },
  {
    "github/copilot.vim",
    config = function()
      vim.cmd([[
        let g:copilot_enabled = 0
        let g:copilot_no_tab_map = v:true
        inoremap <silent><script><expr> <C-e> copilot#Accept('\<CR>')
      ]])
    end
  },
}
