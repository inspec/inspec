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

require 'google/apis/youtube_partner_v1/service.rb'
require 'google/apis/youtube_partner_v1/classes.rb'
require 'google/apis/youtube_partner_v1/representations.rb'

module Google
  module Apis
    # YouTube Content ID API
    #
    # API for YouTube partners. To use this API a YouTube CMS account is required.
    #
    # @see https://developers.google.com/youtube/partner/
    module YoutubePartnerV1
      VERSION = 'V1'
      REVISION = '20191024'

      # View and manage your assets and associated content on YouTube
      AUTH_YOUTUBEPARTNER = 'https://www.googleapis.com/auth/youtubepartner'

      # View content owner account details from YouTube.
      AUTH_YOUTUBEPARTNER_CONTENT_OWNER_READONLY = 'https://www.googleapis.com/auth/youtubepartner-content-owner-readonly'
    end
  end
end
