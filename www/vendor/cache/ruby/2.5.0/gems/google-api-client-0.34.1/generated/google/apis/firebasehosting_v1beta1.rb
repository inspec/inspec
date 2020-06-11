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

require 'google/apis/firebasehosting_v1beta1/service.rb'
require 'google/apis/firebasehosting_v1beta1/classes.rb'
require 'google/apis/firebasehosting_v1beta1/representations.rb'

module Google
  module Apis
    # Firebase Hosting API
    #
    # The Firebase Hosting REST API enables programmatic and customizable
    # deployments to your Firebase-hosted sites. Use this REST API to deploy new or
    # updated hosting configurations and content files.
    #
    # @see https://firebase.google.com/docs/hosting/
    module FirebasehostingV1beta1
      VERSION = 'V1beta1'
      REVISION = '20191029'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'

      # View your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM_READ_ONLY = 'https://www.googleapis.com/auth/cloud-platform.read-only'

      # View and administer all your Firebase data and settings
      AUTH_FIREBASE = 'https://www.googleapis.com/auth/firebase'

      # View all your Firebase data and settings
      AUTH_FIREBASE_READONLY = 'https://www.googleapis.com/auth/firebase.readonly'
    end
  end
end
