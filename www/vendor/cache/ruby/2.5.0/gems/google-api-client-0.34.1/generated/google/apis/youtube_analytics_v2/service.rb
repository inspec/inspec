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

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module YoutubeAnalyticsV2
      # YouTube Analytics API
      #
      # Retrieves your YouTube Analytics data.
      #
      # @example
      #    require 'google/apis/youtube_analytics_v2'
      #
      #    YoutubeAnalytics = Google::Apis::YoutubeAnalyticsV2 # Alias the module
      #    service = YoutubeAnalytics::YouTubeAnalyticsService.new
      #
      # @see https://developers.google.com/youtube/analytics
      class YouTubeAnalyticsService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://youtubeanalytics.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Removes an item from a group.
        # @param [String] id
        #   The `id` parameter specifies the YouTube group item ID of the group item
        #   that is being deleted.
        # @param [String] on_behalf_of_content_owner
        #   This parameter can only be used in a properly authorized request. **Note:**
        #   This parameter is intended exclusively for YouTube content partners that
        #   own and manage many different YouTube channels.
        #   The `onBehalfOfContentOwner` parameter indicates that the request's
        #   authorization credentials identify a YouTube user who is acting on behalf
        #   of the content owner specified in the parameter value. It allows content
        #   owners to authenticate once and get access to all their video and channel
        #   data, without having to provide authentication credentials for each
        #   individual channel. The account that the user authenticates with must be
        #   linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeAnalyticsV2::EmptyResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeAnalyticsV2::EmptyResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_group_item(id: nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/groupItems', options)
          command.response_representation = Google::Apis::YoutubeAnalyticsV2::EmptyResponse::Representation
          command.response_class = Google::Apis::YoutubeAnalyticsV2::EmptyResponse
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a group item.
        # @param [Google::Apis::YoutubeAnalyticsV2::GroupItem] group_item_object
        # @param [String] on_behalf_of_content_owner
        #   This parameter can only be used in a properly authorized request. **Note:**
        #   This parameter is intended exclusively for YouTube content partners that
        #   own and manage many different YouTube channels.
        #   The `onBehalfOfContentOwner` parameter indicates that the request's
        #   authorization credentials identify a YouTube user who is acting on behalf
        #   of the content owner specified in the parameter value. It allows content
        #   owners to authenticate once and get access to all their video and channel
        #   data, without having to provide authentication credentials for each
        #   individual channel. The account that the user authenticates with must be
        #   linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeAnalyticsV2::GroupItem] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeAnalyticsV2::GroupItem]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_group_item(group_item_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/groupItems', options)
          command.request_representation = Google::Apis::YoutubeAnalyticsV2::GroupItem::Representation
          command.request_object = group_item_object
          command.response_representation = Google::Apis::YoutubeAnalyticsV2::GroupItem::Representation
          command.response_class = Google::Apis::YoutubeAnalyticsV2::GroupItem
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a collection of group items that match the API request parameters.
        # @param [String] group_id
        #   The `groupId` parameter specifies the unique ID of the group for which you
        #   want to retrieve group items.
        # @param [String] on_behalf_of_content_owner
        #   This parameter can only be used in a properly authorized request. **Note:**
        #   This parameter is intended exclusively for YouTube content partners that
        #   own and manage many different YouTube channels.
        #   The `onBehalfOfContentOwner` parameter indicates that the request's
        #   authorization credentials identify a YouTube user who is acting on behalf
        #   of the content owner specified in the parameter value. It allows content
        #   owners to authenticate once and get access to all their video and channel
        #   data, without having to provide authentication credentials for each
        #   individual channel. The account that the user authenticates with must be
        #   linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeAnalyticsV2::ListGroupItemsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeAnalyticsV2::ListGroupItemsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_group_items(group_id: nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/groupItems', options)
          command.response_representation = Google::Apis::YoutubeAnalyticsV2::ListGroupItemsResponse::Representation
          command.response_class = Google::Apis::YoutubeAnalyticsV2::ListGroupItemsResponse
          command.query['groupId'] = group_id unless group_id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a group.
        # @param [String] id
        #   The `id` parameter specifies the YouTube group ID of the group that is
        #   being deleted.
        # @param [String] on_behalf_of_content_owner
        #   This parameter can only be used in a properly authorized request. **Note:**
        #   This parameter is intended exclusively for YouTube content partners that
        #   own and manage many different YouTube channels.
        #   The `onBehalfOfContentOwner` parameter indicates that the request's
        #   authorization credentials identify a YouTube user who is acting on behalf
        #   of the content owner specified in the parameter value. It allows content
        #   owners to authenticate once and get access to all their video and channel
        #   data, without having to provide authentication credentials for each
        #   individual channel. The account that the user authenticates with must be
        #   linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeAnalyticsV2::EmptyResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeAnalyticsV2::EmptyResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_group(id: nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/groups', options)
          command.response_representation = Google::Apis::YoutubeAnalyticsV2::EmptyResponse::Representation
          command.response_class = Google::Apis::YoutubeAnalyticsV2::EmptyResponse
          command.query['id'] = id unless id.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a group.
        # @param [Google::Apis::YoutubeAnalyticsV2::Group] group_object
        # @param [String] on_behalf_of_content_owner
        #   This parameter can only be used in a properly authorized request. **Note:**
        #   This parameter is intended exclusively for YouTube content partners that
        #   own and manage many different YouTube channels.
        #   The `onBehalfOfContentOwner` parameter indicates that the request's
        #   authorization credentials identify a YouTube user who is acting on behalf
        #   of the content owner specified in the parameter value. It allows content
        #   owners to authenticate once and get access to all their video and channel
        #   data, without having to provide authentication credentials for each
        #   individual channel. The account that the user authenticates with must be
        #   linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeAnalyticsV2::Group] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeAnalyticsV2::Group]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_group(group_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/groups', options)
          command.request_representation = Google::Apis::YoutubeAnalyticsV2::Group::Representation
          command.request_object = group_object
          command.response_representation = Google::Apis::YoutubeAnalyticsV2::Group::Representation
          command.response_class = Google::Apis::YoutubeAnalyticsV2::Group
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a collection of groups that match the API request parameters. For
        # example, you can retrieve all groups that the authenticated user owns,
        # or you can retrieve one or more groups by their unique IDs.
        # @param [String] id
        #   The `id` parameter specifies a comma-separated list of the YouTube group
        #   ID(s) for the resource(s) that are being retrieved. Each group must be
        #   owned by the authenticated user. In a `group` resource, the `id` property
        #   specifies the group's YouTube group ID.
        #   Note that if you do not specify a value for the `id` parameter, then you
        #   must set the `mine` parameter to `true`.
        # @param [Boolean] mine
        #   This parameter can only be used in a properly authorized request. Set this
        #   parameter's value to true to retrieve all groups owned by the authenticated
        #   user.
        # @param [String] on_behalf_of_content_owner
        #   This parameter can only be used in a properly authorized request. **Note:**
        #   This parameter is intended exclusively for YouTube content partners that
        #   own and manage many different YouTube channels.
        #   The `onBehalfOfContentOwner` parameter indicates that the request's
        #   authorization credentials identify a YouTube user who is acting on behalf
        #   of the content owner specified in the parameter value. It allows content
        #   owners to authenticate once and get access to all their video and channel
        #   data, without having to provide authentication credentials for each
        #   individual channel. The account that the user authenticates with must be
        #   linked to the specified YouTube content owner.
        # @param [String] page_token
        #   The `pageToken` parameter identifies a specific page in the result set that
        #   should be returned. In an API response, the `nextPageToken` property
        #   identifies the next page that can be retrieved.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeAnalyticsV2::ListGroupsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeAnalyticsV2::ListGroupsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_groups(id: nil, mine: nil, on_behalf_of_content_owner: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/groups', options)
          command.response_representation = Google::Apis::YoutubeAnalyticsV2::ListGroupsResponse::Representation
          command.response_class = Google::Apis::YoutubeAnalyticsV2::ListGroupsResponse
          command.query['id'] = id unless id.nil?
          command.query['mine'] = mine unless mine.nil?
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Modifies a group. For example, you could change a group's title.
        # @param [Google::Apis::YoutubeAnalyticsV2::Group] group_object
        # @param [String] on_behalf_of_content_owner
        #   This parameter can only be used in a properly authorized request. **Note:**
        #   This parameter is intended exclusively for YouTube content partners that
        #   own and manage many different YouTube channels.
        #   The `onBehalfOfContentOwner` parameter indicates that the request's
        #   authorization credentials identify a YouTube user who is acting on behalf
        #   of the content owner specified in the parameter value. It allows content
        #   owners to authenticate once and get access to all their video and channel
        #   data, without having to provide authentication credentials for each
        #   individual channel. The account that the user authenticates with must be
        #   linked to the specified YouTube content owner.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeAnalyticsV2::Group] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeAnalyticsV2::Group]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_group(group_object = nil, on_behalf_of_content_owner: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v2/groups', options)
          command.request_representation = Google::Apis::YoutubeAnalyticsV2::Group::Representation
          command.request_object = group_object
          command.response_representation = Google::Apis::YoutubeAnalyticsV2::Group::Representation
          command.response_class = Google::Apis::YoutubeAnalyticsV2::Group
          command.query['onBehalfOfContentOwner'] = on_behalf_of_content_owner unless on_behalf_of_content_owner.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieve your YouTube Analytics reports.
        # @param [String] currency
        #   The currency to which financial metrics should be converted. The default is
        #   US Dollar (USD). If the result contains no financial metrics, this flag
        #   will be ignored. Responds with an error if the specified currency is not
        #   recognized.",
        #   pattern: [A-Z]`3`
        # @param [String] dimensions
        #   A comma-separated list of YouTube Analytics dimensions, such as `views` or
        #   `ageGroup,gender`. See the [Available
        #   Reports](/youtube/analytics/v2/available_reports) document for a list of
        #   the reports that you can retrieve and the dimensions used for those
        #   reports. Also see the [Dimensions](/youtube/analytics/v2/dimsmets/dims)
        #   document for definitions of those dimensions."
        #   pattern: [0-9a-zA-Z,]+
        # @param [String] end_date
        #   The end date for fetching YouTube Analytics data. The value should be in
        #   `YYYY-MM-DD` format.
        #   required: true, pattern: [0-9]`4`-[0-9]`2`-[0-9]`2`
        # @param [String] filters
        #   A list of filters that should be applied when retrieving YouTube Analytics
        #   data. The [Available Reports](/youtube/analytics/v2/available_reports)
        #   document identifies the dimensions that can be used to filter each report,
        #   and the [Dimensions](/youtube/analytics/v2/dimsmets/dims)  document defines
        #   those dimensions. If a request uses multiple filters, join them together
        #   with a semicolon (`;`), and the returned result table will satisfy both
        #   filters. For example, a filters parameter value of
        #   `video==dMH0bHeiRNg;country==IT` restricts the result set to include data
        #   for the given video in Italy.",
        # @param [String] ids
        #   Identifies the YouTube channel or content owner for which you are
        #   retrieving YouTube Analytics data.
        #   - To request data for a YouTube user, set the `ids` parameter value to
        #   `channel==CHANNEL_ID`, where `CHANNEL_ID` specifies the unique YouTube
        #   channel ID.
        #   - To request data for a YouTube CMS content owner, set the `ids` parameter
        #   value to `contentOwner==OWNER_NAME`, where `OWNER_NAME` is the CMS name
        #   of the content owner.
        #   required: true, pattern: [a-zA-Z]+==[a-zA-Z0-9_+-]+
        # @param [Boolean] include_historical_channel_data
        #   If set to true historical data (i.e. channel data from before the linking
        #   of the channel to the content owner) will be retrieved.",
        # @param [Fixnum] max_results
        #   The maximum number of rows to include in the response.",
        #   minValue: 1
        # @param [String] metrics
        #   A comma-separated list of YouTube Analytics metrics, such as `views` or
        #   `likes,dislikes`. See the
        #   [Available Reports](/youtube/analytics/v2/available_reports)  document for
        #   a list of the reports that you can retrieve and the metrics
        #   available in each report, and see the
        #   [Metrics](/youtube/analytics/v2/dimsmets/mets) document for definitions of
        #   those metrics.
        #   required: true, pattern: [0-9a-zA-Z,]+
        # @param [String] sort
        #   A comma-separated list of dimensions or metrics that determine the sort
        #   order for YouTube Analytics data. By default the sort order is ascending.
        #   The '`-`' prefix causes descending sort order.",
        #   pattern: [-0-9a-zA-Z,]+
        # @param [String] start_date
        #   The start date for fetching YouTube Analytics data. The value should be in
        #   `YYYY-MM-DD` format.
        #   required: true, pattern: "[0-9]`4`-[0-9]`2`-[0-9]`2`
        # @param [Fixnum] start_index
        #   An index of the first entity to retrieve. Use this parameter as a
        #   pagination mechanism along with the max-results parameter (one-based,
        #   inclusive).",
        #   minValue: 1
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::YoutubeAnalyticsV2::QueryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::YoutubeAnalyticsV2::QueryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def query_report(currency: nil, dimensions: nil, end_date: nil, filters: nil, ids: nil, include_historical_channel_data: nil, max_results: nil, metrics: nil, sort: nil, start_date: nil, start_index: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/reports', options)
          command.response_representation = Google::Apis::YoutubeAnalyticsV2::QueryResponse::Representation
          command.response_class = Google::Apis::YoutubeAnalyticsV2::QueryResponse
          command.query['currency'] = currency unless currency.nil?
          command.query['dimensions'] = dimensions unless dimensions.nil?
          command.query['endDate'] = end_date unless end_date.nil?
          command.query['filters'] = filters unless filters.nil?
          command.query['ids'] = ids unless ids.nil?
          command.query['includeHistoricalChannelData'] = include_historical_channel_data unless include_historical_channel_data.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['metrics'] = metrics unless metrics.nil?
          command.query['sort'] = sort unless sort.nil?
          command.query['startDate'] = start_date unless start_date.nil?
          command.query['startIndex'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
