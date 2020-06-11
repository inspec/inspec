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

require 'google/apis/groupsmigration_v1/service.rb'
require 'google/apis/groupsmigration_v1/classes.rb'
require 'google/apis/groupsmigration_v1/representations.rb'

module Google
  module Apis
    # Groups Migration API
    #
    # Groups Migration Api.
    #
    # @see https://developers.google.com/google-apps/groups-migration/
    module GroupsmigrationV1
      VERSION = 'V1'
      REVISION = '20180803'

      # Manage messages in groups on your domain
      AUTH_APPS_GROUPS_MIGRATION = 'https://www.googleapis.com/auth/apps.groups.migration'
    end
  end
end
