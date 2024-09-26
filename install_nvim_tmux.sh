#!/bin/bash

# Copy itself to /usr/local/bin/
SCRIPT_NAME="nvim_tmux.sh"
TARGET_PATH="/usr/local/bin/$SCRIPT_NAME"

# Check if the script already exists in /usr/local/bin
if [ ! -f "$TARGET_PATH" ] && ! grep -Fxq "alias nvim=\"$TARGET_PATH\"" ~/.bashrc; then
    sudo cp "$(realpath "$0")" "$TARGET_PATH"
    sudo chmod +x "$TARGET_PATH"
    
    # Add alias to ~/.bashrc
    echo "# nvim tmux conf" >> ~/.bashrc
    echo "alias nvim=\"$TARGET_PATH\"" >> ~/.bashrc

    echo "Copied to $TARGET_PATH and alias added to ~/.bashrc.\nNow run command: source ~/.bashrc"
else
    echo "Script already exists in $TARGET_PATH or alias already present in ~/.bashrc."
fi

