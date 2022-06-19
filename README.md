# dotfiles
NOTED: These are my personal configuration files, which could be changed as I develop my environment across multiple systems.

## Installation
Make sure `neovim`, `tmux` and `alacritty` are installed. Clone repository and copy all files to your home folder
```shell script
$ git clone https://github.com/knasync/dotfiles.git
$ cp -R ~/dotfiles/* ~
$ cp -R ~/dotfiles/.* ~
```
Open `~/.config/nvim/plugin.lua` and execute `:PackerInstall` to install all neovim's plugins:
```shell script
$ vim ~/.config/nvim/plugin.lua
:PackerInstall
:PackerSync
```

## Additional options
If you want to use a tagging system, install `ctags` and remember to create a ctags database by running `ctags -R` at your project root in the terminal.
You might need to install these packages as well: [The Silver Searcher (ag)](https://github.com/ggreer/the_silver_searcher).

## References
[tmux](https://github.com/tmux/tmux)\
[vim](https://www.vim.org/)\
[neovim](https://neovim.io/)
