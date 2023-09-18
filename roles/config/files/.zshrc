############## History ###################
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

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

bindkey -s ^f "tmux-switcher\n"
bindkey -s '^[u' "tmux-switcher ~/personal/dotfiles\n"
bindkey -s '^[i' "tmux-switcher ~/personal/kongroo.io\n"
bindkey -s '^[o' "tmux-switcher ~/personal/zellij\n"

# kubectl
source <(kubectl completion zsh)
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
