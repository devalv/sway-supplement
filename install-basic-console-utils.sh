#!/bin/bash

set -e

apt-get install git wget curl zsh duf bat zoxide eza mc -y -q || exit 1

echo "Basic console utils installed successfully!"
