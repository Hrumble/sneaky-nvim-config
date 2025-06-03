#!/bin/bash

set -e

echo "This script will install every dependency required for the nvim config. \n would you like to continue?\n [Y/N]"
read u

if [ "$u" != "Y" ] && [ "$u" != "y" ]; then
  echo "[FINISHED] Installation aborted"
	exit
fi

echo "🛠️ Installing config dependencies..."

#!/usr/bin/env bash

set -e

check_cmd() {
  command -v "$1" >/dev/null 2>&1
}

install_linux() {
  echo "[+] Detected Linux OS"

  # Detect package manager
  if check_cmd apt; then
    PM="sudo apt install -y"
    UPDATE="sudo apt update"
  elif check_cmd dnf; then
    PM="sudo dnf install -y"
    UPDATE="sudo dnf check-update || true"
  elif check_cmd pacman; then
    PM="sudo pacman -S --noconfirm"
    UPDATE="sudo pacman -Sy"
  else
    echo "[-] Unsupported Linux package manager"
    exit 1
  fi

  $UPDATE

  # Python
  if ! check_cmd python3; then
    echo "[*] Installing Python"
    $PM python3
  else
    echo "[✔] Python already installed"
  fi

  # NPM
  if ! check_cmd npm; then
    echo "[*] Installing NPM"
    $PM npm
  else
    echo "[✔] NPM already installed"
  fi

  # ripgrep
  if ! check_cmd rg; then
    echo "[*] Installing ripgrep"
    $PM ripgrep
  else
    echo "[✔] ripgrep already installed"
  fi

  # clang
  if ! check_cmd clang; then
    echo "[*] Installing clang"
    $PM clang
  else
    echo "[✔] clang already installed"
  fi
}

install_windows() {
  echo "[+] Detected Windows OS"

  if ! check_cmd choco; then
    echo "[-] Chocolatey not found. Please install Chocolatey first: https://chocolatey.org/install"
    exit 1
  fi

  # Python
  if ! check_cmd python; then
    echo "[*] Installing Python"
    choco install -y python
  else
    echo "[✔] Python already installed"
  fi

  # NPM
  if ! check_cmd npm; then
    echo "[*] Installing Node.js (includes npm)"
    choco install -y nodejs
  else
    echo "[✔] NPM already installed"
  fi

  # ripgrep
  if ! check_cmd rg; then
    echo "[*] Installing ripgrep"
    choco install -y ripgrep
  else
    echo "[✔] ripgrep already installed"
  fi

  # clang
  if ! check_cmd clang; then
    echo "[*] Installing LLVM/Clang"
    choco install -y llvm
  else
    echo "[✔] clang already installed"
  fi
}

main() {
  unameOut="$(uname -s)"
  case "${unameOut}" in
    Linux*)     install_linux ;;
    Darwin*)    echo "[-] macOS not supported in this script yet"; exit 1 ;;
    MINGW*|MSYS*|CYGWIN*) install_windows ;;
    *)          echo "[-] Unknown OS: ${unameOut}"; exit 1 ;;
  esac
}

main
