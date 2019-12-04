#!/bin/bash

set -ue

S3_URL="s3://public-cd-buildkite-cache/${BUILDKITE_PIPELINE_SLUG}/${BUILDKITE_LABEL}"

pull_s3_file() {
    aws s3 cp "${S3_URL}/$1" "$1" || echo "Could not pull $1 from S3"
}

push_s3_file() {
    if [ -f "$1" ]; then
        aws s3 cp "$1" "${S3_URL}/$1" || echo "Could not push $1 to S3 for caching."
    fi
}

install_cache_deps() {
    apt-get update -y

    if [ -n "${1:-}" ]; then
        apt-get install "$@" -y
    fi

    if [ -z "${SKIP_BUNDLE_CACHE:-}" ]; then
        apt-get install awscli -y
    fi
}

pull_bundle() {
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
}

push_bundle() {
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
}
