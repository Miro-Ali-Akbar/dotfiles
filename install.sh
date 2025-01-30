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

# ------
# Nvim
# ------
if [[ $do_everything -eq 0 ]] || [[ $(ask "Add nvim settings?") -eq 0 ]]; then
    echo -e "${GREEN}Installing nvim config${RESET_FONT}"
    nvimlink=$(readlink ~/.config/nvim)
    nvimfolder=$(pwd)/config/nvim
    if [[ -z $nvimlink ]] || [[ ! $nvimlink == $nvimfolder ]]; then 
        if [ -e ~/.config/nvim ]; then
            if [ -L ~/.config/nvim ]; then
                echo -e "${YELLOW}\t Overriding symbolic link${RESET_FONT}"
            else
                echo -e "${YELLOW}\t Found /nvim folder - creating backup${RESET_FONT}"
                mv $HOME/.config/nvim $HOME/.config/nvim.bak
            fi
        fi
        echo -e "${YELLOW}\t Placing symbolic link${RESET_FONT}"
        ln -sf $nvimfolder $HOME/.config/
    else
        echo -e "${GREEN}Nvim already configured${RESET_FONT}"
    fi

    echo -e "${GREEN}\t Installing spell languages${YELLOW}"
    spelldir=$HOME/.config/nvim/spell/
    if [ ! -f  "$spelldir/sv.utf-8.spl" ]; then
        # Spell files download previously "http://ftp.vim.org/vim/runtime/spell/"
        wget --directory-prefix="$spelldir" https://ftp.nluug.nl/vim/runtime/spell/sv.utf-8.spl
        wget --directory-prefix="$spelldir" https://ftp.nluug.nl/vim/runtime/spell/sv.utf-8.sug
    else
        echo -e "${GREEN}\t Already installed all languages${RESET_FONT}"
    fi
fi

# ----------
# Alacritty
# ----------
if [[ $do_everything -eq 0 ]] || [[ $(ask "Add alacritty settings?") -eq 0 ]]; then
    echo -e "${GREEN}Installing alacritty config${RESET_FONT}"
    alacrittylink=$(readlink $HOME/.config/alacritty)
    alacrittyfolder=$(pwd)/config/alacritty
    if [[ -z $alacrittylink ]] || [[ ! $alacrittylink == $alacrittyfolder ]]; then 
        if [ -e ~/.config/alacritty ]; then
            if [ -L ~/.config/alacritty ]; then
                echo -e "${YELLOW}\t Overriding symbolic link${RESET_FONT}"
            else
                echo -e "${YELLOW}\t Found /alacritty folder - creating backup${RESET_FONT}"
                mv $HOME/.config/alacritty/ $HOME/.config/alacritty.bak
            fi
        fi
        echo -e "${YELLOW}\t Placing symbolic link${RESET_FONT}"
        ln -sf $alacrittyfolder $HOME/.config/
    else
        echo -e "${GREEN}Alacritty already configured${RESET_FONT}"
    fi
fi

# --------
# Zathura
# --------
if [[ $do_everything -eq 0 ]] || [[ $(ask "Add Zathura settings?") -eq 0 ]]; then
    echo -e "${GREEN}Installing Zathura config${RESET_FONT}"
    zathuralink=$(readlink $HOME/.config/zathura)
    zathurafolder=$(pwd)/config/zathura
    if [[ -z $zathuralink ]] || [[ ! $zathuralink == $zathurafolder ]]; then 
        if [ -e ~/.config/zathura ]; then
            if [ -L ~/.config/zathura ]; then
                echo -e "${YELLOW}\t Overriding symbolic link${RESET_FONT}"
            else
                echo -e "${YELLOW}\t Found /zathura folder - creating backup${RESET_FONT}"
                mv $HOME/.config/zathura/ $HOME/.config/zathura.bak
            fi
        fi
        echo -e "${YELLOW}\t Placing symbolic link${RESET_FONT}"
        ln -sf $zathurafolder $HOME/.config/
    else
        echo -e "${GREEN}Zathura already configured${RESET_FONT}"
    fi
fi

# ----------------
# Shell shortcuts
# ----------------
if [[ $do_everything -eq 0 ]] || [[ $(ask "Add shell shortcuts?") ]]; then
    echo -e "${GREEN}\e[4mInstalling shell shortcuts${RESET_FONT}"

    # --------
    # Inputrc
    # --------
    echo -e "${GREEN}Sourcing input.rc${RESET_FONT}"
    inputrc_path="$(pwd)/shell/inputrc.sh"
    # Indlude inputrc if it does not exists already in ~/
    if [ ! -e ~/.inputrc ]; then 
        echo -e "${YELLOW}\t Creating local ~/inputrc from etc/inputrc${RESET_FONT}"
        echo '$include /etc/inputrc' > ~/.inputrc; 
    fi
    if ! grep -q dotfiles ~/.inputrc; then
        echo "# Inputrc config provided by dotfiles located in $(pwd)" >> ~/.inputrc
        echo "\$include $inputrc_path" >> ~/.inputrc
        echo -e "${YELLOW}\t Inputrc config done${RESET_FONT}"
    else
        echo -e "${GREEN}Inputrc config already sourced${RESET_FONT}"
    fi

    # Bash
    #
    echo -e "${GREEN}Sourcing bash alias${RESET_FONT}"
    bash_config_path="$(pwd)/shell/bash_config.sh"
    if ! grep -q bash_config ~/.bashrc; then
        echo "# Bash config provided by dotfiles located in $(pwd)" >> ~/.bashrc
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
        echo "# Git aliases provided by dotfiles located in $(pwd)" >> ~/.bashrc
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
            echo "# App alias provided by dotfiles located in $(pwd)" >> ~/.bashrc
            echo "source $app_specific_alias_path" >> ~/.bashrc
            echo -e "${YELLOW}\t App specific alias done${RESET_FONT}"
        else
            echo -e "${GREEN}App specific alias already sourced${RESET_FONT}"
        fi
    else
        echo -e "${RED}\t Error dependencies not met${RESET_FONT}"
    fi
fi 


# -------
# Scripts
# -------
if [[ $do_everything -eq 0 ]] || [[ $(ask "Add shell scripts?") -eq 0 ]]; then
    echo -e "${GREEN}Installing shell scripts${RESET_FONT}"
    script_folder="$(pwd)/shell/scripts"
    if ! grep -q scripts ~/.bashrc; then
        chmod +x $(pwd)/shell/scripts/*
        echo "# Scripts folder sourced provided by dotfiles located in $(pwd)" >> ~/.bashrc
        echo "export PATH=\"$script_folder:\$PATH\"" >> ~/.bashrc
        echo -e "${YELLOW}\t Script source done${RESET_FONT}"
    else
        echo -e "${GREEN}Scripts already sourced${RESET_FONT}"
    fi
fi

echo -e "${BOLD}End of dotfiles${RESET_FONT}"
exit 0
