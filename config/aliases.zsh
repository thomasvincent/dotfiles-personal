#!/usr/bin/env zsh

# Description: Custom aliases for Zsh optimized for macOS with an emphasis on DevOps and security.
# Repository: https://github.comthomasvincent/dotfiles-personal
# Author: Thomas Vincent
# Date: 2023-10-07

# -*- mode: sh -*-
# General Utilities
# Contains aliases for general system utilities and operations.
alias ll='ls -lahG'  # Detailed list view, showing hidden files

# Git Commands
# Shortcuts for frequent git operations such as status, commit, and push.
if (( $+commands[git] )); then
  alias gs='git status'           # Show the working tree status
  alias gc='git commit'           # Record changes to the repository
  alias gp='git push'             # Update remote refs along with associated objects
  alias gl='git pull'             # Fetch from and integrate with another repository or a local branch
  alias gco='git checkout'        # Switch branches or restore working tree files
  alias gb='git branch'           # List, create, or delete branches
  alias ga='git add'              # Add file contents to the index
  alias gd='git diff'             # Show changes between commits, commit and working tree, etc
  alias gpr='git pull --rebase'   # Rebase current branch on pull
  alias gca='git commit -a'       # Automatically stage all tracked, modified files before the commit
  alias gcam='git commit -am'     # Add and commit with a message
  alias glog='git log --oneline --decorate --graph'  # Pretty git logs
fi

# GitHub CLI
# Utilize `gh` for streamlined interactions with GitHub.
if (( $+commands[gh] )); then
  alias ghpr='gh pr list'                # List and filter pull requests in this repository
  alias ghprc='gh pr create'             # Create a pull request
  alias ghprv='gh pr view'               # View a pull request
  alias ghi='gh issue list'              # List and filter issues in this repository
  alias ghic='gh issue create'           # Create an issue
  alias ghiv='gh issue view'             # View an issue
  alias ghrepo='gh repo view'            # View repository details
  alias ghrepoa='gh repo clone'          # Clone a repository
  alias ghrepol='gh repo list'           # List repositories viewable by the user
fi

# Kubernetes
# Kubernetes command line tool `kubectl` aliases.
if (( $+commands[kubectl] )); then
  alias k='kubectl'                      # Shortcut for kubectl
  alias kx='kubectl exec -it'            # Execute commands in a container
  alias kd='kubectl describe'            # Describe resources
  alias kgp='kubectl get pods'           # Get information about all pods
  alias kgs='kubectl get svc'            # Get information about all services
  alias kgn='kubectl get nodes'          # Get information about all nodes
fi

# Docker
# Docker management shortcuts.
if (( $+commands[docker] )); then
  alias dk='docker'                      # Main Docker command
  alias dkb='docker build'               # Build an image from a Dockerfile
  alias dkr='docker run'                 # Run a command in a new container
  alias dkp='docker ps'                  # List containers
  alias dki='docker images'              # List images
  alias dklogs='docker logs'             # Fetch the logs of a container
  alias dke='docker exec -it'            # Execute an interactive command in a container
  alias dkc='docker compose'             # Run docker-compose commands
fi

# Terraform (HashiCorp)
# Manage infrastructure as code with simple command line shortcuts.
if (( $+commands[terraform] )); then
  alias tf='terraform'                   # Main Terraform command
  alias tfi='terraform init'             # Initialize a Terraform working directory
  alias tfp='terraform plan'             # Generate and show an execution plan
  alias tfa='terraform apply'            # Builds or changes infrastructure
  alias tfd='terraform destroy'          # Destroy Terraform-managed infrastructure
  alias tfo='terraform output'           # Read an output from a state file
  alias tff='terraform fmt'              # Rewrites config files to canonical format
  alias tfv='terraform validate'         # Validates the Terraform files
fi

# Vault (HashiCorp)
# Manage secrets and protects sensitive data.
if (( $+commands[vault] )); then
  alias vt='vault'                       # Main Vault command
  alias vts='vault status'               # Print seal and HA status
  alias vtsv='vault server -dev'         # Start a development server
  alias vtw='vault write'                # Write data to Vault
  alias vtr='vault read'                 # Read data from Vault
  alias vtd='vault delete'               # Delete data from Vault
fi

# Consul (HashiCorp)
# Consul service mesh solution shortcuts.
if (( $+commands[consul] )); then
  alias cl='consul'                      # Main Consul command
  alias clk='consul kv put'              # Put a new key/value pair
  alias clkg='consul kv get'             # Retrieve the value of a key
  alias clp='consul peers'               # List the members of the consul cluster
fi

# Packer (HashiCorp)
# Build automated machine images.
if (( $+commands[packer] )); then
  alias pk='packer'                      # Main Packer command
  alias pkb='packer build'               # Build images from a template
fi

# End of aliases.zsh
