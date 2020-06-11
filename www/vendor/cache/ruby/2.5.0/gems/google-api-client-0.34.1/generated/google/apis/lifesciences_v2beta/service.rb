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
    module LifesciencesV2beta
      # Cloud Life Sciences API
      #
      # Cloud Life Sciences is a suite of services and tools for managing, processing,
      #  and transforming life sciences data.
      #
      # @example
      #    require 'google/apis/lifesciences_v2beta'
      #
      #    Lifesciences = Google::Apis::LifesciencesV2beta # Alias the module
      #    service = Lifesciences::CloudLifeSciencesService.new
      #
      # @see https://cloud.google.com/life-sciences
      class CloudLifeSciencesService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://lifesciences.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Gets information about a location.
        # @param [String] name
        #   Resource name for the location.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LifesciencesV2beta::Location] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LifesciencesV2beta::Location]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta/{+name}', options)
          command.response_representation = Google::Apis::LifesciencesV2beta::Location::Representation
          command.response_class = Google::Apis::LifesciencesV2beta::Location
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists information about the supported locations for this service.
        # @param [String] name
        #   The resource that owns the locations collection, if applicable.
        # @param [String] filter
        #   The standard list filter.
        # @param [Fixnum] page_size
        #   The standard list page size.
        # @param [String] page_token
        #   The standard list page token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LifesciencesV2beta::ListLocationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LifesciencesV2beta::ListLocationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_locations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta/{+name}/locations', options)
          command.response_representation = Google::Apis::LifesciencesV2beta::ListLocationsResponse::Representation
          command.response_class = Google::Apis::LifesciencesV2beta::ListLocationsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Starts asynchronous cancellation on a long-running operation.
        # The server makes a best effort to cancel the operation, but success is not
        # guaranteed. Clients may use Operations.GetOperation
        # or Operations.ListOperations
        # to check whether the cancellation succeeded or the operation completed
        # despite cancellation.
        # Authorization requires the following [Google IAM](https://cloud.google.com/iam)
        # permission&#58;
        # * `lifesciences.operations.cancel`
        # @param [String] name
        #   The name of the operation resource to be cancelled.
        # @param [Google::Apis::LifesciencesV2beta::CancelOperationRequest] cancel_operation_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LifesciencesV2beta::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LifesciencesV2beta::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_operation(name, cancel_operation_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta/{+name}:cancel', options)
          command.request_representation = Google::Apis::LifesciencesV2beta::CancelOperationRequest::Representation
          command.request_object = cancel_operation_request_object
          command.response_representation = Google::Apis::LifesciencesV2beta::Empty::Representation
          command.response_class = Google::Apis::LifesciencesV2beta::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the latest state of a long-running operation.
        # Clients can use this method to poll the operation result at intervals as
        # recommended by the API service.
        # Authorization requires the following [Google IAM](https://cloud.google.com/iam)
        # permission&#58;
        # * `lifesciences.operations.get`
        # @param [String] name
        #   The name of the operation resource.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LifesciencesV2beta::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LifesciencesV2beta::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta/{+name}', options)
          command.response_representation = Google::Apis::LifesciencesV2beta::Operation::Representation
          command.response_class = Google::Apis::LifesciencesV2beta::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists operations that match the specified filter in the request.
        # Authorization requires the following [Google IAM](https://cloud.google.com/iam)
        # permission&#58;
        # * `lifesciences.operations.list`
        # @param [String] name
        #   The name of the operation's parent resource.
        # @param [String] filter
        #   A string for filtering Operations.
        #   The following filter fields are supported&#58;
        #   * createTime&#58; The time this job was created
        #   * events&#58; The set of event (names) that have occurred while running
        #   the pipeline.  The &#58; operator can be used to determine if a
        #   particular event has occurred.
        #   * error&#58; If the pipeline is running, this value is NULL.  Once the
        #   pipeline finishes, the value is the standard Google error code.
        #   * labels.key or labels."key with space" where key is a label key.
        #   * done&#58; If the pipeline is running, this value is false. Once the
        #   pipeline finishes, the value is true.
        # @param [Fixnum] page_size
        #   The maximum number of results to return. The maximum value is 256.
        # @param [String] page_token
        #   The standard list page token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LifesciencesV2beta::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LifesciencesV2beta::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_operations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2beta/{+name}/operations', options)
          command.response_representation = Google::Apis::LifesciencesV2beta::ListOperationsResponse::Representation
          command.response_class = Google::Apis::LifesciencesV2beta::ListOperationsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Runs a pipeline.  The returned Operation's metadata field will contain a
        # google.cloud.lifesciences.v2beta.Metadata object describing the status
        # of the pipeline execution. The
        # response field will contain a
        # google.cloud.lifesciences.v2beta.RunPipelineResponse object if the
        # pipeline completes successfully.
        # **Note:** Before you can use this method, the *Life Sciences Service Agent*
        # must have access to your project. This is done automatically when the
        # Cloud Life Sciences API is first enabled, but if you delete this permission
        # you must disable and re-enable the API to grant the Life Sciences
        # Service Agent the required permissions.
        # Authorization requires the following [Google
        # IAM](https://cloud.google.com/iam/) permission:
        # * `lifesciences.workflows.run`
        # @param [String] parent
        #   The project and location that this request should be executed against.
        # @param [Google::Apis::LifesciencesV2beta::RunPipelineRequest] run_pipeline_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::LifesciencesV2beta::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::LifesciencesV2beta::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def run_pipeline(parent, run_pipeline_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2beta/{+parent}/pipelines:run', options)
          command.request_representation = Google::Apis::LifesciencesV2beta::RunPipelineRequest::Representation
          command.request_object = run_pipeline_request_object
          command.response_representation = Google::Apis::LifesciencesV2beta::Operation::Representation
          command.response_class = Google::Apis::LifesciencesV2beta::Operation
          command.params['parent'] = parent unless parent.nil?
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
