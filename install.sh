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
yes | sudo pacman -Sy rust
yes | sudo pacman -Sy nodejs
yes | sudo pacman -Sy starship
yes | sudo pacman -Sy git
yes | sudo pacman -Sy fd
yes | sudo pacman -Sy the_silver_searcher
yes | sudo pacman -Sy ripgrep
yes | sudo pacman -Sy zssh
yes | sudo pacman -Sy k9s
yes | sudo pacman -Sy jq
yes | sudo pacman -Sy fzf
yes | sudo pacman -Sy npm
yes | sudo pacman -Sy dust
yes | sudo pacman -Sy stern
yes | sudo pacman -Sy go
yes | sudo pacman -Sy btop
yes | sudo pacman -Sy git-delta
yes | sudo pacman -Sy kubectl
yes | sudo pacman -Sy yazi

# Git Clone Repo
## Tpm
mkdir -p ~/.config/tmux/plugins
[ ! -d "$HOME/.config/tmux/plugins/tpm" ] && git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Copying and checking out configuration files
echo "Planting Configuration Files..."
mkdir -p $HOME/Github
[ ! -d "$HOME/Github/dotfiles" ] && git clone --depth=1 https://github.com/mohenoo/dotfiles.git $HOME/Github/dotfiles
mkdir -p $HOME/.config
mkdir -p $HOME/.ssh
[ ! -d "$HOME/.ssh/config" ] && cp $HOME/Github/dotfiles/.ssh/config $HOME/.ssh/config
[ ! -d "$HOME/.gitconfig" ] && cp $HOME/Github/dotfiles/.gitconfig $HOME/.gitconfig
stow -v --target $HOME .
# bat install Catppuccin theme
mkdir -p "$(bat --config-dir)/themes"
git clone https://github.com/catppuccin/bat.git
cp bat/*.tmTheme "$(bat --config-dir)/themes"
bat cache --build

# delta install Catppuccin theme
# wait issue https://github.com/catppuccin/catppuccin/issues/2246
git clone https://github.com/Anomalocaridid/delta ~/.config/delta

# btop install Catppuccin theme
mkdir -p ~/.config/btop/themes
git clone https://github.com/catppuccin/btop.git
cp btop/themes/* ~/.config/btop/themes/

# run source manually
# source $HOME/.zshrc
