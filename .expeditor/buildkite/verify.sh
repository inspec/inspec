#!/bin/bash

set -ueo pipefail

export LANG=C.UTF-8 LANGUAGE=C.UTF-8
apt-get update -y
apt-get install sudo -y

echo "--- setting up user"
useradd -m -U --uid 2000 normal
echo "normal ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/normal

echo "--- updating rubygems"
gem update --system -N

echo "--- system details"
uname -a
gem env
bundle --version

echo "--- bundle install"
bundle install --jobs=7 --retry=3 --without tools maintenance deploy

echo "+++ bundle exec rake"
# TODO: run this as non-root:
# chown -R normal:normal /home/normal /workdir
# su normal -c "bundle exec rake ${RAKE_TASK:-}"
bundle exec rake ${RAKE_TASK:-}
