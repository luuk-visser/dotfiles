#!/usr/bin/env bash
# Linux installation script.

set -eou pipefail

# Create directories
chmod +x ./install_scripts/create_directories.sh
./install_scripts/create_directories.sh
chmod -x ./install_scripts/create_directories.sh

# Configure git
chmod +x ./install_scripts/configure_git.sh
./install_scripts.configure_git.sh
chmod -x ./install_scripts/configure_git.sh



# Install Anaconda
chmod +x ./install_scripts/install_anaconda-linux.sh
./install_scripts/install_anaconda-linux.sh
chmod -x ./install_scripts/install_anaconda-linux.sh
