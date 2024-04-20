#!/bin/zsh
#
# This script configures environment variables, initializes Zsh settings, and loads custom configurations
# for macOS. It enhances shell interactivity and functionality through completion scripts,
# path management, and specific environment settings.
#
# Author: Thomas Vincent
# Date: 2024-04-19
# Repository: https://github.com/thomasvincent/dotfiles-personal
# License: MIT License
#
# For more information on usage and dependencies, refer to README.md in the repository.

# Add custom bin directories to the PATH
# Globals: PATH
# Arguments: none
# Outputs: Modifies global PATH variable
# Returns: none
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/go/bin:$PATH"

# Load additional configuration files safely
# Globals: none
# Arguments: none
# Outputs: Sources configuration files if they exist
# Returns: none
for file in "$HOME"/.bashrc_{aws,gcp,azure,k8s}; do
  [[ -f "$file" ]] && source "$file"
done

# Modular dotfiles loading
# Globals: none
# Arguments: none
# Outputs: Sources dotfiles if they are readable and exist
# Returns: none
for file in "$HOME"/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [[ -r "$file" && -f "$file" ]] && source "$file"
done

# Set options to enhance functionality
# Globals: none
# Arguments: none
# Outputs: Sets Zsh options to enhance functionality
# Returns: none
setopt NO_CASE_GLOB EXTENDED_GLOB APPEND_HISTORY SHARE_HISTORY CDABLE_VARS

# Homebrew Zsh completion setup
# Globals: BREW_PREFIX
# Arguments: none
# Outputs: Sources Homebrew Zsh completion scripts if available
# Returns: none
if (( $+commands[brew] )); then
  BREW_PREFIX=$(brew --prefix)
  [[ -r "${BREW_PREFIX}/share/zsh/site-functions" ]] && fpath=(${BREW_PREFIX}/share/zsh/site-functions $fpath)
  autoload -Uz compinit && compinit
fi

# Git command completion
# Globals: none
# Arguments: none
# Outputs: Configures autocompletion for Git commands
# Returns: none
if (( $+commands[git] )); then
  autoload -Uz compinit && compinit
  compdef _git g=git
fi

# SSH hosts completion
# Globals: none
# Arguments: none
# Outputs: Configures autocompletion for SSH-related commands
# Returns: none
if [[ -e "$HOME/.ssh/config" ]]; then
  compctl -K _ssh_hosts ssh sftp scp
  function _ssh_hosts() {
    reply=($(awk '/^Host / && !/*/ {print $2}' "$HOME/.ssh/config"))
  }
fi

# Completion for macOS 'defaults' command
# Globals: none
# Arguments: none
# Outputs: Configures autocompletion for the 'defaults' command
# Returns: none
compctl -K _defaults defaults
function _defaults() {
  reply=("read" "write" "NSGlobalDomain")
}

# Unset temporary variables to avoid environment pollution
# Globals: file, BREW_PREFIX
# Arguments: none
# Outputs: Cleans up temporary variables used in the script
# Returns: none
unset file BREW_PREFIX
