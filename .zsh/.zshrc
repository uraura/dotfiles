# Created by newuser for 5.4.2

source <(antibody bundle <<EOF
mafredri/zsh-async
sindresorhus/pure
caarlos0/ports kind:path
djui/alias-tips
zsh-users/zsh-completions
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
zsh-users/zsh-autosuggestions
EOF
)

autoload -Uz compinit; compinit
autoload -Uz promptinit; promptinit

eval "$(direnv hook zsh)"

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt extended_history

{
  f=$HOME/.misc/nerd-fonts/bin/scripts/lib/i_all.sh
  test -f $f && source $f
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

