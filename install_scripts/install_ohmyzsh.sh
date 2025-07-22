#!/usr/bin/env bash

# Check if Oh My Zsh is already installed
if [[ -d "$HOME/.oh-my-zsh" ]]; then
    echo "Oh My Zsh is already installed at $HOME/.oh-my-zsh"
    echo "Skipping installation."
    exit 0
fi

echo "Installing Oh My Zsh..."
# https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#basic-installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Oh My Zsh installation completed!"

