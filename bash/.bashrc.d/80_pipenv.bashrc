if command -v pyenv 1>/dev/null 2>&1; then
    export PIPENV_PYTHON="$(pyenv root)/shims/python"
fi
export PIPENV_VENV_IN_PROJECT=yes
