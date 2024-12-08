#!/bin/bash

# Check if paru is installed
if command -v paru &> /dev/null; then
    echo "Paru is installed. Proceeding with package installation."

    # Check if pkg-arch.txt exists
    if [[ -f "pkg-arch.txt" ]]; then
        # Read the file and install packages
        while IFS= read -r package; do
            paru -S --noconfirm "$package"
        done < "pkg-arch.txt"
    else
        echo "Error: pkg-arch.txt file not found."
    fi
else
    echo "Paru is not installed. Please install paru first."
fi
