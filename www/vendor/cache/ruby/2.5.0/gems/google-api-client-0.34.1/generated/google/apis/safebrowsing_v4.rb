# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'google/apis/safebrowsing_v4/service.rb'
require 'google/apis/safebrowsing_v4/classes.rb'
require 'google/apis/safebrowsing_v4/representations.rb'

module Google
  module Apis
    # Safe Browsing API
    #
    # Enables client applications to check web resources (most commonly URLs)
    # against Google-generated lists of unsafe web resources. The Safe Browsing APIs
    # are for non-commercial use only. If you need to use APIs to detect malicious
    # URLs for commercial purposes – meaning “for sale or revenue-generating
    # purposes” – please refer to the Web Risk API.
    #
    # @see https://developers.google.com/safe-browsing/
    module SafebrowsingV4
      VERSION = 'V4'
      REVISION = '20190923'
    end
  end
end
