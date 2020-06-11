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

require 'google/apis/adexperiencereport_v1/service.rb'
require 'google/apis/adexperiencereport_v1/classes.rb'
require 'google/apis/adexperiencereport_v1/representations.rb'

module Google
  module Apis
    # Ad Experience Report API
    #
    # Views Ad Experience Report data, and gets a list of sites that have a
    # significant number of annoying ads.
    #
    # @see https://developers.google.com/ad-experience-report/
    module AdexperiencereportV1
      VERSION = 'V1'
      REVISION = '20190902'

      # Test scope for access to the Zoo service
      AUTH_XAPI_ZOO = 'https://www.googleapis.com/auth/xapi.zoo'
    end
  end
end
