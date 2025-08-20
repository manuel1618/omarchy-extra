#!/bin/bash

# List of packages to install
packages=(
  discord
)

echo "Installing social packages: ${packages[*]}"
yay -S --noconfirm "${packages[@]}"

echo "All social packages installed successfully."
