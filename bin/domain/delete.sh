#!/bin/bash

# set config variables
export domain=${3}

# check if domain name is set
if [ -z "$domain" ]; then
  echo "Error: Domain not entered!"
  exit
fi

# notice
echo "Removing existing domain $domain from your system..."

# remove domain from nginx
rm -f "/etc/nginx/sites-available/$domain"
rm -f "/etc/nginx/sites-enabled/$domain"
service nginx reload

# remove domain directory
rm -rf "/var/www/$domain"
