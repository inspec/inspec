#!/bin/bash
#
# After a PR merge, Chef Expeditor will bump the PATCH version in the VERSION file.
# It then executes this file to update related files and components, generating a new version with a beta suffix.
#

set -evx

VERSION="$(cat VERSION).beta"

sed -i -r "s/VERSION = \".*\"/VERSION = \"$VERSION\"/" lib/inspec/version.rb
sed -i -r "s/VERSION = \".*\"/VERSION = \"$VERSION\"/" inspec-bin/lib/inspec-bin/version.rb
