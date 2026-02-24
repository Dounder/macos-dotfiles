#!/usr/bin/env zsh

# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"


# =============================================================================
# .zshrc Configuration
# =============================================================================

# Oh My Zsh Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"

# Plugin Configuration
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    you-should-use
    docker
    docker-compose
    npm
    yarn
    bun
    fnm
    flutter
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# =============================================================================
# Environment Variables
# =============================================================================

# Node.js (fnm)
eval "$(fnm env --use-on-cd --shell zsh)"

# Flutter & Dart
export PATH="$HOME/flutter/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"
export FLUTTER_ROOT="$HOME/flutter"
# Chrome for Flutter web
export CHROME_EXECUTABLE="/Applications/Arc.app/Contents/MacOS/Arc"

# Java
export JAVA_HOME="/opt/homebrew/Cellar/openjdk@17/17.0.17/libexec/openjdk.jdk/Contents/Home"

# Docker
export COMPOSE_BAKE=true

# History configuration
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$HOME/.zsh_history"
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# =============================================================================
# Basic Aliases
# =============================================================================

# System
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -la --color=auto'
alias grep='grep --color=auto'
alias cl='clear'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Configuration
alias ec="zed $HOME/.dotfiles/.zshrc"
alias sc="source $HOME/.zshrc"
alias reload="exec zsh"
alias aec="zed $HOME/.dotfiles/aerospace.toml"

# Applications
alias lzd="lazydocker"

# =============================================================================
# Git Aliases
# =============================================================================

# Basic Git Aliases
# Basic Git Aliases
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpp='git pull'
alias gpo='git push origin'
alias gpom='git push origin main'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gbd='git branch -d'
alias gm='git merge'
alias gl='git log --oneline'
alias gd='git diff'
alias gds='git diff --staged'


# Advanced Git Aliases
alias gbalocal="git branch -l | grep -v -E '(prod|main|dev|develop|staging|HEAD)' | sed 's/ origin\///'"
alias gclearlocal="git branch -l | grep -v -E '(prod|main|dev|develop|staging|HEAD)' | sed 's/ origin\///' | xargs -n 1 git branch -D"
alias gbaorigin="git branch -r | grep -v -E '(origin/prod|origin/main|origin/dev|origin/develop|origin/staging|origin/HEAD)' | sed 's/origin\///'"
alias gclearorigin="git branch -r | grep -v -E '(origin/prod|origin/main|origin/dev|origin/develop|origin/staging|origin/HEAD)' | sed 's/origin\///' | xargs -n 1 git push origin --delete"

# =============================================================================
# Docker Aliases
# =============================================================================

alias d='docker'
alias dc='docker compose'
alias dup='docker compose up'
alias ddown='docker compose down'
alias dps='docker container ls'
alias dpsa='docker container ls -a'
alias di='docker images'
alias dprune='docker system prune -af'

# =============================================================================
# Package Manager Aliases
# =============================================================================

alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install -g'
alias nr='npm run'
alias ns='npm start'
alias nt='npm test'
alias nb='npm run build'

alias yi='yarn install'
alias ya='yarn add'
alias yad='yarn add --dev'
alias yr='yarn run'
alias ys='yarn start'
alias yt='yarn test'
alias yb='yarn build'

alias pi='pnpm install'
alias pa='pnpm add'
alias pad='pnpm add -D'
alias pr='pnpm run'
alias ps='pnpm start'
alias pt='pnpm test'
alias pb='pnpm build'

# Update all package managers
alias @update='npm i -g npm yarn pnpm bun && brew update && brew upgrade'
alias brewup="brew update && brew upgrade && brew cleanup"

# =============================================================================
# Utility Functions
# =============================================================================

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract various archive formats
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Find process by name
findproc() {
    ps aux | grep -i "$1" | grep -v grep
}

# Kill process by name
killproc() {
    pkill -f "$1"
}

# =============================================================================
# SSH & Git Management Functions
# =============================================================================

# Start SSH agent on shell startup
init_ssh_agent()

# Initialize SSH agent environment (run on shell startup)
init_ssh_agent() {
    local agent_env="$HOME/.ssh/agent-environment"

    # Try to load existing agent environment
    if [[ -f "$agent_env" ]]; then
        source "$agent_env" >/dev/null
    fi

    # Check if the loaded agent is still running
    if ! ssh-add -l >/dev/null 2>&1; then
        # Start new agent and save environment
        echo "🔄 Initializing SSH agent..."
        ssh-agent -s > "$agent_env"
        source "$agent_env" >/dev/null
        echo "✅ SSH agent initialized"
    fi
}

