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

require 'google/apis/bigquery_v2/service.rb'
require 'google/apis/bigquery_v2/classes.rb'
require 'google/apis/bigquery_v2/representations.rb'

module Google
  module Apis
    # BigQuery API
    #
    # A data platform for customers to create, manage, share and query data.
    #
    # @see https://cloud.google.com/bigquery/
    module BigqueryV2
      VERSION = 'V2'
      REVISION = '20191019'

      # View and manage your data in Google BigQuery
      AUTH_BIGQUERY = 'https://www.googleapis.com/auth/bigquery'

      # Insert data into Google BigQuery
      AUTH_BIGQUERY_INSERTDATA = 'https://www.googleapis.com/auth/bigquery.insertdata'

      # View your data in Google BigQuery
      AUTH_BIGQUERY_READONLY = 'https://www.googleapis.com/auth/bigquery.readonly'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'

      # View your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM_READ_ONLY = 'https://www.googleapis.com/auth/cloud-platform.read-only'

      # Manage your data and permissions in Google Cloud Storage
      AUTH_DEVSTORAGE_FULL_CONTROL = 'https://www.googleapis.com/auth/devstorage.full_control'

      # View your data in Google Cloud Storage
      AUTH_DEVSTORAGE_READ_ONLY = 'https://www.googleapis.com/auth/devstorage.read_only'

      # Manage your data in Google Cloud Storage
      AUTH_DEVSTORAGE_READ_WRITE = 'https://www.googleapis.com/auth/devstorage.read_write'
    end
  end
end
