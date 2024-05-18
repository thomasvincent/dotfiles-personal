#!/bin/zsh
# -*- mode: sh -*-
# .zshrc - Interactive shell configuration for macOS Catalina with Homebrew, iTerm2, GitHub, and Git integration

echo "Initializing Zsh configuration for macOS..."

# Set strict execution modes
set -euo pipefail

# Define local variables for cache and completions
local cache_file="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
local gh_completion_file="$(brew --prefix)/share/zsh/site-functions/_gh"  # Assuming Homebrew installation

# Define function to configure zsh plugins using oh-my-zsh
function configure_zsh_plugins() {
  local oh_my_zsh_init="${ZSH:-$HOME/.oh-my-zsh}/oh-my-zsh.sh"
  if [[ -f "$oh_my_zsh_init" ]]; then
    source "$oh_my_zsh_init"
    plugins=(git gitfast osx kubectl helm terraform aws azure docker)
  else
    echo "oh-my-zsh not found. Please install or check the path."
  fi
}

# Source essential scripts
for file in "$HOME/.zsh/functions.zsh" "$HOME/.zsh/aliases.zsh"; do
  [[ -f "$file" ]] && source "$file" || echo "Configuration file missing: $file"
done

# Configure zsh plugins
configure_zsh_plugins

# Enable shell completion
autoload -Uz compinit && compinit -i

# Customize the prompt using Powerlevel10k, if available
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh" || echo "Powerlevel10k config missing."

# Load GitHub CLI completions from Homebrew path
[[ -f "$gh_completion_file" ]] && source "$gh_completion_file" || echo "GitHub CLI completions not found."

# iTerm2 shell integration for enhanced terminal features
if [[ -f "${HOME}/.iterm2_shell_integration.zsh" ]]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
else
  echo "iTerm2 integration script not found. Please install via iTerm2."
fi

echo "Zsh configuration loaded successfully on macOS."
