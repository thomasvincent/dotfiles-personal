#!/bin/zsh

# MIT License
#
# Copyright (c) 2024 Thomas Vincent
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
#
# Dependency: This script requires the GitHub CLI (gh) to function properly.
#             Ensure that 'gh' is installed by visiting: https://cli.github.com/
#
# Repository: https://www.github.com/thomasvincent/dotfiles/bin/
#
# This script analyzes the git commit history to quantify contributions by line
# changes. It supports command-line options to obfuscate email addresses, convert
# text to HTML entities, and to run verbosely. Use the -o, -h, and -v flags respectively.

# Function to obfuscate email addresses
obfuscate() {
  echo "$1" | sed 's/@/ at the /g' | sed 's/\./ dot /g'
}

# Function to convert text to HTML entities
htmlize() {
  echo "$1" | sed 's/&/\&amp;/g' | sed 's/</\&lt;/g' | sed 's/>/\&gt;/g'
}

# Initialize associative array for storing line counts
typeset -A lines

# Default options
verbose=0
obfuscate_flag=0
htmlize_flag=0

# Parse command-line options
while getopts "voh" opt; do
  case "$opt" in
    v) verbose=1 ;;
    o) obfuscate_flag=1 ;;
    h) htmlize_flag=1 ;;
    *) echo "Usage: $0 [-v] [-o] [-h]"; exit 1 ;;
  esac
done

# Ensure GitHub CLI and git are installed
for cmd in gh git; do
  if ! command -v $cmd &>/dev/null; then
    echo "Error: $cmd is not installed. Please install it to use this script."
    exit 1
  fi
done

# Check if the current directory is a Git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not a git repository (or any of the parent directories)."
    exit 1
fi

# Fetch the git log using GitHub CLI and clean the input
git_log=$(gh api repos/:owner/:repo/commits --paginate --jq '.[] | .commit.message' | tr -d '\n')

# Process git log
author=""
state="pre_author"
echo "$git_log" | while IFS= read -r line; do
  case "$line" in
    "Author:"*)
      author=${line#Author: }
      state="post_author"
      lines[$author]=0
      ;;
    "+++"*)
      state="in_diff"
      ;;
    *[\+\-]*)
      if [[ $state == "in_diff" ]]; then
        ((lines[$author]++))
      fi
      ;;
    "commit "*)
      state="pre_author"
      ;;
  esac
done

# Sort and print results
for author count in "${(@o)lines}"; do
  [[ $obfuscate_flag -eq 1 ]] && author=$(obfuscate "$author")
  [[ $htmlize_flag -eq 1 ]] && author=$(htmlize "$author")
  if [[ $verbose -eq 1 ]]; then
    echo "$author: $count lines of diff"
  else
    echo "$author"
  fi
done
