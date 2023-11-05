#!/usr/bin/env bash

set -eo pipefail

declare -a opts
opts=(
  -sL
  -H 'X-MS-API-ROLE: Sample.Role'
  -H 'Content-Type: application/json'
  -H 'Accept: application/json'
)

if [ -n "$API_TOKEN" ];then
  opts+=(
   -H "Authorization: Bearer '$API_TOKEN'"
  )
fi

## GRAPHQL
curl "${opts[@]}" --data '{ "query": "{ books(first: 1, orderBy: { title: DESC }) { items { id title }}}" }' \
  localhost:5000/graphql/ | python -m json.tool

curl "${opts[@]}" --data '{ "query": "{ book_by_pk(id:1010) {title} }" }' \
  localhost:5000/graphql/ | python -m json.tool

## REST
#curl "${opts[@]}" http://localhost:5000/api/Book
#curl "${opts[@]}" http://localhost:5000/api/Author
