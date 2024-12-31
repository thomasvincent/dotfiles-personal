# ~/.bash_aliases - File for user-defined aliases

# General aliases
alias ll='ls -alF'  # List with detailed view and file types
alias la='ls -A'    # List all except '.' and '..'
alias l='ls -CF'    # List with column view

# Git aliases
alias gs='git status'      # Show the current Git status
alias gd='git diff'        # Show Git changes
alias gc='git commit'      # Commit changes
alias gca='git commit --amend' # Amend the last commit
alias gl='git log --oneline --graph --decorate' # Compact Git log
alias gp='git pull'        # Pull latest changes from remote
alias gpu='git push'       # Push changes to remote

# Docker and Kubernetes shortcuts
alias dc='docker-compose'  # Shortcut for docker-compose commands
alias k='kubectl'          # Shortcut for Kubernetes CLI

# Other utilities
alias tf='terraform'       # Shortcut for Terraform
alias venv='python3 -m venv .venv && source .venv/bin/activate' # Create and activate virtual environments
alias chez='chezmoi'       # Shortcut for Chezmoi dotfile manager
