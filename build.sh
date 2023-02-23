#!/usr/bin/env bash

set -euo pipefail

DOLIBARR_GIT_URL="${2:-https://github.com/Dolibarr/dolibarr.git}"
DOLIBARR_GIT_VERSION="$1"

# Clone or update Dolibarr instance
if [ -d dolibarr ]; then
  (
    cd dolibarr
    git checkout develop
    git pull --rebase --autostash
    git checkout "$DOLIBARR_GIT_VERSION"
  )
else
  git clone "$DOLIBARR_GIT_URL" -b "$DOLIBARR_GIT_VERSION" dolibarr
fi

# Build the docker images
docker build . --tag dolibarr-php:"$DOLIBARR_GIT_VERSION" --file docker/php/Dockerfile
docker build . --tag dolibarr-nginx:"$DOLIBARR_GIT_VERSION" --file docker/nginx/Dockerfile

# Tag the docker images to latest
docker tag dolibarr-php:"$DOLIBARR_GIT_VERSION" dolibarr-php:latest
docker tag dolibarr-nginx:"$DOLIBARR_GIT_VERSION" dolibarr-nginx:latest
