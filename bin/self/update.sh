#!/bin/bash

# update repository
cd "$DEVTOOLS_DIRECTORY" || exit
git fetch --all
git reset --hard origin/main

# set permissions
chmod +x "$DEVTOOLS_DIRECTORY/devtools"