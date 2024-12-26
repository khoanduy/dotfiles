#!/bin/bash
#vim:ft=bash

# Fuzzy find the project directory
dir=$(fd -t d -d 3 . $REPOS | fzf --tmux 80%)

# If the directory is empty, exit
if [ -z "${dir}" ]; then
  exit 0
fi

# Set the name to the directory name
name=$(basename $dir)

# Check if the session already exists
sess=$(tmux list-sessions | grep $name | awk -F: '{print $1}')

# If the session doesn't exist, create it
if [ -z "${sess}" ]; then
  tmux new-session -d -s $name -c $dir; tmux send-keys -t $name:0 "vim ." Enter
fi

# Anyway switch to it
tmux switch -t $name:0

