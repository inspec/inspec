#!/bin/bash

set -exou pipefail

# Download the release-notes for our specific build
curl -o release-notes.md "https://packages.chef.io/release-notes/${EXPEDITOR_PRODUCT_KEY}/${EXPEDITOR_VERSION}.md"

topic_title="Chef InSpec $EXPEDITOR_VERSION Released!"
topic_body=$(cat <<EOH
Hello InSpec friends!
We are delighted to announce the availability of version $EXPEDITOR_VERSION of Chef InSpec. Changes include:
$(cat release-notes.md)
---
## Get the Build

You can download binaries directly from [downloads.chef.io](https://downloads.chef.io/$EXPEDITOR_PRODUCT_KEY/$EXPEDITOR_VERSION).
EOH
)

# category 9 is "Chef Release Announcements": https://discourse.chef.io/c/chef-release

curl -X POST https://discourse.chef.io/posts \
  -H "Content-Type: multipart/form-data" \
  -F "api_username=chef-ci" \
  -F "api_key=$DISCOURSE_API_TOKEN" \
  -F "category=9" \
  -F "title=$topic_title" \
  -F "raw=$topic_body"

# Cleanup
rm release-notes.md
