#!/bin/bash
#
# After a PR merge, Chef Expeditor will bump the PATCH version in the VERSION file.
# It then executes this file to update any other files/components with that new version.
#

set -evx

sed -i -r "s/VERSION = '.*'/VERSION = '$(cat VERSION)'/" lib/inspec/version.rb
sed -i -r "s/VERSION = '.*'/VERSION = '$(cat VERSION)'/" inspec-bin/lib/inspec-bin/version.rb
