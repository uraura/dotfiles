setopt no_global_rcs

typeset -U path PATH
path=(/usr/local/bin /usr/bin /bin /usr/sbin /sbin)
path=(~/bin ~/sbin ~/opt/coreutils/libexec/gnubin ~/.cargo/bin $path)
path=(${^path}(N-/^W)) # must exist, must be directory, must have safe permission

typeset -U fpath
fpath=(~/share/zsh/site-functions /opt/brew/completions/zsh $fpath)
path=(${^fpath}(N-/^W)) # must exist, must be directory, must have safe permission

export ZDOTDIR=~/.zsh

export LESS=' --RAW-CONTROL-CHARS '
export LESSOPEN='| src-hilite-lesspipe.sh %s'
