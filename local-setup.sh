#!/usr/bin/env bash

set -e

echo "Installing developer toolchain..."

apk update
apk add bash curl git build-base docker

# Neovim
apk add neovim

# Python
apk add python3 py3-pip

# Node.js + pnpm
apk add nodejs npm
npm install -g pnpm

# Go
apk add go

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# -----------------------------
# Lazy tools
# -----------------------------

install_github_binary() {
  local repo=$1
  local name=$2

  echo "Installing $name..."

  latest=$(curl -s "https://api.github.com/repos/$repo/releases/latest" |
    grep "browser_download_url" |
    grep linux |
    head -n 1 |
    cut -d '"' -f 4)

  curl -L "$latest" -o /usr/local/bin/$name
  chmod +x /usr/local/bin/$name
}

# LazyGit
install_github_binary "jesseduffield/lazygit" "lazygit"

# LazyDocker
install_github_binary "jesseduffield/lazydocker" "lazydocker"

# LazySQL
install_github_binary "jorgerojas26/lazysql" "lazysql"

echo "Done!"
