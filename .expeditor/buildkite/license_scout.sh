#!/bin/bash

echo "--- dependencies"
. .expeditor/buildkite/cache_support.sh
install_cache_deps sudo

echo "--- updating rubygems"
gem install bundler
gem update -N --system 3.2.3 --force

echo "--- system details"
uname -a
gem env
bundle --version
mount
df /tmp
echo ${TMPDIR:-unknown}

echo "--- pull bundle cache"
pull_bundle

echo "--- bundle"
bundle config --local path 'vendor/cache'
bundle config set --local without tools maintenance deploy
bundle install --jobs=7 --retry=3

echo "--- push bundle cache"
push_bundle

echo "--- running license_scout"
#gem install license_scout -v 1.3.1
bundle exec license_scout
LICENSE_SCOUT_EXIT=$?
exit $LICENSE_SCOUT_EXIT