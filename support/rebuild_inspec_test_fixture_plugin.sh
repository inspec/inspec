#!/bin/bash

# Unportable assumptions:
# 1. You use rbenv to manage ruby runtimes.
# 2. You are running from project root
eval "$(rbenv init -)"

PLUGIN_SRC_DIR=test/fixtures/plugins/inspec-test-fixture
FIXTURE_BASE=test/fixtures/config_dirs
FIXTURE_VERSIONS="1 2"

# The format here is "<actual_version>,<abi_version> <another_version><<another_abi_version>""
RUBY_VERSIONS="2.5.3,2.5.0 2.6.2,2.6.0"

# Make two fresh gems
cd $PLUGIN_SRC_DIR
sed -i -e s/0\.2\.0/0.1.0/ lib/inspec-test-fixture/version.rb
bundle exec rake build
sed -i -e s/0\.1\.0/0.2.0/ lib/inspec-test-fixture/version.rb
bundle exec rake build
sed -i -e s/0\.2\.0/0.1.0/ lib/inspec-test-fixture/version.rb
rm -f lib/inspec-test-fixture/version.rb-e
cd ../../../../../

# Purge and re-install the existing gem installs
for fver in $FIXTURE_VERSIONS; do
  for info in $RUBY_VERSIONS; do
    RUBY_VER=$(echo "$info" | cut -d, -f1)
    RUBY_ABI=$(echo "$info" | cut -d, -f2)
    GEM_DIR="$FIXTURE_BASE/test-fixture-${fver}-float/gems/$RUBY_ABI"
    echo "Reinstalling inspec-test-fixture-0.${fver}.0 for ABI $RUBY_ABI"
    rm -rf "$GEM_DIR"
    mkdir -p "$GEM_DIR"
    rbenv shell "$RUBY_VER"
    gem install -N -i "$GEM_DIR" "$PLUGIN_SRC_DIR/pkg/inspec-test-fixture-0.${fver}.0.gem"
    echo
  done
done

# Fix ordinal array gemspec....
for info in $RUBY_VERSIONS; do
  RUBY_ABI=$(echo $info | cut -d, -f2)
  GEM_DIR="$FIXTURE_BASE/test-fixture-${fver}-float/gems/$RUBY_ABI"
  cp -v "$GEM_DIR/specifications/ordinal_array-0.2.0.gemspec" "$GEM_DIR/gems/ordinal_array-0.2.0/ordinal_array.gemspec"
done

rbenv shell 2.6.2
