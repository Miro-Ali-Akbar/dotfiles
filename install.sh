#!/bin/bash


echo "Installing dotfiles"

echo "Installing nvim .file"
if [ -e "$nvim_config_path" ]; then
    if [ -L ~/.config/nvim ]; then
        echo "Overriding symbolic link"
    else
        echo "Found /nvim folder - creating backup"
        mv $HOME/.config/nvim $HOME/.config/nvim.bak
    fi
fi

echo "Placing symbolic link"
ln -sf "$(pwd)/nvim" ~/.config/

echo "Installing bash shortcuts"
echo "WIP"
