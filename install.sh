#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

OMARCHY_EXTRA_ROOT=~/.local/share/omarchy-extra

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

source $OMARCHY_EXTRA_ROOT/install/apps/dev.sh
source $OMARCHY_EXTRA_ROOT/install/apps/socials.sh
source $OMARCHY_EXTRA_ROOT/install/apps/vpn.sh

source $OMARCHY_EXTRA_ROOT/install/config/config.sh

source $OMARCHY_EXTRA_ROOT/install/bin/bin.sh
