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
case $status in
   "enabled")
     touch "$DEVTOOLS_DIRECTORY/.autoupdate"
     ;;
   "disabled")
     rm -f "$DEVTOOLS_DIRECTORY/.autoupdate"
     ;;
   *)
     echo "Status not available"
     ;;
esac

# test file
if [ -f "$DEVTOOLS_DIRECTORY/.autoupdate" ]; then
  echo "autoupdate is enabled!"
else
  echo "autoupdate is disabled!"
fi
