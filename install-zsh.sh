#!/bin/bash

set -e

# install zsh
if ! dpkg -s zsh >/dev/null 2>&1; then
    sudo apt-get install zsh -y -q || exit 1
fi

# Get the path to zsh
ZSH_PATH=$(which zsh)


# Check if zsh is already the default shell, that means OhMyZsh already installed
if [ "$SHELL" = "$ZSH_PATH" ]; then
    echo "Zsh is already your default shell."
    exit 0
fi

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Zsh and OhMyZsh installed successfully! Please re-login"
