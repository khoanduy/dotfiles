# vimscript
NOTED: These are my personal configuration files, which could be changed as I develop my environment across multiple systems.

## Installation
Make sure `neovim` is installed. Clone repository to `~/.config/nvim` then open `plugins.vim` (ignore all the errors) and run `:PlugInstall`
```shell script
$ git clone https://github.com/knguyenc/vimrc.git ~/.config/nvim
$ nvim ~/.config/nvim/plugins.vim
:PlugInstall
```

You might want to use some `neovim` plugins, in order to use them you need to install `pynvim` using `pip`.
Firstly, make sure `pip` is installed:
```shell script
$ python -m pip --version
```
If you see something like `pip X.Y.Z from .../pip (python A.B)` then skip this step, otherwise you have to install `pip` manually.
To install `pip`, securely download [get-pip.py](https://bootstrap.pypa.io/get-pip.py) or alternatively, use `curl`.
Then run the script by `python` command:
```shell script
$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
$ python get-pip.py
```
After successfully installed `pip`, use it to install `pynvim` and you're good to go:
```shell script
$ pip install pynvim
```

## Language-specific settings
Python essential packages:
```shell script
$ pip install jedi
$ pip install yapf
```

## Additional options
If you want to use a tagging system, install `ctags` and remember to create a ctags database by running `ctags -R` at your project root in the terminal.

## References
[Neovim](https://neovim.io/)\
[vim-plug](https://github.com/junegunn/vim-plug)\
[VimAwesome](https://vimawesome.com/)
