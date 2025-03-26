# Brewfile: Optimized for macOS Development, Genealogy, Security, AppleScript Development

# Taps (Third-party package repositories)
tap "homebrew/cask"          # For GUI applications
tap "homebrew/cask-fonts"    # For fonts
tap "homebrew/core"          # Ensure core tap is included
tap "hashicorp/tap"          # HashiCorp products (Terraform, Vault, etc.)
tap "mongodb/brew"           # MongoDB database server
tap "exercism/cli"           # Exercism coding challenges
tap "jenkins-x/jx"           # Jenkins X
tap "homebrew/bundle"        # Homebrew bundle

# macOS Essentials & Shell
brew "git"                    # Version control system (GitHub's foundation)
brew "gh"                     # GitHub command-line tool
brew "hub"                    # Extended Git CLI with GitHub integration
brew "git-lfs"                # Git Large File Storage (for large assets in repos)
brew "gnu-sed"                # GNU version of `sed` for compatibility
brew "coreutils"              # GNU core utilities (ls, cp, etc.)
brew "watchman"               # File watching service (used by some development tools)
brew "openssh"                # Latest OpenSSH for secure shell connections
brew "zsh"                    # Zsh shell

# Shell Enhancements (Focus on zsh as it's popular with macOS users)
brew "zsh-autosuggestions"    # Autosuggestions for zsh
brew "zsh-completions"        # Additional completion definitions for zsh
brew "zsh-history-substring-search" # Zsh port of Fish's history search (Ctrl+R)
brew "zsh-syntax-highlighting" # Syntax highlighting for Zsh

# Version Management (Prioritize asdf, common on GitHub)
brew "asdf"                    # asdf version manager (universal)

# Programming Languages & Environments
brew "python@3.12"             # Python 3.12
brew "go"                      # Go Programming Language
brew "node"                    # Node.js
brew "openjdk@21"              # OpenJDK 21
brew "perl"                    # Perl scripting language
brew "ruby"                    # Ruby programming language
brew "rust"                    # Rust programming language

# Build Tools & Package Managers (Focused on languages in use)
brew "gradle"                  # Gradle build automation tool
brew "maven"                   # Maven build automation tool (for Java projects)

# Cloud & DevOps Tools (GitHub Actions & popular cloud providers)
brew "awscli"                  # AWS Command Line Interface (for general AWS interaction)
brew "azure-cli"               # Azure Command Line Interface
brew "doctl"                   # DigitalOcean Command Line Interface
brew "terraform"               # Infrastructure as Code (IaC) tool
brew "tfsec"                   # Terraform security scanner
brew "act"                     # Run GitHub Actions locally
brew "ansible"                 # Ansible automation tool
brew "aws-sam-cli"             # AWS Serverless Application Model CLI
brew "google-cloud-sdk"        # Google Cloud SDK

# Databases and Server Software via Docker
# These will be run using Docker Desktop
# MongoDB, PostgreSQL, and Redis examples provided below:

# MongoDB
# docker run -d --name mongodb -p 27017:27017 -v mongodbdata:/data/db mongo:latest

# PostgreSQL
# docker run -d --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -v pgdata:/var/lib/postgresql/data postgres:14

# Redis
# docker run -d --name redis -p 6379:6379 redis:latest

# Productivity & Utilities
brew "aspell"                  # Spell checker
brew "bat"                     # Cat(1) clone with syntax highlighting
brew "direnv"                  # Load/unload environment variables based on directory
brew "dive"                    # Docker image exploration tool
brew "duplicity"               # Encrypted backup software
brew "fd"                      # Simple, fast, and user-friendly find alternative
brew "fish"                    # Friendly interactive shell
brew "fzf"                     # Fuzzy finder
brew "git-extras"              # Additional Git utilities
brew "git-secrets"             # Prevents you from committing secrets and credentials into git repositories
brew "gnupg"                   # GNU Privacy Guard
brew "grafana"                 # Observability and data visualization platform
brew "htop"                    # Interactive process viewer
brew "httpie"                  # User-friendly HTTP client
brew "iperf3"                  # Network bandwidth measurement tool
brew "jq"                      # Command-line JSON processor
brew "mas"                     # Mac App Store command-line interface
brew "nmap"                    # Network scanner
brew "neovim"                  # Vim-based text editor
brew "newrelic-cli"            # New Relic CLI for interacting with New Relic
brew "packer"                  # Machine image creation tool
brew "podman"                  # Daemonless container engine
brew "powerlevel10k"           # Zsh theme
brew "prettier"                # Code formatter
brew "prometheus"              # Monitoring and alerting toolkit
brew "restic"                  # Secure backup program
brew "shellcheck"              # Static analysis tool for shell scripts
brew "thefuck"                 # Corrects your previous console command
brew "tmux"                    # Terminal multiplexer
brew "tree"                    # Display directories as trees
brew "trivy"                   # Simple and comprehensive vulnerability scanner for containers
brew "watch"                   # Executes a program periodically, showing output fullscreen
brew "wget"                    # File downloader
brew "wrk"                     # HTTP benchmarking tool
brew "zinit"                   # Zsh plugin manager
brew "zoxide"                  # Faster way to navigate your filesystem
brew "aws-vault"               # A vault for securely storing and accessing AWS credentials in macOS Keychain
brew "chezmoi"                 # Manage your dotfiles across multiple machines

# Genealogy Tools
brew "gramps"                  # Genealogy software
brew "gedit"                   # GEDCOM utilities

