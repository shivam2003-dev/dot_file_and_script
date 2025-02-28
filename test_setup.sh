#!/bin/bash

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Test function
test_installation() {
    local test_name="$1"
    local command="$2"

    echo -n "Testing $test_name... "
    if eval "$command" &>/dev/null; then
        echo -e "${GREEN}OK${NC}"
        return 0
    else
        echo -e "${RED}FAILED${NC}"
        return 1
    fi
}

# Run tests
echo "Running installation tests..."

# Test Neovim installation
test_installation "Neovim availability" "command -v nvim"

# Test vim-plug installation
test_installation "vim-plug installation" "[ -f ~/.local/share/nvim/site/autoload/plug.vim ]"

# Test Neovim config
test_installation "Neovim config" "[ -f ~/.config/nvim/init.vim ]"

# Test CoC installation
test_installation "CoC installation" "[ -d ~/.config/coc/extensions ]"

# Test plugin directory
test_installation "Plugin directory" "[ -d ~/.local/share/nvim/plugged ]"

# Test language servers
test_installation "TypeScript Language Server" "command -v typescript-language-server"
test_installation "YAML Language Server" "command -v yaml-language-server"
test_installation "Python Language Server" "command -v pyright"

# Test Neovim startup
test_installation "Neovim startup" "nvim --headless +qa"

echo "Tests completed!"