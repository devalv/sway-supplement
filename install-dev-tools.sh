#!/bin/bash

set -e

# pyenv installation
if command -v $HOME/.pyenv/bin/pyenv &> /dev/null; then
    echo "✅ pyenv already installed"
    $HOME/.pyenv/bin/pyenv --version
else
    echo "📦 pyenv not found, starting installation..."

    curl -fsSL https://pyenv.run | bash

    # add pyenv in PATH
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    echo "✅ pyenv installed successfully!"
    pyenv --version

    pyenv init --install

    # will be done by dotfiles
    # echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.zshrc
    # echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> $HOME/.zshrc
    # echo 'eval "$(pyenv init - zsh)"' >> $HOME/.zshrc

    # install python build deps
    sudo apt-get update &&
    sudo apt-get install make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl git \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev libzstd-dev -y -q|| exit 1

    echo "✅ python build deps installed successfully!"
fi

# poetry installation
if [ -d "$HOME/.local/bin" ] && command -v poetry &> /dev/null; then
    echo "✅ Poetry already installed"
    poetry --version
else
    echo "📦 poetry not found, starting installation..."

    curl -sSL https://install.python-poetry.org | python3 -

    # add poetry in PATH
    export PATH="$HOME/.local/bin:$PATH"

    echo "✅ Poetry installed successfully!"
    poetry --version

fi

# pre-commit installation
if command -v pre-commit &> /dev/null; then
    echo "✅ pre-commit already installed"
    pre-commit --version
else
    echo "📦 pre-commit not found, starting installation..."
    sudo apt-get install python3-pip -y -q || exit 1

    python3 -m pip install pre-commit --break-system-packages

    echo "✅ pre-commit успешно установлен"
    pre-commit --version

    pre-commit install
fi

# TODO: install golang and golang tools
