#!/bin/zsh
# .zshrc
#
# Description: This script configures interactive shell behavior, including aliases,
# functions, plugins, and other interactive shell features. It is sourced by every
# interactive shell session after .zprofile during the login sequence.
#
# Author: Thomas Vincent
# Date: 2024-04-19
# Repository: https://github.com/thomasvincent/dotfiles-personal
# License: MIT License

echo "Loading .zshrc configurations..."

### Initial Setup
# Powerlevel10k instant prompt if available
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Plugins Configuration
source $ZSH/oh-my-zsh.sh
plugins=(git docker kubectl nvm pyenv ruby rvm terraform aws azure)

### Aliases and Functions
alias gs='git status'
alias gcm='git commit -m'
alias ll='ls -lah'
function kcd() { echo "Switching Kubernetes context to: $1"; kubectl config use-context "$1"; }
function tfplan() { echo "Generating Terraform plan..."; terraform plan -out="$1" -var-file="$2"; }

### Advanced Configuration
# Custom completion and scripting capabilities
[[ -f /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion

### Additional Options
setopt HIST_STAMPS  # Adds timestamps to history entries
DISABLE_UNTRACKED_FILES_DIRTY="true"  # Improves performance in large git repos

### Cleanup
unsetopt HIST_STAMPS

echo "Zsh configuration loaded successfully."
