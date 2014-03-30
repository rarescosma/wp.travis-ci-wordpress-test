#!/usr/bin/env bash

# nginx / fpm / npm
apt-get install -y nginx php5-fpm php5-cli php5-mysql nodejs
cp etc/nginx.conf /etc/nginx/nginx.conf
/etc/init.d/php5-fpm restart
/etc/init.d/nginx restart

# hosts
echo "127.0.0.1 wp.l" >> /etc/hosts

# wp-cli
wget -nv https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli-nightly.phar -O /usr/bin/wp
chmod +x /usr/bin/wp
alias wp='wp --allow-root'

# wp
mkdir -p /tmp/wp
cp -R wp/* /tmp/wp/

cd /tmp/wp
wp core download
wp core config --dbname=wp_l --dbuser=root
wp db create
gunzip fixture.sql.gz
wp db import fixture.sql

# node
npm install