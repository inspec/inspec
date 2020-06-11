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
    module LoggingV2
      # Stackdriver Logging API
      #
      # Writes log entries and manages your Stackdriver Logging configuration. The
      #  table entries below are presented in alphabetical order, not in order of
      #  common use. For explanations of the concepts found in the table entries, read
      #  the Stackdriver Logging documentation.
      #
      # @example
      #    require 'google/apis/logging_v2'
      #
      #    Logging = Google::Apis::LoggingV2 # Alias the module
      #    service = Logging::LoggingService.new
      #
      # @see https://cloud.google.com/logging/docs/
      class LoggingService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://logging.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a new exclusion in a specified parent resource. Only log entries
        # belonging to that resource can be excluded. You can have up to 10 exclusions
        # in a resource.
        # @param [String] parent
        #   Required. The parent resource in which to create the exclusion:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        #   Examples: "projects/my-logging-project", "organizations/123456789".
        # @param [Google::Apis::LoggingV2::LogExclusion] log_exclusion_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_billing_account_exclusion(parent, log_exclusion_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/exclusions', options)
          command.request_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.request_object = log_exclusion_object
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an exclusion.
        # @param [String] name
        #   Required. The resource name of an existing exclusion to delete:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_billing_account_exclusion(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the description of an exclusion.
        # @param [String] name
        #   Required. The resource name of an existing exclusion:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_billing_account_exclusion(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the exclusions in a parent resource.
        # @param [String] parent
        #   Required. The parent resource whose exclusions are to be listed.
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListExclusionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListExclusionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_billing_account_exclusions(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/exclusions', options)
          command.response_representation = Google::Apis::LoggingV2::ListExclusionsResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListExclusionsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Changes one or more properties of an existing exclusion.
        # @param [String] name
        #   Required. The resource name of the exclusion to update:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [Google::Apis::LoggingV2::LogExclusion] log_exclusion_object
        # @param [String] update_mask
        #   Required. A non-empty list of fields to change in the existing exclusion. New
        #   values for the fields are taken from the corresponding fields in the
        #   LogExclusion included in this request. Fields not mentioned in update_mask are
        #   not changed and are ignored in the request.For example, to change the filter
        #   and description of an exclusion, specify an update_mask of "filter,description"
        #   .
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_billing_account_exclusion(name, log_exclusion_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.request_object = log_exclusion_object
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes all the log entries in a log. The log reappears if it receives new
        # entries. Log entries written shortly before the delete operation might not be
        # deleted. Entries received after the delete operation with a timestamp before
        # the operation will be deleted.
        # @param [String] log_name
        #   Required. The resource name of the log to delete:
        #   "projects/[PROJECT_ID]/logs/[LOG_ID]"
        #   "organizations/[ORGANIZATION_ID]/logs/[LOG_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/logs/[LOG_ID]"
        #   "folders/[FOLDER_ID]/logs/[LOG_ID]"
        #   [LOG_ID] must be URL-encoded. For example, "projects/my-project-id/logs/syslog"
        #   , "organizations/1234567890/logs/cloudresourcemanager.googleapis.com%
        #   2Factivity". For more information about log names, see LogEntry.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_billing_account_log(log_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+logName}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['logName'] = log_name unless log_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the logs in projects, organizations, folders, or billing accounts. Only
        # logs that have entries are listed.
        # @param [String] parent
        #   Required. The resource name that owns the logs:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListLogsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListLogsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_billing_account_logs(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/logs', options)
          command.response_representation = Google::Apis::LoggingV2::ListLogsResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListLogsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a sink that exports specified log entries to a destination. The export
        # of newly-ingested log entries begins immediately, unless the sink's
        # writer_identity is not permitted to write to the destination. A sink can
        # export log entries only from the resource owning the sink.
        # @param [String] parent
        #   Required. The resource in which to create the sink:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        #   Examples: "projects/my-logging-project", "organizations/123456789".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. Determines the kind of IAM identity returned as writer_identity in
        #   the new sink. If this value is omitted or set to false, and if the sink's
        #   parent is a project, then the value returned as writer_identity is the same
        #   group or service account used by Logging before the addition of writer
        #   identities to this API. The sink's destination must be in the same project as
        #   the sink itself.If this field is set to true, or if the sink is owned by a non-
        #   project resource such as an organization, then the value of writer_identity
        #   will be a unique service account used only for exports from the new sink. For
        #   more information, see writer_identity in LogSink.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_billing_account_sink(parent, log_sink_object = nil, unique_writer_identity: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/sinks', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['parent'] = parent unless parent.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a sink. If the sink has a unique writer_identity, then that service
        # account is also deleted.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to delete, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_billing_account_sink(sink_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+sinkName}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a sink.
        # @param [String] sink_name
        #   Required. The resource name of the sink:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_billing_account_sink(sink_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+sinkName}', options)
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists sinks.
        # @param [String] parent
        #   Required. The parent resource whose sinks are to be listed:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListSinksResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListSinksResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_billing_account_sinks(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/sinks', options)
          command.response_representation = Google::Apis::LoggingV2::ListSinksResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListSinksResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a sink. This method replaces the following fields in the existing sink
        # with values from the new sink: destination, and filter.The updated sink might
        # also have a new writer_identity; see the unique_writer_identity field.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to update, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. See sinks.create for a description of this field. When updating a
        #   sink, the effect of this field on the value of writer_identity in the updated
        #   sink depends on both the old and new values of this field:
        #   If the old and new values of this field are both false or both true, then
        #   there is no change to the sink's writer_identity.
        #   If the old value is false and the new value is true, then writer_identity is
        #   changed to a unique service account.
        #   It is an error if the old value is true and the new value is set to false or
        #   defaulted to false.
        # @param [String] update_mask
        #   Optional. Field mask that specifies the fields in sink that need an update. A
        #   sink field will be overwritten if, and only if, it is in the update mask. name
        #   and output only fields cannot be updated.An empty updateMask is temporarily
        #   treated as using the following mask for backwards compatibility purposes:
        #   destination,filter,includeChildren At some point in the future, behavior will
        #   be removed and specifying an empty updateMask will be an error.For a detailed
        #   FieldMask definition, see https://developers.google.com/protocol-buffers/docs/
        #   reference/google.protobuf#google.protobuf.FieldMaskExample: updateMask=filter.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_billing_account_sink(sink_name, log_sink_object = nil, unique_writer_identity: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+sinkName}', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a sink. This method replaces the following fields in the existing sink
        # with values from the new sink: destination, and filter.The updated sink might
        # also have a new writer_identity; see the unique_writer_identity field.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to update, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. See sinks.create for a description of this field. When updating a
        #   sink, the effect of this field on the value of writer_identity in the updated
        #   sink depends on both the old and new values of this field:
        #   If the old and new values of this field are both false or both true, then
        #   there is no change to the sink's writer_identity.
        #   If the old value is false and the new value is true, then writer_identity is
        #   changed to a unique service account.
        #   It is an error if the old value is true and the new value is set to false or
        #   defaulted to false.
        # @param [String] update_mask
        #   Optional. Field mask that specifies the fields in sink that need an update. A
        #   sink field will be overwritten if, and only if, it is in the update mask. name
        #   and output only fields cannot be updated.An empty updateMask is temporarily
        #   treated as using the following mask for backwards compatibility purposes:
        #   destination,filter,includeChildren At some point in the future, behavior will
        #   be removed and specifying an empty updateMask will be an error.For a detailed
        #   FieldMask definition, see https://developers.google.com/protocol-buffers/docs/
        #   reference/google.protobuf#google.protobuf.FieldMaskExample: updateMask=filter.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_billing_account_sink(sink_name, log_sink_object = nil, unique_writer_identity: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v2/{+sinkName}', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists log entries. Use this method to retrieve log entries that originated
        # from a project/folder/organization/billing account. For ways to export log
        # entries, see Exporting Logs.
        # @param [Google::Apis::LoggingV2::ListLogEntriesRequest] list_log_entries_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListLogEntriesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListLogEntriesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_entry_log_entries(list_log_entries_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/entries:list', options)
          command.request_representation = Google::Apis::LoggingV2::ListLogEntriesRequest::Representation
          command.request_object = list_log_entries_request_object
          command.response_representation = Google::Apis::LoggingV2::ListLogEntriesResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListLogEntriesResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Writes log entries to Logging. This API method is the only way to send log
        # entries to Logging. This method is used, directly or indirectly, by the
        # Logging agent (fluentd) and all logging libraries configured to use Logging. A
        # single request may contain log entries for a maximum of 1000 different
        # resources (projects, organizations, billing accounts or folders)
        # @param [Google::Apis::LoggingV2::WriteLogEntriesRequest] write_log_entries_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::WriteLogEntriesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::WriteLogEntriesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def write_entry_log_entries(write_log_entries_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/entries:write', options)
          command.request_representation = Google::Apis::LoggingV2::WriteLogEntriesRequest::Representation
          command.request_object = write_log_entries_request_object
          command.response_representation = Google::Apis::LoggingV2::WriteLogEntriesResponse::Representation
          command.response_class = Google::Apis::LoggingV2::WriteLogEntriesResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new exclusion in a specified parent resource. Only log entries
        # belonging to that resource can be excluded. You can have up to 10 exclusions
        # in a resource.
        # @param [String] parent
        #   Required. The parent resource in which to create the exclusion:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        #   Examples: "projects/my-logging-project", "organizations/123456789".
        # @param [Google::Apis::LoggingV2::LogExclusion] log_exclusion_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_exclusion(parent, log_exclusion_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/exclusions', options)
          command.request_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.request_object = log_exclusion_object
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an exclusion.
        # @param [String] name
        #   Required. The resource name of an existing exclusion to delete:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_exclusion(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the description of an exclusion.
        # @param [String] name
        #   Required. The resource name of an existing exclusion:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_exclusion(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the exclusions in a parent resource.
        # @param [String] parent
        #   Required. The parent resource whose exclusions are to be listed.
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListExclusionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListExclusionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_exclusions(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/exclusions', options)
          command.response_representation = Google::Apis::LoggingV2::ListExclusionsResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListExclusionsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Changes one or more properties of an existing exclusion.
        # @param [String] name
        #   Required. The resource name of the exclusion to update:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [Google::Apis::LoggingV2::LogExclusion] log_exclusion_object
        # @param [String] update_mask
        #   Required. A non-empty list of fields to change in the existing exclusion. New
        #   values for the fields are taken from the corresponding fields in the
        #   LogExclusion included in this request. Fields not mentioned in update_mask are
        #   not changed and are ignored in the request.For example, to change the filter
        #   and description of an exclusion, specify an update_mask of "filter,description"
        #   .
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_exclusion(name, log_exclusion_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.request_object = log_exclusion_object
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new exclusion in a specified parent resource. Only log entries
        # belonging to that resource can be excluded. You can have up to 10 exclusions
        # in a resource.
        # @param [String] parent
        #   Required. The parent resource in which to create the exclusion:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        #   Examples: "projects/my-logging-project", "organizations/123456789".
        # @param [Google::Apis::LoggingV2::LogExclusion] log_exclusion_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_folder_exclusion(parent, log_exclusion_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/exclusions', options)
          command.request_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.request_object = log_exclusion_object
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an exclusion.
        # @param [String] name
        #   Required. The resource name of an existing exclusion to delete:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_folder_exclusion(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the description of an exclusion.
        # @param [String] name
        #   Required. The resource name of an existing exclusion:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_folder_exclusion(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the exclusions in a parent resource.
        # @param [String] parent
        #   Required. The parent resource whose exclusions are to be listed.
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListExclusionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListExclusionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_folder_exclusions(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/exclusions', options)
          command.response_representation = Google::Apis::LoggingV2::ListExclusionsResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListExclusionsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Changes one or more properties of an existing exclusion.
        # @param [String] name
        #   Required. The resource name of the exclusion to update:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [Google::Apis::LoggingV2::LogExclusion] log_exclusion_object
        # @param [String] update_mask
        #   Required. A non-empty list of fields to change in the existing exclusion. New
        #   values for the fields are taken from the corresponding fields in the
        #   LogExclusion included in this request. Fields not mentioned in update_mask are
        #   not changed and are ignored in the request.For example, to change the filter
        #   and description of an exclusion, specify an update_mask of "filter,description"
        #   .
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_folder_exclusion(name, log_exclusion_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.request_object = log_exclusion_object
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes all the log entries in a log. The log reappears if it receives new
        # entries. Log entries written shortly before the delete operation might not be
        # deleted. Entries received after the delete operation with a timestamp before
        # the operation will be deleted.
        # @param [String] log_name
        #   Required. The resource name of the log to delete:
        #   "projects/[PROJECT_ID]/logs/[LOG_ID]"
        #   "organizations/[ORGANIZATION_ID]/logs/[LOG_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/logs/[LOG_ID]"
        #   "folders/[FOLDER_ID]/logs/[LOG_ID]"
        #   [LOG_ID] must be URL-encoded. For example, "projects/my-project-id/logs/syslog"
        #   , "organizations/1234567890/logs/cloudresourcemanager.googleapis.com%
        #   2Factivity". For more information about log names, see LogEntry.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_folder_log(log_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+logName}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['logName'] = log_name unless log_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the logs in projects, organizations, folders, or billing accounts. Only
        # logs that have entries are listed.
        # @param [String] parent
        #   Required. The resource name that owns the logs:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListLogsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListLogsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_folder_logs(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/logs', options)
          command.response_representation = Google::Apis::LoggingV2::ListLogsResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListLogsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a sink that exports specified log entries to a destination. The export
        # of newly-ingested log entries begins immediately, unless the sink's
        # writer_identity is not permitted to write to the destination. A sink can
        # export log entries only from the resource owning the sink.
        # @param [String] parent
        #   Required. The resource in which to create the sink:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        #   Examples: "projects/my-logging-project", "organizations/123456789".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. Determines the kind of IAM identity returned as writer_identity in
        #   the new sink. If this value is omitted or set to false, and if the sink's
        #   parent is a project, then the value returned as writer_identity is the same
        #   group or service account used by Logging before the addition of writer
        #   identities to this API. The sink's destination must be in the same project as
        #   the sink itself.If this field is set to true, or if the sink is owned by a non-
        #   project resource such as an organization, then the value of writer_identity
        #   will be a unique service account used only for exports from the new sink. For
        #   more information, see writer_identity in LogSink.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_folder_sink(parent, log_sink_object = nil, unique_writer_identity: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/sinks', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['parent'] = parent unless parent.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a sink. If the sink has a unique writer_identity, then that service
        # account is also deleted.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to delete, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_folder_sink(sink_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+sinkName}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a sink.
        # @param [String] sink_name
        #   Required. The resource name of the sink:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_folder_sink(sink_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+sinkName}', options)
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists sinks.
        # @param [String] parent
        #   Required. The parent resource whose sinks are to be listed:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListSinksResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListSinksResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_folder_sinks(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/sinks', options)
          command.response_representation = Google::Apis::LoggingV2::ListSinksResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListSinksResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a sink. This method replaces the following fields in the existing sink
        # with values from the new sink: destination, and filter.The updated sink might
        # also have a new writer_identity; see the unique_writer_identity field.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to update, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. See sinks.create for a description of this field. When updating a
        #   sink, the effect of this field on the value of writer_identity in the updated
        #   sink depends on both the old and new values of this field:
        #   If the old and new values of this field are both false or both true, then
        #   there is no change to the sink's writer_identity.
        #   If the old value is false and the new value is true, then writer_identity is
        #   changed to a unique service account.
        #   It is an error if the old value is true and the new value is set to false or
        #   defaulted to false.
        # @param [String] update_mask
        #   Optional. Field mask that specifies the fields in sink that need an update. A
        #   sink field will be overwritten if, and only if, it is in the update mask. name
        #   and output only fields cannot be updated.An empty updateMask is temporarily
        #   treated as using the following mask for backwards compatibility purposes:
        #   destination,filter,includeChildren At some point in the future, behavior will
        #   be removed and specifying an empty updateMask will be an error.For a detailed
        #   FieldMask definition, see https://developers.google.com/protocol-buffers/docs/
        #   reference/google.protobuf#google.protobuf.FieldMaskExample: updateMask=filter.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_folder_sink(sink_name, log_sink_object = nil, unique_writer_identity: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+sinkName}', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a sink. This method replaces the following fields in the existing sink
        # with values from the new sink: destination, and filter.The updated sink might
        # also have a new writer_identity; see the unique_writer_identity field.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to update, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. See sinks.create for a description of this field. When updating a
        #   sink, the effect of this field on the value of writer_identity in the updated
        #   sink depends on both the old and new values of this field:
        #   If the old and new values of this field are both false or both true, then
        #   there is no change to the sink's writer_identity.
        #   If the old value is false and the new value is true, then writer_identity is
        #   changed to a unique service account.
        #   It is an error if the old value is true and the new value is set to false or
        #   defaulted to false.
        # @param [String] update_mask
        #   Optional. Field mask that specifies the fields in sink that need an update. A
        #   sink field will be overwritten if, and only if, it is in the update mask. name
        #   and output only fields cannot be updated.An empty updateMask is temporarily
        #   treated as using the following mask for backwards compatibility purposes:
        #   destination,filter,includeChildren At some point in the future, behavior will
        #   be removed and specifying an empty updateMask will be an error.For a detailed
        #   FieldMask definition, see https://developers.google.com/protocol-buffers/docs/
        #   reference/google.protobuf#google.protobuf.FieldMaskExample: updateMask=filter.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_folder_sink(sink_name, log_sink_object = nil, unique_writer_identity: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v2/{+sinkName}', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes all the log entries in a log. The log reappears if it receives new
        # entries. Log entries written shortly before the delete operation might not be
        # deleted. Entries received after the delete operation with a timestamp before
        # the operation will be deleted.
        # @param [String] log_name
        #   Required. The resource name of the log to delete:
        #   "projects/[PROJECT_ID]/logs/[LOG_ID]"
        #   "organizations/[ORGANIZATION_ID]/logs/[LOG_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/logs/[LOG_ID]"
        #   "folders/[FOLDER_ID]/logs/[LOG_ID]"
        #   [LOG_ID] must be URL-encoded. For example, "projects/my-project-id/logs/syslog"
        #   , "organizations/1234567890/logs/cloudresourcemanager.googleapis.com%
        #   2Factivity". For more information about log names, see LogEntry.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_log(log_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+logName}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['logName'] = log_name unless log_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the logs in projects, organizations, folders, or billing accounts. Only
        # logs that have entries are listed.
        # @param [String] parent
        #   Required. The resource name that owns the logs:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListLogsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListLogsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_logs(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/logs', options)
          command.response_representation = Google::Apis::LoggingV2::ListLogsResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListLogsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the descriptors for monitored resource types used by Logging.
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListMonitoredResourceDescriptorsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListMonitoredResourceDescriptorsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_monitored_resource_descriptors(page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/monitoredResourceDescriptors', options)
          command.response_representation = Google::Apis::LoggingV2::ListMonitoredResourceDescriptorsResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListMonitoredResourceDescriptorsResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new exclusion in a specified parent resource. Only log entries
        # belonging to that resource can be excluded. You can have up to 10 exclusions
        # in a resource.
        # @param [String] parent
        #   Required. The parent resource in which to create the exclusion:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        #   Examples: "projects/my-logging-project", "organizations/123456789".
        # @param [Google::Apis::LoggingV2::LogExclusion] log_exclusion_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_organization_exclusion(parent, log_exclusion_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/exclusions', options)
          command.request_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.request_object = log_exclusion_object
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an exclusion.
        # @param [String] name
        #   Required. The resource name of an existing exclusion to delete:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_organization_exclusion(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the description of an exclusion.
        # @param [String] name
        #   Required. The resource name of an existing exclusion:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_organization_exclusion(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the exclusions in a parent resource.
        # @param [String] parent
        #   Required. The parent resource whose exclusions are to be listed.
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListExclusionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListExclusionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_organization_exclusions(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/exclusions', options)
          command.response_representation = Google::Apis::LoggingV2::ListExclusionsResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListExclusionsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Changes one or more properties of an existing exclusion.
        # @param [String] name
        #   Required. The resource name of the exclusion to update:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [Google::Apis::LoggingV2::LogExclusion] log_exclusion_object
        # @param [String] update_mask
        #   Required. A non-empty list of fields to change in the existing exclusion. New
        #   values for the fields are taken from the corresponding fields in the
        #   LogExclusion included in this request. Fields not mentioned in update_mask are
        #   not changed and are ignored in the request.For example, to change the filter
        #   and description of an exclusion, specify an update_mask of "filter,description"
        #   .
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_organization_exclusion(name, log_exclusion_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.request_object = log_exclusion_object
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes all the log entries in a log. The log reappears if it receives new
        # entries. Log entries written shortly before the delete operation might not be
        # deleted. Entries received after the delete operation with a timestamp before
        # the operation will be deleted.
        # @param [String] log_name
        #   Required. The resource name of the log to delete:
        #   "projects/[PROJECT_ID]/logs/[LOG_ID]"
        #   "organizations/[ORGANIZATION_ID]/logs/[LOG_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/logs/[LOG_ID]"
        #   "folders/[FOLDER_ID]/logs/[LOG_ID]"
        #   [LOG_ID] must be URL-encoded. For example, "projects/my-project-id/logs/syslog"
        #   , "organizations/1234567890/logs/cloudresourcemanager.googleapis.com%
        #   2Factivity". For more information about log names, see LogEntry.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_organization_log(log_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+logName}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['logName'] = log_name unless log_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the logs in projects, organizations, folders, or billing accounts. Only
        # logs that have entries are listed.
        # @param [String] parent
        #   Required. The resource name that owns the logs:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListLogsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListLogsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_organization_logs(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/logs', options)
          command.response_representation = Google::Apis::LoggingV2::ListLogsResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListLogsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a sink that exports specified log entries to a destination. The export
        # of newly-ingested log entries begins immediately, unless the sink's
        # writer_identity is not permitted to write to the destination. A sink can
        # export log entries only from the resource owning the sink.
        # @param [String] parent
        #   Required. The resource in which to create the sink:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        #   Examples: "projects/my-logging-project", "organizations/123456789".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. Determines the kind of IAM identity returned as writer_identity in
        #   the new sink. If this value is omitted or set to false, and if the sink's
        #   parent is a project, then the value returned as writer_identity is the same
        #   group or service account used by Logging before the addition of writer
        #   identities to this API. The sink's destination must be in the same project as
        #   the sink itself.If this field is set to true, or if the sink is owned by a non-
        #   project resource such as an organization, then the value of writer_identity
        #   will be a unique service account used only for exports from the new sink. For
        #   more information, see writer_identity in LogSink.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_organization_sink(parent, log_sink_object = nil, unique_writer_identity: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/sinks', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['parent'] = parent unless parent.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a sink. If the sink has a unique writer_identity, then that service
        # account is also deleted.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to delete, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_organization_sink(sink_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+sinkName}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a sink.
        # @param [String] sink_name
        #   Required. The resource name of the sink:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_organization_sink(sink_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+sinkName}', options)
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists sinks.
        # @param [String] parent
        #   Required. The parent resource whose sinks are to be listed:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListSinksResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListSinksResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_organization_sinks(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/sinks', options)
          command.response_representation = Google::Apis::LoggingV2::ListSinksResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListSinksResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a sink. This method replaces the following fields in the existing sink
        # with values from the new sink: destination, and filter.The updated sink might
        # also have a new writer_identity; see the unique_writer_identity field.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to update, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. See sinks.create for a description of this field. When updating a
        #   sink, the effect of this field on the value of writer_identity in the updated
        #   sink depends on both the old and new values of this field:
        #   If the old and new values of this field are both false or both true, then
        #   there is no change to the sink's writer_identity.
        #   If the old value is false and the new value is true, then writer_identity is
        #   changed to a unique service account.
        #   It is an error if the old value is true and the new value is set to false or
        #   defaulted to false.
        # @param [String] update_mask
        #   Optional. Field mask that specifies the fields in sink that need an update. A
        #   sink field will be overwritten if, and only if, it is in the update mask. name
        #   and output only fields cannot be updated.An empty updateMask is temporarily
        #   treated as using the following mask for backwards compatibility purposes:
        #   destination,filter,includeChildren At some point in the future, behavior will
        #   be removed and specifying an empty updateMask will be an error.For a detailed
        #   FieldMask definition, see https://developers.google.com/protocol-buffers/docs/
        #   reference/google.protobuf#google.protobuf.FieldMaskExample: updateMask=filter.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_organization_sink(sink_name, log_sink_object = nil, unique_writer_identity: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+sinkName}', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a sink. This method replaces the following fields in the existing sink
        # with values from the new sink: destination, and filter.The updated sink might
        # also have a new writer_identity; see the unique_writer_identity field.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to update, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. See sinks.create for a description of this field. When updating a
        #   sink, the effect of this field on the value of writer_identity in the updated
        #   sink depends on both the old and new values of this field:
        #   If the old and new values of this field are both false or both true, then
        #   there is no change to the sink's writer_identity.
        #   If the old value is false and the new value is true, then writer_identity is
        #   changed to a unique service account.
        #   It is an error if the old value is true and the new value is set to false or
        #   defaulted to false.
        # @param [String] update_mask
        #   Optional. Field mask that specifies the fields in sink that need an update. A
        #   sink field will be overwritten if, and only if, it is in the update mask. name
        #   and output only fields cannot be updated.An empty updateMask is temporarily
        #   treated as using the following mask for backwards compatibility purposes:
        #   destination,filter,includeChildren At some point in the future, behavior will
        #   be removed and specifying an empty updateMask will be an error.For a detailed
        #   FieldMask definition, see https://developers.google.com/protocol-buffers/docs/
        #   reference/google.protobuf#google.protobuf.FieldMaskExample: updateMask=filter.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_organization_sink(sink_name, log_sink_object = nil, unique_writer_identity: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v2/{+sinkName}', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new exclusion in a specified parent resource. Only log entries
        # belonging to that resource can be excluded. You can have up to 10 exclusions
        # in a resource.
        # @param [String] parent
        #   Required. The parent resource in which to create the exclusion:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        #   Examples: "projects/my-logging-project", "organizations/123456789".
        # @param [Google::Apis::LoggingV2::LogExclusion] log_exclusion_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_exclusion(parent, log_exclusion_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/exclusions', options)
          command.request_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.request_object = log_exclusion_object
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an exclusion.
        # @param [String] name
        #   Required. The resource name of an existing exclusion to delete:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_exclusion(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+name}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the description of an exclusion.
        # @param [String] name
        #   Required. The resource name of an existing exclusion:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_exclusion(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+name}', options)
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the exclusions in a parent resource.
        # @param [String] parent
        #   Required. The parent resource whose exclusions are to be listed.
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListExclusionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListExclusionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_exclusions(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/exclusions', options)
          command.response_representation = Google::Apis::LoggingV2::ListExclusionsResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListExclusionsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Changes one or more properties of an existing exclusion.
        # @param [String] name
        #   Required. The resource name of the exclusion to update:
        #   "projects/[PROJECT_ID]/exclusions/[EXCLUSION_ID]"
        #   "organizations/[ORGANIZATION_ID]/exclusions/[EXCLUSION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/exclusions/[EXCLUSION_ID]"
        #   "folders/[FOLDER_ID]/exclusions/[EXCLUSION_ID]"
        #   Example: "projects/my-project-id/exclusions/my-exclusion-id".
        # @param [Google::Apis::LoggingV2::LogExclusion] log_exclusion_object
        # @param [String] update_mask
        #   Required. A non-empty list of fields to change in the existing exclusion. New
        #   values for the fields are taken from the corresponding fields in the
        #   LogExclusion included in this request. Fields not mentioned in update_mask are
        #   not changed and are ignored in the request.For example, to change the filter
        #   and description of an exclusion, specify an update_mask of "filter,description"
        #   .
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogExclusion] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogExclusion]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_exclusion(name, log_exclusion_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+name}', options)
          command.request_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.request_object = log_exclusion_object
          command.response_representation = Google::Apis::LoggingV2::LogExclusion::Representation
          command.response_class = Google::Apis::LoggingV2::LogExclusion
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes all the log entries in a log. The log reappears if it receives new
        # entries. Log entries written shortly before the delete operation might not be
        # deleted. Entries received after the delete operation with a timestamp before
        # the operation will be deleted.
        # @param [String] log_name
        #   Required. The resource name of the log to delete:
        #   "projects/[PROJECT_ID]/logs/[LOG_ID]"
        #   "organizations/[ORGANIZATION_ID]/logs/[LOG_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/logs/[LOG_ID]"
        #   "folders/[FOLDER_ID]/logs/[LOG_ID]"
        #   [LOG_ID] must be URL-encoded. For example, "projects/my-project-id/logs/syslog"
        #   , "organizations/1234567890/logs/cloudresourcemanager.googleapis.com%
        #   2Factivity". For more information about log names, see LogEntry.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_log(log_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+logName}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['logName'] = log_name unless log_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the logs in projects, organizations, folders, or billing accounts. Only
        # logs that have entries are listed.
        # @param [String] parent
        #   Required. The resource name that owns the logs:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListLogsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListLogsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_logs(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/logs', options)
          command.response_representation = Google::Apis::LoggingV2::ListLogsResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListLogsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a logs-based metric.
        # @param [String] parent
        #   The resource name of the project in which to create the metric:
        #   "projects/[PROJECT_ID]"
        #   The new metric must be provided in the request.
        # @param [Google::Apis::LoggingV2::LogMetric] log_metric_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogMetric] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogMetric]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_metric(parent, log_metric_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/metrics', options)
          command.request_representation = Google::Apis::LoggingV2::LogMetric::Representation
          command.request_object = log_metric_object
          command.response_representation = Google::Apis::LoggingV2::LogMetric::Representation
          command.response_class = Google::Apis::LoggingV2::LogMetric
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a logs-based metric.
        # @param [String] metric_name
        #   The resource name of the metric to delete:
        #   "projects/[PROJECT_ID]/metrics/[METRIC_ID]"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_metric(metric_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+metricName}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['metricName'] = metric_name unless metric_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a logs-based metric.
        # @param [String] metric_name
        #   The resource name of the desired metric:
        #   "projects/[PROJECT_ID]/metrics/[METRIC_ID]"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogMetric] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogMetric]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_metric(metric_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+metricName}', options)
          command.response_representation = Google::Apis::LoggingV2::LogMetric::Representation
          command.response_class = Google::Apis::LoggingV2::LogMetric
          command.params['metricName'] = metric_name unless metric_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists logs-based metrics.
        # @param [String] parent
        #   Required. The name of the project containing the metrics:
        #   "projects/[PROJECT_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListLogMetricsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListLogMetricsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_metrics(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/metrics', options)
          command.response_representation = Google::Apis::LoggingV2::ListLogMetricsResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListLogMetricsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates or updates a logs-based metric.
        # @param [String] metric_name
        #   The resource name of the metric to update:
        #   "projects/[PROJECT_ID]/metrics/[METRIC_ID]"
        #   The updated metric must be provided in the request and it's name field must be
        #   the same as [METRIC_ID] If the metric does not exist in [PROJECT_ID], then a
        #   new metric is created.
        # @param [Google::Apis::LoggingV2::LogMetric] log_metric_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogMetric] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogMetric]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_project_metric(metric_name, log_metric_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v2/{+metricName}', options)
          command.request_representation = Google::Apis::LoggingV2::LogMetric::Representation
          command.request_object = log_metric_object
          command.response_representation = Google::Apis::LoggingV2::LogMetric::Representation
          command.response_class = Google::Apis::LoggingV2::LogMetric
          command.params['metricName'] = metric_name unless metric_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a sink that exports specified log entries to a destination. The export
        # of newly-ingested log entries begins immediately, unless the sink's
        # writer_identity is not permitted to write to the destination. A sink can
        # export log entries only from the resource owning the sink.
        # @param [String] parent
        #   Required. The resource in which to create the sink:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        #   Examples: "projects/my-logging-project", "organizations/123456789".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. Determines the kind of IAM identity returned as writer_identity in
        #   the new sink. If this value is omitted or set to false, and if the sink's
        #   parent is a project, then the value returned as writer_identity is the same
        #   group or service account used by Logging before the addition of writer
        #   identities to this API. The sink's destination must be in the same project as
        #   the sink itself.If this field is set to true, or if the sink is owned by a non-
        #   project resource such as an organization, then the value of writer_identity
        #   will be a unique service account used only for exports from the new sink. For
        #   more information, see writer_identity in LogSink.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_sink(parent, log_sink_object = nil, unique_writer_identity: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/sinks', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['parent'] = parent unless parent.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a sink. If the sink has a unique writer_identity, then that service
        # account is also deleted.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to delete, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_sink(sink_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+sinkName}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a sink.
        # @param [String] sink_name
        #   Required. The resource name of the sink:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_sink(sink_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+sinkName}', options)
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists sinks.
        # @param [String] parent
        #   Required. The parent resource whose sinks are to be listed:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListSinksResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListSinksResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_sinks(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/sinks', options)
          command.response_representation = Google::Apis::LoggingV2::ListSinksResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListSinksResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a sink. This method replaces the following fields in the existing sink
        # with values from the new sink: destination, and filter.The updated sink might
        # also have a new writer_identity; see the unique_writer_identity field.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to update, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. See sinks.create for a description of this field. When updating a
        #   sink, the effect of this field on the value of writer_identity in the updated
        #   sink depends on both the old and new values of this field:
        #   If the old and new values of this field are both false or both true, then
        #   there is no change to the sink's writer_identity.
        #   If the old value is false and the new value is true, then writer_identity is
        #   changed to a unique service account.
        #   It is an error if the old value is true and the new value is set to false or
        #   defaulted to false.
        # @param [String] update_mask
        #   Optional. Field mask that specifies the fields in sink that need an update. A
        #   sink field will be overwritten if, and only if, it is in the update mask. name
        #   and output only fields cannot be updated.An empty updateMask is temporarily
        #   treated as using the following mask for backwards compatibility purposes:
        #   destination,filter,includeChildren At some point in the future, behavior will
        #   be removed and specifying an empty updateMask will be an error.For a detailed
        #   FieldMask definition, see https://developers.google.com/protocol-buffers/docs/
        #   reference/google.protobuf#google.protobuf.FieldMaskExample: updateMask=filter.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_sink(sink_name, log_sink_object = nil, unique_writer_identity: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v2/{+sinkName}', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a sink. This method replaces the following fields in the existing sink
        # with values from the new sink: destination, and filter.The updated sink might
        # also have a new writer_identity; see the unique_writer_identity field.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to update, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. See sinks.create for a description of this field. When updating a
        #   sink, the effect of this field on the value of writer_identity in the updated
        #   sink depends on both the old and new values of this field:
        #   If the old and new values of this field are both false or both true, then
        #   there is no change to the sink's writer_identity.
        #   If the old value is false and the new value is true, then writer_identity is
        #   changed to a unique service account.
        #   It is an error if the old value is true and the new value is set to false or
        #   defaulted to false.
        # @param [String] update_mask
        #   Optional. Field mask that specifies the fields in sink that need an update. A
        #   sink field will be overwritten if, and only if, it is in the update mask. name
        #   and output only fields cannot be updated.An empty updateMask is temporarily
        #   treated as using the following mask for backwards compatibility purposes:
        #   destination,filter,includeChildren At some point in the future, behavior will
        #   be removed and specifying an empty updateMask will be an error.For a detailed
        #   FieldMask definition, see https://developers.google.com/protocol-buffers/docs/
        #   reference/google.protobuf#google.protobuf.FieldMaskExample: updateMask=filter.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_project_sink(sink_name, log_sink_object = nil, unique_writer_identity: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v2/{+sinkName}', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a sink that exports specified log entries to a destination. The export
        # of newly-ingested log entries begins immediately, unless the sink's
        # writer_identity is not permitted to write to the destination. A sink can
        # export log entries only from the resource owning the sink.
        # @param [String] parent
        #   Required. The resource in which to create the sink:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        #   Examples: "projects/my-logging-project", "organizations/123456789".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. Determines the kind of IAM identity returned as writer_identity in
        #   the new sink. If this value is omitted or set to false, and if the sink's
        #   parent is a project, then the value returned as writer_identity is the same
        #   group or service account used by Logging before the addition of writer
        #   identities to this API. The sink's destination must be in the same project as
        #   the sink itself.If this field is set to true, or if the sink is owned by a non-
        #   project resource such as an organization, then the value of writer_identity
        #   will be a unique service account used only for exports from the new sink. For
        #   more information, see writer_identity in LogSink.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_sink(parent, log_sink_object = nil, unique_writer_identity: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+parent}/sinks', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['parent'] = parent unless parent.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a sink. If the sink has a unique writer_identity, then that service
        # account is also deleted.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to delete, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_sink(sink_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v2/{+sinkName}', options)
          command.response_representation = Google::Apis::LoggingV2::Empty::Representation
          command.response_class = Google::Apis::LoggingV2::Empty
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a sink.
        # @param [String] sink_name
        #   Required. The resource name of the sink:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_sink(sink_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+sinkName}', options)
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists sinks.
        # @param [String] parent
        #   Required. The parent resource whose sinks are to be listed:
        #   "projects/[PROJECT_ID]"
        #   "organizations/[ORGANIZATION_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]"
        #   "folders/[FOLDER_ID]"
        # @param [Fixnum] page_size
        #   Optional. The maximum number of results to return from this request. Non-
        #   positive values are ignored. The presence of nextPageToken in the response
        #   indicates that more results might be available.
        # @param [String] page_token
        #   Optional. If present, then retrieve the next batch of results from the
        #   preceding call to this method. pageToken must be the value of nextPageToken
        #   from the previous response. The values of other method parameters should be
        #   identical to those in the previous call.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::ListSinksResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::ListSinksResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_sinks(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+parent}/sinks', options)
          command.response_representation = Google::Apis::LoggingV2::ListSinksResponse::Representation
          command.response_class = Google::Apis::LoggingV2::ListSinksResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a sink. This method replaces the following fields in the existing sink
        # with values from the new sink: destination, and filter.The updated sink might
        # also have a new writer_identity; see the unique_writer_identity field.
        # @param [String] sink_name
        #   Required. The full resource name of the sink to update, including the parent
        #   resource and the sink identifier:
        #   "projects/[PROJECT_ID]/sinks/[SINK_ID]"
        #   "organizations/[ORGANIZATION_ID]/sinks/[SINK_ID]"
        #   "billingAccounts/[BILLING_ACCOUNT_ID]/sinks/[SINK_ID]"
        #   "folders/[FOLDER_ID]/sinks/[SINK_ID]"
        #   Example: "projects/my-project-id/sinks/my-sink-id".
        # @param [Google::Apis::LoggingV2::LogSink] log_sink_object
        # @param [Boolean] unique_writer_identity
        #   Optional. See sinks.create for a description of this field. When updating a
        #   sink, the effect of this field on the value of writer_identity in the updated
        #   sink depends on both the old and new values of this field:
        #   If the old and new values of this field are both false or both true, then
        #   there is no change to the sink's writer_identity.
        #   If the old value is false and the new value is true, then writer_identity is
        #   changed to a unique service account.
        #   It is an error if the old value is true and the new value is set to false or
        #   defaulted to false.
        # @param [String] update_mask
        #   Optional. Field mask that specifies the fields in sink that need an update. A
        #   sink field will be overwritten if, and only if, it is in the update mask. name
        #   and output only fields cannot be updated.An empty updateMask is temporarily
        #   treated as using the following mask for backwards compatibility purposes:
        #   destination,filter,includeChildren At some point in the future, behavior will
        #   be removed and specifying an empty updateMask will be an error.For a detailed
        #   FieldMask definition, see https://developers.google.com/protocol-buffers/docs/
        #   reference/google.protobuf#google.protobuf.FieldMaskExample: updateMask=filter.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LoggingV2::LogSink] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LoggingV2::LogSink]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_sink(sink_name, log_sink_object = nil, unique_writer_identity: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v2/{+sinkName}', options)
          command.request_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.request_object = log_sink_object
          command.response_representation = Google::Apis::LoggingV2::LogSink::Representation
          command.response_class = Google::Apis::LoggingV2::LogSink
          command.params['sinkName'] = sink_name unless sink_name.nil?
          command.query['uniqueWriterIdentity'] = unique_writer_identity unless unique_writer_identity.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
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
