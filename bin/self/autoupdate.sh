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
   "enable")
     touch "$DEVTOOLS_DIRECTORY/.autoupdate"
     echo "autoupdate has been enabled!"
     ;;
   "disable")
     rm -f "$DEVTOOLS_DIRECTORY/.autoupdate"
     echo "autoupdate has been disabled!"
     ;;
   *)
     echo "Status not available"
     ;;
esac
