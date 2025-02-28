#!/bin/bash

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
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

# Configuration directories
CONFIG_DIR="$HOME/.config"
NVIM_CONFIG_DIR="$CONFIG_DIR/nvim"
NVIM_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvim"
NVIM_AUTOLOAD_DIR="$NVIM_DATA_DIR/site/autoload"
NVIM_PLUGGED_DIR="$NVIM_DATA_DIR/plugged"
BACKUP_DIR="$HOME/.dotfiles.backup.$(date +%Y%m%d_%H%M%S)"

# Install vim-plug
install_vim_plug() {
    log "Installing vim-plug..."
    local plug_file="$NVIM_AUTOLOAD_DIR/plug.vim"

    mkdir -p "$NVIM_AUTOLOAD_DIR"

    if [ ! -f "$plug_file" ]; then
        curl -fLo "$plug_file" --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || \
            error "Failed to install vim-plug"
        log "vim-plug installed successfully"
    else
        log "vim-plug already installed"
    fi
}

# Set up Neovim configuration
setup_nvim() {
    log "Setting up Neovim configuration..."

    # Create necessary directories
    mkdir -p "$NVIM_CONFIG_DIR" "$NVIM_PLUGGED_DIR"

    # Install vim-plug
    install_vim_plug

    # Copy Neovim configurations
    log "Copying Neovim configurations..."
    cp -r .config/nvim/* "$NVIM_CONFIG_DIR/" || error "Failed to copy Neovim configurations"

    # Install plugins non-interactively
    log "Installing Neovim plugins..."
    nvim --headless +PlugInstall +qa || warn "Plugin installation completed with warnings"

    # Setup CoC configuration directory
    mkdir -p "$HOME/.config/coc/extensions"
    cd "$HOME/.config/coc/extensions"
    if [ ! -f package.json ]; then
        echo '{"dependencies":{}}' > package.json
    fi
}

# Backup existing configurations
backup_configs() {
    log "Creating backup of existing configurations..."
    mkdir -p "$BACKUP_DIR"

    # List of files to backup
    local files=(".zshrc" ".tmux.conf" ".config/nvim")

    for file in "${files[@]}"; do
        local full_path="$HOME/$file"
        if [ -e "$full_path" ]; then
            log "Backing up $file"
            cp -R "$full_path" "$BACKUP_DIR/"
        fi
    done
}

# Main installation function
main() {
    log "Starting dotfiles installation..."

    backup_configs
    setup_nvim

    log "Installation completed successfully!"
    log "Please restart your terminal for changes to take effect."
    log "Run ./test_setup.sh to verify the installation."
}

# Run main installation
main