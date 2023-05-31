#!/bin/bash
# Install essential tools for my development environment

# Install essential packages
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "[-] Installing Xcode Command Line Tools [-]"
  xcode-select --install

  if ! hash brew &> /dev/null; then
    echo "[-] Installing Homebrew [-]"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  echo "[-] Installing some essentials packages [-]"
  brew update
  brew install git neovim zsh tmux curl wget node cmake ripgrep fzf go lazygit coreutils fd ncdu exa

  echo "[-] Installing Source Code Pro Nerd Font [-]"
  brew tap homebrew/cask-fonts
  brew install --cask font-sauce-code-pro-nerd-font

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "[-] Installing some essentials packages [-]"
  sudo apt-get update
  sudo apt-get install -y git vim zsh tmux curl wget cmake python3 python3-pip ripgrep build-essential libssl-dev fd-find ncdu exa ninja-build gettext unzip

  sudo add-apt-repository ppa:longsleep/golang-backports
  sudo apt update
  sudo apt install -y golang-go

  go install github.com/jesseduffield/lazygit@latest

  echo "[-] Installing Source Code Pro Nerd Font [-]"
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/SourceCodePro.zip
  unzip SourceCodePro.zip -d ~/.fonts
  fc-cache -fv
  rm -rf SourceCodePro.zip

  if ! hash node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
  fi
else
  echo "Unsupported OS."
  exit
fi

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

mkdir ~/open-source
echo "[-] Installing Alacritty [-]"
git clone https://github.com/alacritty/alacritty.git ~/open-source/alacritty

rustup override set stable
rustup update stable

if [[ "$OSTYPE" == "darwin"* ]]; then
  rustup target add x86_64-apple-darwin aarch64-apple-darwin
  make -C ~/open-source/alacritty/ app-universal
  cp -r ~/open-source/alacritty/target/release/osx/Alacritty.app /Applications/
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt-get install -y pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev
  cargo build --release --manifest-path ~/open-source/alacritty/Cargo.toml
  sudo tic -xe alacritty,alacritty-direct ~/open-source/alacritty/extra/alacritty.info

  sudo cp ~/open-source/alacritty/target/release/alacritty /usr/local/bin
  sudo cp ~/open-source/alacritty/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
  sudo desktop-file-install ~/open-source/alacritty/extra/linux/Alacritty.desktop
  sudo update-desktop-database

  echo "[-] Installing Neovim [-]"
  git clone https://github.com/neovim/neovim.git ~/open-source/neovim
  cd ~/open-source/neovim
  make CMAKE_BUILD_TYPE=Release
  sudo make install
  cd ~
fi

chsh -s $(which zsh)
echo "[-] Setup done. Run \`source ~/.zshrc\` to refresh shell config [-]"
