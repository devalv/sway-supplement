#!/bin/bash

set -e

# install docker engine
if command -v docker &> /dev/null && docker info &> /dev/null; then
    echo "✅ Docker already installed: $(docker --version)"
else
    echo "Docker engine should be installed..."

    sudo apt-get install ca-certificates curl -y -q || exit 1
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    sudo tee /etc/apt/sources.list.d/docker.sources <<EOF &&
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: trixie
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

    sudo apt-get update &&
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y -q || exit 1

    echo "Docker engine installed successfully!"
fi

sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Docker engine configured successfully!"
