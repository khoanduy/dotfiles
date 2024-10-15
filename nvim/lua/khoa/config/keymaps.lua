local nrs = { noremap = true, silent = true }
local nrns = { noremap = true, silent = false }

-- local funcs = require("utils.funcs")
-- Remap swith region keys
vim.keymap.set("n", "<C-h>", "<C-w>h", nrns)
vim.keymap.set("n", "<C-j>", "<C-w>j", nrns)
vim.keymap.set("n", "<C-k>", "<C-w>k", nrns)
vim.keymap.set("n", "<C-l>", "<C-w>l", nrns)

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

-- Grep current select text
vim.keymap.set("v", "<leader>/", 'y:grep <c-r>"<CR>', nrs)
