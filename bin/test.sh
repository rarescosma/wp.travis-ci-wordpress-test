#!/usr/bin/env bash
cd /tmp/wp
export PATH=`pwd`/node_modules/.bin:$PATH
grunt
