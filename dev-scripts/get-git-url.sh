#!/bin/bash

INPUT_FOLDER="$1"

if [ ! -d "$INPUT_FOLDER/.git" ]; then
    echo -e "Error: Not a git repository"
fi

cd "$INPUT_FOLDER" || exit 1
GIT_REMOTE_URL=$(git config --get remote.origin.url)

echo -e "$GIT_REMOTE_URL"