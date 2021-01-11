#!/bin/bash

export domain=${2}
export try_files='$uri $uri/ =404'

mkdir -p /var/www/${domain}

envsubst </opt/devtools/templates/domain.conf >/etc/nginx/sites-available/${domain}

ln -s -f /etc/nginx/sites-available/${domain} /etc/nginx/sites-enabled/${domain}

service nginx reload

certbot --nginx -d ${domain}
