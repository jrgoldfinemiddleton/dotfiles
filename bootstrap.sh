#!/bin/bash
#
# Pull updated dotfiles and deploy them into a home directory.

if ! (which brew >/dev/null); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo Homebrew previously installed - skipping
fi

brew analytics off
brew install stow

cd
git clone https://github.com/jrgoldfinemiddleton/dotfiles.git
cd dotfiles
./setup.sh
