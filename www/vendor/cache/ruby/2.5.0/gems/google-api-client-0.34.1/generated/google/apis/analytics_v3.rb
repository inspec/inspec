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

require 'google/apis/analytics_v3/service.rb'
require 'google/apis/analytics_v3/classes.rb'
require 'google/apis/analytics_v3/representations.rb'

module Google
  module Apis
    # Google Analytics API
    #
    # Views and manages your Google Analytics data.
    #
    # @see https://developers.google.com/analytics/
    module AnalyticsV3
      VERSION = 'V3'
      REVISION = '20190807'

      # View and manage your Google Analytics data
      AUTH_ANALYTICS = 'https://www.googleapis.com/auth/analytics'

      # Edit Google Analytics management entities
      AUTH_ANALYTICS_EDIT = 'https://www.googleapis.com/auth/analytics.edit'

      # Manage Google Analytics Account users by email address
      AUTH_ANALYTICS_MANAGE_USERS = 'https://www.googleapis.com/auth/analytics.manage.users'

      # View Google Analytics user permissions
      AUTH_ANALYTICS_MANAGE_USERS_READONLY = 'https://www.googleapis.com/auth/analytics.manage.users.readonly'

      # Create a new Google Analytics account along with its default property and view
      AUTH_ANALYTICS_PROVISION = 'https://www.googleapis.com/auth/analytics.provision'

      # View your Google Analytics data
      AUTH_ANALYTICS_READONLY = 'https://www.googleapis.com/auth/analytics.readonly'

      # Manage Google Analytics user deletion requests
      AUTH_ANALYTICS_USER_DELETION = 'https://www.googleapis.com/auth/analytics.user.deletion'
    end
  end
end
