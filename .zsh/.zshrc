# Created by newuser for 5.4.2

source <(antibody bundle <<EOF
mafredri/zsh-async
sindresorhus/pure
caarlos0/ports kind:path
djui/alias-tips
zsh-users/zsh-completions
zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
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

source_if_exists() {
  local f=$1
  [ -f $f ] && source $f
}

source_if_exists $HOME/.misc/nerd-fonts/bin/scripts/lib/i_all.sh
source_if_exists $HOME/.fzf.zsh
source_if_exists $HOME/opt/fzf/shell/key-bindings.zsh
[[ $- == *i* ]] && source_if_exists $HOME/opt/fzf/shell/completion.zsh

alias dotmake='make --directory $HOME/.dotfiles'

if [ ${path[(i)$HOME/opt/coreutils/libexec/gnubin]} -le ${#path} ]; then
  alias ls='ls --color=auto --almost-all --file-type --human-readable'
  alias ll='ls -l --color=auto --almost-all --file-type --human-readable'
  alias mkdir='mkdir --parents'
else
  alias ls='ls -G'
  alias ll='ls -l -a -G'
  alias mkdir='mkdir -p'
fi

if [ -e $HOME/bin/grep ]; then
  alias grep='grep --with-filename --line-number'
else
  unalias grep
fi

if [ -v TMUX ]; then
  man() {
    p=$(apropos $1 \
    | fzf-tmux --preview-window=down:50% --preview 'echo {} cut -f1 -d"(" | xargs man' \
    | cut -f1 -d"(")
    man $p
  }
else
  typeset -f man && unfunction man
fi