# Security Tools
brew "wireshark"               # Network protocol analyzer
brew "openvas"                 # Open-source vulnerability scanner
brew "metasploit"              # Penetration testing framework
brew "hashicorp/tap/vault"     # HashiCorp Vault
brew "keepassxc"               # Cross-platform password manager

# Idiomatic macOS Tools
brew "hammerspoon"             # Powerful automation tool using Lua scripting
brew "bettertouchtool"         # Customize input devices
brew "karabiner-elements"      # Powerful keyboard customizer
brew "cheatsheet"              # Display all keyboard shortcuts of the active application
brew "rectangle"               # Window management tool

# AppleScript Development Tools
brew "script-debugger"         # IDE for AppleScript
brew "bbedit"                  # Text editor with excellent AppleScript support

# Casks (GUI Applications, often used in conjunction with GitHub)
cask "corelocationcli"         # Core Location CLI
cask "discord"                 # Discord chat application
cask "docker"                  # Docker Desktop
cask "firefox"                 # Mozilla Firefox web browser
cask "google-chrome"           # Google Chrome web browser
cask "brave-browser"           # Brave web browser
cask "microsoft-edge"          # Microsoft Edge web browser
cask "font-hack-nerd-font"     # Hack Nerd Font
cask "font-jetbrains-mono-nerd-font" # JetBrains Mono Nerd Font
cask "github"                  # GitHub Desktop client
cask "intellij-idea"           # IntelliJ IDEA Ultimate
cask "intellij-idea-ce"        # IntelliJ IDEA Community
cask "pycharm"                 # PyCharm Professional
cask "pycharm-ce"              # PyCharm Community
cask "webstorm"                # WebStorm
cask "goland"                  # GoLand
cask "clion"                   # CLion
cask "rider"                   # Rider
cask "phpstorm"                # PhpStorm
cask "iterm2"                  # iTerm2 terminal emulator (popular with macOS users)
cask "jetbrains-toolbox"       # JetBrains Toolbox App
cask "multipass"               # Multipass VM manager
cask "notion"                  # Notion productivity app
cask "obsidian"                # Obsidian note-taking app (for documentation)
cask "raycast"                 # Spotlight replacement (productivity tool)
cask "sourcetree"              # Git GUI client
cask "tableplus"               # TablePlus database GUI
cask "visual-studio-code"      # Visual Studio Code IDE
cask "warp"                    # Warp terminal (modern alternative)
cask "whatsapp"                # WhatsApp Desktop
cask "zed"                     # Zed code editor
cask "hammerspoon"             # Automation tool for macOS
cask "bettertouchtool"         # Customize input devices
cask "karabiner-elements"      # Powerful keyboard customizer
cask "cheatsheet"              # Display all keyboard shortcuts of the active application
cask "rectangle"               # Window management tool

# Omni Apps
mas "OmniFocus", id: 1346203938
mas "OmniGraffle", id: 1142578753
mas "OmniOutliner", id: 1142578772
mas "OmniPlan", id: 1460319993

# Mac App Store apps
mas "Alfred", id: 405843582
mas "Bear", id: 1091189122
mas "Fantastical", id: 975937182
mas "Gitfox", id: 1475511261
mas "Magnet", id: 441258766
mas "MindNode", id: 1289197285
mas "Slack", id: 803453959
mas "Smart Tasks", id: 1498145730
mas "Todoist", id: 585829637
mas "Transmit", id: 403388562
mas "Ulysses", id: 1225570693
mas "Xcode", id: 497799835

# VS Code Extensions (Refactored and Language-Specific)
vscode "bmewburn.vscode-intelephense-client"  # PHP Intellisense
vscode "dart-code.dart-code"                  # Dart & Flutter support
vscode "golang.go"                            # Go support
vscode "ms-python.python"                     # Python extension
vscode "ms-python.vscode-pylance"             # Enhanced Python linting and type checking
vscode "dsznajder.es7-react-js-snippets"      # ES7 React/Redux/GraphQL/React-Native snippets
vscode "ecmel.vscode-html-css"                # HTML and CSS support
vscode "github.copilot"                       # GitHub Copilot
vscode "github.copilot-chat"                  # GitHub Copilot Chat
vscode "github.vscode-github-actions"         # GitHub Actions
vscode "ms-azuretools.vscode-docker"          # Docker tools
vscode "ms-python.debugpy"                    # Python debugging
vscode "ms-vscode-remote.remote-containers"   # Remote Containers
vscode "ms-vscode.cmake-tools"                # CMake tools
vscode "ms-vscode.cpptools"                   # C++ tools
vscode "ms-vscode.cpptools-extension-pack"    # C++ extension pack
vscode "ms-vscode.cpptools-themes"            # C++ themes
vscode "ms-vscode.makefile-tools"             # Makefile tools
vscode "ms-vscode.powershell"                 # PowerShell support
vscode "redhat.java"                          # Java support
vscode "rust-lang.rust-analyzer"              # Rust language support
vscode "shopify.ruby-lsp"                     # Ruby LSP support
vscode "vscjava.vscode-java-pack"             # Java Extension Pack
vscode "vue.volar"                            # Vue.js support
vscode "ms-kubernetes-tools.vscode-kubernetes-tools" # Kubernetes tools

# Jenkins X Setup
brew "jx"  # Jenkins X

# Kubernetes and Docker Integration
brew "kubectl" # Kubernetes CLI
brew "kustomize" # Kubernetes native configuration management
brew "helm" # Kubernetes package manager
# Use Docker Desktop's built-in Kubernetes support
