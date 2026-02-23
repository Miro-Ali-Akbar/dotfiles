# .bashrc

# autocd
shopt -s autocd

# Promt
# PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;31m\]\w$(__git_ps1 " \[\033[01;32m\](%s)\[\033[00m\] ")$([[ $? != 0 ]] && echo "\[\033[01;31m\]|Error|\[\033[00m\]")\[\033[00m\]:> '

GREEN="\[\e[01;32m\]"
RED="\[\e[01;31m\]"
RESET="\[\e[00m\]"

build_prompt() {
    local EXIT="$?"
    # PS1="\n${GREEN}\u${RESET}:"
    PS1="${GREEN}\u${RESET}:"
    PS1+="${RED}\w${RESET}"

    PS1+="$(__git_ps1 " ${GREEN}(%s)${RESET}")"

    if [ $EXIT -ne 0 ]; then
        PS1+="${RED}|Error: $EXIT|${RESET}"
    fi

    PS1+=":> "
}
PROMPT_COMMAND=build_prompt

# Alias
alias ..="cd .."
alias cl="clear"
alias REPL="NVIM_REPL=1 nvim"

# manpage highlighter
# export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANPAGER='nvim +Man!'
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
