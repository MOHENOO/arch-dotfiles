set -U fish_greeting
set fish_key_bindings fish_vi_key_bindings
set LC_ALL en_US.UTF-8
set LANG en_US.UTF-8
set EDITOR nvim

if status is-interactive
    # Abbreviations
    abbr --add -- la 'eza -a'
    abbr --add -- ll 'eza -l'
    abbr --add -- lla 'eza -la'
    abbr --add -- ls eza
    abbr --add -- lt 'eza --tree'

    # Aliases
    alias cat 'bat -p --paging never'
    alias eza 'eza --icons auto --git --hyperlink'
    alias fd 'fd --hyperlink'
    alias g git
    alias gst 'git status'
    alias vim nvim

    # Interactive shell initialisation
    fzf --fish | source

    zoxide init fish | source

    # k8s
    switcher init fish | source
    alias k kubectl
    alias kc kubeswitch
    alias kn 'kubeswitch namespace'

    if test "$TERM" != dumb
        starship init fish | source
        enable_transience
    end
end
