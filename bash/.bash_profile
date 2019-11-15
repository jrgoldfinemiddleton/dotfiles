# Include bashrc file segments
if [ -d ~/.bashrc.d ]; then
    for file in $(ls ~/.bashrc.d/*.bashrc | sort); do
        source "$file"
    done
fi
