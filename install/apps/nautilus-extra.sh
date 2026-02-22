#!/bin/bash

packages=(
  nautilus-open-any-terminal
)

echo "Installing nautilus extra packages: ${packages[*]}"
yay -S --noconfirm "${packages[@]}"

echo "All nautilus extra packages installed successfully."
