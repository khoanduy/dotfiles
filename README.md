# dotfiles
NOTED: These are my personal configuration files, which could be changed as I develop my environment across multiple systems.

## Installation
Clone repository and run the setup script (you have to run `chmod +x` in able to execute it)
```shell script
$ git clone https://github.com/knasync/dotfiles.git
$ cd dotfiles
$ chmod +x setup_tilde.sh
$ ./setup_tilde.sh
$ source ~/.zshrc
```
Open `~/.config/nvim/lua/plugin.lua`, ignore all errors and install all neovim's plugins:
```shell script
$ nvim ~/.config/nvim/lua/plugin.lua
:source %
:PackerClean
:PackerInstall
:PackerCompile
```

## Additional options
You might want to install these packages as well:
1. [Alacritty](https://github.com/alacritty/alacritty)
2. [Lazygit](https://github.com/jesseduffield/lazygit)

## References
[tmux](https://github.com/tmux/tmux)\
[neovim](https://neovim.io/)
