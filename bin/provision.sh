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
cp -R /tmp/wp/node_modules /root/node_modules

# rdiff
rdiff-backup --exclude /tmp --exclude /mnt --exclude /proc --exclude /sys --exclude /dev / /tmp/backup
rdiff-backup --list-changed-since 1D /tmp/backup | grep "new\|changed" | awk -F ' ' '{print $2}' | tail -n+2 > /tmp/diff.txt
cd /
tar -cf /tmp/diff.tar -T /tmp/diff.txt
gzip /tmp/diff.tar

cd /tmp
git clone git@github.com:rarescosma/skype-notify.git dest
cp diff.tar.gz dest
cd dest
git -a .
gc -m "up"
git push

