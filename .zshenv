# Should only contain user's environment variables

# Set XDG base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Set language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Default editor
export EDITOR="vim"
export VISUAL="vim"

# Zsh history
HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=10000

# Scripts directory
export CHORES="$HOME/chores"

# Use 256 color term
export TERM=xterm-256color
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#bcbcbc'

# Fzf options
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#434343,bg:-1,hl:#325cc0,gutter:-1
 --color=fg+:#434343,bg+:-1,hl+:#007acc,gutter:-1
 --color=info:#448c27,prompt:#7a3e9d,pointer:#aa3731
 --color=marker:#cb9000,spinner:#e64ce6,header:#f05050'

# Cargo env
. "$HOME/.cargo/env"

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

# JDK paths
export JDK11="$HOME/.sdkman/candidates/java/11.0.24-amzn"
export JDK17="$HOME/.sdkman/candidates/java/17.0.12-amzn"
export JDK21="$HOME/.sdkman/candidates/java/21.0.4-amzn"

export JAVA_HOME=$JDK11

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

