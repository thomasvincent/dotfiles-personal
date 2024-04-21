#!/bin/zsh
# -*- mode: sh -*-
# functions.zsh - Custom functions for Zsh optimized for macOS

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_" || return
}

# Change working directory to the top-most Finder window location
function cdf() {
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')" || return
}

# Create a .tar.gz archive using best available compressor
function targz() {
  local tmp_file="${@%/}.tar"
  tar -cvf "${tmp_file}" --exclude=".DS_Store" "${@}" || return 1
  local compressor=$(command -v pigz || command -v gzip)
  echo "Compressing .tar using \`${compressor}\`…"
  $compressor "${tmp_file}" || return 1
  [ -f "${tmp_file}" ] && rm "${tmp_file}"
  echo "${tmp_file}.gz created successfully."
}

# Determine size of a file or total size of a directory
function fs() {
  du -sh "${@:-.}"  # Default to current directory if no argument given
}

# Use Git's colored diff when available
if (( $+commands[git] )); then
  function diff() {
    git diff --no-index --color-words "$@"
  }
fi

# Create a data URL from a file
function dataurl() {
  local mime_type=$(file -b --mime-type "$1")
  mime_type+=";charset=utf-8"
  echo "data:${mime_type};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Start an HTTP server from a directory, specifying the port
function server() {
  local port="${1:-8000}"
  sleep 1 && open "http://localhost:${port}/" &
  python3 -m http.server --bind localhost "${port}"
}

# Start a PHP server from a directory, specifying the port
function php_server() {
  local port="${1:-4000}"
  local ip=$(ipconfig getifaddr en1 || echo "127.0.0.1")
  sleep 1 && open "http://${ip}:${port}/" &
  php -S "${ip}:${port}"
}

# Compare original and gzipped file size
function gz() {
  local orig_size=$(stat -f "%z" "$1")
  local gzip_size=$(gzip -c "$1" | wc -c)
  local ratio=$(echo "scale=2; $gzip_size * 100 / $orig_size" | bc)
  printf "orig: %d bytes\ngzip: %d bytes (%2.2f%%)\n" "$orig_size" "$gzip_size" "$ratio"
}

# Run `dig` and display the most useful info
function digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}

# Show all the names (CNs and SANs) listed in the SSL certificate for a given domain
function get_cert_names() {
  if [[ -z "${1}" ]]; then
    echo "ERROR: No domain specified."
    return 1
  fi
  local domain="${1}"
  local output=$(echo | openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1)
  if [[ "${output}" =~ "BEGIN CERTIFICATE" ]]; then
    echo "${output}" | openssl x509 -text | grep -A1 "Subject Alternative Name:"
  else
    echo "No valid certificate received."
    return 1
  fi
}

# Homebrew management functions
function brew_update() {
  brew update && brew upgrade && brew cleanup
}

function brew_search() {
  brew search "$@"
}

function brew_install() {
  brew install "$@"
}

function brew_uninstall() {
  brew uninstall "$@"
}
