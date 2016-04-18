# encoding: utf-8
#
# Copyright 2015 Chef Software, Inc.
#
# All Rights Reserved.
#

# This should go away once this is all public
name 'train'

license "Apache-2.0"
license_file "LICENSE"

dependency 'ruby'

default_version "v0.10.4"

source git: "https://github.com/chef/#{name}.git"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # Remove existing built gems in case they exist in the current dir
  delete "r-#{name}-*.gem"

  gem "build #{name}.gemspec", env: env
  gem "install r-#{name}-*.gem --no-document", env: env
end
