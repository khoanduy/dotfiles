#!/bin/bash
# Install essential tools for my development environment

# Install essential packages
if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "Unsupported OS."
  exit
fi

echo "[-] Installing Xcode Command Line Tools [-]"
xcode-select --install

if ! hash brew &> /dev/null; then
  echo "[-] Installing Homebrew [-]"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "[-] Installing some essentials packages [-]"
brew update
brew install git neovim zsh tmux curl wget node cmake ripgrep fzf go lazygit coreutils fd ncdu exa pyenv

# Install font
echo "[-] Installing Source Code Pro Nerd Font [-]"
brew tap homebrew/cask-fonts
brew install --cask font-sauce-code-pro-nerd-font

# Ensure Rust installation
if ! hash rustc &> /dev/null; then
  echo "[-] Installing Rust [-]"
  sh -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y)"
  sh -c "$(source $HOME/.cargo/env)"
fi

# Backup dotfiles
function backup() {
  echo "[-] Backing up dotfiles [-]"
  local current_date=$(date +%s)
  local backup_dir=dotfiles_bak_$current_date

  mkdir ~/$backup_dir
  mv ~/.zshrc ~/$backup_dir/.zshrc
  mv ~/.tmux.conf ~/$backup_dir/.tmux.conf
}
backup

# Link dotfiles
echo "[-] Linking dotfiles [-]"
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s $(pwd)/nvim $XDG_CONFIG_HOME/nvim
ln -s $(pwd)/alacritty $XDG_CONFIG_HOME/alacritty

# Install default terminal emulator
echo "[-] Installing Alacritty [-]"
brew install alacritty

# Create some essential folders
echo "[-] Create essential folders [-]"
mkdir ~/open-source
mkdir ~/playground

# Change default shell
echo "[-] Change default shell to Zsh [-]"
chsh -s $(which zsh)

# Notify configuration finished
echo "[-] Setup done. Run \`source ~/.zshrc\` to refresh shell config [-]"
