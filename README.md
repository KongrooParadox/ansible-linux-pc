# Linux Workstation

My config and tools for linux

Designed and tested for Debian Bookworm

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

## Install

For initial installation run `make init`

> :info: This will install system requirements and `ansible`

## Run

To play all stages run `make all`

You can run only a specifig tag by running `make ${TAG_NAME}`

Available tags :

* `packages` : Install or upgrade software and tools
* `config` : Only user specific configuration steps and dotfiles update
* `system` : System specific configuration (user creation, sudoers changes, etc.)

# Post setup manual step

To install [displaylink drivers for debian](https://github.com/AdnanHodzic/displaylink-debian) run :

```shell
./displaylink.sh
```

> Thanks to [Adnan Hodzic](https://github.com/AdnanHodzic) for the driver ;)

# TODO

- [x] Mate Settings
  - [x] Import keyboard shortcuts
  - [x] Import keyboard layout
  - [x] Import terminal settings
- [ ] firefox
- [ ] nvim
  - [x] Base setup
  - [x] Migrate to lazy
  - [ ] remaps (git fugitive, zellij-runner, etc)
  - [x] Find appropriate theme
- [ ] kvm (to test)
- [x] k8s tools
- [ ] packer
- [ ] vault
- [x] podman
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
  - [x] ssh keygen
  - [x] gitconfig
  - [x] nvim
  - [x] starship
