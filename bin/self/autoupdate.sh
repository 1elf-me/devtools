#!/bin/bash

# added auto update flag
touch "$DEVTOOLS_DIRECTORY/.autoupdate"

if [ -f "$DEVTOOLS_DIRECTORY/.autoupdate" ]; then
  echo "autoupdate has been successfully enabled!"
else
  echo "$DEVTOOLS_DIRECTORY/.autoupdate can't be created"
fi