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
alias fd='fdfind'
############## completion #################
autoload -Uz compinit
compinit

#### Zellij ####
ZELLIJ_AUTO_ATTACH=false
export ZELLIJ_AUTO_ATTACH

# Custom zellij session switcher
bindkey -s ^f "zellij-switcher\n"
bindkey -s '^[j' "zellij-switcher ~/personal/dotfiles\n"
bindkey -s '^[k' "zellij-switcher ~/personal/zellij\n"

# kubectl
source <(kubectl completion zsh)
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
