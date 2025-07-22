#!/usr/bin/env bash

set -eou pipefail

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: git is required but not installed"
    exit 1
fi

# Check if zsh is installed, if not install it
if ! command -v zsh &> /dev/null; then
    echo "Zsh not found. Installing zsh..."
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y zsh
    elif command -v yum &> /dev/null; then
        sudo yum install -y zsh
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y zsh
    elif command -v pacman &> /dev/null; then
        sudo pacman -S --noconfirm zsh
    else
        echo "Error: Unable to install zsh. Please install it manually."
        exit 1
    fi
fi

# Set zsh as default shell if it isn't already
if [[ "$SHELL" != *"zsh" ]]; then
    echo "Setting zsh as default shell..."
    chsh -s $(which zsh)
fi

# Check if Oh My Zsh is installed
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Error: Oh My Zsh is required but not installed. Please install Oh My Zsh first."
    exit 1
fi

# Install Powerlevel10k theme
P10K_DIR="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
if [[ -d "$P10K_DIR" ]]; then
    echo "Powerlevel10k is already installed. Updating..."
    cd "$P10K_DIR"
    git pull
else
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
fi

# Update .zshrc to use powerlevel10k theme
ZSHRC="$HOME/.zshrc"
if [[ -f "$ZSHRC" ]]; then
    if grep -q "^ZSH_THEME=" "$ZSHRC"; then
        sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$ZSHRC"
    else
        echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$ZSHRC"
    fi
else
    echo "Warning: .zshrc not found. Powerlevel10k theme setting may need manual configuration."
fi

echo "Powerlevel10k installation completed!"
echo "Note: You may need to restart your terminal or run 'exec zsh' to see changes."
echo "Run 'p10k configure' to customize your prompt."

# Reload shell if we just installed zsh or if we're already in zsh
if [[ "$SHELL" == *"zsh" ]] || command -v zsh &> /dev/null; then
    echo "Reloading shell configuration..."
    exec zsh
fi