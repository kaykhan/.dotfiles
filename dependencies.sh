#!/usr/bin/env bash
set -euo pipefail

# Core packages
sudo apt-get update
sudo apt-get install -y \
  curl \
  git \
  ca-certificates \
  build-essential \
  procps \
  file \
  make \
  wget \
  xclip \
  xdg-utils \
  python3-pip

# ZSH
sudo apt-get install -y zsh

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# nvm
export NVM_DIR="$HOME/.nvm"

NVM_LATEST_TAG="$(
  git ls-remote --tags --refs https://github.com/nvm-sh/nvm.git 'v*' \
    | awk -F/ '{print $3}' \
    | sort -V \
    | tail -n1
)"

curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_LATEST_TAG}/install.sh" | bash

# Load nvm for this script run
. "$NVM_DIR/nvm.sh"

nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

npm install -g \
  neovim \
  eslint_d \
  npm-check-updates \
  prettier \
  typescript-language-server \
  typescript \
  vscode-langservers-extracted \
  yarn \
  @prisma/language-server \
  serverless \
  vim-language-server

# tmux
sudo apt-get install -y tmux

git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

# After this script finishes, open tmux and press:
# Ctrl+b, then Shift+i

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# pyenv
sudo apt-get install -y \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev \
  libzstd-dev

brew install pyenv

# nvim
brew install \
  neovim \
  efm-langserver \
  tree-sitter-cli \
  go \
  gopls \
  ruff \
  lazygit \
  gh \
  uv \
  imagemagick \
  ghostscript \
  mermaid-cli \
  tectonic \
  luarocks

brew install anomalyco/tap/opencode

python3 -m pip install --user --upgrade pynvim

sudo apt-get install -y \
  ripgrep \
  fd-find
