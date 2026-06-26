#!/bin/bash

set -e

# install helix
if ! dpkg -s hx >/dev/null 2>&1; then
    sudo apt-get install hx -y -q || exit 1
fi

# install vscode-binary
if ! dpkg -s code >/dev/null 2>&1; then
    sudo apt-get install wget gpg -y -q || exit 1 &&
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft.gpg &&

    sudo tee /etc/apt/sources.list.d/vscode.sources <<EOF &&
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF

    sudo apt-get update &&
    sudo apt-get install code -y -q || exit 1
fi

echo "Editors installed successfully!"
