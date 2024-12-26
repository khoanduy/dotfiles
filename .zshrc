# Zsh configuration
# Initialize autocompletion
setopt auto_cd
autoload -Uz compinit; compinit

# Set up history
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt NO_BEEP
# Use emacs keybinding
bindkey -e

# Autocompletion (based on history)
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

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

# Source .profile
source $HOME/.profile

# Activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Aliases
alias a="tmux a"
alias v="nvim"
alias vo="nvim ."
alias vg="nvim -c ':G'"

alias gs="git status"
alias ga="git add ."
alias gA="git restore --staged"
alias gc="git commit -m"
alias gb="git branch --all"
alias gB="git branch --all | grep"
alias gC="git checkout"
alias gf="git fetch"
alias gp="git pull"
alias gP="git push"
alias gr="git reset --hard"
alias gR="git clean --force"

alias rs1="tmux new-session -d -s provisioning; tmux send-keys -t provisioning:0 start-provisioning-services.sh Enter"
alias ts1="tmux send-keys -t provisioning:0 stop-provisioning-services.sh Enter; tmux send-keys -t provisioning:0 'tmux kill-session' Enter"

alias rs2="tmux new-session -d -s monitoring; tmux send-keys -t monitoring:0 start-monitoring-services.sh Enter"
alias ts2="tmux send-keys -t monitoring:0 stop-monitoring-services.sh Enter; tmux send-keys -t monitoring:0 'tmux kill-session' Enter"
