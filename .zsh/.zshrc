# Created by newuser for 5.4.2

autoload -Uz compinit; compinit
autoload -Uz promptinit; promptinit

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
