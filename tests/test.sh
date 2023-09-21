#!/bin/bash
declare -a opts
opts=(
  -sL
  -H 'X-MS-API-ROLE: Sample.Role'
  -H 'Content-Type: application/json'
  -H 'Accept: application/json'
)

opts+=(
 -H 'Authorization: Bearer ey...'
)

## GRAPHQL
curl "${opts[@]}" --data '{ "query": "{ books(first: 1, orderBy: { title: DESC }) { items { id title }}}" }' \
  localhost:5000/graphql/ | python -m json.tool

curl "${opts[@]}" --data '{ "query": "{ book_by_pk(id:1010) {title} }" }' \
  localhost:5000/graphql/ | python -m json.tool

## REST
#curl "${opts[@]}" http://localhost:5000/api/Book
#curl "${opts[@]}" http://localhost:5000/api/Author
