#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Logger functions
log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

error() {
    echo -e "${RED}[ERROR] $1${NC}"
    exit 1
}

warn() {
    echo -e "${YELLOW}[WARNING] $1${NC}"
}

# Find latest backup
find_latest_backup() {
    local backup_dir=$(ls -td "$HOME"/.dotfiles.backup.* 2>/dev/null | head -1)
    if [ -z "$backup_dir" ]; then
        error "No backup directory found!"
    fi
    echo "$backup_dir"
}

# Restore a file from backup
restore_file() {
    local backup_dir="$1"
    local file="$2"
    local target="$3"

    if [ -e "$backup_dir/$file" ]; then
        log "Restoring $target"
        rm -rf "$target"
        cp -R "$backup_dir/$file" "$target"
    else
        warn "No backup found for $target"
    fi
}

# Main rollback function
main() {
    log "Starting rollback process..."

    local backup_dir=$(find_latest_backup)
    log "Rolling back to backup in $backup_dir"

    # Restore configurations
    restore_file "$backup_dir" ".zshrc" "$HOME/.zshrc"
    restore_file "$backup_dir" ".tmux.conf" "$HOME/.tmux.conf"
    restore_file "$backup_dir" "nvim" "$HOME/.config/nvim"

    log "Rollback completed successfully!"
    log "Please restart your terminal for changes to take effect."
}

# Run main rollback
main