#!/bin/bash
# Install essential tools for my development environment

# Install essential packages
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install

  if ! hash brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  echo "Installing some essentials..."
  brew update
  brew install git neovim zsh tmux curl wget the_silver_searcher node
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Installing some essentials..."
  sudo apt-get update
  sudo apt-get install -y git vim zsh tmux curl wget silversearcher-ag build-essential

  if ! hash node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
  fi
else
  echo "Unsupported OS."
  exit
fi

if [[ ! -d ~/.oh-my-zsh ]]; then
  echo "Installing Oh My Zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# $HOME become repo's root
if [[ $PWD != $HOME ]]; then
  echo "Make your home directory a repository..."
  cp -R ./* ~
  cp -R ./.* ~
fi

echo "Setup completed."
