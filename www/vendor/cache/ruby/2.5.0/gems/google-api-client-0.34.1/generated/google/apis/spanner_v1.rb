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

require 'google/apis/spanner_v1/service.rb'
require 'google/apis/spanner_v1/classes.rb'
require 'google/apis/spanner_v1/representations.rb'

module Google
  module Apis
    # Cloud Spanner API
    #
    # Cloud Spanner is a managed, mission-critical, globally consistent and scalable
    # relational database service.
    #
    # @see https://cloud.google.com/spanner/
    module SpannerV1
      VERSION = 'V1'
      REVISION = '20190911'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'

      # Administer your Spanner databases
      AUTH_SPANNER_ADMIN = 'https://www.googleapis.com/auth/spanner.admin'

      # View and manage the contents of your Spanner databases
      AUTH_SPANNER_DATA = 'https://www.googleapis.com/auth/spanner.data'
    end
  end
end
