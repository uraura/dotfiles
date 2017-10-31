typeset -U path PATH
path=(~/.dotfiles/bin ~/bin ~/opt/coreutils/libexec/gnubin $path)

typeset -U fpath
typeset -U MANPATH

export ZDOTDIR=~/.zsh

export LESS=' --RAW-CONTROL-CHARS '
export LESSOPEN='| src-hilite-lesspipe.sh %s'
