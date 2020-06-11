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

require 'google/apis/compute_v1/service.rb'
require 'google/apis/compute_v1/classes.rb'
require 'google/apis/compute_v1/representations.rb'

module Google
  module Apis
    # Compute Engine API
    #
    # Creates and runs virtual machines on Google Cloud Platform.
    #
    # @see https://developers.google.com/compute/docs/reference/latest/
    module ComputeV1
      VERSION = 'V1'
      REVISION = '20191009'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'

      # View and manage your Google Compute Engine resources
      AUTH_COMPUTE = 'https://www.googleapis.com/auth/compute'

      # View your Google Compute Engine resources
      AUTH_COMPUTE_READONLY = 'https://www.googleapis.com/auth/compute.readonly'

      # Manage your data and permissions in Google Cloud Storage
      AUTH_DEVSTORAGE_FULL_CONTROL = 'https://www.googleapis.com/auth/devstorage.full_control'

      # View your data in Google Cloud Storage
      AUTH_DEVSTORAGE_READ_ONLY = 'https://www.googleapis.com/auth/devstorage.read_only'

      # Manage your data in Google Cloud Storage
      AUTH_DEVSTORAGE_READ_WRITE = 'https://www.googleapis.com/auth/devstorage.read_write'
    end
  end
end
