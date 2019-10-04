#!/usr/bin/env bash

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

# append OS-generic functions, aliases, etc to bashrc
if ! $(grep -q "^source '$HOME/.bashrc.common'" > /dev/null); then
  echo "source '$HOME/.bashrc.common'" >> "$HOME/.bashrc"
fi

# append OS-specific functions, aliases, etc to bashrc
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if ! $(grep -q "^source '$HOME/.bashrc.linux'" > /dev/null); then
    echo "source '$HOME/.bashrc.linux'" >> "$HOME/.bashrc"
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  if ! $(grep -q "^source '$HOME/.bashrc.macos'" > /dev/null); then
    echo "source '$HOME/.bashrc.macos'" >> "$HOME/.bashrc"
  fi
fi 
