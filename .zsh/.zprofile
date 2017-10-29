typeset -U path PATH
path=(~/.dotfiles/bin ~/bin $path)

typeset -U fpath
fpath=(/opt/brew/completions/zsh $fpath)
