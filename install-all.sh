#!/bin/bash

set -e

# Install all packages in order
. ./install-basic-console-utils.sh
. ./install-gui-utils.sh
. ./install-zsh.sh
. ./install-go-dev-tools.sh
. ./install-python-dev-tools.sh
. ./install-docker.sh
. ./install-editors.sh
. ./install-dotfiles.sh
. ./set-ssh-keys.sh
