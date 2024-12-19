-- General settings
vim.loader.enable()

-- Load custom options
vim.cmd("source $XDG_CONFIG_HOME/nvim/vimscript/options.vim")

-- Load plugins and extended features
require("khoa.lazy")
require("khoa.lsp")

-- Load my preferences
vim.cmd("source $XDG_CONFIG_HOME/nvim/vimscript/keymaps.vim")
vim.cmd("source $XDG_CONFIG_HOME/nvim/vimscript/highlights.vim")
