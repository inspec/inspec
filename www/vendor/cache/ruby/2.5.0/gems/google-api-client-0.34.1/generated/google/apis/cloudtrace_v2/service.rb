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
    module CloudtraceV2
      # Stackdriver Trace API
      #
      # Sends application trace data to Stackdriver Trace for viewing. Trace data is
      #  collected for all App Engine applications by default. Trace data from other
      #  applications can be provided using this API. This library is used to interact
      #  with the Trace API directly. If you are looking to instrument your application
      #  for Stackdriver Trace, we recommend using OpenCensus.
      #
      # @example
      #    require 'google/apis/cloudtrace_v2'
      #
      #    Cloudtrace = Google::Apis::CloudtraceV2 # Alias the module
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
        
        # Sends new spans to new or existing traces. You cannot update
        # existing spans.
        # @param [String] name
        #   Required. The name of the project where the spans belong. The format is
        #   `projects/[PROJECT_ID]`.
        # @param [Google::Apis::CloudtraceV2::BatchWriteSpansRequest] batch_write_spans_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtraceV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtraceV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_trace_write_spans(name, batch_write_spans_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+name}/traces:batchWrite', options)
          command.request_representation = Google::Apis::CloudtraceV2::BatchWriteSpansRequest::Representation
          command.request_object = batch_write_spans_request_object
          command.response_representation = Google::Apis::CloudtraceV2::Empty::Representation
          command.response_class = Google::Apis::CloudtraceV2::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new span.
        # @param [String] name
        #   The resource name of the span in the following format:
        #   projects/[PROJECT_ID]/traces/[TRACE_ID]/spans/SPAN_ID is a unique
        #   identifier for a trace within a project;
        #   it is a 32-character hexadecimal encoding of a 16-byte array.
        #   [SPAN_ID] is a unique identifier for a span within a trace; it
        #   is a 16-character hexadecimal encoding of an 8-byte array.
        # @param [Google::Apis::CloudtraceV2::Span] span_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudtraceV2::Span] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudtraceV2::Span]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_trace_span_span(name, span_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+name}', options)
          command.request_representation = Google::Apis::CloudtraceV2::Span::Representation
          command.request_object = span_object
          command.response_representation = Google::Apis::CloudtraceV2::Span::Representation
          command.response_class = Google::Apis::CloudtraceV2::Span
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
