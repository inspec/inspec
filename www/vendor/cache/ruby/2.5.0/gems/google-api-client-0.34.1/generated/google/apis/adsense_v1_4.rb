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

require 'google/apis/adsense_v1_4/service.rb'
require 'google/apis/adsense_v1_4/classes.rb'
require 'google/apis/adsense_v1_4/representations.rb'

module Google
  module Apis
    # AdSense Management API
    #
    # Accesses AdSense publishers' inventory and generates performance reports.
    #
    # @see https://developers.google.com/adsense/management/
    module AdsenseV1_4
      VERSION = 'V1_4'
      REVISION = '20180807'

      # View and manage your AdSense data
      AUTH_ADSENSE = 'https://www.googleapis.com/auth/adsense'

      # View your AdSense data
      AUTH_ADSENSE_READONLY = 'https://www.googleapis.com/auth/adsense.readonly'
    end
  end
end
