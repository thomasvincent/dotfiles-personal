# ~/.bashrc - Main bash configuration file for non-login shells

# Source aliases if the file exists
[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"

# Source functions if the file exists
[ -f "$HOME/.bash_functions" ] && source "$HOME/.bash_functions"

# Source exported variables if the file exists
[ -f "$HOME/.bash_exports" ] && source "$HOME/.bash_exports"

# Source custom prompt settings if the file exists
[ -f "$HOME/.bash_prompt" ] && source "$HOME/.bash_prompt"

# Source tab completion settings if the file exists
[ -f "$HOME/.bash_completion" ] && source "$HOME/.bash_completion"

# Configure history behavior
shopt -s histappend  # Append to the history file, don’t overwrite it
PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND:-}"

# Add common directories to PATH
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Enable advanced shell options for better usability
for option in nocaseglob cdspell autocd globstar; do
    shopt -s "$option" 2>/dev/null || true
done

# Platform detection (Linux or macOS)
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*) platform="Linux" ;;
    Darwin*) platform="Mac" ;;
    *) platform="UNKNOWN:${unameOut}" ;;
esac
