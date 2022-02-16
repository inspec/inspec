#!/bin/bash

echo "--- dependencies"
. .expeditor/buildkite/cache_support.sh
install_cache_deps sudo

echo "--- setting up user"
export LANG=C.UTF-8 LANGUAGE=C.UTF-8
useradd -m -U --uid 2000 normal
echo "normal ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/normal

echo "--- updating rubygems"
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
bundle config --local path vendor/bundle
bundle config set --local without tools maintenance deploy
bundle install --jobs=7 --retry=3

echo "--- push bundle cache"
push_bundle

echo "+++ bundle exec rake ${RAKE_TASK:-}"
# TODO: run this as non-root:
# chown -R normal:normal /home/normal /workdir
# su normal -c "bundle exec rake ${RAKE_TASK:-}"
# shellcheck disable=SC2086
bundle exec rake ${RAKE_TASK:-}
