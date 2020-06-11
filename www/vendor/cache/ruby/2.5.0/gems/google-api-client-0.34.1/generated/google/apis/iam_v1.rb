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

require 'google/apis/iam_v1/service.rb'
require 'google/apis/iam_v1/classes.rb'
require 'google/apis/iam_v1/representations.rb'

module Google
  module Apis
    # Identity and Access Management (IAM) API
    #
    # Manages identity and access control for Google Cloud Platform resources,
    # including the creation of service accounts, which you can use to authenticate
    # to Google and make API calls.
    #
    # @see https://cloud.google.com/iam/
    module IamV1
      VERSION = 'V1'
      REVISION = '20191025'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'
    end
  end
end
