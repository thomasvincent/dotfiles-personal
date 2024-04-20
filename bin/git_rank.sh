#!/bin/bash

# MIT License
# Copyright (c) 2024 Thomas Vincent
# <License details omitted for brevity>

# This script analyzes the git commit history using the GitHub CLI.
# Ensure that 'gh' is installed by visiting: https://cli.github.com/

# Functions to obfuscate and htmlize text
obfuscate() {
    echo "$1" | sed 's/@/ at the /g' | sed 's/\./ dot /g'
}

htmlize() {
    echo "$1" | sed 's/&/\&amp;/g' | sed 's/</\&lt;/g' | sed 's/>/\&gt;/g'
}

# Usage information
usage() {
    echo "Usage: $0 -v -o -h -r <owner/repo>"
    echo "  -v  Verbose output"
    echo "  -o  Obfuscate email addresses"
    echo "  -h  Convert output to HTML entities"
    echo "  -r  Specify GitHub repository in the format owner/repo"
    exit 1
}

# Initialize variables
verbose=0
obfuscate_flag=0
htmlize_flag=0
repo=""

# Parse command-line options
while getopts "vohr:" opt; do
    case "$opt" in
        v) verbose=1 ;;
        o) obfuscate_flag=1 ;;
        h) htmlize_flag=1 ;;
        r) repo="$OPTARG" ;;
        ?) usage ;;
    esac
done

if [[ -z "$repo" ]]; then
    echo "Error: Repository not specified."
    usage
fi

# Check for necessary commands
for cmd in gh git; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "Error: $cmd is not installed. Please install it to use this script."
        exit 1
    fi
done

# Fetch git log using GitHub CLI
if ! git_log=$(gh api repos/$repo/commits --paginate -q '.[].commit.message'); then
    echo "Failed to fetch git log from GitHub."
    exit 1
fi

# Process git log
declare -a authors=()
declare -a lines=()

IFS=$'\n'
for line in $git_log; do
    if [[ "$line" =~ ^Author:\ (.*)$ ]]; then
        author="${BASH_REMATCH[1]}"
        found=0
        for i in "${!authors[@]}"; do
            if [[ "${authors[i]}" == "$author" ]]; then
                lines[i]=$((lines[i]+1))
                found=1
                break
            fi
        done
        if [[ $found -ne 1 ]]; then
            authors+=("$author")
            lines+=("1")
        fi
    fi
done

# Print results
for i in "${!authors[@]}"; do
    current_author="${authors[i]}"
    count="${lines[i]}"
    [[ $obfuscate_flag -eq 1 ]] && current_author=$(obfuscate "$current_author")
    [[ $htmlize_flag -eq 1 ]] && current_author=$(htmlize "$current_author")
    if [[ $verbose -eq 1 ]]; then
        echo "$current_author: $count lines of diff"
    else
        echo "$current_author"
    fi
done
