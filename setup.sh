#!/bin/bash
#
# Deploy dotfiles into a home directory.
# NOTE: This repository must be cloned into a direct subdirectory of
#       the target home directory.

if ! (which brew >/dev/null); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew analytics off
else
    echo "Homebrew previously installed - skipping"
fi

if ! (which stow >/dev/null); then
    brew install stow 2>/dev/null
else
    echo "stow previously installed - skipping"
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
