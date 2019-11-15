# Set Bash command aliases
if [ -d ~/.bash_aliases.d ]; then
    for file in ~/.bash_aliases.d/*.aliases; do
        source "$file"
    done
fi
