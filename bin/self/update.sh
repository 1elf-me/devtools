#!/bin/bash

# update repository
cd "$DEVTOOLS_DIRECTORY" || exit
git fetch --all --quiet
git reset --hard origin/main --quiet

# set permissions
chmod +x "$DEVTOOLS_DIRECTORY/devtools"