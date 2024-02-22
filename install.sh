#!/bin/bash

# Constants
dependencies=("bat" "eza" "zoxide")

    # Colors
BOLD="\033[1m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RESET_FONT="\033[0m"

# Functions
check_installed_program() {
    command -v "$1" > /dev/null
}

check_installed_dependencies() {
    all_dependencies_met=0
    for program in "${dependencies[@]}"; do
        if ! check_installed_program "$program"; then
            echo -e "${RED}\t Error dependency not met: $program ${RESET_FONT}"
            echo -e "${RED}\t Please make sure all needed dependencies are downloaded${RESET_FONT}"
            all_dependencies_met=1
        fi
    done
    [ "$all_dependencies_met" ]
}

function ask() {
    read -p "$1 (Y/n): " resp
    if [ -z "$resp" ]; then
        response_lc="y" # empty is Yes
    else
        response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    if [ "$response_lc" = "y" ]; then 
        echo 0 
    else
        echo 1
    fi
}

# ---------------
# Start of script
# ---------------
echo -e "${BOLD}Installing dotfiles${RESET_FONT}"

do_everything=$(ask "Install everything?")
if [[ $do_everything -eq 0 ]] || [[ $(ask "Add nvim settings?") -eq 0 ]]; then
    echo -e "${GREEN}Installing nvim config${RESET_FONT}"
    if [ -e "$nvim_config_path" ]; then
        if [ -L ~/.config/nvim ]; then
            echo -e "${YELLOW}\t Overriding symbolic link${RESET_FONT}"
        else
            echo -e "${YELLOW}\t Found /nvim folder - creating backup${RESET_FONT}"
            mv $HOME/.config/nvim $HOME/.config/nvim.bak
        fi
    fi
    echo -e "${YELLOW}\t Placing symbolic link${RESET_FONT}"
    ln -sf "$(pwd)/nvim" ~/.config/
fi

if [[ $do_everything -eq 0 ]] || [[ $(ask "Add shell shortcuts?") ]]; then
    echo -e "${GREEN}Installing shell shortcuts${RESET_FONT}"

    # ----
    # Bash
    #
    echo -e "${GREEN}Sourcing bash alias${RESET_FONT}"
    bash_config_path="$(pwd)/shell/bash_config.sh"
    if ! grep -q bash_config ~/.bashrc; then
        echo "source $bash_config_path" >> ~/.bashrc
        echo -e "${YELLOW}\t Bash config done${RESET_FONT}"
    else
        echo -e "${GREEN}Bash config already sourced${RESET_FONT}"
    fi

    # ---
    # Git
    # ---
    echo -e "${GREEN}Sourcing git aliases${RESET_FONT}"
    git_alias_path="$(pwd)/shell/git_alias.sh"
    if ! grep -q git_alias ~/.bashrc; then
        echo "source $git_alias_path" >> ~/.bashrc
        echo -e "${YELLOW}\t Git alias done${RESET_FONT}"
    else
        echo -e "${GREEN}Git alias already sourced${RESET_FONT}"
    fi

    # ------------
    # App specific
    # ------------
    echo -e "${GREEN}Sourcing app specific aliases${RESET_FONT}"
    app_specific_alias_path="$(pwd)/shell/app_specific_alias.sh"
    if check_installed_dependencies; then
        echo -e "${GREEN}All dependencies met${RESET_FONT}"
        if ! grep -q app_specific_alias ~/.bashrc; then
            echo "source $app_specific_alias_path" >> ~/.bashrc
            echo -e "${YELLOW}\t App specific alias done${RESET_FONT}"
        else
            echo -e "${GREEN}App specific alias already sourced${RESET_FONT}"
        fi
    else
        echo -e "${RED}\t Error dependencies not met${RESET_FONT}"
    fi
fi 
    
echo -e "${BOLD}End of dotfiles${RESET_FONT}"
