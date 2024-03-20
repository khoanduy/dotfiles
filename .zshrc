# Initialize autocompletion
autoload -U compinit; compinit

# Set up history
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt NO_BEEP

# Autocompletion using arrow keys (based on history)
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Enable git prompt
source ~/.zsh/plugins/git/git-prompt.sh

# Git prompt options
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM='verbose'
GIT_PS1_HIDE_IF_PWD_IGNORED=true
GIT_PS1_COMPRESSSPARSESTATE=true

# Enable command-subsitution in PS1
setopt PROMPT_SUBST
NL=$'\n'
PS1='$NL%B%F{cyan}%0~%f%b% %F{magenta}$(__git_ps1 "  %s")%f$NL%B%(?.%F{green}.%F{red})%(!.#.$)%f%b '

# Use 256 color term
export TERM=xterm-256color

# fzf export
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--color=fg:#cdd6f4,hl:#f38ba8
--color=fg+:#cdd6f4,bg+:#1e1e2e,hl+:#f38ba8,gutter:-1
--color=info:#cba6f7,prompt:#cba6f7,pointer:#f5e0dc
--color=marker:#f5e0dc,spinner:#f5e0dc,header:#f38ba8"

# source .profile
source $HOME/.profile

# Cargo
. "$HOME/.cargo/env"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Set XDG_DATA_HOME
export XDG_DATA_HOME="$HOME/.local/share/"

# Alias
alias v=vim
alias vo="vim ."
alias lg=lazygit
