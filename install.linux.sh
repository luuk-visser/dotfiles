#!/usr/bin/env bash
# Linux installation script.

# Step 1: Create directories
chmod +x ./install_scripts/create_directories.sh
./install_scripts/create_directories.sh
chmod -x ./install_scripts/create_directories.sh





# Step 4: Install Anaconda
chmod +x ./install_scripts/install_anaconda-linux.sh
./install_scripts/install_anaconda-linux.sh
chmod -x ./install_scripts/install_anaconda-linux.sh
