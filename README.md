# dotfiles
NOTED: These are my personal configuration files, which could be changed as I develop my environment across multiple systems.

## Installation
Clone repository to your local device and `cd` into it:
```shell script
$ git clone https://github.com/khoarx/dotfiles.git
$ cd dotfiles
```
Then run the setup script (you have to run `chmod +x` in able to execute it):
```shell script
$ chmod +x setup_tilde.sh
$ ./setup_tilde.sh
```
This might take quite a while as it needs to download and install several tools.

After script execution finish, reload your zsh config file:
```shell script
$ source ~/.zshrc
```
Open `neovim` plugin config file:
```shell script
$ nvim ~/.config/nvim/lua/plugin.lua
```
Ignore all errors and install all plugins:
```vim
:source %
:PackerClean
:PackerInstall
:PackerCompile
```

## Additional options
You might want to install these packages if they are not there yet:
1. [Alacritty](https://github.com/alacritty/alacritty)
2. [Lazygit](https://github.com/jesseduffield/lazygit)

## References
[tmux](https://github.com/tmux/tmux)\
[neovim](https://neovim.io/)
