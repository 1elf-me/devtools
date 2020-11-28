#!/bin/bash

apt-get install -y git

if [[ -d "/opt/devtools" ]]; then
    cd /opt/devtools
    git fetch --all
    git reset --hard origin/main
else
    mkdir -p /opt/devtools
    git clone https://github.com/1elf-me/devtools.git /opt/devtools
fi

chmod +x /opt/devtools/devtools

if [[ -f "/usr/local/bin/devtools" ]]; then
    ln -s /opt/devtools/devtools /usr/local/bin/devtools
fi