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

require 'google/apis/youtubereporting_v1/service.rb'
require 'google/apis/youtubereporting_v1/classes.rb'
require 'google/apis/youtubereporting_v1/representations.rb'

module Google
  module Apis
    # YouTube Reporting API
    #
    # Schedules reporting jobs containing your YouTube Analytics data and downloads
    # the resulting bulk data reports in the form of CSV files.
    #
    # @see https://developers.google.com/youtube/reporting/v1/reports/
    module YoutubereportingV1
      VERSION = 'V1'
      REVISION = '20190406'

      # View monetary and non-monetary YouTube Analytics reports for your YouTube content
      AUTH_YT_ANALYTICS_MONETARY_READONLY = 'https://www.googleapis.com/auth/yt-analytics-monetary.readonly'

      # View YouTube Analytics reports for your YouTube content
      AUTH_YT_ANALYTICS_READONLY = 'https://www.googleapis.com/auth/yt-analytics.readonly'
    end
  end
end
