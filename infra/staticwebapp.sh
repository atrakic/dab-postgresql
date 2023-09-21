#!/usr/bin/env bash

set -e
set -o pipefail

GITHUB_USER_NAME=${GITHUB_USER_NAME:?"You need to configure the GITHUB_USER_NAME environment variable; eg. atrakic"}
LOCATION=${LOCATION:-westeurope}
APP_NAME=$(basename "$(git rev-parse --show-toplevel)")
RGROUP="RG-$APP_NAME"

az ad signed-in-user show || az login

az group create \
  --name "$RGROUP" \
  --location "$LOCATION"

az staticwebapp create \
    --name "$APP_NAME" \
    --resource-group "$RGROUP" \
    --source https://github.com/"$GITHUB_USER_NAME"/"$APP_NAME" \
    --location "$LOCATION" \
    --branch main \
    --app-location "src" \
    --login-with-github

az staticwebapp show \
  --name "$APP_NAME" \
  --query "repositoryUrl"

az staticwebapp show \
  --name "$APP_NAME" \
  --query "defaultHostname"
