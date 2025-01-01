# ~/.zshrc - Main Zsh configuration file

# Source aliases if the file exists
[ -f "$HOME/.zsh_aliases" ] && source "$HOME/.zsh_aliases"

# Source functions if the file exists
[ -f "$HOME/.zsh_functions" ] && source "$HOME/.zsh_functions"

# Source exported variables if the file exists
[ -f "$HOME/.zsh_exports" ] && source "$HOME/.zsh_exports"

# Source custom prompt settings if the file exists
[ -f "$HOME/.zsh_prompt" ] && source "$HOME/.zsh_prompt"

# Source tab completion settings if the file exists
[ -f "$HOME/.zsh_completion" ] && source "$HOME/.zsh_completion"

# Configure history behavior
HISTSIZE=5000                        # Maximum number of history entries
SAVEHIST=5000                        # Number of entries to save to disk
HISTFILE="$HOME/.zsh_history"        # Location of history file
setopt APPEND_HISTORY                # Append history to the file
setopt SHARE_HISTORY                 # Share history across sessions
setopt INC_APPEND_HISTORY            # Add commands to history immediately
setopt HIST_IGNORE_DUPS              # Ignore duplicate commands
setopt HIST_REDUCE_BLANKS            # Remove unnecessary blanks

# Add common directories to PATH
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Enable advanced shell options for better usability
setopt NO_CASE_GLOB                  # Case-insensitive globbing
setopt
