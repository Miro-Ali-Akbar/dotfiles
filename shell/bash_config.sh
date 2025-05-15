# .bashrc

# autocd
shopt -s autocd

# Promt
ErrorCodeColor() {
    [[ $? != 0 ]] && printf '\033[01;31m'
}
# PS1='\[\033[01;32m\]$(ErrorCodeColor)\u\e[0m:\[\033[01;31m\]$(ErrorCodeColor)\w$(__git_ps1 " \[\033[01;32m\]$(ErrorCodeColor)(%s) ")\e[0m:> '
PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;31m\]\w$(__git_ps1 " \[\033[01;32m\](%s)\[\033[00m\] ")$([[ $? != 0 ]] && echo "\[\033[01;31m\]|Error|\[\033[00m\]")\[\033[00m\]:> '
# Alias
alias ..="cd .."
alias cl="clear"

# manpage highlighter
# export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANPAGER='nvim +Man!'
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
