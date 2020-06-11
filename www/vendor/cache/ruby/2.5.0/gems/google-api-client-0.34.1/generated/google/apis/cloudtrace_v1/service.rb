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
    module CloudtraceV1
      # Stackdriver Trace API
      #
      # Sends application trace data to Stackdriver Trace for viewing. Trace data is
      #  collected for all App Engine applications by default. Trace data from other
      #  applications can be provided using this API. This library is used to interact
      #  with the Trace API directly. If you are looking to instrument your application
      #  for Stackdriver Trace, we recommend using OpenCensus.
      #
      # @example
      #    require 'google/apis/cloudtrace_v1'
      #
      #    Cloudtrace = Google::Apis::CloudtraceV1 # Alias the module
      #    service = Cloudtrace::CloudTraceService.new
      #
      # @see https://cloud.google.com/trace
      class CloudTraceService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudtrace.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Sends new traces to Stackdriver Trace or updates existing traces. If the ID
        # of a trace that you send matches that of an existing trace, any fields
        # in the existing trace and its spans are overwritten by the provided values,
        # and any new fields provided are merged with the existing trace data. If the
        # ID does not match, a new trace is created.
        # @param [String] project_id
        #   Required. ID of the Cloud project where the trace data is stored.
        # @param [Google::Apis::CloudtraceV1::Traces] traces_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtraceV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtraceV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_traces(project_id, traces_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/projects/{projectId}/traces', options)
          command.request_representation = Google::Apis::CloudtraceV1::Traces::Representation
          command.request_object = traces_object
          command.response_representation = Google::Apis::CloudtraceV1::Empty::Representation
          command.response_class = Google::Apis::CloudtraceV1::Empty
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a single trace by its ID.
        # @param [String] project_id
        #   Required. ID of the Cloud project where the trace data is stored.
        # @param [String] trace_id
        #   Required. ID of the trace to return.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtraceV1::Trace] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtraceV1::Trace]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_trace(project_id, trace_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/projects/{projectId}/traces/{traceId}', options)
          command.response_representation = Google::Apis::CloudtraceV1::Trace::Representation
          command.response_class = Google::Apis::CloudtraceV1::Trace
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['traceId'] = trace_id unless trace_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns of a list of traces that match the specified filter conditions.
        # @param [String] project_id
        #   Required. ID of the Cloud project where the trace data is stored.
        # @param [String] end_time
        #   End of the time interval (inclusive) during which the trace data was
        #   collected from the application.
        # @param [String] filter
        #   Optional. A filter against labels for the request.
        #   By default, searches use prefix matching. To specify exact match, prepend
        #   a plus symbol (`+`) to the search term.
        #   Multiple terms are ANDed. Syntax:
        #   *   `root:NAME_PREFIX` or `NAME_PREFIX`: Return traces where any root
        #   span starts with `NAME_PREFIX`.
        #   *   `+root:NAME` or `+NAME`: Return traces where any root span's name is
        #   exactly `NAME`.
        #   *   `span:NAME_PREFIX`: Return traces where any span starts with
        #   `NAME_PREFIX`.
        #   *   `+span:NAME`: Return traces where any span's name is exactly
        #   `NAME`.
        #   *   `latency:DURATION`: Return traces whose overall latency is
        #   greater or equal to than `DURATION`. Accepted units are nanoseconds
        #   (`ns`), milliseconds (`ms`), and seconds (`s`). Default is `ms`. For
        #   example, `latency:24ms` returns traces whose overall latency
        #   is greater than or equal to 24 milliseconds.
        #   *   `label:LABEL_KEY`: Return all traces containing the specified
        #   label key (exact match, case-sensitive) regardless of the key:value
        #   pair's value (including empty values).
        #   *   `LABEL_KEY:VALUE_PREFIX`: Return all traces containing the specified
        #   label key (exact match, case-sensitive) whose value starts with
        #   `VALUE_PREFIX`. Both a key and a value must be specified.
        #   *   `+LABEL_KEY:VALUE`: Return all traces containing a key:value pair
        #   exactly matching the specified text. Both a key and a value must be
        #   specified.
        #   *   `method:VALUE`: Equivalent to `/http/method:VALUE`.
        #   *   `url:VALUE`: Equivalent to `/http/url:VALUE`.
        # @param [String] order_by
        #   Optional. Field used to sort the returned traces.
        #   Can be one of the following:
        #   *   `trace_id`
        #   *   `name` (`name` field of root span in the trace)
        #   *   `duration` (difference between `end_time` and `start_time` fields of
        #   the root span)
        #   *   `start` (`start_time` field of the root span)
        #   Descending order can be specified by appending `desc` to the sort field
        #   (for example, `name desc`).
        #   Only one sort field is permitted.
        # @param [Fixnum] page_size
        #   Optional. Maximum number of traces to return. If not specified or <= 0, the
        #   implementation selects a reasonable value.  The implementation may
        #   return fewer traces than the requested page size.
        # @param [String] page_token
        #   Token identifying the page of results to return. If provided, use the
        #   value of the `next_page_token` field from a previous request.
        # @param [String] start_time
        #   Start of the time interval (inclusive) during which the trace data was
        #   collected from the application.
        # @param [String] view
        #   Optional. Type of data returned for traces in the list. Default is
        #   `MINIMAL`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtraceV1::ListTracesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtraceV1::ListTracesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_traces(project_id, end_time: nil, filter: nil, order_by: nil, page_size: nil, page_token: nil, start_time: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/projects/{projectId}/traces', options)
          command.response_representation = Google::Apis::CloudtraceV1::ListTracesResponse::Representation
          command.response_class = Google::Apis::CloudtraceV1::ListTracesResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['endTime'] = end_time unless end_time.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startTime'] = start_time unless start_time.nil?
          command.query['view'] = view unless view.nil?
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
