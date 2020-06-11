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
    module CloudassetV1beta1
      # Cloud Asset API
      #
      # The cloud asset API manages the history and inventory of cloud resources.
      #
      # @example
      #    require 'google/apis/cloudasset_v1beta1'
      #
      #    Cloudasset = Google::Apis::CloudassetV1beta1 # Alias the module
      #    service = Cloudasset::CloudAssetService.new
      #
      # @see https://cloud.google.com/resource-manager/docs/cloud-asset-inventory/quickstart-cloud-asset-inventory
      class CloudAssetService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudasset.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Exports assets with time and resource types to a given Cloud Storage
        # location. The output format is newline-delimited JSON.
        # This API implements the google.longrunning.Operation API allowing you
        # to keep track of the export.
        # @param [String] parent
        #   Required. The relative name of the root asset. This can only be an
        #   organization number (such as "organizations/123"), a project ID (such as
        #   "projects/my-project-id"), a project number (such as "projects/12345"), or
        #   a folder number (such as "folders/123").
        # @param [Google::Apis::CloudassetV1beta1::ExportAssetsRequest] export_assets_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudassetV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudassetV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def export_folder_assets(parent, export_assets_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}:exportAssets', options)
          command.request_representation = Google::Apis::CloudassetV1beta1::ExportAssetsRequest::Representation
          command.request_object = export_assets_request_object
          command.response_representation = Google::Apis::CloudassetV1beta1::Operation::Representation
          command.response_class = Google::Apis::CloudassetV1beta1::Operation
          command.params['parent'] = parent unless parent.nil?
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
        # @yieldparam result [Google::Apis::CloudassetV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudassetV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_folder_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::CloudassetV1beta1::Operation::Representation
          command.response_class = Google::Apis::CloudassetV1beta1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Batch gets the update history of assets that overlap a time window.
        # For RESOURCE content, this API outputs history with asset in both
        # non-delete or deleted status.
        # For IAM_POLICY content, this API outputs history when the asset and its
        # attached IAM POLICY both exist. This can create gaps in the output history.
        # If a specified asset does not exist, this API returns an INVALID_ARGUMENT
        # error.
        # @param [String] parent
        #   Required. The relative name of the root asset. It can only be an
        #   organization number (such as "organizations/123"), a project ID (such as
        #   "projects/my-project-id")", or a project number (such as "projects/12345").
        # @param [Array<String>, String] asset_names
        #   A list of the full names of the assets. For example:
        #   `//compute.googleapis.com/projects/my_project_123/zones/zone1/instances/
        #   instance1`.
        #   See [Resource
        #   Names](https://cloud.google.com/apis/design/resource_names#full_resource_name)
        #   for more info.
        #   The request becomes a no-op if the asset name list is empty, and the max
        #   size of the asset name list is 100 in one request.
        # @param [String] content_type
        #   Optional. The content type.
        # @param [String] read_time_window_end_time
        #   End time of the time window (inclusive).
        #   Current timestamp if not specified.
        # @param [String] read_time_window_start_time
        #   Start time of the time window (exclusive).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudassetV1beta1::BatchGetAssetsHistoryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudassetV1beta1::BatchGetAssetsHistoryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_organization_get_assets_history(parent, asset_names: nil, content_type: nil, read_time_window_end_time: nil, read_time_window_start_time: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}:batchGetAssetsHistory', options)
          command.response_representation = Google::Apis::CloudassetV1beta1::BatchGetAssetsHistoryResponse::Representation
          command.response_class = Google::Apis::CloudassetV1beta1::BatchGetAssetsHistoryResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['assetNames'] = asset_names unless asset_names.nil?
          command.query['contentType'] = content_type unless content_type.nil?
          command.query['readTimeWindow.endTime'] = read_time_window_end_time unless read_time_window_end_time.nil?
          command.query['readTimeWindow.startTime'] = read_time_window_start_time unless read_time_window_start_time.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Exports assets with time and resource types to a given Cloud Storage
        # location. The output format is newline-delimited JSON.
        # This API implements the google.longrunning.Operation API allowing you
        # to keep track of the export.
        # @param [String] parent
        #   Required. The relative name of the root asset. This can only be an
        #   organization number (such as "organizations/123"), a project ID (such as
        #   "projects/my-project-id"), a project number (such as "projects/12345"), or
        #   a folder number (such as "folders/123").
        # @param [Google::Apis::CloudassetV1beta1::ExportAssetsRequest] export_assets_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudassetV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudassetV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def export_organization_assets(parent, export_assets_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}:exportAssets', options)
          command.request_representation = Google::Apis::CloudassetV1beta1::ExportAssetsRequest::Representation
          command.request_object = export_assets_request_object
          command.response_representation = Google::Apis::CloudassetV1beta1::Operation::Representation
          command.response_class = Google::Apis::CloudassetV1beta1::Operation
          command.params['parent'] = parent unless parent.nil?
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
        # @yieldparam result [Google::Apis::CloudassetV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudassetV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_organization_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::CloudassetV1beta1::Operation::Representation
          command.response_class = Google::Apis::CloudassetV1beta1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Batch gets the update history of assets that overlap a time window.
        # For RESOURCE content, this API outputs history with asset in both
        # non-delete or deleted status.
        # For IAM_POLICY content, this API outputs history when the asset and its
        # attached IAM POLICY both exist. This can create gaps in the output history.
        # If a specified asset does not exist, this API returns an INVALID_ARGUMENT
        # error.
        # @param [String] parent
        #   Required. The relative name of the root asset. It can only be an
        #   organization number (such as "organizations/123"), a project ID (such as
        #   "projects/my-project-id")", or a project number (such as "projects/12345").
        # @param [Array<String>, String] asset_names
        #   A list of the full names of the assets. For example:
        #   `//compute.googleapis.com/projects/my_project_123/zones/zone1/instances/
        #   instance1`.
        #   See [Resource
        #   Names](https://cloud.google.com/apis/design/resource_names#full_resource_name)
        #   for more info.
        #   The request becomes a no-op if the asset name list is empty, and the max
        #   size of the asset name list is 100 in one request.
        # @param [String] content_type
        #   Optional. The content type.
        # @param [String] read_time_window_end_time
        #   End time of the time window (inclusive).
        #   Current timestamp if not specified.
        # @param [String] read_time_window_start_time
        #   Start time of the time window (exclusive).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudassetV1beta1::BatchGetAssetsHistoryResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudassetV1beta1::BatchGetAssetsHistoryResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_project_get_assets_history(parent, asset_names: nil, content_type: nil, read_time_window_end_time: nil, read_time_window_start_time: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}:batchGetAssetsHistory', options)
          command.response_representation = Google::Apis::CloudassetV1beta1::BatchGetAssetsHistoryResponse::Representation
          command.response_class = Google::Apis::CloudassetV1beta1::BatchGetAssetsHistoryResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['assetNames'] = asset_names unless asset_names.nil?
          command.query['contentType'] = content_type unless content_type.nil?
          command.query['readTimeWindow.endTime'] = read_time_window_end_time unless read_time_window_end_time.nil?
          command.query['readTimeWindow.startTime'] = read_time_window_start_time unless read_time_window_start_time.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Exports assets with time and resource types to a given Cloud Storage
        # location. The output format is newline-delimited JSON.
        # This API implements the google.longrunning.Operation API allowing you
        # to keep track of the export.
        # @param [String] parent
        #   Required. The relative name of the root asset. This can only be an
        #   organization number (such as "organizations/123"), a project ID (such as
        #   "projects/my-project-id"), a project number (such as "projects/12345"), or
        #   a folder number (such as "folders/123").
        # @param [Google::Apis::CloudassetV1beta1::ExportAssetsRequest] export_assets_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudassetV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudassetV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def export_project_assets(parent, export_assets_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}:exportAssets', options)
          command.request_representation = Google::Apis::CloudassetV1beta1::ExportAssetsRequest::Representation
          command.request_object = export_assets_request_object
          command.response_representation = Google::Apis::CloudassetV1beta1::Operation::Representation
          command.response_class = Google::Apis::CloudassetV1beta1::Operation
          command.params['parent'] = parent unless parent.nil?
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
        # @yieldparam result [Google::Apis::CloudassetV1beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudassetV1beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::CloudassetV1beta1::Operation::Representation
          command.response_class = Google::Apis::CloudassetV1beta1::Operation
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
