#!/bin/bash

exit 0 # don't do this quite yet...

set -ue

echo "--- bundle install"

cd www
bundle install --jobs=7 --retry=3 --without tools maintenance deploy

echo "+++ bundle exec rake"
bundle exec rake www V=1 PUSH=1
