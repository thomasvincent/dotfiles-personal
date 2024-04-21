#!/bin/zsh
# -*- mode: sh -*-
# .zshrc - Interactive shell configuration for macOS Catalina

# Set up strict script execution
set -euo pipefail

# Local variables
local cache_file="$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
local completion_file="/usr/local/share/zsh/site-functions/_gh"

# Inform user about script loading
echo "Loading .zshrc configurations..."

# Source custom functions
source "$HOME/.zsh/functions.zsh"

# Source custom aliases.zsh
source "$HOME/.zsh/aliases.zsh"

# Configure zsh plugins
function configure_zsh_plugins() {
  source "$ZSH/oh-my-zsh.sh" || echo "Failed to load oh-my-zsh.sh"
  plugins=(git gitfast brew osx kubectl helm terraform aws azure docker)
}

# Check and load cache_file if it exists
[[ -r "$cache_file" ]] && source "$cache_file"

# Configure zsh plugins
configure_zsh_plugins

# Enable completions
autoload -Uz compinit && compinit -i

# Customize prompt (using powerlevel10k)
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# GitHub CLI completion
[[ -r "$completion_file" ]] && source "$completion_file"

# iTerm2 shell integration
[[ -e "${HOME}/.iterm2_shell_integration.zsh" ]] && source "${HOME}/.iterm2_shell_integration.zsh"

echo "Zsh configuration loaded successfully."
