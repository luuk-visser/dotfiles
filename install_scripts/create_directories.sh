#!/usr/bin/env bash
source ./utils/directories_to_make.sh

echo "Checking and creating directories..."
for DIR in "${DIRECTORIES_TO_CREATE[@]}"; do
    if [[ ! -d "$DIR" ]]; then
        echo "Creating directory: $DIR"
        mkdir -p "$DIR"
    else
        echo "Directory already exists: $DIR"
    fi
done
echo "Directory creation completed!"
