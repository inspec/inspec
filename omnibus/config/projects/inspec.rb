# encoding: utf-8
#
# Copyright:: Copyright 2016-2018, Chef Software Inc.
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
homepage 'https://github.com/inspec/inspec'

license 'Chef EULA'
license_file 'https://www.chef.io/end-user-license-agreement/'

# Defaults to C:/opscode/inspec on Windows
# and /opt/inspec on all other platforms.
if windows?
  install_dir "#{default_root}/opscode/#{name}"
else
  install_dir "#{default_root}/#{name}"
end

build_version Inspec::VERSION
build_iteration 1

# Load dynamically updated overrides
overrides_path = File.expand_path('../../../../omnibus_overrides.rb', __FILE__)
instance_eval(File.read(overrides_path), overrides_path)

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

dependency 'ruby-cleanup'

package :rpm do
  signing_passphrase ENV['OMNIBUS_RPM_SIGNING_PASSPHRASE']
  compression_level 1
  compression_type :xz
end

package :deb do
  compression_level 1
  compression_type :xz
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
