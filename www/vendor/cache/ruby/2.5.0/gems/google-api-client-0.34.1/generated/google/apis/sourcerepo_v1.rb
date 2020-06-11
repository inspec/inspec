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

require 'google/apis/sourcerepo_v1/service.rb'
require 'google/apis/sourcerepo_v1/classes.rb'
require 'google/apis/sourcerepo_v1/representations.rb'

module Google
  module Apis
    # Cloud Source Repositories API
    #
    # Accesses source code repositories hosted by Google.
    #
    # @see https://cloud.google.com/source-repositories/docs/apis
    module SourcerepoV1
      VERSION = 'V1'
      REVISION = '20190611'

      # View and manage your data across Google Cloud Platform services
      AUTH_CLOUD_PLATFORM = 'https://www.googleapis.com/auth/cloud-platform'

      # Manage your source code repositories
      AUTH_SOURCE_FULL_CONTROL = 'https://www.googleapis.com/auth/source.full_control'

      # View the contents of your source code repositories
      AUTH_SOURCE_READ_ONLY = 'https://www.googleapis.com/auth/source.read_only'

      # Manage the contents of your source code repositories
      AUTH_SOURCE_READ_WRITE = 'https://www.googleapis.com/auth/source.read_write'
    end
  end
end
