#!/bin/sh

# This will install nightly Neovim on Linux.
# You do not need to run this as root, nor should you.

# I thought users intersted in this vim plugin
# might also be interested in an install script
# because a locked-down server is a common reason
# people might still be forced to use regular Vim.

set -eu

has() { command -v "$@" >/dev/null 2>&1; }
die() { echo "ERROR: $*"; exit 1; }
download() {
  mkdir -p "$(dirname "$2")"
  if has curl; then
    curl -Lf "$1" -o "$2" -z "$2"
  elif has get; then
    wget "$1" -O "$2"
  else
    die "curl or wget required"
  fi
}

[ "$(id -u)" != "0" ] || die "Do not run as root"
[ "$(uname -s)" = "Linux" ] || die "Not Linux"

nvim="$HOME/.local/bin/nvim"
nvimurl="https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage"

download "$nvimurl" "$nvim"
chmod u+x "$nvim"
