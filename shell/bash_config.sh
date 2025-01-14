# .bashrc

# autocd
shopt -s autocd

# Promt
ErrorCodeColor() {
    [[ $? != 0 ]] && printf '\033[01;31m'
}
PS1='\[\033[01;32m\]$(ErrorCodeColor)\u\e[0m:\[\033[01;31m\]$(ErrorCodeColor)\w$(__git_ps1 " \[\033[01;32m\]$(ErrorCodeColor)(%s) ")\e[0m:> '

# Alias
alias ..="cd .."
alias cl="clear"

# manpage highlighter
export MANPAGER="less -R --use-color -Dd+r -Du+b"
