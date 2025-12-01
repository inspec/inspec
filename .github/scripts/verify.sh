#!/bin/bash

echo "--- setting up user"
export LANG=C.UTF-8 LANGUAGE=C.UTF-8

if ! id "normal" &>/dev/null; then
  useradd -m -U --uid 2000 normal
  echo "normal ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/normal
fi

echo "--- updating rubygems"
gem update -N --system 3.3.3 --force

echo "--- system details"
uname -a
gem env
bundle --version
mount
df /tmp
echo ${TMPDIR:-unknown}

echo "--- bundle install"
bundle config --local path vendor/bundle
bundle config set --local without deploy kitchen
bundle install --jobs=7 --retry=3

echo "+++ bundle exec rake ${RAKE_TASK:-}"
# shellcheck disable=SC2086
bundle exec rake ${RAKE_TASK:-}
exit $?
