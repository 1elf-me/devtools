#!/bin/bash

# set config variables
export status=${3}

# shellcheck disable=SC2016
export try_files='$uri $uri/ =404' # export try_files='$uri $uri/ /index.php?$query_string'

# check if domain name is set
if [ -z "$status" ]; then
  echo "Error: status not entered! Options: enable, disable"
  exit
fi

# set autoupdate by status
if [ "$status" = "enable" ]; then
  touch "$DEVTOOLS_DIRECTORY/.autoupdate"
else if [ "$status" = "disable" ]; then
  rm -f "$DEVTOOLS_DIRECTORY/.autoupdate"  
else
  echo "Status not available"
  exit 1
fi

# test file
if [ -f "$DEVTOOLS_DIRECTORY/.autoupdate" ]; then
  echo "autoupdate has been successfully enabled!"
else
  echo "autoupdate has been disabled!"
fi
