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

require 'google/apis/analytics_v2_4/service.rb'
require 'google/apis/analytics_v2_4/classes.rb'
require 'google/apis/analytics_v2_4/representations.rb'

module Google
  module Apis
    # Google Analytics API
    #
    # Views and manages your Google Analytics data.
    #
    # @see https://developers.google.com/analytics/
    module AnalyticsV2_4
      VERSION = 'V2_4'
      REVISION = '20180622'

      # View and manage your Google Analytics data
      AUTH_ANALYTICS = 'https://www.googleapis.com/auth/analytics'

      # View your Google Analytics data
      AUTH_ANALYTICS_READONLY = 'https://www.googleapis.com/auth/analytics.readonly'
    end
  end
end
