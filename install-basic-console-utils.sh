#!/bin/bash

set -e

sudo apt-get install git wget curl zsh duf bat zoxide eza mc -y -q || exit 1

echo "Basic console utils installed successfully!"

# install additional fonts for starship
wget -q --show-progress https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

unzip -q FiraCode.zip -d FiraCode
unzip -q "FiraCode/*.zip" -d FiraCode/extracted 2>/dev/null || true

find FiraCode -name "*.ttf" -o -name "*.otf" -exec cp {} "$FONT_DIR/" \;

fc-cache -f -v


# install starship and default firacode
sudo apt-get install fonts-firacode starship -y -q || exit 1
