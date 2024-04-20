#!/bin/bash
# .bashrc
#
# Description: This script is executed for interactive non-login shells but also sourced from
# .bash_profile for login shells. It configures command history, aliases, and sets environment
# variables for various development tools.
#
# Usage: Sourced by the shell automatically for each interactive session or manually by
# sourcing directly.
#
# Author: Thomas Vincent
# Repository: https://www.github.com/thomasvincent/dotfiles-public
# License: MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

echo "Loading .bashrc configurations..."

# History Configuration
export HISTSIZE=32768
export HISTFILESIZE=32768
export HISTCONTROL=ignoreboth:erasedups

# Aliases for Efficiency
alias ll='ls -lah'
alias gst='git status'
alias c='clear'

# Environment Variables for Development Tools
export EDITOR='vim'
export NODE_REPL_HISTORY="$HOME/.node_history"
export NODE_REPL_HISTORY_SIZE='32768'
export NODE_REPL_MODE='sloppy'

# Python Environment Setup
if command -v pyenv >/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Java Environment Setup
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$PATH:$JAVA_HOME/bin"

# Additional setups like Ruby, Go, etc.
export PATH="$PATH:/usr/local/opt/ruby/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Bash Completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

echo "Loaded .bashrc configurations."
