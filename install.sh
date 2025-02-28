#!/bin/bash

set -e

BACKUP_DIR="$HOME/.dotfiles.backup.$(date +%Y%m%d_%H%M%S)"
CONFIG_DIR="$HOME/.config"
NVIM_AUTOLOAD_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload"
NVIM_PLUGIN_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/plugged"
FONT_DIR="$HOME/.local/share/fonts"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Backup existing configurations
backup_if_exists() {
    if [ -e "$1" ]; then
        echo "Backing up $1"
        cp -R "$1" "$BACKUP_DIR/"
    fi
}

backup_if_exists "$HOME/.zshrc"
backup_if_exists "$HOME/.tmux.conf"
backup_if_exists "$HOME/.config/nvim"

# Create necessary directories
mkdir -p "$CONFIG_DIR/nvim"
mkdir -p "$NVIM_AUTOLOAD_DIR"
mkdir -p "$NVIM_PLUGIN_DIR"
mkdir -p "$FONT_DIR"

# Install fonts
echo "Installing Nerd Fonts..."
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"
FONT_ZIP="/tmp/JetBrainsMono.zip"
curl -fLo "$FONT_ZIP" "$FONT_URL"
if [ $? -ne 0 ]; then
    echo "Failed to download JetBrainsMono font"
    exit 1
fi

unzip -o "$FONT_ZIP" -d "$FONT_DIR"
if [ $? -ne 0 ]; then
    echo "Failed to unzip font files"
    exit 1
fi
rm "$FONT_ZIP"
fc-cache -fv

# Install Oh-My-Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh-My-Zsh..."
    RUNZSH=no CHSH=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install vim-plug for Neovim
echo "Installing vim-plug..."
if [ ! -f "$NVIM_AUTOLOAD_DIR/plug.vim" ]; then
    curl -fLo "$NVIM_AUTOLOAD_DIR/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    if [ $? -ne 0 ]; then
        echo "Failed to download vim-plug"
        exit 1
    fi
    echo "vim-plug installed successfully"
else
    echo "vim-plug already installed"
fi

# Copy configurations
echo "Installing configurations..."
cp .zshrc "$HOME/.zshrc"
cp .tmux.conf "$HOME/.tmux.conf"
cp -r .config/nvim/* "$CONFIG_DIR/nvim/"
cp .config/aliases.sh "$CONFIG_DIR/"

# Verify tmux configuration
if ! command -v tmux >/dev/null 2>&1; then
    echo "Error: tmux is not installed"
    exit 1
fi

# Test tmux configuration
echo "Testing tmux configuration..."
tmux new-session -d -s test
if [ $? -ne 0 ]; then
    echo "Failed to create test tmux session"
    exit 1
fi
tmux kill-session -t test

# Install Neovim plugins
echo "Installing Neovim plugins..."
if command -v nvim >/dev/null 2>&1; then
    echo "Checking Neovim plugins installation..."
    nvim --headless +PlugInstall +qall || {
        echo "Plugin installation failed. Please check Neovim's error messages."
        exit 1
    }
    echo "Neovim plugins installed successfully"
else
    echo "Neovim not found. Please install Neovim first."
    exit 1
fi

echo "Installation complete! Please restart your terminal."