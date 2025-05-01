#!/bin/bash

set -e

echo "This script will install every dependency required for the nvim config. \n would you like to continue?\n [Y/N]"
read u

if [ "$u" != "Y" ] && [ "$u" != "y" ]; then
  echo "[FINISHED] Installation aborted"
	exit
fi

echo "🛠️ Installing config dependencies..."

# Install ripgrep (used by Telescope, fzf, etc.)
if ! command -v rg &>/dev/null; then
  echo "Installing ripgrep..."
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt install -y ripgrep
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install ripgrep
  fi
else
  echo "[OK] ripgrep already installed"
fi

# Install clang (for C/C++ LSPs like clangd)
if ! command -v clang &>/dev/null; then
  echo "Installing clang..."
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt install -y clang
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install llvm
  fi
else
  echo "[OK] clang already installed"
fi

echo "Would you like to let the setup install the required LSPs not provided by mason? (tsserver, dartls)\n[Y/N]"
read u

if [ "$u" != "Y" ] && [ "$u" != "y" ]; then
  echo "[FINISHED] Installation complete"
	exit
fi

# Install Node.js-based language servers
echo "📦 Installing Node.js language servers..."

if ! command -v npm &>/dev/null; then
  echo "❌ npm is not installed. Please install Node.js first."
  exit 1
fi

npm install -g \
  typescript \
  typescript-language-server \
  vscode-langservers-extracted \
  prettier \
  eslint_d

# Example: Python LSP (optional)
if command -v pip &>/dev/null; then
  echo "🐍 Installing Python LSP..."
  pip install 'python-lsp-server[all]'
fi

# Install rust-analyzer via rustup (if Rust is installed)
if command -v rustup &>/dev/null; then
  echo "🦀 Installing rust-analyzer..."
  rustup component add rust-analyzer || true
else
  echo "❌ rustup not found. Install Rust first if you want rust-analyzer."
fi

# Optionally auto-install Mason packages (if using Mason)
echo "🧩 (Optional) Installing Mason packages via Lua? Consider scripting :MasonInstall"

echo "[OK] All done! You may now restart Neovim."
