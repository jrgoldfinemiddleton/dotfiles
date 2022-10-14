# ~/.bashrc: executed by bash(1) for non-login shells.
# See /usr/share/doc/bash/examples/startup-files (from package bash-doc)
# for examples.

# If not running interactively, don't do anything.
[[ -z "$PS1" ]] && return

# Only add things relevant to interactive shells, such as shell options,
# HISTORY control, terminal characteristics, PROMPT, etc.  Most of the fun
# stuff goes in here or another file it sources.

# DO NOT set a relative PATH in this file.

# Custom prompt
export PS1="\[\e[0;32m\] \[\e[1;32m\]\t \[\e[0;2m\]\w \[\e[0m\]\$ "

# Use colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

export HISTTIMEFORMAT="%F %T  "
export HOMEBREW_EDITOR=vim

# Enable Bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#export PIP_REQUIRE_VIRTUALENV=true

if command -v pyenv 1>/dev/null 2>&1; then
  export PIPENV_PYTHON="$(pyenv root)/shims/python"
fi
export PIPENV_VENV_IN_PROJECT=yes


# Aliases
if command -v pyenv 1>/dev/null 2>&1; then
  alias brew="env PATH='${PATH//$(pyenv root)\/shims:/}' brew"
fi

alias tma="tmux attach"

export PATH="$PATH:/Users/jason/.local/bin"

if [[ -d ~/.bash/git-aware-prompt ]]; then
  export GITAWAREPROMPT=~/.bash/git-aware-prompt
  source "${GITAWAREPROMPT}/main.sh"

  export PS1="\[\e[0;32m\] \[\e[1;32m\]\t \[\e[0;2m\]\w \[\$txtcyn\]\$git_branch\[\$txtred\]\$git_dirty\[\$txtrst\]\[\e[0m\]\$ "
fi
