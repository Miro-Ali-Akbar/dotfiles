# .bashrc

# autocd
shopt -s autocd

# Promt
PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;31m\]\w$(__git_ps1 " \[\033[01;32m\](%s)\[\033[00m\] ")$([[ $? != 0 ]] && echo "\[\033[01;31m\]|Error|\[\033[00m\]")\[\033[00m\]:> '

# Alias
alias ..="cd .."
