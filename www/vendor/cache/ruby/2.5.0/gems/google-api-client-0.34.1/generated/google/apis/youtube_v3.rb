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

require 'google/apis/youtube_v3/service.rb'
require 'google/apis/youtube_v3/classes.rb'
require 'google/apis/youtube_v3/representations.rb'

module Google
  module Apis
    # YouTube Data API
    #
    # Supports core YouTube features, such as uploading videos, creating and
    # managing playlists, searching for content, and much more.
    #
    # @see https://developers.google.com/youtube/v3
    module YoutubeV3
      VERSION = 'V3'
      REVISION = '20190827'

      # Manage your YouTube account
      AUTH_YOUTUBE = 'https://www.googleapis.com/auth/youtube'

      # See, edit, and permanently delete your YouTube videos, ratings, comments and captions
      AUTH_YOUTUBE_FORCE_SSL = 'https://www.googleapis.com/auth/youtube.force-ssl'

      # View your YouTube account
      AUTH_YOUTUBE_READONLY = 'https://www.googleapis.com/auth/youtube.readonly'

      # Manage your YouTube videos
      AUTH_YOUTUBE_UPLOAD = 'https://www.googleapis.com/auth/youtube.upload'

      # View and manage your assets and associated content on YouTube
      AUTH_YOUTUBEPARTNER = 'https://www.googleapis.com/auth/youtubepartner'

      # View private information of your YouTube channel relevant during the audit process with a YouTube partner
      AUTH_YOUTUBEPARTNER_CHANNEL_AUDIT = 'https://www.googleapis.com/auth/youtubepartner-channel-audit'
    end
  end
end
