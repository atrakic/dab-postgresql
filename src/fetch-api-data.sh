#!/bin/sh

set -e

if [ -n "$API_URL" ];then curl -s "$API_URL" | jq -r ".value" > /usr/share/nginx/html/data.json; fi
