#!/usr/bin/env bash

# Install nginx / php-fpm
rm -rf /etc/apt/sources.list.d/*
apt-get update > /dev/null

apt-get install -y nginx php5-fpm php5-cli

cp nginx.conf /etc/nginx/nginx.conf
/etc/init.d/nginx restart

# Update hosts
echo "127.0.0.1 wp.l" >> /etc/hosts

# Install WP-CLI
wget -nv https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli-nightly.phar -O /usr/bin/wp
chmod +x /usr/bin/wp

# Install WordPress
mkdir -p /tmp/wp
gunzip fixture.sql.gz
cp fixture.sql /tmp/wp
cd /tmp/wp
wp core download
wp core config --dbname=wp_l --dbuser=root
wp db create
wp db import fixture.sql
