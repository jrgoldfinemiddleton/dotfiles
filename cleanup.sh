#!/bin/bash
#
# Remove stowed dotfiles

echo "Unlinking Vim configuration"
stow -D vim
echo "Unlinking Git configuration"
stow -D git
echo "Unlinking Tmux configuration"
stow -D tmux
echo "Unlinking Bash configuration"
stow -D bash
