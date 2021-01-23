#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y software-properties-common

# Nginx
sudo apt-get install -y nginx

# MariaDB
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror2.hs-esslingen.de/mariadb/repo/10.4/ubuntu bionic main'

sudo add-apt update
sudo add-apt install -y mariadb-server

sudo mysql_secure_installation

# php
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update

sudo apt-get install -y php-fpm php-mysql
sudo apt-get install -y php-xml php-mbstring php-curl php-zip php-bcmath

# test and reload
sudo nginx -t
sudo systemctl reload nginx
