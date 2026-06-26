#!/bin/bash

set -e

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/devalv/dotfiles"
REPO_NAME="dotfiles"

# Install stow
sudo apt-get install stow -y -q
