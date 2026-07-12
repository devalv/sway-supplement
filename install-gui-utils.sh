#!/bin/bash

set -e

sudo apt-get install keepassxc chromium vlc -y -q || exit 1

echo "GUI utils installed successfully!"
