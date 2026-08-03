#!/bin/bash

set -e

# install zsh
if ! dpkg -s zsh >/dev/null 2>&1; then
    sudo apt-get install zsh -y -q || exit 1
fi
