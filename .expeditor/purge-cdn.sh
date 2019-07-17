#!/bin/bash

set -eou pipefail

echo "Purging '${EXPEDITOR_CHANNEL}/${EXPEDITOR_PRODUCT_KEY}/latest' Surrogate Key group from Fastly"
curl -X POST -H "Fastly-Key: $FASTLY_API_TOKEN" "https://api.fastly.com/service/1ga2Kt6KclvVvCeUYJ3MRp/purge/${EXPEDITOR_CHANNEL}/${EXPEDITOR_PRODUCT_KEY}/latest"
