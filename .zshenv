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
--color=fg:#444444,bg:#eeeeee,hl:#d70000
--color=fg+:#444444,bg+:#eeeeee,hl+:#d70000,gutter:-1
--color=info:#005f87,prompt:#005f87,pointer:#d70087
--color=marker:#d75f00,spinner:#d75f00,header:#d70000"

. "$HOME/.cargo/env"

export JDK11="$HOME/.sdkman/candidates/java/11.0.22-amzn"
export JDK17="$HOME/.sdkman/candidates/java/17.0.10-amzn"
export JDK21="$HOME/.sdkman/candidates/java/21.0.2-amzn"

export JAVA_HOME=$JDK11

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

