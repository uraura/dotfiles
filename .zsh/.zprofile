typeset -U fpath
fpath=(/opt/brew/completions/zsh $fpath)

typeset -U MANPATH
export MANPATH=~/opt/coreutils/libexec/gnuman:$(manpath)

export PATH="$HOME/.cargo/bin:$PATH"
