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

echo "--- installing rugged dependencies"
apt-get install cmake -y
apt-get install pkg-config -y

echo "--- bundle"
bundle config --local path vendor/bundle
bundle config set --local without tools maintenance deploy
bundle install --jobs=7 --retry=3

echo "--- push bundle cache"
push_bundle

echo "--- GEMPATH DIAGNOSTICS"
echo "bundle show rake"
bundle show rake
echo "pwd"
pwd
echo "ls ./vendor/bundle/ruby/3.0.0"
ls ./vendor/bundle/ruby/3.0.0

echo "--- running license_scout"
bundle exec license_scout --log-level debug
LICENSE_SCOUT_EXIT=$?
exit $LICENSE_SCOUT_EXIT
