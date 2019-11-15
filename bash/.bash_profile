# Include bashrc file segments
if [ -d ~/.bashrc.d ]; then
    for file in ~/.bashrc.d/*.bashrc; do
        source "$file"
    done
fi
