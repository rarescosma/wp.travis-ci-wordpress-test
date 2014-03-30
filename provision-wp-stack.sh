#!/usr/bin/env bash

# nginx / fpm
rm -rf /etc/apt/sources.list.d/*
apt-get update > /dev/null

apt-get install -y nginx php5-fpm php5-cli

cp nginx.conf /etc/nginx/nginx.conf
/etc/init.d/nginx restart

# hosts
echo "127.0.0.1 wp.l" >> /etc/hosts

# wp-cli
wget -nv https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli-nightly.phar -O /usr/bin/wp
chmod +x /usr/bin/wp
alias wp='wp --allow-root'

# wp
mkdir -p /tmp/wp
gunzip fixture.sql.gz
cp fixture.sql /tmp/wp
cd /tmp/wp
wp core download
wp core config --dbname=wp_l --dbuser=root
wp db create
wp db import fixture.sql
