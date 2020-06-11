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

require 'google/apis/plus_domains_v1/service.rb'
require 'google/apis/plus_domains_v1/classes.rb'
require 'google/apis/plus_domains_v1/representations.rb'

module Google
  module Apis
    # Google+ Domains API
    #
    # Builds on top of the Google+ platform for Google Apps Domains.
    #
    # @see https://developers.google.com/+/domains/
    module PlusDomainsV1
      VERSION = 'V1'
      REVISION = '20190415'

      # View your circles and the people and pages in them
      AUTH_PLUS_CIRCLES_READ = 'https://www.googleapis.com/auth/plus.circles.read'

      # View your basic profile info, including your age range and language
      AUTH_PLUS_LOGIN = 'https://www.googleapis.com/auth/plus.login'

      # Associate you with your personal info on Google
      AUTH_PLUS_ME = 'https://www.googleapis.com/auth/plus.me'

      # Send your photos and videos to Google+
      AUTH_PLUS_MEDIA_UPLOAD = 'https://www.googleapis.com/auth/plus.media.upload'

      # View your own Google+ profile and profiles visible to you
      AUTH_PLUS_PROFILES_READ = 'https://www.googleapis.com/auth/plus.profiles.read'

      # View your Google+ posts, comments, and stream
      AUTH_PLUS_STREAM_READ = 'https://www.googleapis.com/auth/plus.stream.read'

      # View your email address
      AUTH_USERINFO_EMAIL = 'https://www.googleapis.com/auth/userinfo.email'

      # See your personal info, including any personal info you've made publicly available
      AUTH_USERINFO_PROFILE = 'https://www.googleapis.com/auth/userinfo.profile'
    end
  end
end
