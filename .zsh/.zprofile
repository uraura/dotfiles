typeset -U path PATH
path=(~/.dotfiles/bin ~/bin $(brew --prefix)/opt/coreutils/libexec/gnubin $path)

typeset -U fpath
fpath=(/opt/brew/completions/zsh $fpath)

typeset -U MANPATH
export MANPATH=$(brew --prefix)/opt/coreutils/libexec/gnuman:$(manpath)

if [ ${path[(i)$(brew --prefix)/opt/coreutils/libexec/gnubin]} -le ${#path} ]; then
  alias ls='ls --color=auto --almost-all --file-type --human-readable'
  alias ll='ls -l --color=auto --almost-all --file-type --human-readable'
  alias mkdir='mkdir --parents'
else
  alias ls='ls -G'
  alias ll='ls -l -a -G'
  alias mkdir='mkdir -p'
fi

if [ -e $(brew --prefix)/bin/grep ]; then
  alias grep='grep --with-filename --line-number'
else
  unalias grep
fi

if [ -v TMUX ]; then
  man() {
    tmux split-window -v "man $1"
  }
else
  unfunction man
fi
