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
    module CloudbuildV1
      # Cloud Build API
      #
      # Creates and manages builds on Google Cloud Platform.
      #
      # @example
      #    require 'google/apis/cloudbuild_v1'
      #
      #    Cloudbuild = Google::Apis::CloudbuildV1 # Alias the module
      #    service = Cloudbuild::CloudBuildService.new
      #
      # @see https://cloud.google.com/cloud-build/docs/
      class CloudBuildService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudbuild.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Starts asynchronous cancellation on a long-running operation.  The server
        # makes a best effort to cancel the operation, but success is not
        # guaranteed.  If the server doesn't support this method, it returns
        # `google.rpc.Code.UNIMPLEMENTED`.  Clients can use
        # Operations.GetOperation or
        # other methods to check whether the cancellation succeeded or whether the
        # operation completed despite cancellation. On successful cancellation,
        # the operation is not deleted; instead, it becomes an operation with
        # an Operation.error value with a google.rpc.Status.code of 1,
        # corresponding to `Code.CANCELLED`.
        # @param [String] name
        #   The name of the operation resource to be cancelled.
        # @param [Google::Apis::CloudbuildV1::CancelOperationRequest] cancel_operation_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbuildV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_operation(name, cancel_operation_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:cancel', options)
          command.request_representation = Google::Apis::CloudbuildV1::CancelOperationRequest::Representation
          command.request_object = cancel_operation_request_object
          command.response_representation = Google::Apis::CloudbuildV1::Empty::Representation
          command.response_class = Google::Apis::CloudbuildV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the latest state of a long-running operation.  Clients can use this
        # method to poll the operation result at intervals as recommended by the API
        # service.
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
        # @yieldparam result [Google::Apis::CloudbuildV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudbuildV1::Operation::Representation
          command.response_class = Google::Apis::CloudbuildV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists operations that match the specified filter in the request. If the
        # server doesn't support this method, it returns `UNIMPLEMENTED`.
        # NOTE: the `name` binding allows API services to override the binding
        # to use different resource name schemes, such as `users/*/operations`. To
        # override the binding, API services can add a binding such as
        # `"/v1/`name=users/*`/operations"` to their service configuration.
        # For backwards compatibility, the default name includes the operations
        # collection id, however overriding users must ensure the name binding
        # is the parent resource, without the operations collection id.
        # @param [String] name
        #   The name of the operation's parent resource.
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
        # @yieldparam result [Google::Apis::CloudbuildV1::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_operations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudbuildV1::ListOperationsResponse::Representation
          command.response_class = Google::Apis::CloudbuildV1::ListOperationsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Cancels a build in progress.
        # @param [String] project_id
        #   ID of the project.
        # @param [String] id
        #   ID of the build.
        # @param [Google::Apis::CloudbuildV1::CancelBuildRequest] cancel_build_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbuildV1::Build] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::Build]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_build(project_id, id, cancel_build_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/projects/{projectId}/builds/{id}:cancel', options)
          command.request_representation = Google::Apis::CloudbuildV1::CancelBuildRequest::Representation
          command.request_object = cancel_build_request_object
          command.response_representation = Google::Apis::CloudbuildV1::Build::Representation
          command.response_class = Google::Apis::CloudbuildV1::Build
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Starts a build with the specified configuration.
        # This method returns a long-running `Operation`, which includes the build
        # ID. Pass the build ID to `GetBuild` to determine the build status (such as
        # `SUCCESS` or `FAILURE`).
        # @param [String] project_id
        #   ID of the project.
        # @param [Google::Apis::CloudbuildV1::Build] build_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbuildV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_build(project_id, build_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/projects/{projectId}/builds', options)
          command.request_representation = Google::Apis::CloudbuildV1::Build::Representation
          command.request_object = build_object
          command.response_representation = Google::Apis::CloudbuildV1::Operation::Representation
          command.response_class = Google::Apis::CloudbuildV1::Operation
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns information about a previously requested build.
        # The `Build` that is returned includes its status (such as `SUCCESS`,
        # `FAILURE`, or `WORKING`), and timing information.
        # @param [String] project_id
        #   ID of the project.
        # @param [String] id
        #   ID of the build.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbuildV1::Build] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::Build]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_build(project_id, id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/projects/{projectId}/builds/{id}', options)
          command.response_representation = Google::Apis::CloudbuildV1::Build::Representation
          command.response_class = Google::Apis::CloudbuildV1::Build
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists previously requested builds.
        # Previously requested builds may still be in-progress, or may have finished
        # successfully or unsuccessfully.
        # @param [String] project_id
        #   ID of the project.
        # @param [String] filter
        #   The raw filter text to constrain the results.
        # @param [Fixnum] page_size
        #   Number of results to return in the list.
        # @param [String] page_token
        #   Token to provide to skip to a particular spot in the list.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbuildV1::ListBuildsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::ListBuildsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_builds(project_id, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/projects/{projectId}/builds', options)
          command.response_representation = Google::Apis::CloudbuildV1::ListBuildsResponse::Representation
          command.response_class = Google::Apis::CloudbuildV1::ListBuildsResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new build based on the specified build.
        # This method creates a new build using the original build request, which may
        # or may not result in an identical build.
        # For triggered builds:
        # * Triggered builds resolve to a precise revision; therefore a retry of a
        # triggered build will result in a build that uses the same revision.
        # For non-triggered builds that specify `RepoSource`:
        # * If the original build built from the tip of a branch, the retried build
        # will build from the tip of that branch, which may not be the same revision
        # as the original build.
        # * If the original build specified a commit sha or revision ID, the retried
        # build will use the identical source.
        # For builds that specify `StorageSource`:
        # * If the original build pulled source from Google Cloud Storage without
        # specifying the generation of the object, the new build will use the current
        # object, which may be different from the original build source.
        # * If the original build pulled source from Cloud Storage and specified the
        # generation of the object, the new build will attempt to use the same
        # object, which may or may not be available depending on the bucket's
        # lifecycle management settings.
        # @param [String] project_id
        #   ID of the project.
        # @param [String] id
        #   Build ID of the original build.
        # @param [Google::Apis::CloudbuildV1::RetryBuildRequest] retry_build_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbuildV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def retry_build(project_id, id, retry_build_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/projects/{projectId}/builds/{id}:retry', options)
          command.request_representation = Google::Apis::CloudbuildV1::RetryBuildRequest::Representation
          command.request_object = retry_build_request_object
          command.response_representation = Google::Apis::CloudbuildV1::Operation::Representation
          command.response_class = Google::Apis::CloudbuildV1::Operation
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['id'] = id unless id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new `BuildTrigger`.
        # This API is experimental.
        # @param [String] project_id
        #   ID of the project for which to configure automatic builds.
        # @param [Google::Apis::CloudbuildV1::BuildTrigger] build_trigger_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbuildV1::BuildTrigger] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::BuildTrigger]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_trigger(project_id, build_trigger_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/projects/{projectId}/triggers', options)
          command.request_representation = Google::Apis::CloudbuildV1::BuildTrigger::Representation
          command.request_object = build_trigger_object
          command.response_representation = Google::Apis::CloudbuildV1::BuildTrigger::Representation
          command.response_class = Google::Apis::CloudbuildV1::BuildTrigger
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a `BuildTrigger` by its project ID and trigger ID.
        # This API is experimental.
        # @param [String] project_id
        #   ID of the project that owns the trigger.
        # @param [String] trigger_id
        #   ID of the `BuildTrigger` to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbuildV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_trigger(project_id, trigger_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/projects/{projectId}/triggers/{triggerId}', options)
          command.response_representation = Google::Apis::CloudbuildV1::Empty::Representation
          command.response_class = Google::Apis::CloudbuildV1::Empty
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['triggerId'] = trigger_id unless trigger_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns information about a `BuildTrigger`.
        # This API is experimental.
        # @param [String] project_id
        #   ID of the project that owns the trigger.
        # @param [String] trigger_id
        #   ID of the `BuildTrigger` to get.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbuildV1::BuildTrigger] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::BuildTrigger]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_trigger(project_id, trigger_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/projects/{projectId}/triggers/{triggerId}', options)
          command.response_representation = Google::Apis::CloudbuildV1::BuildTrigger::Representation
          command.response_class = Google::Apis::CloudbuildV1::BuildTrigger
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['triggerId'] = trigger_id unless trigger_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists existing `BuildTrigger`s.
        # This API is experimental.
        # @param [String] project_id
        #   ID of the project for which to list BuildTriggers.
        # @param [Fixnum] page_size
        #   Number of results to return in the list.
        # @param [String] page_token
        #   Token to provide to skip to a particular spot in the list.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbuildV1::ListBuildTriggersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::ListBuildTriggersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_triggers(project_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/projects/{projectId}/triggers', options)
          command.response_representation = Google::Apis::CloudbuildV1::ListBuildTriggersResponse::Representation
          command.response_class = Google::Apis::CloudbuildV1::ListBuildTriggersResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a `BuildTrigger` by its project ID and trigger ID.
        # This API is experimental.
        # @param [String] project_id
        #   ID of the project that owns the trigger.
        # @param [String] trigger_id
        #   ID of the `BuildTrigger` to update.
        # @param [Google::Apis::CloudbuildV1::BuildTrigger] build_trigger_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbuildV1::BuildTrigger] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::BuildTrigger]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_trigger(project_id, trigger_id, build_trigger_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/projects/{projectId}/triggers/{triggerId}', options)
          command.request_representation = Google::Apis::CloudbuildV1::BuildTrigger::Representation
          command.request_object = build_trigger_object
          command.response_representation = Google::Apis::CloudbuildV1::BuildTrigger::Representation
          command.response_class = Google::Apis::CloudbuildV1::BuildTrigger
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['triggerId'] = trigger_id unless trigger_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Runs a `BuildTrigger` at a particular source revision.
        # @param [String] project_id
        #   ID of the project.
        # @param [String] trigger_id
        #   ID of the trigger.
        # @param [Google::Apis::CloudbuildV1::RepoSource] repo_source_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudbuildV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudbuildV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def run_project_trigger(project_id, trigger_id, repo_source_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/projects/{projectId}/triggers/{triggerId}:run', options)
          command.request_representation = Google::Apis::CloudbuildV1::RepoSource::Representation
          command.request_object = repo_source_object
          command.response_representation = Google::Apis::CloudbuildV1::Operation::Representation
          command.response_class = Google::Apis::CloudbuildV1::Operation
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['triggerId'] = trigger_id unless trigger_id.nil?
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
