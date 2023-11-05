#!/usr/bin/env bash

set -eo pipefail

if [ -n "$CONNECTION_STRING" ];
then
  rm -rf dab-config.PostgreSql.json
  while IFS= read -r line; do
    echo "dab $line" | sh
  done < postgresql-commands.txt
fi
