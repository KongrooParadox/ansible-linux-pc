# Linux Workstation

My config and tools for linux.

Tested only with Debian based [Kaisen Linux](https://kaisenlinux.org/)

# Requirements

Install `make` and `direnv` and hook into bash :
```shell
sudo apt install -y make direnv 
grep -q 'eval "$(direnv hook bash)"' ~/.bashrc || echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
source ~/.bashrc
```

Setup ansible workdir of your choice, and setup virtualenv for ansible projects :
```shell
mkdir -p ~/personal
cd !$
echo "#
# .envrc
#
layout python3" > .envrc
direnv allow .
```

# Usage

For initial installation run `sudo make init`

> :info: This will install system requirements and `ansible`

# TODO

- [ ] Mate Settings
  - [x] Import keyboard shortcuts
  - [x] Import keyboard layout
  - [x] Import terminal settings
- [ ] firefox
- [ ] nvim
  - [x] Base setup
  - [x] Migrate to lazy
  - [ ] remaps (git fugitive, zellij-runner, etc)
  - [ ] Find appropriate theme
- [ ] kvm (to test)
- [x] k8s tools
- [ ] packer
- [ ] vault
- [ ] docker
- [ ] terraform
- [x] zellij
- [x] spotify
- [ ] vagrant
- [ ] asdf
- [x] starship
- [ ] dns setup
- [ ] nodejs
- [ ] Hugo
- [ ] cloud CLI
  - [ ] aws
  - [ ] gcp
  - [ ] scaleway
- [x] dotfiles
  - [ ] ssh keygen (broken)
  - [x] gitconfig
  - [x] nvim
  - [x] starship
