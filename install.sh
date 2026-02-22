#!/bin/bash

set -e

OMARCHY_EXTRA_ROOT=~/.local/share/omarchy-extra

catch_errors() {
  echo -e "\n\e[31mOmarchy Extra installation failed!\e[0m"
}

trap catch_errors ERR

show_logo() {
  clear
  cat <~/.local/share/omarchy/logo.txt
  echo
}

show_subtext() {
  echo "$1"
  echo
}

show_logo expand

for dir in apps config bin; do
  for script in "$OMARCHY_EXTRA_ROOT/install/$dir"/*.sh; do
    [ -f "$script" ] && source "$script"
  done
done
