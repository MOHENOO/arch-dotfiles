autoload -U +X compinit && compinit
setopt COMBINING_CHARS
export TERM="xterm-256color"

# antidote
## You can change the names/locations of these if you prefer.
antidote_dir=$HOME/.antidote
plugins_txt=$HOME/.zsh_plugins.txt
static_file=$HOME/.zsh_plugins.zsh

## Clone antidote if necessary and generate a static plugin file.
[[ ! -e $antidote_dir ]] && git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir
source $antidote_dir/antidote.zsh
if [[ ! $static_file -nt $plugins_txt ]]; then
  [[ -e $plugins_txt ]] || touch $plugins_txt
  antidote bundle <$plugins_txt >$static_file
fi

## Uncomment this if you want antidote commands like `antidote update` available
## in your interactive shell session:
autoload -Uz $antidote_dir/functions/antidote

## source the static plugins file
source $static_file

## cleanup
unset antidote_dir plugins_txt static_file

####################################### alias ############################################
alias gst='git status'
alias tmux="tmux -u"
alias l="eza -al --icons --git"
alias ll="eza -alig --icons --git"
alias lt="eza --tree --level=2 --long --icons --git"
alias ls="eza --icons"
alias vim=nvim
alias cat="bat -p -P"
alias ssh="TERM=xterm-256color zssh"
alias k="kubectl"

####################################### bindkey ##############################################

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
#bindkey -M emacs '^P' history-substring-search-up
#bindkey -M emacs '^N' history-substring-search-down

####################################### export ###############################################
# set language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

## golang
export GOPATH=$HOME/Development/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

## ssh
export ZSSHESCAPE='^G'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi
export XDG_CONFIG_HOME=$HOME/.config
export PATH=${HOME}/.local/bin:$PATH

# abbr
export ABBR_GET_AVAILABLE_ABBREVIATION=1
export ABBR_LOG_AVAILABLE_ABBREVIATION=1
export ABBR_EXPAND_PUSH_ABBREVIATION_TO_HISTORY=1
export ABBR_EXPAND_AND_ACCEPT_PUSH_ABBREVIATED_LINE_TO_HISTORY=1

############################################# autotheme #######################################
function set_dark_theme(){
    export FZF_DEFAULT_OPTS="--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"
    export BAT_THEME="Catppuccin Frappe"
    tmux set -g @catppuccin_flavour 'frappe'
    tmux source-file ~/.config/tmux/tmux.conf >/dev/null
    sed -i '' 's/palette = \"catppuccin_latte\"/palette = \"catppuccin_frappe\"/g' ~/Github/dotfiles/.config/starship.toml > /dev/null
    sed -i '' 's/color_theme = \"catppuccin_latte\"/color_theme = \"catppuccin_frappe\"/g' ~/Github/dotfiles/.config/btop/btop.conf > /dev/null
    sed -i '' 's/skin: catppuccin-latte/skin: catppuccin-frappe/g' ~/Github/dotfiles/.config/k9s/config.yaml > /dev/null
}

function set_light_theme(){
    export FZF_DEFAULT_OPTS="--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 --color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"
    export BAT_THEME="Catppuccin Latte"

    tmux set -g @catppuccin_flavour 'latte'
    tmux source-file ~/.config/tmux/tmux.conf >/dev/null
    sed -i '' 's/palette = \"catppuccin_frappe\"/palette = \"catppuccin_latte\"/g' ~/Github/dotfiles/.config/starship.toml > /dev/null
    sed -i '' 's/color_theme = \"catppuccin_frappe\"/color_theme = \"catppuccin_latte\"/g' ~/Github/dotfiles/.config/btop/btop.conf > /dev/null
    sed -i '' 's/skin: catppuccin-frappe/skin: catppuccin-latte/g' ~/Github/dotfiles/.config/k9s/config.yaml > /dev/null
}

############################################## other ##################################################
# fzf
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"

# forgit
## disable forgit alias
# export FORGIT_NO_ALIASES="yes"
# export PATH="$PATH:$FORGIT_INSTALL_DIR/bin"

# proxy
function proxy () {
  export http_proxy=socks5://127.0.0.1:12345;export https_proxy=socks5://127.0.0.1:12345;export ALL_PROXY=socks5://127.0.0.1:12345
}
function unproxy () {
  unset http_proxy && unset https_proxy && unset ALL_PROXY
}


# kubectl
source <(kubectl completion zsh)
# kind
#source <(kind completion zsh)
# kubebuilder
#source <(kubebuilder completion zsh)

# k9s
export K9S_CONFIG_DIR=$HOME/.config/k9s
source <(k9s completion zsh)

# k8s
# export KUBECONFIG=~/.kube/config
# [ -d ~/Work/kubeconfig ] && export KUBECONFIG=$KUBECONFIG:~/Work/kubeconfig/beijing-kubeconfig:~/Work/kubeconfig/guangzhou-kubeconfig:~/Work/kubeconfig/shanghai-kubeconfig:~/Work/kubeconfig/beijing-test-kubeconfig
source <(switcher init zsh)
source <(switch completion zsh)
alias kc=switch
alias kn="switch namespace"
export HISTFILE=$HOME/.zsh_history
