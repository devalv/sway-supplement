
##!/bin/bash

set -e

if [ -d "/usr/local/go" ] && command -v go >/dev/null 2>&1; then
    echo "✅ Go already installed"
    go version
else
     echo "📦 Go not found, starting installation..."

    # Устанавливаем Go (для Linux)
    GO_VERSION="1.26.4"
    GO_OS="linux"
    GO_ARCH="amd64"

    # Скачиваем и устанавливаем Go
    wget -q "https://go.dev/dl/go${GO_VERSION}.${GO_OS}-${GO_ARCH}.tar.gz" -O /tmp/go.tar.gz
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf /tmp/go.tar.gz
    rm /tmp/go.tar.gz

    # added Go in PATH
    export PATH="/usr/local/go/bin:$PATH"

    echo "✅ Go installed successfully!"
    go version

    # install go extra linters
    go install golang.org/x/tools/cmd/goimports@latest
    $HOME/go/bin/goimports --help

    # install gofumpt
    go install mvdan.cc/gofumpt@latest
    $HOME/go/bin/gofumpt --version

    # install golangci-lint
    curl -sSfL https://golangci-lint.run/install.sh | sh -s -- -b $(go env GOPATH)/bin v2.12.2
    $HOME/go/bin/golangci-lint --version
fi
