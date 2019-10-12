#!/bin/bash

set -ueo pipefail

export LANG=C.UTF-8 LANGUAGE=C.UTF-8
# test-reporter expects reporter identifier under this environment variable
CC_TEST_REPORTER_ID="FIXME"
TEST_REPORTER_VERSION="0.6.3"
S3_URL="s3://public-cd-buildkite-cache/${BUILDKITE_PIPELINE_SLUG}/${BUILDKITE_LABEL}"

download_test_reporter() {
    curl -o test-reporter -L https://codeclimate.com/downloads/test-reporter/test-reporter-"${TEST_REPORTER_VERSION}"-linux-amd64
    chmod +x test-reporter
}

download_s3_file() {
    aws s3 cp "${S3_URL}/$1" "$1"
}

upload_s3_file() {
    if [ -f "$1" ]; then
        aws s3 cp "$1" "${S3_URL}/$1" || echo "Could not push $1 to S3 for caching."
    fi
}

echo "--- downloading coverage tool"
aws s3 cp "${S3_URL}/test-reporter" || download_test_reporter
aws s3 cp "${S3_URL}/test-reporter.sha" || echo "Could not download test-reporter.sha"


echo "--- updating rubygems"
gem update --system -N

echo "--- system details"
uname -a
gem env
bundle --version

echo "--- setting up test coverage before build"
./test-reporter before-build

echo "--- bundle install"
bundle install --jobs=7 --retry=3 --without tools maintenance deploy

echo "+++ bundle exec rake"
bundle exec rake "${RAKE_TASK:-}"
EXIT-CODE=$?

echo "+++ formatting and uploading test coverage"
./test-reporter after-build -t simplecov --exit-code $EXIT_CODE

echo "--- uploading test-reporter{.sha} to s3"
if [ "test-reporter" -nt "test-reporter.sha" ]; then
    if shasum --check test-reporter.sha --status; then
        shasum -a 256 test-reporter > test-reporter.sha
        for i in "test-reporter" "test-reporter.sha"; do
            upload_s3_file "$i"
        done
    fi
fi
