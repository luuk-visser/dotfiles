#!/usr/bin/env bash

# Get the directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

# Define folder variables
DOTFILES_DIR="$ROOT_DIR/.files"
SHELL_ALIASES_DIR="$ROOT_DIR/.shell_aliases"

echo "Installing dotfiles..."

if [[ ! -d "$DOTFILES_DIR" ]]; then
    echo "Error: $DOTFILES_DIR directory not found"
    exit 1
fi

if [[ ! -d "$SHELL_ALIASES_DIR" ]]; then
    echo "Error: $SHELL_ALIASES_DIR directory not found"
    exit 1
fi

echo "Copying .files to $HOME"
cp -rT "$DOTFILES_DIR" $HOME

echo "Copying .shell_aliases to $HOME/.shell_aliases"
cp -rT "$SHELL_ALIASES_DIR" $HOME/.shell_aliases

echo "Setting up shell aliases sourcing in zsh..."
# Add sourcing of shell aliases to .zshrc if not already present
if [[ -f "$HOME/.zshrc" ]]; then
    ALIAS_SOURCE_LINE="# Source shell aliases"
    ALIAS_SOURCE_CMD="for file in ~/.shell_aliases/*; do [ -r \"\$file\" ] && [ -f \"\$file\" ] && source \"\$file\"; done"
    
    if ! grep -q "shell_aliases" "$HOME/.zshrc"; then
        echo "" >> "$HOME/.zshrc"
        echo "$ALIAS_SOURCE_LINE" >> "$HOME/.zshrc"
        echo "$ALIAS_SOURCE_CMD" >> "$HOME/.zshrc"
        echo "Added shell aliases sourcing to .zshrc"
    else
        echo "Shell aliases sourcing already present in .zshrc"
    fi
else
    echo "Warning: .zshrc not found. Shell aliases may not be sourced automatically."
fi

echo "Dotfiles installation completed!"
