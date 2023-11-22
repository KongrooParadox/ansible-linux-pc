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
autoload -U +X bashcompinit && bashcompinit

bindkey -s ^f "tmux-switcher\n"
bindkey -s '^[y' "tmux-switcher ~/personal/homelab\n"
bindkey -s '^[u' "tmux-switcher ~/personal/dotfiles\n"
bindkey -s '^[i' "tmux-switcher ~/personal/kongroo.io\n"
bindkey -s '^[o' "tmux-switcher ~/personal/zellij\n"

# kubectl
source <(kubectl completion zsh)
complete -F __start_kubectl k
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

complete -o nospace -C /usr/bin/terraform terraform
