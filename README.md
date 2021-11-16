# vimscript
NOTED: These are my personal configuration files, which could be changed as I develop my environment across multiple systems.

## Installation
Make sure `neovim` is installed. Clone repository to `~/.config/nvim` then open `plugins.vim` (ignore all the errors) and run `:PlugInstall`
```shell script
$ git clone https://github.com/khoadnse/vimrc.git ~/.config/nvim
$ nvim ~/.config/nvim/plugins.vim
:PlugInstall
```

## Additional options
If you want to use a tagging system, install `ctags` and remember to create a ctags database by running `ctags -R` at your project root in the terminal.
You might need to install these packages as well: [The Silver Searcher (ag)](https://github.com/ggreer/the_silver_searcher), [bat](https://github.com/sharkdp/bat)

## References
[Neovim](https://neovim.io/)\
[vim-plug](https://github.com/junegunn/vim-plug)\
[VimAwesome](https://vimawesome.com/)
