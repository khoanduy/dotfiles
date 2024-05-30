# Should only contain user's environment variables

# Set XDG base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Default editor
export EDITOR="vim"
export VISUAL="vim"

# Zsh history
HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=10000

# Use 256 color term
export TERM=xterm-256color

# Fzf options
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--color=fg:#e4e4e4,bg:#161616,hl:#e98885
--color=fg+:#e4e4e4,bg+:#161616,hl+:#e98885,gutter:-1
--color=info:#e7cdfb,prompt:#e7cdfb,pointer:#ffb472
--color=marker:#a3c38b,spinner:#a3c38b,header:#e98885"

. "$HOME/.cargo/env"

export JDK11="$HOME/.sdkman/candidates/java/11.0.22-amzn"
export JDK17="$HOME/.sdkman/candidates/java/17.0.10-amzn"
export JDK21="$HOME/.sdkman/candidates/java/21.0.2-amzn"

export JAVA_HOME=$JDK11

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

