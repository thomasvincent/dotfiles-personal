# Go development
if which go &> /dev/null; then
    export GOPATH=$HOME/go
    export PATH="$PATH:$GOPATH/bin"
    if [ -f "$GOPATH/bin/godev" ]; then
        source "$GOPATH/bin/godev"
    fi
fi

# Java development
if which java &> /dev/null; then
    export JAVA_HOME=$(/usr/libexec/java_home)
    export PATH="$PATH:$JAVA_HOME/bin"
fi

# Ruby development
if which ruby &> /dev/null; then
    export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
    if [ -f "$HOME/.gemrc" ]; then
        source "$HOME/.gemrc"
    fi
fi

# Python development
if which python3 &> /dev/null; then
    export PATH="$PATH:$HOME/.local/bin"
    if [ -f "$HOME/.pythonrc" ]; then
        source "$HOME/.pythonrc"
    fi
fi

# Shell development
if [ -f "$HOME/.shellrc" ]; then
    source "$HOME/.shellrc"
fi

# Add tab completion for many zsh commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/share/zsh/site-functions/_brew" ]; then
    # Ensure existing Homebrew v1 completions continue to work
    fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
    autoload -Uz _brew
elif [ -f /usr/local/share/zsh/site-functions/_brew ]; then
    fpath=(/usr/local/share/zsh/site-functions $fpath)
    autoload -Uz _brew
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
    compdef _git g
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
if [ -e "$HOME/.ssh/config" ]; then
    hosts=($(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n'))
    compdef _ssh $hosts
fi
