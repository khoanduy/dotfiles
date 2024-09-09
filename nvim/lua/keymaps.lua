--------------
-- Mappings --
--------------

local nrs = { noremap = true, silent = true }
local nrns = { noremap = true, silent = true }
-- local funcs = require('utils.funcs')

-- Remap swith region keys
vim.keymap.set('n', '<c-h>', '<c-w>h', nrns)
vim.keymap.set('n', '<c-j>', '<c-w>j', nrns)
vim.keymap.set('n', '<c-k>', '<c-w>k', nrns)
vim.keymap.set('n', '<c-l>', '<c-w>l', nrns)

-- Remap swith region keys within terminal
vim.keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h', nrs)
vim.keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j', nrs)
vim.keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k', nrs)
vim.keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l', nrs)

-- Resize split windows using arrow keys
vim.keymap.set('n', '<up>', ':resize -2<cr>', nrs)
vim.keymap.set('n', '<down>', ':resize +2<cr>', nrs)
vim.keymap.set('n', '<left>', ':vertical resize +2<cr>', nrs)
vim.keymap.set('n', '<right>', ':vertical resize -2<cr>', nrs)

-- Search current marked text
vim.keymap.set('v', '//', 'y/\\V<c-r>=escape(@",\'/\\\')<cr><cr>', nrs)

-- Copy marked text/paste to/from global register
vim.keymap.set('v', '<leader>y', '"+y', nrs)
vim.keymap.set('n', '<leader>p', '"+p', nrs)
vim.keymap.set('v', '<leader>p', '"+p', nrs)

-- Grep current select text
vim.keymap.set('v', '<leader>/', 'y:grep <c-r>"<cr>', nrs)

------------------
-- End mappings --
------------------
