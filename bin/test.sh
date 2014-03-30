#!/usr/bin/env bash
cd /tmp/wp
export PATH=`pwd`/node_modules/.bin:$PATH
mocha-casperjs --casper-timeout=50000 test/*.coffee
