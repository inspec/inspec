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

require 'google/apis/bigquerydatatransfer_v1/service.rb'
require 'google/apis/bigquerydatatransfer_v1/classes.rb'
require 'google/apis/bigquerydatatransfer_v1/representations.rb'

module Google
  module Apis
    # BigQuery Data Transfer API
    #
    # Schedule queries or transfer external data from SaaS applications to Google
    # BigQuery on a regular basis.
    #
    # @see https://cloud.google.com/bigquery/
    module BigquerydatatransferV1
      VERSION = 'V1'
      REVISION = '20190918'

      # View and manage your data in Google BigQuery
      AUTH_BIGQUERY = 'https://www.googleapis.com/auth/bigquery'

      # View your data in Google BigQuery
      AUTH_BIGQUERY_READONLY = 'https://www.googleapis.com/auth/bigquery.readonly'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'

      # View your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM_READ_ONLY = 'https://www.googleapis.com/auth/cloud-platform.read-only'
    end
  end
end
