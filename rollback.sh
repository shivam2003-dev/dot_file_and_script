#!/bin/bash

set -e

# Find latest backup
BACKUP_DIR=$(ls -td $HOME/.dotfiles.backup.* | head -1)

if [ -z "$BACKUP_DIR" ]; then
    echo "No backup directory found!"
    exit 1
fi

echo "Rolling back to backup in $BACKUP_DIR"

# Restore files if they exist in backup
restore_if_exists() {
    if [ -e "$BACKUP_DIR/$(basename $1)" ]; then
        echo "Restoring $1"
        cp -R "$BACKUP_DIR/$(basename $1)" "$1"
    fi
}

restore_if_exists "$HOME/.zshrc"
restore_if_exists "$HOME/.tmux.conf"
restore_if_exists "$HOME/.config/nvim"

echo "Rollback complete! Please restart your terminal."
