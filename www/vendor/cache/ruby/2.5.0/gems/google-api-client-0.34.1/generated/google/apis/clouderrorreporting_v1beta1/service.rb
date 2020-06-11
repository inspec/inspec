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
    module ClouderrorreportingV1beta1
      # Stackdriver Error Reporting API
      #
      # Groups and counts similar errors from cloud services and applications, reports
      #  new errors, and provides access to error groups and their associated errors.
      #
      # @example
      #    require 'google/apis/clouderrorreporting_v1beta1'
      #
      #    Clouderrorreporting = Google::Apis::ClouderrorreportingV1beta1 # Alias the module
      #    service = Clouderrorreporting::ClouderrorreportingService.new
      #
      # @see https://cloud.google.com/error-reporting/
      class ClouderrorreportingService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://clouderrorreporting.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Deletes all error events of a given project.
        # @param [String] project_name
        #   Required. The resource name of the Google Cloud Platform project. Written
        #   as `projects/` plus the
        #   [Google Cloud Platform project
        #   ID](https://support.google.com/cloud/answer/6158840).
        #   Example: `projects/my-project-123`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouderrorreportingV1beta1::DeleteEventsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouderrorreportingV1beta1::DeleteEventsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_events(project_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+projectName}/events', options)
          command.response_representation = Google::Apis::ClouderrorreportingV1beta1::DeleteEventsResponse::Representation
          command.response_class = Google::Apis::ClouderrorreportingV1beta1::DeleteEventsResponse
          command.params['projectName'] = project_name unless project_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the specified events.
        # @param [String] project_name
        #   Required. The resource name of the Google Cloud Platform project. Written
        #   as `projects/` plus the
        #   [Google Cloud Platform project
        #   ID](https://support.google.com/cloud/answer/6158840).
        #   Example: `projects/my-project-123`.
        # @param [String] group_id
        #   Required. The group for which events shall be returned.
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return per response.
        # @param [String] page_token
        #   Optional. A `next_page_token` provided by a previous response.
        # @param [String] service_filter_resource_type
        #   Optional. The exact value to match against
        #   [`ServiceContext.resource_type`](/error-reporting/reference/rest/v1beta1/
        #   ServiceContext#FIELDS.resource_type).
        # @param [String] service_filter_service
        #   Optional. The exact value to match against
        #   [`ServiceContext.service`](/error-reporting/reference/rest/v1beta1/
        #   ServiceContext#FIELDS.service).
        # @param [String] service_filter_version
        #   Optional. The exact value to match against
        #   [`ServiceContext.version`](/error-reporting/reference/rest/v1beta1/
        #   ServiceContext#FIELDS.version).
        # @param [String] time_range_period
        #   Restricts the query to the specified time range.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouderrorreportingV1beta1::ListEventsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouderrorreportingV1beta1::ListEventsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_events(project_name, group_id: nil, page_size: nil, page_token: nil, service_filter_resource_type: nil, service_filter_service: nil, service_filter_version: nil, time_range_period: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+projectName}/events', options)
          command.response_representation = Google::Apis::ClouderrorreportingV1beta1::ListEventsResponse::Representation
          command.response_class = Google::Apis::ClouderrorreportingV1beta1::ListEventsResponse
          command.params['projectName'] = project_name unless project_name.nil?
          command.query['groupId'] = group_id unless group_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['serviceFilter.resourceType'] = service_filter_resource_type unless service_filter_resource_type.nil?
          command.query['serviceFilter.service'] = service_filter_service unless service_filter_service.nil?
          command.query['serviceFilter.version'] = service_filter_version unless service_filter_version.nil?
          command.query['timeRange.period'] = time_range_period unless time_range_period.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Report an individual error event.
        # This endpoint accepts **either** an OAuth token,
        # **or** an [API key](https://support.google.com/cloud/answer/6158862)
        # for authentication. To use an API key, append it to the URL as the value of
        # a `key` parameter. For example:
        # `POST
        # https://clouderrorreporting.googleapis.com/v1beta1/projects/example-project/
        # events:report?key=123ABC456`
        # @param [String] project_name
        #   Required. The resource name of the Google Cloud Platform project. Written
        #   as `projects/` plus the
        #   [Google Cloud Platform project
        #   ID](https://support.google.com/cloud/answer/6158840). Example:
        #   `projects/my-project-123`.
        # @param [Google::Apis::ClouderrorreportingV1beta1::ReportedErrorEvent] reported_error_event_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouderrorreportingV1beta1::ReportErrorEventResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouderrorreportingV1beta1::ReportErrorEventResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def report_project_event(project_name, reported_error_event_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+projectName}/events:report', options)
          command.request_representation = Google::Apis::ClouderrorreportingV1beta1::ReportedErrorEvent::Representation
          command.request_object = reported_error_event_object
          command.response_representation = Google::Apis::ClouderrorreportingV1beta1::ReportErrorEventResponse::Representation
          command.response_class = Google::Apis::ClouderrorreportingV1beta1::ReportErrorEventResponse
          command.params['projectName'] = project_name unless project_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the specified groups.
        # @param [String] project_name
        #   Required. The resource name of the Google Cloud Platform project. Written
        #   as <code>projects/</code> plus the
        #   <a href="https://support.google.com/cloud/answer/6158840">Google Cloud
        #   Platform project ID</a>.
        #   Example: <code>projects/my-project-123</code>.
        # @param [String] alignment
        #   Optional. The alignment of the timed counts to be returned.
        #   Default is `ALIGNMENT_EQUAL_AT_END`.
        # @param [String] alignment_time
        #   Optional. Time where the timed counts shall be aligned if rounded
        #   alignment is chosen. Default is 00:00 UTC.
        # @param [Array<String>, String] group_id
        #   Optional. List all <code>ErrorGroupStats</code> with these IDs.
        # @param [String] order
        #   Optional. The sort order in which the results are returned.
        #   Default is `COUNT_DESC`.
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return per response.
        #   Default is 20.
        # @param [String] page_token
        #   Optional. A `next_page_token` provided by a previous response. To view
        #   additional results, pass this token along with the identical query
        #   parameters as the first request.
        # @param [String] service_filter_resource_type
        #   Optional. The exact value to match against
        #   [`ServiceContext.resource_type`](/error-reporting/reference/rest/v1beta1/
        #   ServiceContext#FIELDS.resource_type).
        # @param [String] service_filter_service
        #   Optional. The exact value to match against
        #   [`ServiceContext.service`](/error-reporting/reference/rest/v1beta1/
        #   ServiceContext#FIELDS.service).
        # @param [String] service_filter_version
        #   Optional. The exact value to match against
        #   [`ServiceContext.version`](/error-reporting/reference/rest/v1beta1/
        #   ServiceContext#FIELDS.version).
        # @param [String] time_range_period
        #   Restricts the query to the specified time range.
        # @param [String] timed_count_duration
        #   Optional. The preferred duration for a single returned `TimedCount`.
        #   If not set, no timed counts are returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouderrorreportingV1beta1::ListGroupStatsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouderrorreportingV1beta1::ListGroupStatsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_group_stats(project_name, alignment: nil, alignment_time: nil, group_id: nil, order: nil, page_size: nil, page_token: nil, service_filter_resource_type: nil, service_filter_service: nil, service_filter_version: nil, time_range_period: nil, timed_count_duration: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+projectName}/groupStats', options)
          command.response_representation = Google::Apis::ClouderrorreportingV1beta1::ListGroupStatsResponse::Representation
          command.response_class = Google::Apis::ClouderrorreportingV1beta1::ListGroupStatsResponse
          command.params['projectName'] = project_name unless project_name.nil?
          command.query['alignment'] = alignment unless alignment.nil?
          command.query['alignmentTime'] = alignment_time unless alignment_time.nil?
          command.query['groupId'] = group_id unless group_id.nil?
          command.query['order'] = order unless order.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['serviceFilter.resourceType'] = service_filter_resource_type unless service_filter_resource_type.nil?
          command.query['serviceFilter.service'] = service_filter_service unless service_filter_service.nil?
          command.query['serviceFilter.version'] = service_filter_version unless service_filter_version.nil?
          command.query['timeRange.period'] = time_range_period unless time_range_period.nil?
          command.query['timedCountDuration'] = timed_count_duration unless timed_count_duration.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the specified group.
        # @param [String] group_name
        #   Required. The group resource name. Written as
        #   <code>projects/<var>projectID</var>/groups/<var>group_name</var></code>.
        #   Call
        #   <a href="/error-reporting/reference/rest/v1beta1/projects.groupStats/list">
        #   <code>groupStats.list</code></a> to return a list of groups belonging to
        #   this project.
        #   Example: <code>projects/my-project-123/groups/my-group</code>
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouderrorreportingV1beta1::ErrorGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouderrorreportingV1beta1::ErrorGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_group(group_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+groupName}', options)
          command.response_representation = Google::Apis::ClouderrorreportingV1beta1::ErrorGroup::Representation
          command.response_class = Google::Apis::ClouderrorreportingV1beta1::ErrorGroup
          command.params['groupName'] = group_name unless group_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Replace the data for the specified group.
        # Fails if the group does not exist.
        # @param [String] name
        #   The group resource name.
        #   Example: <code>projects/my-project-123/groups/my-groupid</code>
        # @param [Google::Apis::ClouderrorreportingV1beta1::ErrorGroup] error_group_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ClouderrorreportingV1beta1::ErrorGroup] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ClouderrorreportingV1beta1::ErrorGroup]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_project_group(name, error_group_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::ClouderrorreportingV1beta1::ErrorGroup::Representation
          command.request_object = error_group_object
          command.response_representation = Google::Apis::ClouderrorreportingV1beta1::ErrorGroup::Representation
          command.response_class = Google::Apis::ClouderrorreportingV1beta1::ErrorGroup
          command.params['name'] = name unless name.nil?
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
