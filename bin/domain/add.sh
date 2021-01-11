#!/bin/bash

# set config variables
export domain=${3}

# shellcheck disable=SC2016
export try_files='$uri $uri/ =404' # export try_files='$uri $uri/ /index.php?$query_string'

# check if domain name is set
if [ -z "$domain" ]; then
  echo "Domain not entered!"
  exit
fi

# notice
echo "Adding new domain $domain to your system..."

DOMAIN_DIRECTORY="/var/www/$domain"

# check if domain directory already exist
if [ -d "$DOMAIN_DIRECTORY" ]; then
    mkdir -p "$DOMAIN_DIRECTORY"
    exit
fi

# create new domain directory
mkdir -p "$DOMAIN_DIRECTORY"

# copy new config file and enable in nginx
envsubst <"$DEVTOOLS_DIRECTORY/templates/domain.conf" >"/etc/nginx/sites-available/$domain"
ln -s -f "/etc/nginx/sites-available/$domain" "/etc/nginx/sites-enabled/$domain"
service nginx reload

# obtain a new certificate
certbot --nginx -d "$domain"
