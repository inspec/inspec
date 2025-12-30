#!/bin/bash
#
# After a PR merge, Chef Expeditor will bump the PATCH version in the VERSION file.
# It then executes this file to update any other files/components with that new version.
#

set -evx

VERSION=$(cat VERSION)
ORIGINAL_VERSION=$(git show inspec-5:VERSION)

sed -i -r "s/VERSION = \".*\"/VERSION = \"${VERSION}\"/" lib/inspec/version.rb
sed -i -r "s/VERSION = \".*\"/VERSION = \"${VERSION}\"/" inspec-bin/lib/inspec-bin/version.rb

# Update the version inside Gemfile.lock
sed -i -r "s/(^\s+inspec\s+.+)${ORIGINAL_VERSION}(.+)/\1${VERSION}\2/" Gemfile.lock
sed -i -r "s/(^\s+inspec-core\s+.+)${ORIGINAL_VERSION}(.+)/\1${VERSION}\2/" Gemfile.lock
sed -i -r "s/(^\s+inspec-bin\s+.+)${ORIGINAL_VERSION}(.+)/\1${VERSION}\2/" Gemfile.lock
