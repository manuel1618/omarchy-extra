#!/bin/bash

# List of packages to install
packages=(
  github-cli
)

echo "Installing dev packages: ${packages[*]}"
yay -S --noconfirm "${packages[@]}"

echo "All dev packages installed successfully."
