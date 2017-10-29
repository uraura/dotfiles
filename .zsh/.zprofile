typeset -U path PATH
path=(~/.dotfiles/bin ~/bin $(brew --prefix)/opt/coreutils/libexec/gnubin $path)

typeset -U fpath
fpath=(/opt/brew/completions/zsh $fpath)

typeset -U MANPATH
export MANPATH=$(brew --prefix)/opt/coreutils/libexec/gnuman:$(manpath)

function contains(ary, elm) {
  return [ ${ary[(i)$elm]} -le ${#ary} ]
}

[ contains($path, $(brew --prefix)/opt/coreutils/libexec/gnubin) ] && {
  alias ls='ls --color=auto --almost-all --file-type --human-readable'
}
