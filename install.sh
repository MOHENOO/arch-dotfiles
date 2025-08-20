#!/bin/bash
# Pacman Formulae
yes | sudo pacman -Sy stow
yes | sudo pacman -Sy neovim
yes | sudo pacman -Sy zsh
yes | sudo pacman -Sy curl
yes | sudo pacman -Sy wget
yes | sudo pacman -Sy eza
yes | sudo pacman -Sy bat
yes | sudo pacman -Sy unzip
yes | sudo pacman -Sy zoxide
yes | sudo pacman -Sy tmux
yes | sudo pacman -Sy python-pip
yes | sudo pacman -Sy nodejs
yes | sudo pacman -Sy starship
yes | sudo pacman -Sy git
yes | sudo pacman -Sy fd
yes | sudo pacman -Sy ripgrep
yes | sudo pacman -Sy zssh
yes | sudo pacman -Sy k9s
yes | sudo pacman -Sy jq
yes | sudo pacman -Sy fzf
yes | sudo pacman -Sy npm
yes | sudo pacman -Sy dust
yes | sudo pacman -Sy stern
yes | sudo pacman -Sy btop
yes | sudo pacman -Sy git-delta
yes | sudo pacman -Sy kubectl

# Git Clone Repo
## Tpm
mkdir -p ~/.config/tmux/plugins
[ ! -d "$HOME/.config/tmux/plugins/tpm" ] && git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Copying and checking out configuration files
echo "Planting Configuration Files..."
mkdir -p "$HOME"/Github
[ ! -d "$HOME/Github/dotfiles" ] && git clone --depth=1 https://github.com/mohenoo/arch-dotfiles.git "$HOME"/Github/dotfiles
mkdir -p "$HOME"/.ssh
[ ! -d "$HOME/.ssh/config" ] && cp "$HOME"/Github/dotfiles/.ssh/config "$HOME"/.ssh/config
mkdir -p "$HOME"/.kube
[ ! -d "$HOME/.kube/switch-config.yaml" ] && cp "$HOME"/Github/dotfiles/.kube/switch-config.yaml "$HOME"/.kube/
[ ! -d "$HOME/.gitconfig" ] && cp "$HOME"/Github/dotfiles/.gitconfig "$HOME"/.gitconfig
mkdir -p "$HOME"/.config
stow -v --target "$HOME" .