# Function to ensure SSH agent is running and add a specific key
start_ssh_agent() {
    local key_path="$1"

    if [[ -z "$key_path" ]]; then
        echo "Usage: start_ssh_agent <path_to_ssh_key>"
        return 1
    fi

    # Check if key file exists
    if [[ ! -f "$key_path" ]]; then
        echo "SSH key not found at $key_path"
        return 1
    fi

    # Check if ssh-agent is accessible and running
    if ! ssh-add -l >/dev/null 2>&1; then
        # No agent running or not accessible, start a new one
        echo "🔄 Starting SSH agent..."
        eval "$(ssh-agent -s)"

        # Export the agent info for the current session
        export SSH_AGENT_PID
        export SSH_AUTH_SOCK
    else
        echo "🔑 Using existing SSH agent"
    fi

    # Get the key fingerprint for comparison
    local key_fingerprint
    key_fingerprint=$(ssh-keygen -lf "$key_path" 2>/dev/null | awk '{print $2}')

    if [[ -z "$key_fingerprint" ]]; then
        echo "❌ Could not read key fingerprint from $key_path"
        return 1
    fi

    # Check if key is already added
    if ssh-add -l 2>/dev/null | grep -q "$key_fingerprint"; then
        echo "✅ Key already loaded: $(basename "$key_path")"
    else
        # Add the key
        if ssh-add "$key_path" 2>/dev/null; then
            echo "✅ Added key: $(basename "$key_path")"
        else
            echo "❌ Failed to add key: $key_path"
            return 1
        fi
    fi
}

# Function to configure git for work
workgit() {
    start_ssh_agent "$HOME/.ssh/work"

    if git rev-parse --is-inside-work-tree &>/dev/null; then
        git config user.name "dr.glasdou"
        git config user.email "daramirez@disagro.com"

        echo "✅ Git configured for WORK environment"
        echo "📧 Name: $(git config user.name)"
        echo "📧 Email: $(git config user.email)"
    else
        echo "⚠️  Not in a git repository. SSH key added but git config not changed."
    fi
}

# Function to configure git for personal use
personalgit() {
    start_ssh_agent "$HOME/.ssh/personal"

    if git rev-parse --is-inside-work-tree &>/dev/null; then
        git config user.name "dr.glasdou"
        git config user.email "dr.glasdou@gmail.com"

        echo "✅ Git configured for PERSONAL environment"
        echo "📧 Name: $(git config user.name)"
        echo "📧 Email: $(git config user.email)"
    else
        echo "⚠️  Not in a git repository. SSH key added but git config not changed."
    fi
}

# Function to load both SSH keys
gitall() {
    start_ssh_agent "$HOME/.ssh/work"
    start_ssh_agent "$HOME/.ssh/personal"

    echo "🔑 Both SSH keys loaded"
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        echo "📧 Current Git config:"
        echo "   Name: $(git config user.name)"
        echo "   Email: $(git config user.email)"
    fi
}

# Show current git configuration
gitconfig() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        echo "📧 Current repository Git config:"
        echo "   Name: $(git config user.name)"
        echo "   Email: $(git config user.email)"
        echo "🌐 Global Git config:"
        echo "   Name: $(git config --global user.name)"
        echo "   Email: $(git config --global user.email)"
    else
        echo "⚠️  Not in a git repository"
        echo "🌐 Global Git config:"
        echo "   Name: $(git config --global user.name)"
        echo "   Email: $(git config --global user.email)"
    fi
}

# Show SSH agent status and loaded keys
sshstatus() {
    if ssh-add -l >/dev/null 2>&1; then
        echo "🔑 SSH Agent Status: Running"
        echo "📋 Loaded keys:"
        ssh-add -l | while read -r line; do
            echo "   • $line"
        done
    else
        echo "❌ SSH Agent Status: Not running or no keys loaded"
    fi

    echo ""
    echo "🌐 Environment variables:"
    echo "   SSH_AGENT_PID: ${SSH_AGENT_PID:-'not set'}"
    echo "   SSH_AUTH_SOCK: ${SSH_AUTH_SOCK:-'not set'}"
}

# =============================================================================
# Development Shortcuts
# =============================================================================

# Quick project navigation (customize these paths)
alias dev="cd ~/dev"

# Flutter shortcuts
alias frun='flutter run'
alias fbuild='flutter build'
alias ftest='flutter test'
alias fclean='flutter clean'
alias fpub='flutter pub get'

# =============================================================================
# Terminal Integration & Completions
# =============================================================================

# Angular CLI autocompletion
if command -v ng &> /dev/null; then
    source <(ng completion script)
fi

# VSCode Shell Integration
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# Go Lang
export PATH="$HOME/go/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
