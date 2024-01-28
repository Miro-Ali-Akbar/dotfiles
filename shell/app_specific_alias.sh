# Dependencies
# bat
# exa
# zoxide

# bat
alias cat="bat"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

alias ls="exa"

# zoxide
eval "$(zoxide init bash)"
alias cd="z"
