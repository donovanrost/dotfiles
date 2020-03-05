# fish config

source ~/.dotfiles/shell/profile
source ~/.config/fish/aliases.fish

starship init fish | source
status --is-interactive; and source (rbenv init -|psub)
