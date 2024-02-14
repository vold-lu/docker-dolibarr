#!/usr/bin/env bash

set -euo pipefail

FROM_VERSION="$1"
TO_VERSION="$2"

# Tag the images
docker tag voldlu/dolibarr-php:"$FROM_VERSION" voldlu/dolibarr-php:"$TO_VERSION"
docker tag voldlu/dolibarr-nginx:"$FROM_VERSION" voldlu/dolibarr-nginx:"$TO_VERSION"
