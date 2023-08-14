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
alias zs='zellij-switcher'
############## completion #################
autoload -Uz compinit
compinit

#### Zellij ####
ZELLIJ_AUTO_ATTACH=false
export ZELLIJ_AUTO_ATTACH

# Custom zellij session switcher
bindkey -s ^f "zs\n"
bindkey -s '^[u' "zs ~/personal/dotfiles\n"
bindkey -s '^[i' "zs ~/personal/zellij-sessionizer\n"
bindkey -s '^[o' "zs ~/personal/zellij\n"

# kubectl
source <(kubectl completion zsh)
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
