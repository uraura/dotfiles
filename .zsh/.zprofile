typeset -U fpath
fpath=(/opt/brew/completions/zsh $fpath)

typeset -U MANPATH
export MANPATH=~/opt/coreutils/libexec/gnuman:$(manpath)

if [ ${path[(i)~/opt/coreutils/libexec/gnubin]} -le ${#path} ]; then
  alias ls='ls --color=auto --almost-all --file-type --human-readable'
  alias ll='ls -l --color=auto --almost-all --file-type --human-readable'
  alias mkdir='mkdir --parents'
else
  alias ls='ls -G'
  alias ll='ls -l -a -G'
  alias mkdir='mkdir -p'
fi

if [ -e ~/bin/grep ]; then
  alias grep='grep --with-filename --line-number'
else
  unalias grep
fi

if [ -v TMUX ]; then
  man() {
    tmux split-window -v "man $@"
  }
else
  typeset -f man && unfunction man
fi
