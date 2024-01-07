#!/usr/bin/env bash

set -euo pipefail

DOLIBARR_GIT_VERSION="$1"

# Push the images
docker push voldlu/dolibarr-php:"$DOLIBARR_GIT_VERSION"
docker push voldlu/dolibarr-nginx:"$DOLIBARR_GIT_VERSION"
