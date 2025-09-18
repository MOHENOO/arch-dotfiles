#!/bin/bash
# Pacman Formulae
yes | sudo pacman -Sy base-devel
yes | sudo pacman -Sy curl
yes | sudo pacman -Sy wget
yes | sudo pacman -Sy unzip
yes | sudo pacman -Sy git
yes | sudo pacman -Sy fd
yes | sudo pacman -Sy ripgrep

yes | sudo pacman -Sy stow

yes | sudo pacman -Sy fish
yes | sudo pacman -Sy starship
yes | sudo pacman -Sy fzf

# editor
yes | sudo pacman -Sy neovim
yes | sudo pacman -Sy tree-sitter
yes | sudo pacman -Sy tree-sitter-cli
yes | sudo pacman -Sy python-pip
yes | sudo pacman -Sy nodejs
yes | sudo pacman -Sy npm

# modern tool
yes | sudo pacman -Sy eza
yes | sudo pacman -Sy bat
yes | sudo pacman -Sy git-delta
yes | sudo pacman -Sy zoxide
yes | sudo pacman -Sy btop
yes | sudo pacman -Sy dust
yes | sudo pacman -Sy zellij

# work
yes | sudo pacman -Sy zssh
yes | sudo pacman -Sy k9s
yes | sudo pacman -Sy kubectl
yes | sudo pacman -Sy stern
yes | sudo pacman -Sy jq

# Git Clone Repo
# Copying and checking out configuration files
echo "Planting Configuration Files..."
mkdir -p "$HOME"/Github
[ ! -d "$HOME/Github/dotfiles" ] && git clone --depth=1 https://github.com/mohenoo/arch-dotfiles.git "$HOME"/Github/dotfiles

# just cp
mkdir -p "$HOME"/.ssh
[ ! -d "$HOME/.ssh/config" ] && cp "$HOME"/Github/dotfiles/.ssh/config "$HOME"/.ssh/config

[ ! -d "$HOME/.gitconfig" ] && cp "$HOME"/Github/dotfiles/.gitconfig "$HOME"/.gitconfig

# lazyvim
[ ! -d "$HOME/.config/nvim" ] && git clone https://github.com/LazyVim/starter ~/.config/nvim

# stow
mkdir -p "$HOME"/.kube
mkdir -p "$HOME"/.config
stow -v --target "$HOME" .
