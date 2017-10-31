typeset -U path PATH
path=(~/bin(N-/) ~/opt/coreutils/libexec/gnubin(N-/) $path)

typeset -U fpath
typeset -U MANPATH

export ZDOTDIR=~/.zsh

export LESS=' --RAW-CONTROL-CHARS '
export LESSOPEN='| src-hilite-lesspipe.sh %s'
