# ~/.bash_functions - File for user-defined functions

# cdp: Change directory to a specific project
# Usage: cdp <project_name>
cdp() {
    if [ -z "$1" ]; then
        echo "Usage: cdp <project_name>" >&2
        return 1
    fi
    if [ ! -d "$HOME/projects" ]; then
        echo "Projects directory not found: $HOME/projects" >&2
        return 1
    fi
    cd "$HOME/projects/$1" || echo "Project not found: $1" >&2
}

# docker-cleanup: Remove unused Docker objects
docker-cleanup() {
    docker container prune -f
    docker image prune -f
    docker volume prune -f
    docker network prune -f
}

# kctx: Switch Kubernetes context
# Usage: kctx <context_name>
kctx() {
    if [ -z "$1" ]; then
        echo "Available contexts:"
        kubectl config get-contexts
        return
    fi
    kubectl config use-context "$1" || echo "Failed to switch context to $1" >&2
}

# gclone: Clone a Git repository and navigate into its directory
# Usage: gclone <repository_url>
gclone() {
    git clone "$1" && cd "$(basename "$1" .git)" || return
}
