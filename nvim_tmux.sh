#!/bin/bash

# Get the first argument(file or folder)
FILE = "$1"

# Determine the session name based on the argument provided
if [ -z "$FILE"]; then
    # no file provided use the current folder name
    SESSION=$(basename "$PWD")
else
    # file provided, use the filename without extension
    SESSION=$(basename "$FILE" | sed 's/\.[^.]*$//')
fi

# start a new tmux session if one does not exists
if ! tmux has-session -t $SESSION 2>/dev/null; then
    if [-z "$FILE"]; then
        # no file provided, start nvim in the current dir
        tmux new-session -d -s $SESSION -n editor "nvim"
    else
        # file provided open it in nvim
        tmux new-session -d -s $SESSION -n editor "nvim $FILE"
    fi

    # create a second window runnig a normal shell (terminal)
    tmux new-window -t $SESSION -n terminal

    # switch back to nvim window
    tmux select-window -t $SESSION:0

    # Attach to the tmux session
    tmux attach-session -t $SESSION
else
    # if the session already exists, just switch to it
    tmux switch-client -t $SESSION
fi
