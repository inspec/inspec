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

require 'google/apis/jobs_v3/service.rb'
require 'google/apis/jobs_v3/classes.rb'
require 'google/apis/jobs_v3/representations.rb'

module Google
  module Apis
    # Cloud Talent Solution API
    #
    # Cloud Talent Solution provides the capability to create, read, update, and
    # delete job postings, as well as search jobs based on keywords and filters.
    #
    # @see https://cloud.google.com/talent-solution/job-search/docs/
    module JobsV3
      VERSION = 'V3'
      REVISION = '20191029'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'

      # Manage job postings
      AUTH_JOBS = 'https://www.googleapis.com/auth/jobs'
    end
  end
end
