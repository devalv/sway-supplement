#!/bin/bash

set -e

apt-get install keepassxc chromium -y -q || exit 1

echo "GUI utils installed successfully!"
