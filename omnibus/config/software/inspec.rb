# encoding: utf-8
#
# Copyright:: Copyright 2016-2019, Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
require_relative '../../../lib/inspec/version.rb'

name 'inspec'

dependency 'ruby'
dependency 'rubygems'
dependency 'bundler'

license :project_license

default_version "v#{Inspec::VERSION}"

source path: "#{Omnibus::Config.project_root}/../",
       options: { exclude: ['omnibus'] }

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # Remove existing built gems in case they exist in the current dir
  delete "#{name}-*.gem"

  # We bundle install to ensure the versions of gems we are going to
  # appbundle-lock to are definitely installed
  bundle 'install --without test integration tools maintenance', env: env

  gem "build #{name}.gemspec", env: env
  gem "install #{name}-*.gem --no-document", env: env

  # OK, we still need to inject the binstub...

  # ... into the embedded tools dir
  copy "#{project_dir}/inspec-test-binstub", "#{install_dir}/embedded/bin/inspec"
  # ... into the embedded gem bin dir. Need a block here to trigger `shellout!` properly
  block do
    inspec_gem_path = File.expand_path('../..', shellout!("#{install_dir}/embedded/bin/gem which #{name}").stdout.chomp)
    copy "#{project_dir}/inspec-test-binstub", "#{inspec_gem_path}/bin/inspec"
  end

  appbundle 'inspec', extra_bin_files: ['inspec'], env: env
end
