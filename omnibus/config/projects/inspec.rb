#
# Copyright 2016 Chef Software, Inc
#
# All Rights Reserved.
#

name "inspec"
maintainer "Christoph Hartmann"
homepage "https://github.com/chef/inspec"

# Defaults to C:/inspec on Windows
# and /opt/inspec on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Creates required build directories
dependency "preparation"

# inspec dependencies/components
dependency "inspec"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
