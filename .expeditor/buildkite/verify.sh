#!/bin/bash

set -ue

echo "--- dependencies"
export LANG=C.UTF-8 LANGUAGE=C.UTF-8
S3_URL="s3://public-cd-buildkite-cache/${BUILDKITE_PIPELINE_SLUG}/${BUILDKITE_LABEL}"

pull_s3_file() {
    aws s3 cp "${S3_URL}/$1" "$1" || echo "Could not pull $1 from S3"
}

push_s3_file() {
    if [ -f "$1" ]; then
        aws s3 cp "$1" "${S3_URL}/$1" || echo "Could not push $1 to S3 for caching."
    fi
}

apt-get update -y
apt-get install sudo -y

if [ -z "${SKIP_BUNDLE_CACHE:-}" ]; then
    apt-get install awscli -y
fi

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
if [ -z "${SKIP_BUNDLE_CACHE:-}" ]; then
    pull_s3_file "bundle.tar.gz"
    pull_s3_file "bundle.sha256"

    if [ -f bundle.tar.gz ]; then
        tar -xzf bundle.tar.gz
        mv Gemfile.lock Gemfile.lock.old || true
    fi

    if [ -n "${RESET_BUNDLE_CACHE:-}" ]; then
        rm bundle.sha256
    fi
fi

bundle config --local path vendor/bundle
bundle install --jobs=7 --retry=3 --without tools maintenance deploy

echo "--- bundle cache"
if [ -z "${SKIP_BUNDLE_CACHE:-}" ]; then
    if test -f bundle.sha256 && shasum --check bundle.sha256 --status; then
        echo "Bundled gems have not changed. Skipping upload to s3"
    else
        echo "Bundled gems have changed. Uploading to s3"
        diff -u Gemfile.lock.old Gemfile.lock || true
        shasum -a 256 Gemfile.lock > bundle.sha256
        tar -czf bundle.tar.gz Gemfile.lock vendor/
        push_s3_file bundle.tar.gz
        push_s3_file bundle.sha256
    fi
fi

echo "+++ bundle exec rake ${RAKE_TASK:-}"
# TODO: run this as non-root:
# chown -R normal:normal /home/normal /workdir
# su normal -c "bundle exec rake ${RAKE_TASK:-}"
bundle exec rake ${RAKE_TASK:-}
