# ~/.bash_profile: executed by the command interpreter for login shells.

# Because of this file's existence, neither ~/.bash_login nor ~/.profile
# will be sourced.

# See /usr/share/doc/bash/examples/startup-files (from package bash-doc)
# for examples.

# Because ~/.profile isn't invoked if this file exists, we must source
# ~/.profile to get its settings.
[[ -r ~/.profile ]] && source ~/.profile

# The following sources ~/.bashrc in the interactive login case, because
# ~/.bashrc isn't sourced for interactive login shells.
[[ "$-" == *i* ]] && [[ -r ~/.bashrc ]] && source ~/.bashrc

# Nothing else goes in here except things that should only run once per
# login session.  Setting a relative PATH is one example.
