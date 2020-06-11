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
    module CloudprivatecatalogproducerV1beta1
      # Cloud Private Catalog Producer API
      #
      # Enables cloud users to manage and share enterprise catalogs intheir
      #  organizations.
      #
      # @example
      #    require 'google/apis/cloudprivatecatalogproducer_v1beta1'
      #
      #    Cloudprivatecatalogproducer = Google::Apis::CloudprivatecatalogproducerV1beta1 # Alias the module
      #    service = Cloudprivatecatalogproducer::CloudPrivateCatalogProducerService.new
      #
      # @see https://cloud.google.com/private-catalog/
      class CloudPrivateCatalogProducerService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudprivatecatalogproducer.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Creates a new Catalog resource.
        # @param [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog] google_cloud_privatecatalogproducer_v1beta1_catalog_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_catalog(google_cloud_privatecatalogproducer_v1beta1_catalog_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/catalogs', options)
          command.request_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog::Representation
          command.request_object = google_cloud_privatecatalogproducer_v1beta1_catalog_object
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Soft deletes an existing Catalog and all resources under it.
        # The catalog can only be deleted if there is no associations under it or
        # DeleteCatalogRequest.force is true. The delete operation
        # can be recovered by the PrivateCatalogProducer.UndeleteCatalog
        # method.
        # @param [String] name
        #   The resource name of the catalog.
        # @param [Boolean] force
        #   Forces deletion of the `Catalog` and its `Association` resources.
        #   If the `Catalog` is still associated with other resources and
        #   force is not set to true, then the operation fails.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_catalog(name, force: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog
          command.params['name'] = name unless name.nil?
          command.query['force'] = force unless force.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the requested Catalog resource.
        # @param [String] name
        #   The resource name of the catalog.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_catalog(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets IAM policy for the specified Catalog.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Fixnum] options_requested_policy_version
        #   Optional. The policy format version to be returned.
        #   Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        #   rejected.
        #   Requests for policies with any conditional bindings must specify version 3.
        #   Policies without any conditional bindings may specify any valid value or
        #   leave the field unset.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_catalog_iam_policy(resource, options_requested_policy_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+resource}:getIamPolicy', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1Policy::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['options.requestedPolicyVersion'] = options_requested_policy_version unless options_requested_policy_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists Catalog resources that the producer has access to, within the
        # scope of the parent resource.
        # @param [Fixnum] page_size
        #   The maximum number of catalogs to return.
        # @param [String] page_token
        #   A pagination token returned from a previous call to ListCatalogs
        #   that indicates where this listing should continue from.
        #   This field is optional.
        # @param [String] parent
        #   The resource name of the parent resource.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListCatalogsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListCatalogsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_catalogs(page_size: nil, page_token: nil, parent: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/catalogs', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListCatalogsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListCatalogsResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a specific Catalog resource.
        # @param [String] name
        #   Output only. The resource name of the catalog, in the format
        #   `catalogs/`catalog_id`'.
        #   A unique identifier for the catalog, which is generated
        #   by catalog service.
        # @param [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog] google_cloud_privatecatalogproducer_v1beta1_catalog_object
        # @param [String] update_mask
        #   Field mask that controls which fields of the catalog should be updated.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_catalog(name, google_cloud_privatecatalogproducer_v1beta1_catalog_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog::Representation
          command.request_object = google_cloud_privatecatalogproducer_v1beta1_catalog_object
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the IAM policy for the specified Catalog.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1SetIamPolicyRequest] google_iam_v1_set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_catalog_iam_policy(resource, google_iam_v1_set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1SetIamPolicyRequest::Representation
          command.request_object = google_iam_v1_set_iam_policy_request_object
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1Policy::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Tests the IAM permissions for the specified Catalog.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1TestIamPermissionsRequest] google_iam_v1_test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_catalog_iam_permissions(resource, google_iam_v1_test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1TestIamPermissionsRequest::Representation
          command.request_object = google_iam_v1_test_iam_permissions_request_object
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleIamV1TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Undeletes a deleted Catalog and all resources under it.
        # @param [String] name
        #   The resource name of the catalog.
        # @param [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1UndeleteCatalogRequest] google_cloud_privatecatalogproducer_v1beta1_undelete_catalog_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def undelete_catalog(name, google_cloud_privatecatalogproducer_v1beta1_undelete_catalog_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:undelete', options)
          command.request_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1UndeleteCatalogRequest::Representation
          command.request_object = google_cloud_privatecatalogproducer_v1beta1_undelete_catalog_request_object
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Catalog
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an Association instance under a given Catalog.
        # @param [String] parent
        #   The `Catalog` resource's name.
        # @param [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1CreateAssociationRequest] google_cloud_privatecatalogproducer_v1beta1_create_association_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Association] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Association]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_catalog_association(parent, google_cloud_privatecatalogproducer_v1beta1_create_association_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/associations', options)
          command.request_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1CreateAssociationRequest::Representation
          command.request_object = google_cloud_privatecatalogproducer_v1beta1_create_association_request_object
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Association::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Association
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the given Association.
        # @param [String] name
        #   The resource name of the `Association` to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_catalog_association(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the requested Association resource.
        # @param [String] name
        #   The resource name of the `Association` to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Association] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Association]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_catalog_association(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Association::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Association
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all Association resources under a catalog.
        # @param [String] parent
        #   The resource name of the `Catalog` whose `Associations` are
        #   being retrieved. In the format `catalogs/<catalog>`.
        # @param [Fixnum] page_size
        #   The maximum number of catalog associations to return.
        # @param [String] page_token
        #   A pagination token returned from the previous call to
        #   `ListAssociations`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListAssociationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListAssociationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_catalog_associations(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/associations', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListAssociationsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListAssociationsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Copies a Product under another Catalog.
        # @param [String] name
        #   The resource name of the current product that is copied from.
        # @param [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1CopyProductRequest] google_cloud_privatecatalogproducer_v1beta1_copy_product_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def copy_catalog_product(name, google_cloud_privatecatalogproducer_v1beta1_copy_product_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:copy', options)
          command.request_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1CopyProductRequest::Representation
          command.request_object = google_cloud_privatecatalogproducer_v1beta1_copy_product_request_object
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a Product instance under a given Catalog.
        # @param [String] parent
        #   The catalog name of the new product's parent.
        # @param [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product] google_cloud_privatecatalogproducer_v1beta1_product_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_catalog_product(parent, google_cloud_privatecatalogproducer_v1beta1_product_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/products', options)
          command.request_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product::Representation
          command.request_object = google_cloud_privatecatalogproducer_v1beta1_product_object
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Hard deletes a Product.
        # @param [String] name
        #   The resource name of the product.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_catalog_product(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the requested Product resource.
        # @param [String] name
        #   The resource name of the product.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_catalog_product(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists Product resources that the producer has access to, within the
        # scope of the parent catalog.
        # @param [String] parent
        #   The resource name of the parent resource.
        # @param [String] filter
        #   A filter expression used to restrict the returned results based
        #   upon properties of the product.
        # @param [Fixnum] page_size
        #   The maximum number of products to return.
        # @param [String] page_token
        #   A pagination token returned from a previous call to ListProducts
        #   that indicates where this listing should continue from.
        #   This field is optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListProductsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListProductsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_catalog_products(parent, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/products', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListProductsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListProductsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a specific Product resource.
        # @param [String] name
        #   Required. The resource name of the product in the format
        #   `catalogs/`catalog_id`/products/a-z*[a-z0-9]'.
        #   A unique identifier for the product under a catalog, which cannot
        #   be changed after the product is created. The final
        #   segment of the name must between 1 and 256 characters in length.
        # @param [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product] google_cloud_privatecatalogproducer_v1beta1_product_object
        # @param [String] update_mask
        #   Field mask that controls which fields of the product should be updated.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_catalog_product(name, google_cloud_privatecatalogproducer_v1beta1_product_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product::Representation
          command.request_object = google_cloud_privatecatalogproducer_v1beta1_product_object
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Product
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an Icon instance under a given Product.
        # If Product only has a default icon, a new Icon
        # instance is created and associated with the given Product.
        # If Product already has a non-default icon, the action creates
        # a new Icon instance, associates the newly created
        # Icon with the given Product and deletes the old icon.
        # @param [String] product
        #   The resource name of the product.
        # @param [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1UploadIconRequest] google_cloud_privatecatalogproducer_v1beta1_upload_icon_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def upload_catalog_product_icon(product, google_cloud_privatecatalogproducer_v1beta1_upload_icon_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+product}/icons:upload', options)
          command.request_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1UploadIconRequest::Representation
          command.request_object = google_cloud_privatecatalogproducer_v1beta1_upload_icon_request_object
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty
          command.params['product'] = product unless product.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a Version instance under a given Product.
        # @param [String] parent
        #   The product name of the new version's parent.
        # @param [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version] google_cloud_privatecatalogproducer_v1beta1_version_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_catalog_product_version(parent, google_cloud_privatecatalogproducer_v1beta1_version_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/versions', options)
          command.request_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version::Representation
          command.request_object = google_cloud_privatecatalogproducer_v1beta1_version_object
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Hard deletes a Version.
        # @param [String] name
        #   The resource name of the version.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_catalog_product_version(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the requested Version resource.
        # @param [String] name
        #   The resource name of the version.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_catalog_product_version(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists Version resources that the producer has access to, within the
        # scope of the parent Product.
        # @param [String] parent
        #   The resource name of the parent resource.
        # @param [Fixnum] page_size
        #   The maximum number of versions to return.
        # @param [String] page_token
        #   A pagination token returned from a previous call to ListVersions
        #   that indicates where this listing should continue from.
        #   This field is optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListVersionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListVersionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_catalog_product_versions(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/versions', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListVersionsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1ListVersionsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a specific Version resource.
        # @param [String] name
        #   Required. The resource name of the version, in the format
        #   `catalogs/`catalog_id`/products/`product_id`/versions/a-z*[a-z0-9]'.
        #   A unique identifier for the version under a product, which can't
        #   be changed after the version is created. The final segment of the name must
        #   between 1 and 63 characters in length.
        # @param [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version] google_cloud_privatecatalogproducer_v1beta1_version_object
        # @param [String] update_mask
        #   Field mask that controls which fields of the version should be updated.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_catalog_product_version(name, google_cloud_privatecatalogproducer_v1beta1_version_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version::Representation
          command.request_object = google_cloud_privatecatalogproducer_v1beta1_version_object
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleCloudPrivatecatalogproducerV1beta1Version
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
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
        # @param [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningCancelOperationRequest] google_longrunning_cancel_operation_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_operation(name, google_longrunning_cancel_operation_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+name}:cancel', options)
          command.request_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningCancelOperationRequest::Representation
          command.request_object = google_longrunning_cancel_operation_request_object
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty
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
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleProtobufEmpty
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
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningOperation
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
        # @param [String] filter
        #   The standard list filter.
        # @param [String] name
        #   The name of the operation's parent resource.
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
        # @yieldparam result [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_operations(filter: nil, name: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/operations', options)
          command.response_representation = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningListOperationsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogproducerV1beta1::GoogleLongrunningListOperationsResponse
          command.query['filter'] = filter unless filter.nil?
          command.query['name'] = name unless name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
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
