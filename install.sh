#!/usr/bin/env bash
# Linux installation script.

set -eou pipefail

execute_script()
{
  SCRIPT=$1
  chmod +x "$SCRIPT"
  "$SCRIPT"
  chmod -x "$SCRIPT"
}

# Create directories
execute_script ./install_scripts/create_directories.sh

# Install Anaconda
execute_script ./install_scripts/install_anaconda-linux.sh

# Install ohmyzsh
execute_script ./install_scripts/install_ohmyzsh.sh

# Install dotfiles
execute_script ./install_scripts/install_dotfiles.sh

