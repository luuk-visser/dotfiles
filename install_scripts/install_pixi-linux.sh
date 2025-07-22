#!/usr/bin/env bash

set -eou pipefail

# Check if pixi is already installed
if command -v pixi &> /dev/null; then
    echo "Pixi is already installed: $(pixi --version)"
    exit 0
fi

# Check if pixi binary exists in the expected location
if [[ -f "$HOME/.pixi/bin/pixi" ]]; then
    echo "Pixi binary found at $HOME/.pixi/bin/pixi"
    # Add pixi to PATH for current session
    export PATH="$HOME/.pixi/bin:$PATH"
    echo "Pixi is already installed: $(pixi --version)"
    exit 0
fi

echo "Installing pixi - Python package manager and project management tool"
# Install pixi - Python package manager and project management tool
curl -fsSL https://pixi.sh/install.sh | bash

# Add pixi to PATH for current session
export PATH="$HOME/.pixi/bin:$PATH"

# Verify installation
echo "Pixi installation completed: $(pixi --version)"