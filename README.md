# dotfiles
NOTED: These are my personal configuration files, which could be changed as I develop my environment on macOS.

## Showcase
![image](./screenshots/vim-screenshot.png)

## Installation
Clone repository to your local device and `cd` into it:
```shell script
$ git clone https://github.com/khoanduy/dotfiles.git
$ cd dotfiles
```
Then run the setup script (you have to run `chmod +x` in able to execute it):
```shell script
$ chmod +x configure-tilde
$ ./configure-tilde
```
This might take quite a while as it needs to download and install several tools.

After script execution finish, reload your `zsh` config file:
```shell script
$ source ~/.zshrc
```

## Additional options
Currently, I use `git submodule` to manage Vim plugins.

Adding a plugin:
```shell script
$ git submodule init
$ git submodule add <repo_url> vim/pack/plugins/start/<plugin_name>
$ git add .gitmodules vim/pack/plugins/start/<plugin_name>
```

Removing a plugin:
```shell script
$ git submodule deinit vim/pack/plugins/start/<plugin_name>
$ git rm vim/pack/plugins/start/<plugin_name>
$ rm -Rf .git/modules/vim/pack/plugins/start/<plugin_name>
```

Updating all plugins:
```shell script
$ git submodule update --remote --merge
```

## References
[tmux](https://github.com/tmux/tmux)\
[vim](https://www.vim.org/)
