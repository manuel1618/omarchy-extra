#!/bin/bash

ansi_art='                 ▄▄▄                                                   
 ▄█████▄    ▄███████████▄    ▄███████   ▄███████   ▄███████   ▄█   █▄    ▄█   █▄ 
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   █▀   ███   ███  ███   ███
███   ███  ███   ███   ███ ▄███▄▄▄███ ▄███▄▄▄██▀  ███       ▄███▄▄▄███▄ ███▄▄▄███
███   ███  ███   ███   ███ ▀███▀▀▀███ ▀███▀▀▀▀    ███      ▀▀███▀▀▀███  ▀▀▀▀▀▀███
███   ███  ███   ███   ███  ███   ███ ██████████  ███   █▄   ███   ███  ▄██   ███
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███
 ▀█████▀    ▀█   ███   █▀   ███   █▀   ███   ███  ███████▀   ███   █▀    ▀█████▀ 
                                       ███   █▀                                  '

clear
echo -e "\n$ansi_art\n"

sudo pacman -Sy --noconfirm --needed git

# Use custom repo if specified, otherwise default to manuel1618/omarchy
OMARCHY_EXTRA_REPO="${OMARCHY_REPO:-manuel1618/omarchy-extra}"

echo -e "\nCloning Omarchy from: https://github.com/${OMARCHY_EXTRA_REPO}.git"
rm -rf ~/.local/share/omarchy-extra/
if ! git clone "https://github.com/${OMARCHY_EXTRA_REPO}.git" ~/.local/share/omarchy-extra --quiet; then
  echo "❌ Failed to clone repository."
  exit 1
fi

# Use custom branch if instructed
if [[ -n "$OMARCHY_REF" ]]; then
  echo "Using branch: $OMARCHY_REF"
  cd ~/.local/share/omarchy-extra
  git fetch origin "${OMARCHY_REF}" && git checkout "${OMARCHY_REF}"
  cd - >/dev/null
fi

INSTALL_SCRIPT=~/.local/share/omarchy-extra/install.sh
if [[ -f "$INSTALL_SCRIPT" ]]; then
  echo -e "\nInstallation starting..."
  source "$INSTALL_SCRIPT"
else
  echo "❌ Install script not found at $INSTALL_SCRIPT"
  exit 1
fi
