# dotfiles
NOTED: These are my personal configuration files, which could be changed as I develop my environment across multiple systems.

## Installation
Make sure `neovim`, `alacritty` and `tmux` are installed. Clone repository and copy all files to your home folder then open `~/.config/nvim/plugins.vim` (ignore all the errors) and run `:PlugInstall`
```shell script
$ git clone https://github.com/khoarx/dotfiles.git
$ cp -R ~/dotfiles/* ~
$ cp -R ~/dotfiles/.* ~
$ nvim ~/.config/nvim/plugins.vim
:PlugInstall
```

## Additional options
If you want to use a tagging system, install `ctags` and remember to create a ctags database by running `ctags -R` at your project root in the terminal.
You might need to install these packages as well: [The Silver Searcher (ag)](https://github.com/ggreer/the_silver_searcher), [bat](https://github.com/sharkdp/bat)

## References
[Alacritty](https://github.com/alacritty/alacritty)\
[tmux](https://github.com/tmux/tmux)\
[Neovim](https://neovim.io/)\
[vim-plug](https://github.com/junegunn/vim-plug)\
[VimAwesome](https://vimawesome.com/)
