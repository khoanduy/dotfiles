# dotfiles
NOTED: These are my personal configuration files, which could be changed as I develop my environment across multiple systems.

## Installation
Make sure `emacs`, `neovim` and `tmux` are installed. Clone repository and copy all files to your home folder
```shell script
$ git clone https://github.com/khoarx/dotfiles.git
$ cp -R ~/dotfiles/* ~
$ cp -R ~/dotfiles/.* ~
```
Open `~/.config/nvim/plugin.conf.nvim` and execute `:PlugInstall` to install all VIM's plugins:
```shell script
$ vim ~/.config/nvim/plugin.conf.nvim
:PlugInstall
```

## Additional options
If you want to use a tagging system, install `ctags` and remember to create a ctags database by running `ctags -R` at your project root in the terminal.
You might need to install these packages as well: [The Silver Searcher (ag)](https://github.com/ggreer/the_silver_searcher).

## References
[tmux](https://github.com/tmux/tmux)\
[emacs](https://www.gnu.org/software/emacs/)\
[vim](https://www.vim.org/)
