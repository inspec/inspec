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

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module YoutubeAnalyticsV2
      
      class EmptyResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ErrorProto
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Errors
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Group
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GroupContentDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GroupItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GroupItemResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GroupSnippet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListGroupItemsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListGroupsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QueryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResultTableColumnHeader
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EmptyResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :errors, as: 'errors', class: Google::Apis::YoutubeAnalyticsV2::Errors, decorator: Google::Apis::YoutubeAnalyticsV2::Errors::Representation
      
        end
      end
      
      class ErrorProto
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :argument, as: 'argument'
          property :code, as: 'code'
          property :debug_info, as: 'debugInfo'
          property :domain, as: 'domain'
          property :external_error_message, as: 'externalErrorMessage'
          property :location, as: 'location'
          property :location_type, as: 'locationType'
        end
      end
      
      class Errors
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :error, as: 'error', class: Google::Apis::YoutubeAnalyticsV2::ErrorProto, decorator: Google::Apis::YoutubeAnalyticsV2::ErrorProto::Representation
      
          property :request_id, as: 'requestId'
        end
      end
      
      class Group
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_details, as: 'contentDetails', class: Google::Apis::YoutubeAnalyticsV2::GroupContentDetails, decorator: Google::Apis::YoutubeAnalyticsV2::GroupContentDetails::Representation
      
          property :errors, as: 'errors', class: Google::Apis::YoutubeAnalyticsV2::Errors, decorator: Google::Apis::YoutubeAnalyticsV2::Errors::Representation
      
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :snippet, as: 'snippet', class: Google::Apis::YoutubeAnalyticsV2::GroupSnippet, decorator: Google::Apis::YoutubeAnalyticsV2::GroupSnippet::Representation
      
        end
      end
      
      class GroupContentDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :item_count, :numeric_string => true, as: 'itemCount'
          property :item_type, as: 'itemType'
        end
      end
      
      class GroupItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :errors, as: 'errors', class: Google::Apis::YoutubeAnalyticsV2::Errors, decorator: Google::Apis::YoutubeAnalyticsV2::Errors::Representation
      
          property :etag, as: 'etag'
          property :group_id, as: 'groupId'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :resource, as: 'resource', class: Google::Apis::YoutubeAnalyticsV2::GroupItemResource, decorator: Google::Apis::YoutubeAnalyticsV2::GroupItemResource::Representation
      
        end
      end
      
      class GroupItemResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :kind, as: 'kind'
        end
      end
      
      class GroupSnippet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :published_at, as: 'publishedAt'
          property :title, as: 'title'
        end
      end
      
      class ListGroupItemsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :errors, as: 'errors', class: Google::Apis::YoutubeAnalyticsV2::Errors, decorator: Google::Apis::YoutubeAnalyticsV2::Errors::Representation
      
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::YoutubeAnalyticsV2::GroupItem, decorator: Google::Apis::YoutubeAnalyticsV2::GroupItem::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ListGroupsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :errors, as: 'errors', class: Google::Apis::YoutubeAnalyticsV2::Errors, decorator: Google::Apis::YoutubeAnalyticsV2::Errors::Representation
      
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::YoutubeAnalyticsV2::Group, decorator: Google::Apis::YoutubeAnalyticsV2::Group::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class QueryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :column_headers, as: 'columnHeaders', class: Google::Apis::YoutubeAnalyticsV2::ResultTableColumnHeader, decorator: Google::Apis::YoutubeAnalyticsV2::ResultTableColumnHeader::Representation
      
          property :errors, as: 'errors', class: Google::Apis::YoutubeAnalyticsV2::Errors, decorator: Google::Apis::YoutubeAnalyticsV2::Errors::Representation
      
          property :kind, as: 'kind'
          collection :rows, as: 'rows', :class => Array do
        include Representable::JSON::Collection
        items
      end
      
        end
      end
      
      class ResultTableColumnHeader
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :column_type, as: 'columnType'
          property :data_type, as: 'dataType'
          property :name, as: 'name'
        end
      end
    end
  end
end
