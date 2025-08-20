#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

OMARCHY_INSTALL=~/.local/share/omarchy-extra/install

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mOmarchy Extra installation failed!\e[0m"
}

trap catch_errors ERR

show_logo() {
  clear
  # tte -i ~/.local/share/omarchy/logo.txt --frame-rate ${2:-120} ${1:-expand}
  cat <~/.local/share/omarchy/logo.txt
  echo
}

show_subtext() {
  echo "$1" # | tte --frame-rate ${3:-640} ${2:-wipe}
  echo
}

show_logo expand

source $OMARCHY_INSTALL/apps/vpn.sh
source $OMARCHY_INSTALL/config/config.sh
