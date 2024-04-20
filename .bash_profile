#!/bin/bash
# .bash_profile
#
# Description: This script is executed for login shells on Unix-like systems. It initializes
# core environment settings and sources the .bashrc for interactive settings applicable
# across all sessions.
#
# Usage: Sourced by the shell automatically at login.
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

echo "Loading .bash_profile configurations..."

# Core Environment Setup
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export GPG_TTY=$(tty)

# Load .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# macOS specific configurations
[ "$(uname -s)" = "Darwin" ] && export BASH_SILENCE_DEPRECATION_WARNING=1

echo "Loaded .bash_profile configurations."
