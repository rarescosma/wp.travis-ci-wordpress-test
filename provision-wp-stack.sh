#!/usr/bin/env bash

# nginx / fpm / npm
apt-get install -y nginx php5-fpm php5-cli php5-mysql npm

ls -la /etc/php5
ls -la /etc/php5/fpm

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
gunzip wp/fixture.sql.gz
cp -R wp/* /tmp/wp/

cd /tmp/wp
wp core download
wp core config --dbname=wp_l --dbuser=root
wp db create
wp db import fixture.sql

# node
npm install
export PATH=`pwd`/node_modules/.bin:$PATH
