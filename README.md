# dotfiles
These are my personal configuration files, which could be changed as I develop my environment on macOS.


## Showcase
![image](./screenshots/vim-screenshot.png)


## Installation
Clone repository to your local device and `cd` into it:
```shell
$ git clone https://github.com/khoanvi/dotfiles.git
$ cd dotfiles
```

Then run the setup script:
```shell
$ source bootstrap
```

This might take quite a while as it needs to download and install several tools.

After script execution finish, reload your `zsh` config file:
```shell
$ source ~/.zshrc
```

Finally, launch Vim (ignore all errors) and install all plugins using `:PlugInstall`.


## Additional Notes
If you are using `ctags`, it's very useful if you put the `tags` in `.gitignore_global` and specify the file in global `.gitconfig`
```
[core]
  excludesfile = $HOME/.gitignore_global
```
So you don't have to duel with git commit anymore


## References
[tmux](https://github.com/tmux/tmux)\
[vim](https://www.vim.org)
