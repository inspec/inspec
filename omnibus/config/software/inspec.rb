# encoding: utf-8
#
# Copyright 2015 Chef Software, Inc.
#
# All Rights Reserved.
#

name 'inspec'

dependency 'ruby'
dependency 'train'

license "Apache-2.0"
license_file "LICENSE"

default_version "v0.18.0"

source git: "https://github.com/chef/#{name}.git"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # Remove existing built gems in case they exist in the current dir
  delete "#{name}-*.gem"

  gem "build #{name}.gemspec", env: env
  gem "install #{name}-*.gem --no-document", env: env

  # Dependecy added to avoid this pry error:
  # "Sorry, you can't use Pry without Readline or a compatible library."
  gem "install rb-readline --no-document", env: env

  touch "#{install_dir}/embedded/service/#{name}/.gitkeep"
end
