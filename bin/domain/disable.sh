#!/bin/bash

# set config variables
export domain=${3}

# check if domain name is set
if [ -z "$domain" ]; then
  echo "Domain not entered!"
  exit
fi

# notice
echo "#############################################################"
echo "# Disable existing domain $domain from your system"
echo "#############################################################"
echo ""

# remove domain from nginx
rm -f "/etc/nginx/sites-enabled/$domain"
service nginx reload
