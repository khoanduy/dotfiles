" Enables the experimental Lua module loader
lua vim.loader.enable()

" Make sure to setup `mapleader` and `maplocalleader` before
let g:mapleader=' '

" Load custom options and plugins
source $XDG_CONFIG_HOME/nvim/vimscript/options.vim
source $XDG_CONFIG_HOME/nvim/vimscript/statusline.vim
source $XDG_CONFIG_HOME/nvim/vimscript/plugins.vim

" LSP config
lua require("lsp")

" Load my preferences
source $XDG_CONFIG_HOME/nvim/vimscript/keymaps.vim
source $XDG_CONFIG_HOME/nvim/vimscript/highlights.vim
