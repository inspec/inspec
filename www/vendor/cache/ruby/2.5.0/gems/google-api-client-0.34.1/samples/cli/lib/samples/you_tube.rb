# Copyright 2016 Google Inc.
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

require 'google/apis/youtube_v3'
require 'base_cli'


module Samples
  # Examples for the YouTube APIs
  #
  # Sample usage:
  #
  #     $ ./google-api-samples youtube upload ~/myvideo.mov --title="So funny!"
  #
  class YouTube < BaseCli
    YT = Google::Apis::YoutubeV3

    desc 'upload FILE', 'Upload a video to YouTube'
    method_option :title, type: :string
    def upload(file)
      youtube = YT::YouTubeService.new
      youtube.authorization = user_credentials_for(YT::AUTH_YOUTUBE)

      metadata  = {
        snippet: {
          title: options[:title] || file
        },
        status: {
          privacy_status: 'unlisted'
        }
      }
      result = youtube.insert_video('snippet,status', metadata, upload_source: file)
      say "Upload complete"
    end
  end
end
