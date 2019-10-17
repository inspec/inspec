#!/bin/bash

set -ueo pipefail

export LANG=C.UTF-8 LANGUAGE=C.UTF-8

echo "--- updating rubygems"
gem update --system -N

echo "--- system details"
uname -a
gem env
bundle --version

echo "--- bundle install"
bundle install --jobs=7 --retry=3 --without tools maintenance deploy

echo "+++ bundle exec rake"
bundle exec rake ${RAKE_TASK:-}
