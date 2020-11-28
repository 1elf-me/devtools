#!/bin/bash

apt-get install -y git

mkdir -p /opt/devtools

git clone https://github.com/1elf-me/devtools.git /opt/devtools

chmod +x /opt/devtools/devtools

ln -s /opt/devtools/devtools /usr/share/devtools