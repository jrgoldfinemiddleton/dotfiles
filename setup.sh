#!/usr/bin/env sh

if ! type stow > /dev/null;
then
  echo "Please install the 'stow' command and run this script again."
  exit 1
fi

echo 'Linking vim configuration'
stow vim
echo 'Linking git configuration'
stow git
echo 'Linking tmux configuration'
stow tmux
