#!/bin/bash

set -e

# Define the path to the public key
PUB_KEY="$HOME/.ssh/id_rsa.pub"

# Check if the file exists and is a regular file
if [ -f "$PUB_KEY" ]; then
    echo "SSH public key already exists at: $PUB_KEY"
else
    echo "SSH public key not found. Generating a new one..."

    # Ensure the .ssh directory exists
    mkdir -p "$HOME/.ssh"

    # Generate the key pair without a passphrase and without prompting
    ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa" -N ""
fi
