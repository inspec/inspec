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
    module RemotebuildexecutionV2
      # Remote Build Execution API
      #
      # Supplies a Remote Execution API service for tools such as bazel.
      #
      # @example
      #    require 'google/apis/remotebuildexecution_v2'
      #
      #    Remotebuildexecution = Google::Apis::RemotebuildexecutionV2 # Alias the module
      #    service = Remotebuildexecution::RemoteBuildExecutionService.new
      #
      # @see https://cloud.google.com/remote-build-execution/docs/
      class RemoteBuildExecutionService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://remotebuildexecution.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Retrieve a cached execution result.
        # Implementations SHOULD ensure that any blobs referenced from the
        # ContentAddressableStorage
        # are available at the time of returning the
        # ActionResult and will be
        # for some period of time afterwards. The TTLs of the referenced blobs SHOULD be
        # increased
        # if necessary and applicable.
        # Errors:
        # * `NOT_FOUND`: The requested `ActionResult` is not in the cache.
        # @param [String] instance_name
        #   The instance of the execution system to operate against. A server may
        #   support multiple instances of the execution system (with their own workers,
        #   storage, caches, etc.). The server MAY require use of this field to select
        #   between them in an implementation-defined fashion, otherwise it can be
        #   omitted.
        # @param [String] hash_
        #   The hash. In the case of SHA-256, it will always be a lowercase hex string
        #   exactly 64 characters long.
        # @param [Fixnum] size_bytes
        #   The size of the blob, in bytes.
        # @param [Array<String>, String] inline_output_files
        #   A hint to the server to inline the contents of the listed output files.
        #   Each path needs to exactly match one path in `output_files` in the
        #   Command message.
        # @param [Boolean] inline_stderr
        #   A hint to the server to request inlining stderr in the
        #   ActionResult message.
        # @param [Boolean] inline_stdout
        #   A hint to the server to request inlining stdout in the
        #   ActionResult message.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionResult] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionResult]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_action_result(instance_name, hash_, size_bytes, inline_output_files: nil, inline_stderr: nil, inline_stdout: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+instanceName}/actionResults/{hash}/{sizeBytes}', options)
          command.response_representation = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionResult::Representation
          command.response_class = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionResult
          command.params['instanceName'] = instance_name unless instance_name.nil?
          command.params['hash'] = hash_ unless hash_.nil?
          command.params['sizeBytes'] = size_bytes unless size_bytes.nil?
          command.query['inlineOutputFiles'] = inline_output_files unless inline_output_files.nil?
          command.query['inlineStderr'] = inline_stderr unless inline_stderr.nil?
          command.query['inlineStdout'] = inline_stdout unless inline_stdout.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Upload a new execution result.
        # In order to allow the server to perform access control based on the type of
        # action, and to assist with client debugging, the client MUST first upload
        # the Action that produced the
        # result, along with its
        # Command, into the
        # `ContentAddressableStorage`.
        # Errors:
        # * `INVALID_ARGUMENT`: One or more arguments are invalid.
        # * `FAILED_PRECONDITION`: One or more errors occurred in updating the
        # action result, such as a missing command or action.
        # * `RESOURCE_EXHAUSTED`: There is insufficient storage space to add the
        # entry to the cache.
        # @param [String] instance_name
        #   The instance of the execution system to operate against. A server may
        #   support multiple instances of the execution system (with their own workers,
        #   storage, caches, etc.). The server MAY require use of this field to select
        #   between them in an implementation-defined fashion, otherwise it can be
        #   omitted.
        # @param [String] hash_
        #   The hash. In the case of SHA-256, it will always be a lowercase hex string
        #   exactly 64 characters long.
        # @param [Fixnum] size_bytes
        #   The size of the blob, in bytes.
        # @param [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionResult] build_bazel_remote_execution_v2_action_result_object
        # @param [Fixnum] results_cache_policy_priority
        #   The priority (relative importance) of this content in the overall cache.
        #   Generally, a lower value means a longer retention time or other advantage,
        #   but the interpretation of a given value is server-dependent. A priority of
        #   0 means a *default* value, decided by the server.
        #   The particular semantics of this field is up to the server. In particular,
        #   every server will have their own supported range of priorities, and will
        #   decide how these map into retention/eviction policy.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionResult] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionResult]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_action_result(instance_name, hash_, size_bytes, build_bazel_remote_execution_v2_action_result_object = nil, results_cache_policy_priority: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v2/{+instanceName}/actionResults/{hash}/{sizeBytes}', options)
          command.request_representation = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionResult::Representation
          command.request_object = build_bazel_remote_execution_v2_action_result_object
          command.response_representation = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionResult::Representation
          command.response_class = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionResult
          command.params['instanceName'] = instance_name unless instance_name.nil?
          command.params['hash'] = hash_ unless hash_.nil?
          command.params['sizeBytes'] = size_bytes unless size_bytes.nil?
          command.query['resultsCachePolicy.priority'] = results_cache_policy_priority unless results_cache_policy_priority.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Execute an action remotely.
        # In order to execute an action, the client must first upload all of the
        # inputs, the
        # Command to run, and the
        # Action into the
        # ContentAddressableStorage.
        # It then calls `Execute` with an `action_digest` referring to them. The
        # server will run the action and eventually return the result.
        # The input `Action`'s fields MUST meet the various canonicalization
        # requirements specified in the documentation for their types so that it has
        # the same digest as other logically equivalent `Action`s. The server MAY
        # enforce the requirements and return errors if a non-canonical input is
        # received. It MAY also proceed without verifying some or all of the
        # requirements, such as for performance reasons. If the server does not
        # verify the requirement, then it will treat the `Action` as distinct from
        # another logically equivalent action if they hash differently.
        # Returns a stream of
        # google.longrunning.Operation messages
        # describing the resulting execution, with eventual `response`
        # ExecuteResponse. The
        # `metadata` on the operation is of type
        # ExecuteOperationMetadata.
        # If the client remains connected after the first response is returned after
        # the server, then updates are streamed as if the client had called
        # WaitExecution
        # until the execution completes or the request reaches an error. The
        # operation can also be queried using Operations
        # API.
        # The server NEED NOT implement other methods or functionality of the
        # Operations API.
        # Errors discovered during creation of the `Operation` will be reported
        # as gRPC Status errors, while errors that occurred while running the
        # action will be reported in the `status` field of the `ExecuteResponse`. The
        # server MUST NOT set the `error` field of the `Operation` proto.
        # The possible errors include:
        # * `INVALID_ARGUMENT`: One or more arguments are invalid.
        # * `FAILED_PRECONDITION`: One or more errors occurred in setting up the
        # action requested, such as a missing input or command or no worker being
        # available. The client may be able to fix the errors and retry.
        # * `RESOURCE_EXHAUSTED`: There is insufficient quota of some resource to run
        # the action.
        # * `UNAVAILABLE`: Due to a transient condition, such as all workers being
        # occupied (and the server does not support a queue), the action could not
        # be started. The client should retry.
        # * `INTERNAL`: An internal error occurred in the execution engine or the
        # worker.
        # * `DEADLINE_EXCEEDED`: The execution timed out.
        # * `CANCELLED`: The operation was cancelled by the client. This status is
        # only possible if the server implements the Operations API CancelOperation
        # method, and it was called for the current execution.
        # In the case of a missing input or command, the server SHOULD additionally
        # send a PreconditionFailure error detail
        # where, for each requested blob not present in the CAS, there is a
        # `Violation` with a `type` of `MISSING` and a `subject` of
        # `"blobs/`hash`/`size`"` indicating the digest of the missing blob.
        # @param [String] instance_name
        #   The instance of the execution system to operate against. A server may
        #   support multiple instances of the execution system (with their own workers,
        #   storage, caches, etc.). The server MAY require use of this field to select
        #   between them in an implementation-defined fashion, otherwise it can be
        #   omitted.
        # @param [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ExecuteRequest] build_bazel_remote_execution_v2_execute_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RemotebuildexecutionV2::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RemotebuildexecutionV2::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def execute_action(instance_name, build_bazel_remote_execution_v2_execute_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+instanceName}/actions:execute', options)
          command.request_representation = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ExecuteRequest::Representation
          command.request_object = build_bazel_remote_execution_v2_execute_request_object
          command.response_representation = Google::Apis::RemotebuildexecutionV2::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::RemotebuildexecutionV2::GoogleLongrunningOperation
          command.params['instanceName'] = instance_name unless instance_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Download many blobs at once.
        # The server may enforce a limit of the combined total size of blobs
        # to be downloaded using this API. This limit may be obtained using the
        # Capabilities API.
        # Requests exceeding the limit should either be split into smaller
        # chunks or downloaded using the
        # ByteStream API, as appropriate.
        # This request is equivalent to calling a Bytestream `Read` request
        # on each individual blob, in parallel. The requests may succeed or fail
        # independently.
        # Errors:
        # * `INVALID_ARGUMENT`: The client attempted to read more than the
        # server supported limit.
        # Every error on individual read will be returned in the corresponding digest
        # status.
        # @param [String] instance_name
        #   The instance of the execution system to operate against. A server may
        #   support multiple instances of the execution system (with their own workers,
        #   storage, caches, etc.). The server MAY require use of this field to select
        #   between them in an implementation-defined fashion, otherwise it can be
        #   omitted.
        # @param [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchReadBlobsRequest] build_bazel_remote_execution_v2_batch_read_blobs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchReadBlobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchReadBlobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_blob_read(instance_name, build_bazel_remote_execution_v2_batch_read_blobs_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+instanceName}/blobs:batchRead', options)
          command.request_representation = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchReadBlobsRequest::Representation
          command.request_object = build_bazel_remote_execution_v2_batch_read_blobs_request_object
          command.response_representation = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchReadBlobsResponse::Representation
          command.response_class = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchReadBlobsResponse
          command.params['instanceName'] = instance_name unless instance_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Upload many blobs at once.
        # The server may enforce a limit of the combined total size of blobs
        # to be uploaded using this API. This limit may be obtained using the
        # Capabilities API.
        # Requests exceeding the limit should either be split into smaller
        # chunks or uploaded using the
        # ByteStream API, as appropriate.
        # This request is equivalent to calling a Bytestream `Write` request
        # on each individual blob, in parallel. The requests may succeed or fail
        # independently.
        # Errors:
        # * `INVALID_ARGUMENT`: The client attempted to upload more than the
        # server supported limit.
        # Individual requests may return the following errors, additionally:
        # * `RESOURCE_EXHAUSTED`: There is insufficient disk quota to store the blob.
        # * `INVALID_ARGUMENT`: The
        # Digest does not match the
        # provided data.
        # @param [String] instance_name
        #   The instance of the execution system to operate against. A server may
        #   support multiple instances of the execution system (with their own workers,
        #   storage, caches, etc.). The server MAY require use of this field to select
        #   between them in an implementation-defined fashion, otherwise it can be
        #   omitted.
        # @param [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchUpdateBlobsRequest] build_bazel_remote_execution_v2_batch_update_blobs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchUpdateBlobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchUpdateBlobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_blob_update(instance_name, build_bazel_remote_execution_v2_batch_update_blobs_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+instanceName}/blobs:batchUpdate', options)
          command.request_representation = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchUpdateBlobsRequest::Representation
          command.request_object = build_bazel_remote_execution_v2_batch_update_blobs_request_object
          command.response_representation = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchUpdateBlobsResponse::Representation
          command.response_class = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchUpdateBlobsResponse
          command.params['instanceName'] = instance_name unless instance_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Determine if blobs are present in the CAS.
        # Clients can use this API before uploading blobs to determine which ones are
        # already present in the CAS and do not need to be uploaded again.
        # There are no method-specific errors.
        # @param [String] instance_name
        #   The instance of the execution system to operate against. A server may
        #   support multiple instances of the execution system (with their own workers,
        #   storage, caches, etc.). The server MAY require use of this field to select
        #   between them in an implementation-defined fashion, otherwise it can be
        #   omitted.
        # @param [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2FindMissingBlobsRequest] build_bazel_remote_execution_v2_find_missing_blobs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2FindMissingBlobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2FindMissingBlobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def find_blob_missing(instance_name, build_bazel_remote_execution_v2_find_missing_blobs_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+instanceName}/blobs:findMissing', options)
          command.request_representation = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2FindMissingBlobsRequest::Representation
          command.request_object = build_bazel_remote_execution_v2_find_missing_blobs_request_object
          command.response_representation = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2FindMissingBlobsResponse::Representation
          command.response_class = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2FindMissingBlobsResponse
          command.params['instanceName'] = instance_name unless instance_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Fetch the entire directory tree rooted at a node.
        # This request must be targeted at a
        # Directory stored in the
        # ContentAddressableStorage
        # (CAS). The server will enumerate the `Directory` tree recursively and
        # return every node descended from the root.
        # The GetTreeRequest.page_token parameter can be used to skip ahead in
        # the stream (e.g. when retrying a partially completed and aborted request),
        # by setting it to a value taken from GetTreeResponse.next_page_token of the
        # last successfully processed GetTreeResponse).
        # The exact traversal order is unspecified and, unless retrieving subsequent
        # pages from an earlier request, is not guaranteed to be stable across
        # multiple invocations of `GetTree`.
        # If part of the tree is missing from the CAS, the server will return the
        # portion present and omit the rest.
        # * `NOT_FOUND`: The requested tree root is not present in the CAS.
        # @param [String] instance_name
        #   The instance of the execution system to operate against. A server may
        #   support multiple instances of the execution system (with their own workers,
        #   storage, caches, etc.). The server MAY require use of this field to select
        #   between them in an implementation-defined fashion, otherwise it can be
        #   omitted.
        # @param [String] hash_
        #   The hash. In the case of SHA-256, it will always be a lowercase hex string
        #   exactly 64 characters long.
        # @param [Fixnum] size_bytes
        #   The size of the blob, in bytes.
        # @param [Fixnum] page_size
        #   A maximum page size to request. If present, the server will request no more
        #   than this many items. Regardless of whether a page size is specified, the
        #   server may place its own limit on the number of items to be returned and
        #   require the client to retrieve more items using a subsequent request.
        # @param [String] page_token
        #   A page token, which must be a value received in a previous
        #   GetTreeResponse.
        #   If present, the server will use it to return the following page of results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2GetTreeResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2GetTreeResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_blob_tree(instance_name, hash_, size_bytes, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+instanceName}/blobs/{hash}/{sizeBytes}:getTree', options)
          command.response_representation = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2GetTreeResponse::Representation
          command.response_class = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2GetTreeResponse
          command.params['instanceName'] = instance_name unless instance_name.nil?
          command.params['hash'] = hash_ unless hash_.nil?
          command.params['sizeBytes'] = size_bytes unless size_bytes.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Wait for an execution operation to complete. When the client initially
        # makes the request, the server immediately responds with the current status
        # of the execution. The server will leave the request stream open until the
        # operation completes, and then respond with the completed operation. The
        # server MAY choose to stream additional updates as execution progresses,
        # such as to provide an update as to the state of the execution.
        # @param [String] name
        #   The name of the Operation
        #   returned by Execute.
        # @param [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2WaitExecutionRequest] build_bazel_remote_execution_v2_wait_execution_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RemotebuildexecutionV2::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RemotebuildexecutionV2::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def wait_operation_execution(name, build_bazel_remote_execution_v2_wait_execution_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v2/{+name}:waitExecution', options)
          command.request_representation = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2WaitExecutionRequest::Representation
          command.request_object = build_bazel_remote_execution_v2_wait_execution_request_object
          command.response_representation = Google::Apis::RemotebuildexecutionV2::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::RemotebuildexecutionV2::GoogleLongrunningOperation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # GetCapabilities returns the server capabilities configuration of the
        # remote endpoint.
        # Only the capabilities of the services supported by the endpoint will
        # be returned:
        # * Execution + CAS + Action Cache endpoints should return both
        # CacheCapabilities and ExecutionCapabilities.
        # * Execution only endpoints should return ExecutionCapabilities.
        # * CAS + Action Cache only endpoints should return CacheCapabilities.
        # @param [String] instance_name
        #   The instance of the execution system to operate against. A server may
        #   support multiple instances of the execution system (with their own workers,
        #   storage, caches, etc.). The server MAY require use of this field to select
        #   between them in an implementation-defined fashion, otherwise it can be
        #   omitted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ServerCapabilities] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ServerCapabilities]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_capabilities(instance_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v2/{+instanceName}/capabilities', options)
          command.response_representation = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ServerCapabilities::Representation
          command.response_class = Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ServerCapabilities
          command.params['instanceName'] = instance_name unless instance_name.nil?
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
