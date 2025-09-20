#!/bin/bash

# Check if input is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <0|1>"
    exit 1
fi

# Set target location
TARGET_DIR="/tmp/my_folder"

# Conditional check
if [ "$1" -eq 1 ]; then
    # Create folder and file
    mkdir -p "$TARGET_DIR"
    echo "Sample content" > "$TARGET_DIR/sample.txt"
    echo "Created folder and file at $TARGET_DIR"
elif [ "$1" -eq 0 ]; then
    # Delete folder
    rm -rf "$TARGET_DIR"
    echo "Deleted folder at $TARGET_DIR"
else
    echo "Invalid input. Use 0 or 1"
    exit 1
fi
