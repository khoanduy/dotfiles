local nrs = { noremap = true, silent = true }
local nr = { noremap = true, silent = false }

-- Load utils functions
local java_utils = require("khoa.utils.java")

-- Remap swith region keys
vim.keymap.set("n", "<C-h>", "<C-w>h", nr)
vim.keymap.set("n", "<C-j>", "<C-w>j", nr)
vim.keymap.set("n", "<C-k>", "<C-w>k", nr)
vim.keymap.set("n", "<C-l>", "<C-w>l", nr)

-- Remap swith region keys within terminal
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", nrs)
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", nrs)
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", nrs)
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", nrs)

-- Resize split windows using arrow keys
vim.keymap.set("n", "<up>", ":resize -2<CR>", nrs)
vim.keymap.set("n", "<down>", ":resize +2<CR>", nrs)
vim.keymap.set("n", "<left>", ":vertical resize +2<CR>", nrs)
vim.keymap.set("n", "<right>", ":vertical resize -2<CR>", nrs)

-- Dismiss highlight and insert esc
vim.keymap.set("n", "H", ":noh<CR>", nrs)
vim.keymap.set("i", "jk", "<ESC>", nrs)

-- Navigate through quickfix list
vim.keymap.set("n", "]q", ":cnext<CR>zz", nrs)
vim.keymap.set("n", "[q", ":cprev<CR>zz", nrs)

-- Move selected visual block by J and K
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", nrs)
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", nrs)

-- Search current marked text
vim.keymap.set("v", "//", 'y/\\V<c-r>=escape(@",\'/\\\')<CR><CR>', nrs)

-- Copy marked text/paste to/from global register
vim.keymap.set("v", "<leader>y", '"+y', nrs)
vim.keymap.set("n", "<leader>Y", '"+Y', nrs)
vim.keymap.set("n", "<leader>p", '"+p', nrs)
vim.keymap.set("n", "<leader>P", '"+P', nrs)
vim.keymap.set("v", "<leader>p", '"+p', nrs)

-- Native fuzzy find
vim.keymap.set("n", "<leader>/", ":grep ''<left>", nr)
vim.keymap.set("v", "<leader>/", '"5y:grep! \'<C-r>5\'<CR><CR>', nrs)
vim.keymap.set("n", "<leader>G", ":set grepprg=<C-z>", nr)

-- Dir/file modification
vim.keymap.set("n", "<leader>cp", ":!cp %<C-z> %:h<C-z>", nr)
vim.keymap.set("n", "<leader>Cp", ":!cp -rp %:h<C-z> %:h<C-z>", nr)
vim.keymap.set("n", "<leader>mv", ":!mv %<C-z> %:h<C-z>", nr)

-- Search and replace
vim.keymap.set("n", "<leader>r", ":%s/<C-r><C-w>//g<left><left>", nr)
vim.keymap.set("v", "<leader>r", '"6y<ESC>:%s/<C-r>6//g<left><left>', nr)

-- Run Maven test
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function(args)
    vim.keymap.set("n", "gt", function() java_utils.run_maven_test() end, { buffer = args.buf })
  end
})
