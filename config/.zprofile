#!/bin/zsh
# -*- mode: sh -*-
# .zprofile - Global configuration for Zsh login shells

# Descriptive header for the script
echo "Loading global configurations for Zsh login shells..."

# Function to safely add directories to the PATH
add_to_path() {
  for dir in "$@"; do
    if [[ ":$PATH:" != *":$dir:"* ]]; then
      export PATH="$dir:$PATH"
    fi
  done
}

# Add /usr/local/bin to the PATH if not already included
add_to_path /opt/local/bin

# Set the default text editor
export EDITOR='vim'

# Set the language environment
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

echo "Configuration loaded successfully."
