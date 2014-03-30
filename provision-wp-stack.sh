#!/usr/bin/env bash
apt-get update

apt-get install nginx
apt-get install php5-fpm

cp nginx.conf /etc/nginx/nginx.conf
/etc/init.d/nginx restart

rm -rf /etc/php5/fpm/pool.d/*
cp fpm.conf /etc/php5/fpm/pool.d/www.conf
/etc/init.d/php5-fpm restart

echo "127.0.0.1 wp.l" >> /etc/hosts

mkdir -p /tmp/wp
cp test.php /tmp/wp/