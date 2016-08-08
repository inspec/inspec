# encoding: utf-8
#
# Copyright:: Copyright 2016, Chef Software Inc.
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

name 'inspec'
maintainer 'Chef Software, Inc <maintainers@chef.io>'
homepage 'https://github.com/chef/inspec'

license 'Apache-2.0'
license_file '../LICENSE'

# Defaults to C:/inspec on Windows
# and /opt/inspec on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

dependency 'preparation'
dependency 'inspec'

exclude '**/.git'
exclude '**/bundler/git'
