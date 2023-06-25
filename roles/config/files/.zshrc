########## Kaisen settings, don't remove please ##########

##Enforce the completion for systemd units files
_systemctl_unit_state() {
  typeset -gA _sys_unit_state
  _sys_unit_state=( $(__systemctl list-unit-files "$PREFIX*" | awk '{print $1, $2}') ) }

#Add the $HOME/.krew folder in the PATH
PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#Use apt full-upgrade instead of apt upgrade (user mode)
sudo() { if [[ $@ == "apt upgrade" ]]; then command sudo apt full-upgrade; else command sudo "$@"; fi; }

#Use apt full-upgrade instead of apt upgrade (root mode)
apt() { if [[ $@ == "upgrade" ]]; then command apt full-upgrade; else command apt "$@"; fi; }

########## Kaisen settings, end ##########

############## Aliases ###################
alias l='ls -lra --color=auto'
alias v='nvim'
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias lll='ls --color=auto -lh | less'
