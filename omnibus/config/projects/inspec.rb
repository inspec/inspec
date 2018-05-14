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

require_relative '../../../lib/inspec/version.rb'

name 'inspec'
friendly_name 'InSpec'
maintainer 'Chef Software, Inc <maintainers@chef.io>'
homepage 'https://github.com/chef/inspec'

license 'Apache-2.0'
license_file '../LICENSE'

# Defaults to C:/opscode/inspec on Windows
# and /opt/inspec on all other platforms.
if windows?
  install_dir "#{default_root}/opscode/#{name}"
else
  install_dir "#{default_root}/#{name}"
end

build_version Inspec::VERSION
build_iteration 1

override 'ruby', version: '2.4.3'
# RubyGems 2.7.0 caused issues in the Jenkins pipelines, trouble installing bundler.
# This issue is not evident in 2.6.x, hence the pin.
override 'rubygems', version: '2.6.14'

# grab the current train release from rubygems.org
train_stable = /^train \((.*)\)/.match(`gem list ^train$ --remote`)[1]
override 'train', version: "v#{train_stable}"

dependency 'preparation'

dependency 'inspec'

# Mark all directories world readable.
dependency 'gem-permissions'
# Redirect all gem bat files and rb files to point to embedded ruby.
dependency 'shebang-cleanup'
# Ensure our SSL cert files are accessible to ruby.
dependency 'openssl-customization'
# Remove all .dll.a and .a files needed for static linkage.
dependency 'clean-static-libs'

package :rpm do
  signing_passphrase ENV['OMNIBUS_RPM_SIGNING_PASSPHRASE']
end

package :pkg do
  identifier 'com.getchef.pkg.inspec'
  signing_identity 'Developer ID Installer: Chef Software, Inc. (EU3VF8YLX2)'
end
compress :dmg

package :msi do
  fast_msi true
  upgrade_code 'DFCD452F-31E5-4236-ACD1-253F4720250B'
  wix_light_extension 'WixUtilExtension'
  signing_identity 'E05FF095D07F233B78EB322132BFF0F035E11B5B', machine_store: true
end

exclude '**/.git'
exclude '**/bundler/git'
