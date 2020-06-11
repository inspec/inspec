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

require 'google/apis/cloudsearch_v1/service.rb'
require 'google/apis/cloudsearch_v1/classes.rb'
require 'google/apis/cloudsearch_v1/representations.rb'

module Google
  module Apis
    # Cloud Search API
    #
    # Cloud Search provides cloud-based search capabilities over G Suite data.  The
    # Cloud Search API allows indexing of non-G Suite data into Cloud Search.
    #
    # @see https://developers.google.com/cloud-search/docs/guides/
    module CloudsearchV1
      VERSION = 'V1'
      REVISION = '20191009'

      # Index and serve your organization's data with Cloud Search
      AUTH_CLOUD_SEARCH = 'https://www.googleapis.com/auth/cloud_search'

      # New Service: https://www.googleapis.com/auth/cloud_search.debug
      AUTH_CLOUD_SEARCH_DEBUG = 'https://www.googleapis.com/auth/cloud_search.debug'

      # New Service: https://www.googleapis.com/auth/cloud_search.indexing
      AUTH_CLOUD_SEARCH_INDEXING = 'https://www.googleapis.com/auth/cloud_search.indexing'

      # Search your organization's data in the Cloud Search index
      AUTH_CLOUD_SEARCH_QUERY = 'https://www.googleapis.com/auth/cloud_search.query'

      # New Service: https://www.googleapis.com/auth/cloud_search.settings
      AUTH_CLOUD_SEARCH_SETTINGS = 'https://www.googleapis.com/auth/cloud_search.settings'

      # New Service: https://www.googleapis.com/auth/cloud_search.settings.indexing
      AUTH_CLOUD_SEARCH_SETTINGS_INDEXING = 'https://www.googleapis.com/auth/cloud_search.settings.indexing'

      # New Service: https://www.googleapis.com/auth/cloud_search.settings.query
      AUTH_CLOUD_SEARCH_SETTINGS_QUERY = 'https://www.googleapis.com/auth/cloud_search.settings.query'

      # New Service: https://www.googleapis.com/auth/cloud_search.stats
      AUTH_CLOUD_SEARCH_STATS = 'https://www.googleapis.com/auth/cloud_search.stats'

      # New Service: https://www.googleapis.com/auth/cloud_search.stats.indexing
      AUTH_CLOUD_SEARCH_STATS_INDEXING = 'https://www.googleapis.com/auth/cloud_search.stats.indexing'
    end
  end
end
