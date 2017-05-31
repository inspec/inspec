# encoding: utf-8
# Copyright:: Copyright (c) 2017 Chef Software, Inc.
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

PROJECT_DIR = File.join(File.expand_path(File.dirname(__FILE__)), '..').freeze
UTILS_DIR     = File.join(PROJECT_DIR, 'lib/utils').freeze

desc 'Updates the list of the spdx valid licenses'
task :spdx do
  # Kudos to Foodcritic for providing that idea
  # @see https://github.com/Foodcritic/foodcritic/pull/530/files
  # list of valid SPDX.org license strings. To build an array run this:
  require 'json'
  require 'net/http'
  json_data = JSON.parse(Net::HTTP.get(URI('https://raw.githubusercontent.com/spdx/license-list-data/master/json/licenses.json')))
  licenses = json_data['licenses'].map { |l| l['licenseId'] }
  # "All Rights Reserved" is non-standard extra value to cover proriatary license
  licenses.push('All Rights Reserved')
  File.write(File.join(UTILS_DIR, 'spdx.txt'), licenses.join("\n"))
end
