#!/bin/bash

set -e

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/devalv/dotfiles"
REPO_NAME="dotfiles"

# Install stow
sudo apt-get install stow -y -q

cd $HOME

# Check if the repository already exists
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
  git clone "$REPO_URL"
fi

# Check if the clone was successful
if [ $? -eq 0 ]; then
  echo "removing old configs"

  rm -rf $HOME/.config/starship.toml $HOME/.config/alacritty $HOME/.gitconfig $HOME/.config/nwg-bar $HOME/.config/rofi/ $HOME/.config/waybar $HOME/.config/wofi $HOME/.zshrc

  cd "$REPO_NAME"

  stow zshrc
  stow wofi
  stow waybar
  stow rofi
  stow starship
  stow nwg-bar
  stow git
  stow alacritty

else
  echo "Failed to clone the repository."
  exit 1
fi

cd "$ORIGINAL_DIR"
