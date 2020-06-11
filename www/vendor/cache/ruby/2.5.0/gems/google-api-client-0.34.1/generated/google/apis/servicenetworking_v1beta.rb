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

require 'google/apis/servicenetworking_v1beta/service.rb'
require 'google/apis/servicenetworking_v1beta/classes.rb'
require 'google/apis/servicenetworking_v1beta/representations.rb'

module Google
  module Apis
    # Service Networking API
    #
    # Provides automatic management of network configurations necessary for certain
    # services.
    #
    # @see https://cloud.google.com/service-infrastructure/docs/service-networking/getting-started
    module ServicenetworkingV1beta
      VERSION = 'V1beta'
      REVISION = '20190922'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'

      # Manage your Google API service configuration
      AUTH_SERVICE_MANAGEMENT = 'https://www.googleapis.com/auth/service.management'
    end
  end
end
