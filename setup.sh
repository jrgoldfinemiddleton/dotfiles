#!/bin/bash
#
# Deploy dotfiles within a home directory.

if ! type stow > /dev/null; then
  echo "Please install the 'stow' command and run this script again."
  exit 1
fi

git submodule update --init --recursive

echo "Linking Vim configuration"
stow vim
echo "Linking Git configuration"
stow git
echo "Linking Tmux configuration"
stow tmux
echo "Linking Bash configuration"
stow bash
