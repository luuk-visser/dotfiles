#!/usr/bin/env bash

set -eou pipefail

# Install pixi - Python package manager and project management tool
curl -fsSL https://pixi.sh/install.sh | bash

# Add pixi to PATH for current session
export PATH="$HOME/.pixi/bin:$PATH"

# Verify installation
pixi --version