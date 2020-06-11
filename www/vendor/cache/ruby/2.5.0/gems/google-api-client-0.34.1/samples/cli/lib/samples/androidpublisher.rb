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

require 'google/apis/androidpublisher_v2'
require 'base_cli'


module Samples
  # Examples for the Google Play Developer API
  #
  # Sample usage:
  #
  #     $ ./google-api-samples androidpublisher upload --apk-path /path/to/com.spiffygame.apk --package-name com.spiffygame
  class Androidpublisher < BaseCli
    Androidpublisher = Google::Apis::AndroidpublisherV2

    desc 'upload', 'Upload an apk to Google Play'
    method_option :apk_path, type: :string
    method_option :package_name, type: :string
    def upload_apk
      android_publisher = Androidpublisher::AndroidPublisherService.new
      android_publisher.authorization = user_credentials_for(Androidpublisher::AUTH_ANDROIDPUBLISHER)

      apk_path = options[:apk_path]
      package_name = options[:package_name]

      edit = android_publisher.insert_edit(package_name)
      apk = android_publisher.upload_apk(package_name, edit.id, upload_source: apk_path)
      android_publisher.update_track(package_name, edit.id, :production,
        Androidpublisher::Track.new(track: "production", version_codes: [apk.version_code]))
      android_publisher.commit_edit(package_name, edit.id)

      say "Upload complete"
    end
  end
end
