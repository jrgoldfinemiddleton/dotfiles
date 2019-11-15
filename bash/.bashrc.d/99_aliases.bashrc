# Set Bash command aliases
if [ -d ~/.bash_aliases.d ]; then
    for file in $(ls ~/.bash_aliases.d/*.aliases | sort); do
        source "$file"
    done
fi
