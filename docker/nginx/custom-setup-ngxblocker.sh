#!/usr/bin/env bash

setup-ngxblocker -x -z -v /data/nginx/dead_host -e conf
setup-ngxblocker -x -z -v /data/nginx/proxy_host -e conf
nginx -s reload