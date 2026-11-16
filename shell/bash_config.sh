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
alias TEX="NVIM_TEX=1 nvim"
alias nosleep='systemd-inhibit --what=handle-lid-switch:sleep:idle --why="no sleep" sleep infinity'
eval "$(fzf --bash)"
export EDITOR=nvim

# manpage highlighter
# export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANPAGER='nvim +Man!'
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Keep $HOME clean: point apps at XDG dirs (see xdg-ninja)
export HISTFILE="$XDG_STATE_HOME"/bash/history
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export XCURSOR_PATH=/usr/share/icons:"$XDG_DATA_HOME"/icons
export NVM_DIR="$XDG_DATA_HOME"/nvm
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node_repl_history
export PYTHON_HISTORY="$XDG_STATE_HOME"/python/history
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export WINEPREFIX="$XDG_DATA_HOME"/wine
export BOTO_CONFIG="$XDG_CONFIG_HOME"/boto/config
export ASYMPTOTE_HOME="$XDG_CONFIG_HOME"/asy
export NXC_PATH="$XDG_CONFIG_HOME"/nxc
export CODEX_HOME="$XDG_DATA_HOME"/codex
export UFBT_HOME="$XDG_DATA_HOME"/ufbt
export KUBECONFIG="$XDG_CONFIG_HOME"/kube/config
export KUBECACHEDIR="$XDG_CACHE_HOME"/kube
# Claude Code: only once ~/.claude has been migrated to the XDG location
if [ -d "$XDG_CONFIG_HOME"/claude ]; then
    export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME"/claude
fi
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
