#!/bin/bash

# List of packages to install
packages=(
  openvpn
  remmina
  remmina-plugin-rdesktop
  freerdp
)

echo "Installing packages: ${packages[*]}"
yay -S --noconfirm "${packages[@]}"

echo "All vpn packages installed successfully."
