alias gs="git status"
alias gu="git pull"
alias gp="git push"
alias ga="git add"
alias gc="git commit"
alias gl="git log --all --graph --pretty=format:'%C(green)%h %C(white) %an %ar%C(auto) %D%n%s%n'"
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias main="git checkout main; git pull"
# Make submodules better
git config --global push.recurseSubmodules on-demand
git config --global submodule.recurse true
