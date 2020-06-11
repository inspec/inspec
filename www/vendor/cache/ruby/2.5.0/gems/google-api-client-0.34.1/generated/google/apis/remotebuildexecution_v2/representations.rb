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
    module RemotebuildexecutionV2
      
      class BuildBazelRemoteExecutionV2Action
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2ActionCacheUpdateCapabilities
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2ActionResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2BatchReadBlobsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2BatchReadBlobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2BatchReadBlobsResponseResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2BatchUpdateBlobsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2BatchUpdateBlobsRequestRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2BatchUpdateBlobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2BatchUpdateBlobsResponseResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2CacheCapabilities
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2Command
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2CommandEnvironmentVariable
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2Digest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2Directory
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2DirectoryNode
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2ExecuteOperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2ExecuteRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2ExecuteResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2ExecutedActionMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2ExecutionCapabilities
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2ExecutionPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2FileNode
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2FindMissingBlobsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2FindMissingBlobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2GetTreeResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2LogFile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2OutputDirectory
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2OutputFile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2OutputSymlink
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2Platform
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2PlatformProperty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2PriorityCapabilities
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2PriorityCapabilitiesPriorityRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2RequestMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2ResultsCachePolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2ServerCapabilities
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2SymlinkNode
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2ToolDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2Tree
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2WaitExecutionRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelSemverSemVer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildbotCommandDurations
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildbotCommandEvents
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildbotCommandStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaAcceleratorConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaCreateInstanceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaCreateWorkerPoolRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaDeleteInstanceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaDeleteWorkerPoolRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaGetInstanceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaGetWorkerPoolRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaInstance
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaListInstancesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaListInstancesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaListWorkerPoolsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaListWorkerPoolsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaUpdateWorkerPoolRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerPool
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2AdminTemp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2Blob
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandOutputs
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandOverhead
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandTask
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandTaskInputs
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandTaskInputsEnvironmentVariable
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandTaskOutputs
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandTaskTimeouts
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2Digest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2Directory
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2DirectoryMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleDevtoolsRemoteworkersV1test2FileMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleLongrunningOperation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleRpcStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildBazelRemoteExecutionV2Action
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :command_digest, as: 'commandDigest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
          property :do_not_cache, as: 'doNotCache'
          property :input_root_digest, as: 'inputRootDigest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
          property :timeout, as: 'timeout'
        end
      end
      
      class BuildBazelRemoteExecutionV2ActionCacheUpdateCapabilities
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :update_enabled, as: 'updateEnabled'
        end
      end
      
      class BuildBazelRemoteExecutionV2ActionResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_metadata, as: 'executionMetadata', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ExecutedActionMetadata, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ExecutedActionMetadata::Representation
      
          property :exit_code, as: 'exitCode'
          collection :output_directories, as: 'outputDirectories', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2OutputDirectory, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2OutputDirectory::Representation
      
          collection :output_directory_symlinks, as: 'outputDirectorySymlinks', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2OutputSymlink, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2OutputSymlink::Representation
      
          collection :output_file_symlinks, as: 'outputFileSymlinks', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2OutputSymlink, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2OutputSymlink::Representation
      
          collection :output_files, as: 'outputFiles', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2OutputFile, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2OutputFile::Representation
      
          property :stderr_digest, as: 'stderrDigest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
          property :stderr_raw, :base64 => true, as: 'stderrRaw'
          property :stdout_digest, as: 'stdoutDigest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
          property :stdout_raw, :base64 => true, as: 'stdoutRaw'
        end
      end
      
      class BuildBazelRemoteExecutionV2BatchReadBlobsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :digests, as: 'digests', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2BatchReadBlobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :responses, as: 'responses', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchReadBlobsResponseResponse, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchReadBlobsResponseResponse::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2BatchReadBlobsResponseResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data, :base64 => true, as: 'data'
          property :digest, as: 'digest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
          property :status, as: 'status', class: Google::Apis::RemotebuildexecutionV2::GoogleRpcStatus, decorator: Google::Apis::RemotebuildexecutionV2::GoogleRpcStatus::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2BatchUpdateBlobsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :requests, as: 'requests', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchUpdateBlobsRequestRequest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchUpdateBlobsRequestRequest::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2BatchUpdateBlobsRequestRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data, :base64 => true, as: 'data'
          property :digest, as: 'digest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2BatchUpdateBlobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :responses, as: 'responses', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchUpdateBlobsResponseResponse, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2BatchUpdateBlobsResponseResponse::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2BatchUpdateBlobsResponseResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :digest, as: 'digest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
          property :status, as: 'status', class: Google::Apis::RemotebuildexecutionV2::GoogleRpcStatus, decorator: Google::Apis::RemotebuildexecutionV2::GoogleRpcStatus::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2CacheCapabilities
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_cache_update_capabilities, as: 'actionCacheUpdateCapabilities', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionCacheUpdateCapabilities, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionCacheUpdateCapabilities::Representation
      
          property :cache_priority_capabilities, as: 'cachePriorityCapabilities', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2PriorityCapabilities, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2PriorityCapabilities::Representation
      
          collection :digest_function, as: 'digestFunction'
          property :max_batch_total_size_bytes, :numeric_string => true, as: 'maxBatchTotalSizeBytes'
          property :symlink_absolute_path_strategy, as: 'symlinkAbsolutePathStrategy'
        end
      end
      
      class BuildBazelRemoteExecutionV2Command
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :arguments, as: 'arguments'
          collection :environment_variables, as: 'environmentVariables', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2CommandEnvironmentVariable, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2CommandEnvironmentVariable::Representation
      
          collection :output_directories, as: 'outputDirectories'
          collection :output_files, as: 'outputFiles'
          property :platform, as: 'platform', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Platform, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Platform::Representation
      
          property :working_directory, as: 'workingDirectory'
        end
      end
      
      class BuildBazelRemoteExecutionV2CommandEnvironmentVariable
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class BuildBazelRemoteExecutionV2Digest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hash_prop, as: 'hash'
          property :size_bytes, :numeric_string => true, as: 'sizeBytes'
        end
      end
      
      class BuildBazelRemoteExecutionV2Directory
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :directories, as: 'directories', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2DirectoryNode, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2DirectoryNode::Representation
      
          collection :files, as: 'files', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2FileNode, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2FileNode::Representation
      
          collection :symlinks, as: 'symlinks', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2SymlinkNode, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2SymlinkNode::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2DirectoryNode
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :digest, as: 'digest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
          property :name, as: 'name'
        end
      end
      
      class BuildBazelRemoteExecutionV2ExecuteOperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_digest, as: 'actionDigest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
          property :stage, as: 'stage'
          property :stderr_stream_name, as: 'stderrStreamName'
          property :stdout_stream_name, as: 'stdoutStreamName'
        end
      end
      
      class BuildBazelRemoteExecutionV2ExecuteRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_digest, as: 'actionDigest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
          property :execution_policy, as: 'executionPolicy', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ExecutionPolicy, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ExecutionPolicy::Representation
      
          property :results_cache_policy, as: 'resultsCachePolicy', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ResultsCachePolicy, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ResultsCachePolicy::Representation
      
          property :skip_cache_lookup, as: 'skipCacheLookup'
        end
      end
      
      class BuildBazelRemoteExecutionV2ExecuteResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cached_result, as: 'cachedResult'
          property :message, as: 'message'
          property :result, as: 'result', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionResult, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ActionResult::Representation
      
          hash :server_logs, as: 'serverLogs', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2LogFile, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2LogFile::Representation
      
          property :status, as: 'status', class: Google::Apis::RemotebuildexecutionV2::GoogleRpcStatus, decorator: Google::Apis::RemotebuildexecutionV2::GoogleRpcStatus::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2ExecutedActionMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution_completed_timestamp, as: 'executionCompletedTimestamp'
          property :execution_start_timestamp, as: 'executionStartTimestamp'
          property :input_fetch_completed_timestamp, as: 'inputFetchCompletedTimestamp'
          property :input_fetch_start_timestamp, as: 'inputFetchStartTimestamp'
          property :output_upload_completed_timestamp, as: 'outputUploadCompletedTimestamp'
          property :output_upload_start_timestamp, as: 'outputUploadStartTimestamp'
          property :queued_timestamp, as: 'queuedTimestamp'
          property :worker, as: 'worker'
          property :worker_completed_timestamp, as: 'workerCompletedTimestamp'
          property :worker_start_timestamp, as: 'workerStartTimestamp'
        end
      end
      
      class BuildBazelRemoteExecutionV2ExecutionCapabilities
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :digest_function, as: 'digestFunction'
          property :exec_enabled, as: 'execEnabled'
          property :execution_priority_capabilities, as: 'executionPriorityCapabilities', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2PriorityCapabilities, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2PriorityCapabilities::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2ExecutionPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :priority, as: 'priority'
        end
      end
      
      class BuildBazelRemoteExecutionV2FileNode
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :digest, as: 'digest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
          property :is_executable, as: 'isExecutable'
          property :name, as: 'name'
        end
      end
      
      class BuildBazelRemoteExecutionV2FindMissingBlobsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :blob_digests, as: 'blobDigests', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2FindMissingBlobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :missing_blob_digests, as: 'missingBlobDigests', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2GetTreeResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :directories, as: 'directories', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Directory, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Directory::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class BuildBazelRemoteExecutionV2LogFile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :digest, as: 'digest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
          property :human_readable, as: 'humanReadable'
        end
      end
      
      class BuildBazelRemoteExecutionV2OutputDirectory
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :path, as: 'path'
          property :tree_digest, as: 'treeDigest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2OutputFile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contents, :base64 => true, as: 'contents'
          property :digest, as: 'digest', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Digest::Representation
      
          property :is_executable, as: 'isExecutable'
          property :path, as: 'path'
        end
      end
      
      class BuildBazelRemoteExecutionV2OutputSymlink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :path, as: 'path'
          property :target, as: 'target'
        end
      end
      
      class BuildBazelRemoteExecutionV2Platform
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :properties, as: 'properties', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2PlatformProperty, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2PlatformProperty::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2PlatformProperty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class BuildBazelRemoteExecutionV2PriorityCapabilities
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :priorities, as: 'priorities', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2PriorityCapabilitiesPriorityRange, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2PriorityCapabilitiesPriorityRange::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2PriorityCapabilitiesPriorityRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_priority, as: 'maxPriority'
          property :min_priority, as: 'minPriority'
        end
      end
      
      class BuildBazelRemoteExecutionV2RequestMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_id, as: 'actionId'
          property :correlated_invocations_id, as: 'correlatedInvocationsId'
          property :tool_details, as: 'toolDetails', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ToolDetails, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ToolDetails::Representation
      
          property :tool_invocation_id, as: 'toolInvocationId'
        end
      end
      
      class BuildBazelRemoteExecutionV2ResultsCachePolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :priority, as: 'priority'
        end
      end
      
      class BuildBazelRemoteExecutionV2ServerCapabilities
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cache_capabilities, as: 'cacheCapabilities', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2CacheCapabilities, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2CacheCapabilities::Representation
      
          property :deprecated_api_version, as: 'deprecatedApiVersion', class: Google::Apis::RemotebuildexecutionV2::BuildBazelSemverSemVer, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelSemverSemVer::Representation
      
          property :execution_capabilities, as: 'executionCapabilities', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ExecutionCapabilities, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2ExecutionCapabilities::Representation
      
          property :high_api_version, as: 'highApiVersion', class: Google::Apis::RemotebuildexecutionV2::BuildBazelSemverSemVer, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelSemverSemVer::Representation
      
          property :low_api_version, as: 'lowApiVersion', class: Google::Apis::RemotebuildexecutionV2::BuildBazelSemverSemVer, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelSemverSemVer::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2SymlinkNode
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :target, as: 'target'
        end
      end
      
      class BuildBazelRemoteExecutionV2ToolDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :tool_name, as: 'toolName'
          property :tool_version, as: 'toolVersion'
        end
      end
      
      class BuildBazelRemoteExecutionV2Tree
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :children, as: 'children', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Directory, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Directory::Representation
      
          property :root, as: 'root', class: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Directory, decorator: Google::Apis::RemotebuildexecutionV2::BuildBazelRemoteExecutionV2Directory::Representation
      
        end
      end
      
      class BuildBazelRemoteExecutionV2WaitExecutionRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class BuildBazelSemverSemVer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :major, as: 'major'
          property :minor, as: 'minor'
          property :patch, as: 'patch'
          property :prerelease, as: 'prerelease'
        end
      end
      
      class GoogleDevtoolsRemotebuildbotCommandDurations
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :docker_prep, as: 'dockerPrep'
          property :docker_prep_start_time, as: 'dockerPrepStartTime'
          property :download, as: 'download'
          property :download_start_time, as: 'downloadStartTime'
          property :exec_start_time, as: 'execStartTime'
          property :execution, as: 'execution'
          property :iso_prep_done, as: 'isoPrepDone'
          property :overall, as: 'overall'
          property :stdout, as: 'stdout'
          property :upload, as: 'upload'
          property :upload_start_time, as: 'uploadStartTime'
        end
      end
      
      class GoogleDevtoolsRemotebuildbotCommandEvents
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :docker_cache_hit, as: 'dockerCacheHit'
          property :input_cache_miss, as: 'inputCacheMiss'
          property :num_errors, :numeric_string => true, as: 'numErrors'
          property :num_warnings, :numeric_string => true, as: 'numWarnings'
        end
      end
      
      class GoogleDevtoolsRemotebuildbotCommandStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :message, as: 'message'
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaAcceleratorConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :accelerator_count, :numeric_string => true, as: 'acceleratorCount'
          property :accelerator_type, as: 'acceleratorType'
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaCreateInstanceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance, as: 'instance', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaInstance, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaInstance::Representation
      
          property :instance_id, as: 'instanceId'
          property :parent, as: 'parent'
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaCreateWorkerPoolRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :parent, as: 'parent'
          property :pool_id, as: 'poolId'
          property :worker_pool, as: 'workerPool', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerPool, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerPool::Representation
      
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaDeleteInstanceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaDeleteWorkerPoolRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaGetInstanceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaGetWorkerPoolRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaInstance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :location, as: 'location'
          property :logging_enabled, as: 'loggingEnabled'
          property :name, as: 'name'
          property :state, as: 'state'
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaListInstancesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :parent, as: 'parent'
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaListInstancesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :instances, as: 'instances', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaInstance, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaInstance::Representation
      
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaListWorkerPoolsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :filter, as: 'filter'
          property :parent, as: 'parent'
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaListWorkerPoolsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :worker_pools, as: 'workerPools', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerPool, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerPool::Representation
      
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaUpdateWorkerPoolRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :update_mask, as: 'updateMask'
          property :worker_pool, as: 'workerPool', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerPool, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerPool::Representation
      
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :accelerator, as: 'accelerator', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaAcceleratorConfig, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaAcceleratorConfig::Representation
      
          property :disk_size_gb, :numeric_string => true, as: 'diskSizeGb'
          property :disk_type, as: 'diskType'
          hash :labels, as: 'labels'
          property :machine_type, as: 'machineType'
          property :min_cpu_platform, as: 'minCpuPlatform'
          property :network_access, as: 'networkAccess'
          property :reserved, as: 'reserved'
        end
      end
      
      class GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerPool
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :state, as: 'state'
          property :worker_config, as: 'workerConfig', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerConfig, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemotebuildexecutionAdminV1alphaWorkerConfig::Representation
      
          property :worker_count, :numeric_string => true, as: 'workerCount'
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2AdminTemp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :arg, as: 'arg'
          property :command, as: 'command'
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2Blob
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contents, :base64 => true, as: 'contents'
          property :digest, as: 'digest', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Digest, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Digest::Representation
      
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandOutputs
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :exit_code, as: 'exitCode'
          property :outputs, as: 'outputs', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Digest, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Digest::Representation
      
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandOverhead
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :duration, as: 'duration'
          property :overhead, as: 'overhead'
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :duration, as: 'duration'
          property :exit_code, as: 'exitCode'
          collection :metadata, as: 'metadata'
          property :outputs, as: 'outputs', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Digest, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Digest::Representation
      
          property :overhead, as: 'overhead'
          property :status, as: 'status', class: Google::Apis::RemotebuildexecutionV2::GoogleRpcStatus, decorator: Google::Apis::RemotebuildexecutionV2::GoogleRpcStatus::Representation
      
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandTask
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expected_outputs, as: 'expectedOutputs', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2CommandTaskOutputs, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2CommandTaskOutputs::Representation
      
          property :inputs, as: 'inputs', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2CommandTaskInputs, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2CommandTaskInputs::Representation
      
          property :timeouts, as: 'timeouts', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2CommandTaskTimeouts, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2CommandTaskTimeouts::Representation
      
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandTaskInputs
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :arguments, as: 'arguments'
          collection :environment_variables, as: 'environmentVariables', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2CommandTaskInputsEnvironmentVariable, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2CommandTaskInputsEnvironmentVariable::Representation
      
          collection :files, as: 'files', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Digest, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Digest::Representation
      
          collection :inline_blobs, as: 'inlineBlobs', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Blob, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Blob::Representation
      
          property :working_directory, as: 'workingDirectory'
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandTaskInputsEnvironmentVariable
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandTaskOutputs
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :directories, as: 'directories'
          collection :files, as: 'files'
          property :stderr_destination, as: 'stderrDestination'
          property :stdout_destination, as: 'stdoutDestination'
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2CommandTaskTimeouts
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :execution, as: 'execution'
          property :idle, as: 'idle'
          property :shutdown, as: 'shutdown'
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2Digest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hash_prop, as: 'hash'
          property :size_bytes, :numeric_string => true, as: 'sizeBytes'
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2Directory
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :directories, as: 'directories', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2DirectoryMetadata, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2DirectoryMetadata::Representation
      
          collection :files, as: 'files', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2FileMetadata, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2FileMetadata::Representation
      
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2DirectoryMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :digest, as: 'digest', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Digest, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Digest::Representation
      
          property :path, as: 'path'
        end
      end
      
      class GoogleDevtoolsRemoteworkersV1test2FileMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contents, :base64 => true, as: 'contents'
          property :digest, as: 'digest', class: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Digest, decorator: Google::Apis::RemotebuildexecutionV2::GoogleDevtoolsRemoteworkersV1test2Digest::Representation
      
          property :is_executable, as: 'isExecutable'
          property :path, as: 'path'
        end
      end
      
      class GoogleLongrunningOperation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::RemotebuildexecutionV2::GoogleRpcStatus, decorator: Google::Apis::RemotebuildexecutionV2::GoogleRpcStatus::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class GoogleRpcStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
        end
      end
    end
  end
end
