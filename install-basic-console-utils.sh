#!/bin/bash

set -e

sudo apt-get install git wget curl zsh duf bat zoxide eza ranger -y -q || exit 1
echo "Basic console utils installed successfully!"

# install additional fonts for starship
wget -q --show-progress https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
unzip -q FiraCode.zip -d FiraCode
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
find FiraCode -type f \( -name "*.ttf" -o -name "*.otf" \) -exec cp -v {} "$FONT_DIR/" \;
fc-cache -f -v

# remove downloaded files
rm -rf FiraCode FiraCode.zip

# install starship and default firacode
sudo apt-get install fonts-firacode starship -y -q || exit 1

# install herdr
curl -fsSL https://herdr.dev/install.sh | sh
