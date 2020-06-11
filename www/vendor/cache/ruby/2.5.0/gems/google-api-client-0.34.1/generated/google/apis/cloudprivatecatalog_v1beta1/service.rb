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
    module CloudprivatecatalogV1beta1
      # Cloud Private Catalog API
      #
      # Enable cloud users to discover enterprise catalogs and products in their
      #  organizations.
      #
      # @example
      #    require 'google/apis/cloudprivatecatalog_v1beta1'
      #
      #    Cloudprivatecatalog = Google::Apis::CloudprivatecatalogV1beta1 # Alias the module
      #    service = Cloudprivatecatalog::CloudPrivateCatalogService.new
      #
      # @see https://cloud.google.com/private-catalog/
      class CloudPrivateCatalogService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudprivatecatalog.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Search Catalog resources that consumers have access to, within the
        # scope of the consumer cloud resource hierarchy context.
        # @param [String] resource
        #   Required. The name of the resource context. It can be in following formats:
        #   * `projects/`project_id``
        #   * `folders/`folder_id``
        #   * `organizations/`organization_id``
        # @param [Fixnum] page_size
        #   The maximum number of entries that are requested.
        # @param [String] page_token
        #   A pagination token returned from a previous call to SearchCatalogs that
        #   indicates where this listing should continue from.
        #   This field is optional.
        # @param [String] query
        #   The query to filter the catalogs. The supported queries are:
        #   * Get a single catalog: `name=catalogs/`catalog_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_folder_catalogs(resource, page_size: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+resource}/catalogs:search', options)
          command.response_representation = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Search Product resources that consumers have access to, within the
        # scope of the consumer cloud resource hierarchy context.
        # @param [String] resource
        #   Required. The name of the resource context. See
        #   SearchCatalogsRequest.resource for details.
        # @param [Fixnum] page_size
        #   The maximum number of entries that are requested.
        # @param [String] page_token
        #   A pagination token returned from a previous call to SearchProducts that
        #   indicates where this listing should continue from.
        #   This field is optional.
        # @param [String] query
        #   The query to filter the products.
        #   The supported queries are:
        #   * List products of all catalogs: empty
        #   * List products under a catalog: `parent=catalogs/`catalog_id``
        #   * Get a product by name:
        #   `name=catalogs/`catalog_id`/products/`product_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchProductsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchProductsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_folder_products(resource, page_size: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+resource}/products:search', options)
          command.response_representation = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchProductsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchProductsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Search Version resources that consumers have access to, within the
        # scope of the consumer cloud resource hierarchy context.
        # @param [String] resource
        #   Required. The name of the resource context. See
        #   SearchCatalogsRequest.resource for details.
        # @param [Fixnum] page_size
        #   The maximum number of entries that are requested.
        # @param [String] page_token
        #   A pagination token returned from a previous call to SearchVersions
        #   that indicates where this listing should continue from.
        #   This field is optional.
        # @param [String] query
        #   The query to filter the versions. Required.
        #   The supported queries are:
        #   * List versions under a product:
        #   `parent=catalogs/`catalog_id`/products/`product_id``
        #   * Get a version by name:
        #   `name=catalogs/`catalog_id`/products/`product_id`/versions/`version_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_folder_versions(resource, page_size: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+resource}/versions:search', options)
          command.response_representation = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Search Catalog resources that consumers have access to, within the
        # scope of the consumer cloud resource hierarchy context.
        # @param [String] resource
        #   Required. The name of the resource context. It can be in following formats:
        #   * `projects/`project_id``
        #   * `folders/`folder_id``
        #   * `organizations/`organization_id``
        # @param [Fixnum] page_size
        #   The maximum number of entries that are requested.
        # @param [String] page_token
        #   A pagination token returned from a previous call to SearchCatalogs that
        #   indicates where this listing should continue from.
        #   This field is optional.
        # @param [String] query
        #   The query to filter the catalogs. The supported queries are:
        #   * Get a single catalog: `name=catalogs/`catalog_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_organization_catalogs(resource, page_size: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+resource}/catalogs:search', options)
          command.response_representation = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Search Product resources that consumers have access to, within the
        # scope of the consumer cloud resource hierarchy context.
        # @param [String] resource
        #   Required. The name of the resource context. See
        #   SearchCatalogsRequest.resource for details.
        # @param [Fixnum] page_size
        #   The maximum number of entries that are requested.
        # @param [String] page_token
        #   A pagination token returned from a previous call to SearchProducts that
        #   indicates where this listing should continue from.
        #   This field is optional.
        # @param [String] query
        #   The query to filter the products.
        #   The supported queries are:
        #   * List products of all catalogs: empty
        #   * List products under a catalog: `parent=catalogs/`catalog_id``
        #   * Get a product by name:
        #   `name=catalogs/`catalog_id`/products/`product_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchProductsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchProductsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_organization_products(resource, page_size: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+resource}/products:search', options)
          command.response_representation = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchProductsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchProductsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Search Version resources that consumers have access to, within the
        # scope of the consumer cloud resource hierarchy context.
        # @param [String] resource
        #   Required. The name of the resource context. See
        #   SearchCatalogsRequest.resource for details.
        # @param [Fixnum] page_size
        #   The maximum number of entries that are requested.
        # @param [String] page_token
        #   A pagination token returned from a previous call to SearchVersions
        #   that indicates where this listing should continue from.
        #   This field is optional.
        # @param [String] query
        #   The query to filter the versions. Required.
        #   The supported queries are:
        #   * List versions under a product:
        #   `parent=catalogs/`catalog_id`/products/`product_id``
        #   * Get a version by name:
        #   `name=catalogs/`catalog_id`/products/`product_id`/versions/`version_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_organization_versions(resource, page_size: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+resource}/versions:search', options)
          command.response_representation = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Search Catalog resources that consumers have access to, within the
        # scope of the consumer cloud resource hierarchy context.
        # @param [String] resource
        #   Required. The name of the resource context. It can be in following formats:
        #   * `projects/`project_id``
        #   * `folders/`folder_id``
        #   * `organizations/`organization_id``
        # @param [Fixnum] page_size
        #   The maximum number of entries that are requested.
        # @param [String] page_token
        #   A pagination token returned from a previous call to SearchCatalogs that
        #   indicates where this listing should continue from.
        #   This field is optional.
        # @param [String] query
        #   The query to filter the catalogs. The supported queries are:
        #   * Get a single catalog: `name=catalogs/`catalog_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_project_catalogs(resource, page_size: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+resource}/catalogs:search', options)
          command.response_representation = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Search Product resources that consumers have access to, within the
        # scope of the consumer cloud resource hierarchy context.
        # @param [String] resource
        #   Required. The name of the resource context. See
        #   SearchCatalogsRequest.resource for details.
        # @param [Fixnum] page_size
        #   The maximum number of entries that are requested.
        # @param [String] page_token
        #   A pagination token returned from a previous call to SearchProducts that
        #   indicates where this listing should continue from.
        #   This field is optional.
        # @param [String] query
        #   The query to filter the products.
        #   The supported queries are:
        #   * List products of all catalogs: empty
        #   * List products under a catalog: `parent=catalogs/`catalog_id``
        #   * Get a product by name:
        #   `name=catalogs/`catalog_id`/products/`product_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchProductsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchProductsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_project_products(resource, page_size: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+resource}/products:search', options)
          command.response_representation = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchProductsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchProductsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Search Version resources that consumers have access to, within the
        # scope of the consumer cloud resource hierarchy context.
        # @param [String] resource
        #   Required. The name of the resource context. See
        #   SearchCatalogsRequest.resource for details.
        # @param [Fixnum] page_size
        #   The maximum number of entries that are requested.
        # @param [String] page_token
        #   A pagination token returned from a previous call to SearchVersions
        #   that indicates where this listing should continue from.
        #   This field is optional.
        # @param [String] query
        #   The query to filter the versions. Required.
        #   The supported queries are:
        #   * List versions under a product:
        #   `parent=catalogs/`catalog_id`/products/`product_id``
        #   * Get a version by name:
        #   `name=catalogs/`catalog_id`/products/`product_id`/versions/`version_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_project_versions(resource, page_size: nil, page_token: nil, query: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+resource}/versions:search', options)
          command.response_representation = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse::Representation
          command.response_class = Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['query'] = query unless query.nil?
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
