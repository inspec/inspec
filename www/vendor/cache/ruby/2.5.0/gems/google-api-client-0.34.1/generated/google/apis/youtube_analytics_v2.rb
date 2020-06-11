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

require 'google/apis/youtube_analytics_v2/service.rb'
require 'google/apis/youtube_analytics_v2/classes.rb'
require 'google/apis/youtube_analytics_v2/representations.rb'

module Google
  module Apis
    # YouTube Analytics API
    #
    # Retrieves your YouTube Analytics data.
    #
    # @see https://developers.google.com/youtube/analytics
    module YoutubeAnalyticsV2
      VERSION = 'V2'
      REVISION = '20190531'

      # Manage your YouTube account
      AUTH_YOUTUBE = 'https://www.googleapis.com/auth/youtube'

      # View your YouTube account
      AUTH_YOUTUBE_READONLY = 'https://www.googleapis.com/auth/youtube.readonly'

      # View and manage your assets and associated content on YouTube
      AUTH_YOUTUBEPARTNER = 'https://www.googleapis.com/auth/youtubepartner'

      # View monetary and non-monetary YouTube Analytics reports for your YouTube content
      AUTH_YT_ANALYTICS_MONETARY_READONLY = 'https://www.googleapis.com/auth/yt-analytics-monetary.readonly'

      # View YouTube Analytics reports for your YouTube content
      AUTH_YT_ANALYTICS_READONLY = 'https://www.googleapis.com/auth/yt-analytics.readonly'
    end
  end
end
