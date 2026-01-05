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
        shasum -a 256 Gemfile.lock > Gemfile.lock.sha256

        if [ -n "${RESET_BUNDLE_CACHE:-}" ]; then
            echo "RESET_BUNDLE_CACHE is set. Will rebuild cache."
            return
        fi

        pull_s3_file "bundle.sha256"

        if test -f bundle.sha256 && diff -q Gemfile.lock.sha256 bundle.sha256 > /dev/null 2>&1; then
            echo "Gemfile.lock matches cache. Pulling cached vendor bundle."
            pull_s3_file "bundle.tar.gz"
            if [ -f bundle.tar.gz ]; then
                # Extract the vendor/ directory, preserve committed Gemfile.lock
                tar -xzf bundle.tar.gz vendor/
            fi
        else
            echo "Gemfile.lock has changed or no cache exists. Will run fresh bundle install."
        fi
    fi
}

push_bundle() {
    if [ -z "${SKIP_BUNDLE_CACHE:-}" ]; then
        shasum -a 256 Gemfile.lock > Gemfile.lock.sha256

        # Compare with cached checksum to decide if upload is needed
        if test -f bundle.sha256 && diff -q Gemfile.lock.sha256 bundle.sha256 > /dev/null 2>&1; then
            echo "Gemfile.lock unchanged. Skipping cache upload."
        else
            echo "Gemfile.lock has changed. Uploading new cache to S3."
            # Cache the vendor/ directory
            cp Gemfile.lock.sha256 bundle.sha256
            tar -czf bundle.tar.gz vendor/
            push_s3_file bundle.tar.gz
            push_s3_file bundle.sha256
        fi
    fi
}
