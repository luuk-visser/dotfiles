#!/usr/bin/env bash

echo "Installing dotfiles..."

if [[ ! -d "../.files" ]]; then
    echo "Error: ../.files directory not found"
    exit 1
fi

if [[ ! -d "../.shell_aliases" ]]; then
    echo "Error: ../.shell_aliases directory not found"
    exit 1
fi

echo "Copying .files to $HOME"
cp -rT ../.files $HOME

echo "Copying .shell_aliases to $HOME/.shell_aliases"
cp -rT ../.shell_aliases $HOME/.shell_aliases

echo "Dotfiles installation completed!"
