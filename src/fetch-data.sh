#!/bin/sh
set -e
curl -s "$API_URL" | jq -r ".value" > /usr/share/nginx/html/data.json
