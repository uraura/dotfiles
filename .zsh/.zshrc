# Created by newuser for 5.4.2

autoload -Uz compinit; compinit

source <(antibody bundle <<EOF
tjun/oedo.zsh
caarlos0/ports kind:path
djui/alias-tips
zsh-users/zsh-completions
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
zsh-users/zsh-autosuggestions
EOF
)

eval "$(direnv hook zsh)"
