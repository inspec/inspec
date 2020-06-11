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
    module VisionV1
      # Cloud Vision API
      #
      # Integrates Google Vision features, including image labeling, face, logo, and
      #  landmark detection, optical character recognition (OCR), and detection of
      #  explicit content, into applications.
      #
      # @example
      #    require 'google/apis/vision_v1'
      #
      #    Vision = Google::Apis::VisionV1 # Alias the module
      #    service = Vision::VisionService.new
      #
      # @see https://cloud.google.com/vision/
      class VisionService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://vision.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Service that performs image detection and annotation for a batch of files.
        # Now only "application/pdf", "image/tiff" and "image/gif" are supported.
        # This service will extract at most 5 (customers can specify which 5 in
        # AnnotateFileRequest.pages) frames (gif) or pages (pdf or tiff) from each
        # file provided and perform detection and annotation for each image
        # extracted.
        # @param [Google::Apis::VisionV1::BatchAnnotateFilesRequest] batch_annotate_files_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::BatchAnnotateFilesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::BatchAnnotateFilesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def annotate_file(batch_annotate_files_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/files:annotate', options)
          command.request_representation = Google::Apis::VisionV1::BatchAnnotateFilesRequest::Representation
          command.request_object = batch_annotate_files_request_object
          command.response_representation = Google::Apis::VisionV1::BatchAnnotateFilesResponse::Representation
          command.response_class = Google::Apis::VisionV1::BatchAnnotateFilesResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Run asynchronous image detection and annotation for a list of generic
        # files, such as PDF files, which may contain multiple pages and multiple
        # images per page. Progress and results can be retrieved through the
        # `google.longrunning.Operations` interface.
        # `Operation.metadata` contains `OperationMetadata` (metadata).
        # `Operation.response` contains `AsyncBatchAnnotateFilesResponse` (results).
        # @param [Google::Apis::VisionV1::AsyncBatchAnnotateFilesRequest] async_batch_annotate_files_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def async_batch_annotate_files(async_batch_annotate_files_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/files:asyncBatchAnnotate', options)
          command.request_representation = Google::Apis::VisionV1::AsyncBatchAnnotateFilesRequest::Representation
          command.request_object = async_batch_annotate_files_request_object
          command.response_representation = Google::Apis::VisionV1::Operation::Representation
          command.response_class = Google::Apis::VisionV1::Operation
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Run image detection and annotation for a batch of images.
        # @param [Google::Apis::VisionV1::BatchAnnotateImagesRequest] batch_annotate_images_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::BatchAnnotateImagesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::BatchAnnotateImagesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def annotate_image(batch_annotate_images_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/images:annotate', options)
          command.request_representation = Google::Apis::VisionV1::BatchAnnotateImagesRequest::Representation
          command.request_object = batch_annotate_images_request_object
          command.response_representation = Google::Apis::VisionV1::BatchAnnotateImagesResponse::Representation
          command.response_class = Google::Apis::VisionV1::BatchAnnotateImagesResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Run asynchronous image detection and annotation for a list of images.
        # Progress and results can be retrieved through the
        # `google.longrunning.Operations` interface.
        # `Operation.metadata` contains `OperationMetadata` (metadata).
        # `Operation.response` contains `AsyncBatchAnnotateImagesResponse` (results).
        # This service will write image annotation outputs to json files in customer
        # GCS bucket, each json file containing BatchAnnotateImagesResponse proto.
        # @param [Google::Apis::VisionV1::AsyncBatchAnnotateImagesRequest] async_batch_annotate_images_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def async_batch_annotate_images(async_batch_annotate_images_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/images:asyncBatchAnnotate', options)
          command.request_representation = Google::Apis::VisionV1::AsyncBatchAnnotateImagesRequest::Representation
          command.request_object = async_batch_annotate_images_request_object
          command.response_representation = Google::Apis::VisionV1::Operation::Representation
          command.response_class = Google::Apis::VisionV1::Operation
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
        # @yieldparam result [Google::Apis::VisionV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_location_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::VisionV1::Operation::Representation
          command.response_class = Google::Apis::VisionV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
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
        # @param [Google::Apis::VisionV1::CancelOperationRequest] cancel_operation_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_operation(name, cancel_operation_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:cancel', options)
          command.request_representation = Google::Apis::VisionV1::CancelOperationRequest::Representation
          command.request_object = cancel_operation_request_object
          command.response_representation = Google::Apis::VisionV1::Empty::Representation
          command.response_class = Google::Apis::VisionV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a long-running operation. This method indicates that the client is
        # no longer interested in the operation result. It does not cancel the
        # operation. If the server doesn't support this method, it returns
        # `google.rpc.Code.UNIMPLEMENTED`.
        # @param [String] name
        #   The name of the operation resource to be deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::VisionV1::Empty::Representation
          command.response_class = Google::Apis::VisionV1::Empty
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
        # @yieldparam result [Google::Apis::VisionV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::VisionV1::Operation::Representation
          command.response_class = Google::Apis::VisionV1::Operation
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
        # @yieldparam result [Google::Apis::VisionV1::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_operations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::VisionV1::ListOperationsResponse::Representation
          command.response_class = Google::Apis::VisionV1::ListOperationsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Service that performs image detection and annotation for a batch of files.
        # Now only "application/pdf", "image/tiff" and "image/gif" are supported.
        # This service will extract at most 5 (customers can specify which 5 in
        # AnnotateFileRequest.pages) frames (gif) or pages (pdf or tiff) from each
        # file provided and perform detection and annotation for each image
        # extracted.
        # @param [String] parent
        #   Optional. Target project and location to make a call.
        #   Format: `projects/`project-id`/locations/`location-id``.
        #   If no parent is specified, a region will be chosen automatically.
        #   Supported location-ids:
        #   `us`: USA country only,
        #   `asia`: East asia areas, like Japan, Taiwan,
        #   `eu`: The European Union.
        #   Example: `projects/project-A/locations/eu`.
        # @param [Google::Apis::VisionV1::BatchAnnotateFilesRequest] batch_annotate_files_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::BatchAnnotateFilesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::BatchAnnotateFilesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def annotate_project_file(parent, batch_annotate_files_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/files:annotate', options)
          command.request_representation = Google::Apis::VisionV1::BatchAnnotateFilesRequest::Representation
          command.request_object = batch_annotate_files_request_object
          command.response_representation = Google::Apis::VisionV1::BatchAnnotateFilesResponse::Representation
          command.response_class = Google::Apis::VisionV1::BatchAnnotateFilesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Run asynchronous image detection and annotation for a list of generic
        # files, such as PDF files, which may contain multiple pages and multiple
        # images per page. Progress and results can be retrieved through the
        # `google.longrunning.Operations` interface.
        # `Operation.metadata` contains `OperationMetadata` (metadata).
        # `Operation.response` contains `AsyncBatchAnnotateFilesResponse` (results).
        # @param [String] parent
        #   Optional. Target project and location to make a call.
        #   Format: `projects/`project-id`/locations/`location-id``.
        #   If no parent is specified, a region will be chosen automatically.
        #   Supported location-ids:
        #   `us`: USA country only,
        #   `asia`: East asia areas, like Japan, Taiwan,
        #   `eu`: The European Union.
        #   Example: `projects/project-A/locations/eu`.
        # @param [Google::Apis::VisionV1::AsyncBatchAnnotateFilesRequest] async_batch_annotate_files_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def async_project_file_batch_annotate(parent, async_batch_annotate_files_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/files:asyncBatchAnnotate', options)
          command.request_representation = Google::Apis::VisionV1::AsyncBatchAnnotateFilesRequest::Representation
          command.request_object = async_batch_annotate_files_request_object
          command.response_representation = Google::Apis::VisionV1::Operation::Representation
          command.response_class = Google::Apis::VisionV1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Run image detection and annotation for a batch of images.
        # @param [String] parent
        #   Optional. Target project and location to make a call.
        #   Format: `projects/`project-id`/locations/`location-id``.
        #   If no parent is specified, a region will be chosen automatically.
        #   Supported location-ids:
        #   `us`: USA country only,
        #   `asia`: East asia areas, like Japan, Taiwan,
        #   `eu`: The European Union.
        #   Example: `projects/project-A/locations/eu`.
        # @param [Google::Apis::VisionV1::BatchAnnotateImagesRequest] batch_annotate_images_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::BatchAnnotateImagesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::BatchAnnotateImagesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def annotate_project_image(parent, batch_annotate_images_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/images:annotate', options)
          command.request_representation = Google::Apis::VisionV1::BatchAnnotateImagesRequest::Representation
          command.request_object = batch_annotate_images_request_object
          command.response_representation = Google::Apis::VisionV1::BatchAnnotateImagesResponse::Representation
          command.response_class = Google::Apis::VisionV1::BatchAnnotateImagesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Run asynchronous image detection and annotation for a list of images.
        # Progress and results can be retrieved through the
        # `google.longrunning.Operations` interface.
        # `Operation.metadata` contains `OperationMetadata` (metadata).
        # `Operation.response` contains `AsyncBatchAnnotateImagesResponse` (results).
        # This service will write image annotation outputs to json files in customer
        # GCS bucket, each json file containing BatchAnnotateImagesResponse proto.
        # @param [String] parent
        #   Optional. Target project and location to make a call.
        #   Format: `projects/`project-id`/locations/`location-id``.
        #   If no parent is specified, a region will be chosen automatically.
        #   Supported location-ids:
        #   `us`: USA country only,
        #   `asia`: East asia areas, like Japan, Taiwan,
        #   `eu`: The European Union.
        #   Example: `projects/project-A/locations/eu`.
        # @param [Google::Apis::VisionV1::AsyncBatchAnnotateImagesRequest] async_batch_annotate_images_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def async_project_image_batch_annotate(parent, async_batch_annotate_images_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/images:asyncBatchAnnotate', options)
          command.request_representation = Google::Apis::VisionV1::AsyncBatchAnnotateImagesRequest::Representation
          command.request_object = async_batch_annotate_images_request_object
          command.response_representation = Google::Apis::VisionV1::Operation::Representation
          command.response_class = Google::Apis::VisionV1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Service that performs image detection and annotation for a batch of files.
        # Now only "application/pdf", "image/tiff" and "image/gif" are supported.
        # This service will extract at most 5 (customers can specify which 5 in
        # AnnotateFileRequest.pages) frames (gif) or pages (pdf or tiff) from each
        # file provided and perform detection and annotation for each image
        # extracted.
        # @param [String] parent
        #   Optional. Target project and location to make a call.
        #   Format: `projects/`project-id`/locations/`location-id``.
        #   If no parent is specified, a region will be chosen automatically.
        #   Supported location-ids:
        #   `us`: USA country only,
        #   `asia`: East asia areas, like Japan, Taiwan,
        #   `eu`: The European Union.
        #   Example: `projects/project-A/locations/eu`.
        # @param [Google::Apis::VisionV1::BatchAnnotateFilesRequest] batch_annotate_files_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::BatchAnnotateFilesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::BatchAnnotateFilesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def annotate_project_location_file(parent, batch_annotate_files_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/files:annotate', options)
          command.request_representation = Google::Apis::VisionV1::BatchAnnotateFilesRequest::Representation
          command.request_object = batch_annotate_files_request_object
          command.response_representation = Google::Apis::VisionV1::BatchAnnotateFilesResponse::Representation
          command.response_class = Google::Apis::VisionV1::BatchAnnotateFilesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Run asynchronous image detection and annotation for a list of generic
        # files, such as PDF files, which may contain multiple pages and multiple
        # images per page. Progress and results can be retrieved through the
        # `google.longrunning.Operations` interface.
        # `Operation.metadata` contains `OperationMetadata` (metadata).
        # `Operation.response` contains `AsyncBatchAnnotateFilesResponse` (results).
        # @param [String] parent
        #   Optional. Target project and location to make a call.
        #   Format: `projects/`project-id`/locations/`location-id``.
        #   If no parent is specified, a region will be chosen automatically.
        #   Supported location-ids:
        #   `us`: USA country only,
        #   `asia`: East asia areas, like Japan, Taiwan,
        #   `eu`: The European Union.
        #   Example: `projects/project-A/locations/eu`.
        # @param [Google::Apis::VisionV1::AsyncBatchAnnotateFilesRequest] async_batch_annotate_files_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def async_project_location_file_batch_annotate(parent, async_batch_annotate_files_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/files:asyncBatchAnnotate', options)
          command.request_representation = Google::Apis::VisionV1::AsyncBatchAnnotateFilesRequest::Representation
          command.request_object = async_batch_annotate_files_request_object
          command.response_representation = Google::Apis::VisionV1::Operation::Representation
          command.response_class = Google::Apis::VisionV1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Run image detection and annotation for a batch of images.
        # @param [String] parent
        #   Optional. Target project and location to make a call.
        #   Format: `projects/`project-id`/locations/`location-id``.
        #   If no parent is specified, a region will be chosen automatically.
        #   Supported location-ids:
        #   `us`: USA country only,
        #   `asia`: East asia areas, like Japan, Taiwan,
        #   `eu`: The European Union.
        #   Example: `projects/project-A/locations/eu`.
        # @param [Google::Apis::VisionV1::BatchAnnotateImagesRequest] batch_annotate_images_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::BatchAnnotateImagesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::BatchAnnotateImagesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def annotate_project_location_image(parent, batch_annotate_images_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/images:annotate', options)
          command.request_representation = Google::Apis::VisionV1::BatchAnnotateImagesRequest::Representation
          command.request_object = batch_annotate_images_request_object
          command.response_representation = Google::Apis::VisionV1::BatchAnnotateImagesResponse::Representation
          command.response_class = Google::Apis::VisionV1::BatchAnnotateImagesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Run asynchronous image detection and annotation for a list of images.
        # Progress and results can be retrieved through the
        # `google.longrunning.Operations` interface.
        # `Operation.metadata` contains `OperationMetadata` (metadata).
        # `Operation.response` contains `AsyncBatchAnnotateImagesResponse` (results).
        # This service will write image annotation outputs to json files in customer
        # GCS bucket, each json file containing BatchAnnotateImagesResponse proto.
        # @param [String] parent
        #   Optional. Target project and location to make a call.
        #   Format: `projects/`project-id`/locations/`location-id``.
        #   If no parent is specified, a region will be chosen automatically.
        #   Supported location-ids:
        #   `us`: USA country only,
        #   `asia`: East asia areas, like Japan, Taiwan,
        #   `eu`: The European Union.
        #   Example: `projects/project-A/locations/eu`.
        # @param [Google::Apis::VisionV1::AsyncBatchAnnotateImagesRequest] async_batch_annotate_images_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def async_project_location_image_batch_annotate(parent, async_batch_annotate_images_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/images:asyncBatchAnnotate', options)
          command.request_representation = Google::Apis::VisionV1::AsyncBatchAnnotateImagesRequest::Representation
          command.request_object = async_batch_annotate_images_request_object
          command.response_representation = Google::Apis::VisionV1::Operation::Representation
          command.response_class = Google::Apis::VisionV1::Operation
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
        # @yieldparam result [Google::Apis::VisionV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::VisionV1::Operation::Representation
          command.response_class = Google::Apis::VisionV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a Product to the specified ProductSet. If the Product is already
        # present, no change is made.
        # One Product can be added to at most 100 ProductSets.
        # Possible errors:
        # * Returns NOT_FOUND if the Product or the ProductSet doesn't exist.
        # @param [String] name
        #   Required. The resource name for the ProductSet to modify.
        #   Format is:
        #   `projects/PROJECT_ID/locations/LOC_ID/productSets/PRODUCT_SET_ID`
        # @param [Google::Apis::VisionV1::AddProductToProductSetRequest] add_product_to_product_set_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def add_product_to_product_set(name, add_product_to_product_set_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:addProduct', options)
          command.request_representation = Google::Apis::VisionV1::AddProductToProductSetRequest::Representation
          command.request_object = add_product_to_product_set_request_object
          command.response_representation = Google::Apis::VisionV1::Empty::Representation
          command.response_class = Google::Apis::VisionV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates and returns a new ProductSet resource.
        # Possible errors:
        # * Returns INVALID_ARGUMENT if display_name is missing, or is longer than
        # 4096 characters.
        # @param [String] parent
        #   Required. The project in which the ProductSet should be created.
        #   Format is `projects/PROJECT_ID/locations/LOC_ID`.
        # @param [Google::Apis::VisionV1::ProductSet] product_set_object
        # @param [String] product_set_id
        #   A user-supplied resource id for this ProductSet. If set, the server will
        #   attempt to use this value as the resource id. If it is already in use, an
        #   error is returned with code ALREADY_EXISTS. Must be at most 128 characters
        #   long. It cannot contain the character `/`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::ProductSet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::ProductSet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_product_set(parent, product_set_object = nil, product_set_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/productSets', options)
          command.request_representation = Google::Apis::VisionV1::ProductSet::Representation
          command.request_object = product_set_object
          command.response_representation = Google::Apis::VisionV1::ProductSet::Representation
          command.response_class = Google::Apis::VisionV1::ProductSet
          command.params['parent'] = parent unless parent.nil?
          command.query['productSetId'] = product_set_id unless product_set_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Permanently deletes a ProductSet. Products and ReferenceImages in the
        # ProductSet are not deleted.
        # The actual image files are not deleted from Google Cloud Storage.
        # @param [String] name
        #   Required. Resource name of the ProductSet to delete.
        #   Format is:
        #   `projects/PROJECT_ID/locations/LOC_ID/productSets/PRODUCT_SET_ID`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_product_set(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::VisionV1::Empty::Representation
          command.response_class = Google::Apis::VisionV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information associated with a ProductSet.
        # Possible errors:
        # * Returns NOT_FOUND if the ProductSet does not exist.
        # @param [String] name
        #   Required. Resource name of the ProductSet to get.
        #   Format is:
        #   `projects/PROJECT_ID/locations/LOG_ID/productSets/PRODUCT_SET_ID`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::ProductSet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::ProductSet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_product_set(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::VisionV1::ProductSet::Representation
          command.response_class = Google::Apis::VisionV1::ProductSet
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Asynchronous API that imports a list of reference images to specified
        # product sets based on a list of image information.
        # The google.longrunning.Operation API can be used to keep track of the
        # progress and results of the request.
        # `Operation.metadata` contains `BatchOperationMetadata`. (progress)
        # `Operation.response` contains `ImportProductSetsResponse`. (results)
        # The input source of this method is a csv file on Google Cloud Storage.
        # For the format of the csv file please see
        # ImportProductSetsGcsSource.csv_file_uri.
        # @param [String] parent
        #   Required. The project in which the ProductSets should be imported.
        #   Format is `projects/PROJECT_ID/locations/LOC_ID`.
        # @param [Google::Apis::VisionV1::ImportProductSetsRequest] import_product_sets_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def import_product_sets(parent, import_product_sets_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/productSets:import', options)
          command.request_representation = Google::Apis::VisionV1::ImportProductSetsRequest::Representation
          command.request_object = import_product_sets_request_object
          command.response_representation = Google::Apis::VisionV1::Operation::Representation
          command.response_class = Google::Apis::VisionV1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists ProductSets in an unspecified order.
        # Possible errors:
        # * Returns INVALID_ARGUMENT if page_size is greater than 100, or less
        # than 1.
        # @param [String] parent
        #   Required. The project from which ProductSets should be listed.
        #   Format is `projects/PROJECT_ID/locations/LOC_ID`.
        # @param [Fixnum] page_size
        #   The maximum number of items to return. Default 10, maximum 100.
        # @param [String] page_token
        #   The next_page_token returned from a previous List request, if any.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::ListProductSetsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::ListProductSetsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_product_sets(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/productSets', options)
          command.response_representation = Google::Apis::VisionV1::ListProductSetsResponse::Representation
          command.response_class = Google::Apis::VisionV1::ListProductSetsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Makes changes to a ProductSet resource.
        # Only display_name can be updated currently.
        # Possible errors:
        # * Returns NOT_FOUND if the ProductSet does not exist.
        # * Returns INVALID_ARGUMENT if display_name is present in update_mask but
        # missing from the request or longer than 4096 characters.
        # @param [String] name
        #   The resource name of the ProductSet.
        #   Format is:
        #   `projects/PROJECT_ID/locations/LOC_ID/productSets/PRODUCT_SET_ID`.
        #   This field is ignored when creating a ProductSet.
        # @param [Google::Apis::VisionV1::ProductSet] product_set_object
        # @param [String] update_mask
        #   The FieldMask that specifies which fields to
        #   update.
        #   If update_mask isn't specified, all mutable fields are to be updated.
        #   Valid mask path is `display_name`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::ProductSet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::ProductSet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_location_product_set(name, product_set_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::VisionV1::ProductSet::Representation
          command.request_object = product_set_object
          command.response_representation = Google::Apis::VisionV1::ProductSet::Representation
          command.response_class = Google::Apis::VisionV1::ProductSet
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes a Product from the specified ProductSet.
        # @param [String] name
        #   Required. The resource name for the ProductSet to modify.
        #   Format is:
        #   `projects/PROJECT_ID/locations/LOC_ID/productSets/PRODUCT_SET_ID`
        # @param [Google::Apis::VisionV1::RemoveProductFromProductSetRequest] remove_product_from_product_set_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def remove_product_from_product_set(name, remove_product_from_product_set_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:removeProduct', options)
          command.request_representation = Google::Apis::VisionV1::RemoveProductFromProductSetRequest::Representation
          command.request_object = remove_product_from_product_set_request_object
          command.response_representation = Google::Apis::VisionV1::Empty::Representation
          command.response_class = Google::Apis::VisionV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the Products in a ProductSet, in an unspecified order. If the
        # ProductSet does not exist, the products field of the response will be
        # empty.
        # Possible errors:
        # * Returns INVALID_ARGUMENT if page_size is greater than 100 or less than 1.
        # @param [String] name
        #   Required. The ProductSet resource for which to retrieve Products.
        #   Format is:
        #   `projects/PROJECT_ID/locations/LOC_ID/productSets/PRODUCT_SET_ID`
        # @param [Fixnum] page_size
        #   The maximum number of items to return. Default 10, maximum 100.
        # @param [String] page_token
        #   The next_page_token returned from a previous List request, if any.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::ListProductsInProductSetResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::ListProductsInProductSetResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_product_set_products(name, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/products', options)
          command.response_representation = Google::Apis::VisionV1::ListProductsInProductSetResponse::Representation
          command.response_class = Google::Apis::VisionV1::ListProductsInProductSetResponse
          command.params['name'] = name unless name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates and returns a new product resource.
        # Possible errors:
        # * Returns INVALID_ARGUMENT if display_name is missing or longer than 4096
        # characters.
        # * Returns INVALID_ARGUMENT if description is longer than 4096 characters.
        # * Returns INVALID_ARGUMENT if product_category is missing or invalid.
        # @param [String] parent
        #   Required. The project in which the Product should be created.
        #   Format is
        #   `projects/PROJECT_ID/locations/LOC_ID`.
        # @param [Google::Apis::VisionV1::Product] product_object
        # @param [String] product_id
        #   A user-supplied resource id for this Product. If set, the server will
        #   attempt to use this value as the resource id. If it is already in use, an
        #   error is returned with code ALREADY_EXISTS. Must be at most 128 characters
        #   long. It cannot contain the character `/`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Product] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Product]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_product(parent, product_object = nil, product_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/products', options)
          command.request_representation = Google::Apis::VisionV1::Product::Representation
          command.request_object = product_object
          command.response_representation = Google::Apis::VisionV1::Product::Representation
          command.response_class = Google::Apis::VisionV1::Product
          command.params['parent'] = parent unless parent.nil?
          command.query['productId'] = product_id unless product_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Permanently deletes a product and its reference images.
        # Metadata of the product and all its images will be deleted right away, but
        # search queries against ProductSets containing the product may still work
        # until all related caches are refreshed.
        # @param [String] name
        #   Required. Resource name of product to delete.
        #   Format is:
        #   `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_product(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::VisionV1::Empty::Representation
          command.response_class = Google::Apis::VisionV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information associated with a Product.
        # Possible errors:
        # * Returns NOT_FOUND if the Product does not exist.
        # @param [String] name
        #   Required. Resource name of the Product to get.
        #   Format is:
        #   `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Product] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Product]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_product(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::VisionV1::Product::Representation
          command.response_class = Google::Apis::VisionV1::Product
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists products in an unspecified order.
        # Possible errors:
        # * Returns INVALID_ARGUMENT if page_size is greater than 100 or less than 1.
        # @param [String] parent
        #   Required. The project OR ProductSet from which Products should be listed.
        #   Format:
        #   `projects/PROJECT_ID/locations/LOC_ID`
        # @param [Fixnum] page_size
        #   The maximum number of items to return. Default 10, maximum 100.
        # @param [String] page_token
        #   The next_page_token returned from a previous List request, if any.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::ListProductsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::ListProductsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_products(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/products', options)
          command.response_representation = Google::Apis::VisionV1::ListProductsResponse::Representation
          command.response_class = Google::Apis::VisionV1::ListProductsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Makes changes to a Product resource.
        # Only the `display_name`, `description`, and `labels` fields can be updated
        # right now.
        # If labels are updated, the change will not be reflected in queries until
        # the next index time.
        # Possible errors:
        # * Returns NOT_FOUND if the Product does not exist.
        # * Returns INVALID_ARGUMENT if display_name is present in update_mask but is
        # missing from the request or longer than 4096 characters.
        # * Returns INVALID_ARGUMENT if description is present in update_mask but is
        # longer than 4096 characters.
        # * Returns INVALID_ARGUMENT if product_category is present in update_mask.
        # @param [String] name
        #   The resource name of the product.
        #   Format is:
        #   `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`.
        #   This field is ignored when creating a product.
        # @param [Google::Apis::VisionV1::Product] product_object
        # @param [String] update_mask
        #   The FieldMask that specifies which fields
        #   to update.
        #   If update_mask isn't specified, all mutable fields are to be updated.
        #   Valid mask paths include `product_labels`, `display_name`, and
        #   `description`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Product] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Product]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_location_product(name, product_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::VisionV1::Product::Representation
          command.request_object = product_object
          command.response_representation = Google::Apis::VisionV1::Product::Representation
          command.response_class = Google::Apis::VisionV1::Product
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Asynchronous API to delete all Products in a ProductSet or all Products
        # that are in no ProductSet.
        # If a Product is a member of the specified ProductSet in addition to other
        # ProductSets, the Product will still be deleted.
        # It is recommended to not delete the specified ProductSet until after this
        # operation has completed. It is also recommended to not add any of the
        # Products involved in the batch delete to a new ProductSet while this
        # operation is running because those Products may still end up deleted.
        # It's not possible to undo the PurgeProducts operation. Therefore, it is
        # recommended to keep the csv files used in ImportProductSets (if that was
        # how you originally built the Product Set) before starting PurgeProducts, in
        # case you need to re-import the data after deletion.
        # If the plan is to purge all of the Products from a ProductSet and then
        # re-use the empty ProductSet to re-import new Products into the empty
        # ProductSet, you must wait until the PurgeProducts operation has finished
        # for that ProductSet.
        # The google.longrunning.Operation API can be used to keep track of the
        # progress and results of the request.
        # `Operation.metadata` contains `BatchOperationMetadata`. (progress)
        # @param [String] parent
        #   Required. The project and location in which the Products should be deleted.
        #   Format is `projects/PROJECT_ID/locations/LOC_ID`.
        # @param [Google::Apis::VisionV1::PurgeProductsRequest] purge_products_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def purge_products(parent, purge_products_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/products:purge', options)
          command.request_representation = Google::Apis::VisionV1::PurgeProductsRequest::Representation
          command.request_object = purge_products_request_object
          command.response_representation = Google::Apis::VisionV1::Operation::Representation
          command.response_class = Google::Apis::VisionV1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates and returns a new ReferenceImage resource.
        # The `bounding_poly` field is optional. If `bounding_poly` is not specified,
        # the system will try to detect regions of interest in the image that are
        # compatible with the product_category on the parent product. If it is
        # specified, detection is ALWAYS skipped. The system converts polygons into
        # non-rotated rectangles.
        # Note that the pipeline will resize the image if the image resolution is too
        # large to process (above 50MP).
        # Possible errors:
        # * Returns INVALID_ARGUMENT if the image_uri is missing or longer than 4096
        # characters.
        # * Returns INVALID_ARGUMENT if the product does not exist.
        # * Returns INVALID_ARGUMENT if bounding_poly is not provided, and nothing
        # compatible with the parent product's product_category is detected.
        # * Returns INVALID_ARGUMENT if bounding_poly contains more than 10 polygons.
        # @param [String] parent
        #   Required. Resource name of the product in which to create the reference image.
        #   Format is
        #   `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`.
        # @param [Google::Apis::VisionV1::ReferenceImage] reference_image_object
        # @param [String] reference_image_id
        #   A user-supplied resource id for the ReferenceImage to be added. If set,
        #   the server will attempt to use this value as the resource id. If it is
        #   already in use, an error is returned with code ALREADY_EXISTS. Must be at
        #   most 128 characters long. It cannot contain the character `/`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::ReferenceImage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::ReferenceImage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_product_reference_image(parent, reference_image_object = nil, reference_image_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/referenceImages', options)
          command.request_representation = Google::Apis::VisionV1::ReferenceImage::Representation
          command.request_object = reference_image_object
          command.response_representation = Google::Apis::VisionV1::ReferenceImage::Representation
          command.response_class = Google::Apis::VisionV1::ReferenceImage
          command.params['parent'] = parent unless parent.nil?
          command.query['referenceImageId'] = reference_image_id unless reference_image_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Permanently deletes a reference image.
        # The image metadata will be deleted right away, but search queries
        # against ProductSets containing the image may still work until all related
        # caches are refreshed.
        # The actual image files are not deleted from Google Cloud Storage.
        # @param [String] name
        #   Required. The resource name of the reference image to delete.
        #   Format is:
        #   `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID/referenceImages/
        #   IMAGE_ID`
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_product_reference_image(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::VisionV1::Empty::Representation
          command.response_class = Google::Apis::VisionV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information associated with a ReferenceImage.
        # Possible errors:
        # * Returns NOT_FOUND if the specified image does not exist.
        # @param [String] name
        #   Required. The resource name of the ReferenceImage to get.
        #   Format is:
        #   `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID/referenceImages/
        #   IMAGE_ID`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::ReferenceImage] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::ReferenceImage]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_product_reference_image(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::VisionV1::ReferenceImage::Representation
          command.response_class = Google::Apis::VisionV1::ReferenceImage
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists reference images.
        # Possible errors:
        # * Returns NOT_FOUND if the parent product does not exist.
        # * Returns INVALID_ARGUMENT if the page_size is greater than 100, or less
        # than 1.
        # @param [String] parent
        #   Required. Resource name of the product containing the reference images.
        #   Format is
        #   `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`.
        # @param [Fixnum] page_size
        #   The maximum number of items to return. Default 10, maximum 100.
        # @param [String] page_token
        #   A token identifying a page of results to be returned. This is the value
        #   of `nextPageToken` returned in a previous reference image list request.
        #   Defaults to the first page if not specified.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::VisionV1::ListReferenceImagesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::ListReferenceImagesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_product_reference_images(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/referenceImages', options)
          command.response_representation = Google::Apis::VisionV1::ListReferenceImagesResponse::Representation
          command.response_class = Google::Apis::VisionV1::ListReferenceImagesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
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
        # @yieldparam result [Google::Apis::VisionV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::VisionV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::VisionV1::Operation::Representation
          command.response_class = Google::Apis::VisionV1::Operation
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
