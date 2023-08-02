############## History ###################
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

############## Aliases ###################
alias l='ls -lra --color=auto'
alias v='nvim'
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias lll='ls --color=auto -lh | less'
############## completion #################
autoload -Uz compinit
compinit

#### Zellij ####
ZELLIJ_AUTO_ATTACH=true
ZELLIJ_RUNNER_ROOT_DIR=personal
ZELLIJ_RUNNER_MAX_DIRS_DEPTH=2

export ZELLIJ_AUTO_ATTACH ZELLIJ_RUNNER_ROOT_DIR ZELLIJ_RUNNER_MAX_DIRS_DEPTH
# kubectl
source <(kubectl completion zsh)
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
if [[ -z "$ZELLIJ" ]]; then
    zellij-runner
    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi
