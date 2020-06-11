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
      
      # Empty response.
      class EmptyResponse
        include Google::Apis::Core::Hashable
      
        # Request Error information.
        # The presence of an error field signals that the operation
        # has failed.
        # Corresponds to the JSON property `errors`
        # @return [Google::Apis::YoutubeAnalyticsV2::Errors]
        attr_accessor :errors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @errors = args[:errors] if args.key?(:errors)
        end
      end
      
      # Describes one specific error.
      class ErrorProto
        include Google::Apis::Core::Hashable
      
        # Error arguments, to be used when building user-friendly error messages
        # given the error domain and code.  Different error codes require different
        # arguments.
        # Corresponds to the JSON property `argument`
        # @return [Array<String>]
        attr_accessor :argument
      
        # Error code in the error domain. This should correspond to
        # a value of the enum type whose name is in domain. See
        # the core error domain in error_domain.proto.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # Debugging information, which should not be
        # shared externally.
        # Corresponds to the JSON property `debugInfo`
        # @return [String]
        attr_accessor :debug_info
      
        # Error domain. RoSy services can define their own
        # domain and error codes. This should normally be
        # the name of an enum type, such as: gdata.CoreErrorDomain
        # Corresponds to the JSON property `domain`
        # @return [String]
        attr_accessor :domain
      
        # A short explanation for the error, which can be shared outside Google.
        # Please set domain, code and arguments whenever possible instead of this
        # error message so that external APIs can build safe error messages
        # themselves.
        # External messages built in a RoSy interface will most likely refer to
        # information and concepts that are not available externally and should not
        # be exposed. It is safer if external APIs can understand the errors and
        # decide what the error message should look like.
        # Corresponds to the JSON property `externalErrorMessage`
        # @return [String]
        attr_accessor :external_error_message
      
        # Location of the error, as specified by the location type.
        # If location_type is PATH, this should be a path to a field that's
        # relative to the request, using FieldPath notation
        # (net/proto2/util/public/field_path.h).
        # Examples:
        # authenticated_user.gaia_id
        # resource.address[2].country
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # 
        # Corresponds to the JSON property `locationType`
        # @return [String]
        attr_accessor :location_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @argument = args[:argument] if args.key?(:argument)
          @code = args[:code] if args.key?(:code)
          @debug_info = args[:debug_info] if args.key?(:debug_info)
          @domain = args[:domain] if args.key?(:domain)
          @external_error_message = args[:external_error_message] if args.key?(:external_error_message)
          @location = args[:location] if args.key?(:location)
          @location_type = args[:location_type] if args.key?(:location_type)
        end
      end
      
      # Request Error information.
      # The presence of an error field signals that the operation
      # has failed.
      class Errors
        include Google::Apis::Core::Hashable
      
        # Global error code. Deprecated and ignored.
        # Set custom error codes in ErrorProto.domain and ErrorProto.code
        # instead.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # Specific error description and codes
        # Corresponds to the JSON property `error`
        # @return [Array<Google::Apis::YoutubeAnalyticsV2::ErrorProto>]
        attr_accessor :error
      
        # Request identifier generated by the service, which can be
        # used to identify the error in the logs
        # Corresponds to the JSON property `requestId`
        # @return [String]
        attr_accessor :request_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @error = args[:error] if args.key?(:error)
          @request_id = args[:request_id] if args.key?(:request_id)
        end
      end
      
      # A group.
      class Group
        include Google::Apis::Core::Hashable
      
        # A group's content details.
        # Corresponds to the JSON property `contentDetails`
        # @return [Google::Apis::YoutubeAnalyticsV2::GroupContentDetails]
        attr_accessor :content_details
      
        # Request Error information.
        # The presence of an error field signals that the operation
        # has failed.
        # Corresponds to the JSON property `errors`
        # @return [Google::Apis::YoutubeAnalyticsV2::Errors]
        attr_accessor :errors
      
        # The Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the group.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies the API resource's type. The value will be `youtube#group`.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A group snippet.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::YoutubeAnalyticsV2::GroupSnippet]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_details = args[:content_details] if args.key?(:content_details)
          @errors = args[:errors] if args.key?(:errors)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # A group's content details.
      class GroupContentDetails
        include Google::Apis::Core::Hashable
      
        # The number of items in the group.
        # Corresponds to the JSON property `itemCount`
        # @return [Fixnum]
        attr_accessor :item_count
      
        # The type of resources that the group contains.
        # Valid values for this property are:
        # * `youtube#channel`
        # * `youtube#playlist`
        # * `youtube#video`
        # * `youtubePartner#asset`
        # Corresponds to the JSON property `itemType`
        # @return [String]
        attr_accessor :item_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @item_count = args[:item_count] if args.key?(:item_count)
          @item_type = args[:item_type] if args.key?(:item_type)
        end
      end
      
      # A group item.
      class GroupItem
        include Google::Apis::Core::Hashable
      
        # Request Error information.
        # The presence of an error field signals that the operation
        # has failed.
        # Corresponds to the JSON property `errors`
        # @return [Google::Apis::YoutubeAnalyticsV2::Errors]
        attr_accessor :errors
      
        # The Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID that YouTube uses to uniquely identify the group that contains the
        # item.
        # Corresponds to the JSON property `groupId`
        # @return [String]
        attr_accessor :group_id
      
        # The ID that YouTube uses to uniquely identify the `channel`, `video`,
        # `playlist`, or `asset` resource that is included in the group. Note that
        # this ID refers specifically to the inclusion of that resource in a
        # particular group and is different than the channel ID, video ID,
        # playlist ID, or asset ID that uniquely identifies the resource itself.
        # The `resource.id` property's value specifies the unique channel, video,
        # playlist, or asset ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies the API resource's type. The value will be `youtube#groupItem`.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The `resource` object contains information that identifies the item being
        # added to the group.
        # Corresponds to the JSON property `resource`
        # @return [Google::Apis::YoutubeAnalyticsV2::GroupItemResource]
        attr_accessor :resource
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @errors = args[:errors] if args.key?(:errors)
          @etag = args[:etag] if args.key?(:etag)
          @group_id = args[:group_id] if args.key?(:group_id)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @resource = args[:resource] if args.key?(:resource)
        end
      end
      
      # 
      class GroupItemResource
        include Google::Apis::Core::Hashable
      
        # The channel, video, playlist, or asset ID that YouTube uses to uniquely
        # identify the item that is being added to the group.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies the type of resource being added to the group.
        # Valid values for this property are:
        # * `youtube#channel`
        # * `youtube#playlist`
        # * `youtube#video`
        # * `youtubePartner#asset`
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # A group snippet.
      class GroupSnippet
        include Google::Apis::Core::Hashable
      
        # The date and time that the group was created. The value is specified in
        # ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
        # Corresponds to the JSON property `publishedAt`
        # @return [String]
        attr_accessor :published_at
      
        # The group name. The value must be a non-empty string.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @published_at = args[:published_at] if args.key?(:published_at)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Response message for GroupsService.ListGroupItems.
      class ListGroupItemsResponse
        include Google::Apis::Core::Hashable
      
        # Request Error information.
        # The presence of an error field signals that the operation
        # has failed.
        # Corresponds to the JSON property `errors`
        # @return [Google::Apis::YoutubeAnalyticsV2::Errors]
        attr_accessor :errors
      
        # The Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # A list of groups that match the API request parameters. Each item in the
        # list represents a `groupItem` resource.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeAnalyticsV2::GroupItem>]
        attr_accessor :items
      
        # Identifies the API resource's type. The value will be
        # `youtube#groupItemListResponse`.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @errors = args[:errors] if args.key?(:errors)
          @etag = args[:etag] if args.key?(:etag)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Response message for GroupsService.ListGroups.
      class ListGroupsResponse
        include Google::Apis::Core::Hashable
      
        # Request Error information.
        # The presence of an error field signals that the operation
        # has failed.
        # Corresponds to the JSON property `errors`
        # @return [Google::Apis::YoutubeAnalyticsV2::Errors]
        attr_accessor :errors
      
        # The Etag of this resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # A list of groups that match the API request parameters. Each item in the
        # list represents a `group` resource.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::YoutubeAnalyticsV2::Group>]
        attr_accessor :items
      
        # Identifies the API resource's type. The value will be
        # `youtube#groupListResponse`.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token that can be used as the value of the `pageToken` parameter to
        # retrieve the next page in the result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @errors = args[:errors] if args.key?(:errors)
          @etag = args[:etag] if args.key?(:etag)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for TargetedQueriesService.Query.
      class QueryResponse
        include Google::Apis::Core::Hashable
      
        # This value specifies information about the data returned in the `rows`
        # fields. Each item in the `columnHeaders` list identifies a field returned
        # in the `rows` value, which contains a list of comma-delimited data. The
        # `columnHeaders` list will begin with the dimensions specified in the API
        # request, which will be followed by the metrics specified in the API
        # request. The order of both dimensions and metrics will match the ordering
        # in the API request. For example, if the API request contains the parameters
        # `dimensions=ageGroup,gender&metrics=viewerPercentage`, the API response
        # will return columns in this order: `ageGroup`, `gender`,
        # `viewerPercentage`.
        # Corresponds to the JSON property `columnHeaders`
        # @return [Array<Google::Apis::YoutubeAnalyticsV2::ResultTableColumnHeader>]
        attr_accessor :column_headers
      
        # Request Error information.
        # The presence of an error field signals that the operation
        # has failed.
        # Corresponds to the JSON property `errors`
        # @return [Google::Apis::YoutubeAnalyticsV2::Errors]
        attr_accessor :errors
      
        # This value specifies the type of data included in the API response.
        # For the query method, the kind property value will be
        # `youtubeAnalytics#resultTable`.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The list contains all rows of the result table. Each item in the list is
        # an array that contains comma-delimited data corresponding to a single row
        # of data. The order of the comma-delimited data fields will match the
        # order of the columns listed in the `columnHeaders` field.
        # If no data is available for the given query, the `rows` element will be
        # omitted from the response.
        # The response for a query with the `day` dimension will not contain rows for
        # the most recent days.
        # Corresponds to the JSON property `rows`
        # @return [Array<Array<Object>>]
        attr_accessor :rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column_headers = args[:column_headers] if args.key?(:column_headers)
          @errors = args[:errors] if args.key?(:errors)
          @kind = args[:kind] if args.key?(:kind)
          @rows = args[:rows] if args.key?(:rows)
        end
      end
      
      # The description of a column of the result table.
      class ResultTableColumnHeader
        include Google::Apis::Core::Hashable
      
        # The type of the column (`DIMENSION` or `METRIC`).
        # Corresponds to the JSON property `columnType`
        # @return [String]
        attr_accessor :column_type
      
        # The type of the data in the column (`STRING`, `INTEGER`, `FLOAT`, etc.).
        # Corresponds to the JSON property `dataType`
        # @return [String]
        attr_accessor :data_type
      
        # The name of the dimension or metric.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column_type = args[:column_type] if args.key?(:column_type)
          @data_type = args[:data_type] if args.key?(:data_type)
          @name = args[:name] if args.key?(:name)
        end
      end
    end
  end
end
