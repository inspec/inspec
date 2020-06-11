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
    module CloudsearchV1
      # Cloud Search API
      #
      # Cloud Search provides cloud-based search capabilities over G Suite data.  The
      #  Cloud Search API allows indexing of non-G Suite data into Cloud Search.
      #
      # @example
      #    require 'google/apis/cloudsearch_v1'
      #
      #    Cloudsearch = Google::Apis::CloudsearchV1 # Alias the module
      #    service = Cloudsearch::CloudSearchService.new
      #
      # @see https://developers.google.com/cloud-search/docs/guides/
      class CloudSearchService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://cloudsearch.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Checks whether an item is accessible by specified principal.
        # @param [String] name
        #   Item name, format:
        #   datasources/`source_id`/items/`item_id`
        # @param [Google::Apis::CloudsearchV1::Principal] principal_object
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::CheckAccessResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::CheckAccessResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def check_debug_datasource_item_access(name, principal_object = nil, debug_options_enable_debugging: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/debug/{+name}:checkAccess', options)
          command.request_representation = Google::Apis::CloudsearchV1::Principal::Representation
          command.request_object = principal_object
          command.response_representation = Google::Apis::CloudsearchV1::CheckAccessResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::CheckAccessResponse
          command.params['name'] = name unless name.nil?
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Fetches the item whose viewUrl exactly matches that of the URL provided
        # in the request.
        # @param [String] name
        #   Source name, format:
        #   datasources/`source_id`
        # @param [Google::Apis::CloudsearchV1::SearchItemsByViewUrlRequest] search_items_by_view_url_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::SearchItemsByViewUrlResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::SearchItemsByViewUrlResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_debug_datasource_item_by_view_url(name, search_items_by_view_url_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/debug/{+name}/items:searchByViewUrl', options)
          command.request_representation = Google::Apis::CloudsearchV1::SearchItemsByViewUrlRequest::Representation
          command.request_object = search_items_by_view_url_request_object
          command.response_representation = Google::Apis::CloudsearchV1::SearchItemsByViewUrlResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::SearchItemsByViewUrlResponse
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all unmapped identities for a specific item.
        # @param [String] parent
        #   The name of the item, in the following format:
        #   datasources/`source_id`/items/`ID`
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [Fixnum] page_size
        #   Maximum number of items to fetch in a request.
        #   Defaults to 100.
        # @param [String] page_token
        #   The next_page_token value returned from a previous List request, if any.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::ListUnmappedIdentitiesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::ListUnmappedIdentitiesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_debug_datasource_item_unmappedids(parent, debug_options_enable_debugging: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/debug/{+parent}/unmappedids', options)
          command.response_representation = Google::Apis::CloudsearchV1::ListUnmappedIdentitiesResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::ListUnmappedIdentitiesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists names of items associated with an unmapped identity.
        # @param [String] parent
        #   The name of the identity source, in the following format:
        #   identitysources/`source_id``
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [String] group_resource_name
        # @param [Fixnum] page_size
        #   Maximum number of items to fetch in a request.
        #   Defaults to 100.
        # @param [String] page_token
        #   The next_page_token value returned from a previous List request, if any.
        # @param [String] user_resource_name
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::ListItemNamesForUnmappedIdentityResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::ListItemNamesForUnmappedIdentityResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_debug_identitysource_item_forunmappedidentity(parent, debug_options_enable_debugging: nil, group_resource_name: nil, page_size: nil, page_token: nil, user_resource_name: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/debug/{+parent}/items:forunmappedidentity', options)
          command.response_representation = Google::Apis::CloudsearchV1::ListItemNamesForUnmappedIdentityResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::ListItemNamesForUnmappedIdentityResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['groupResourceName'] = group_resource_name unless group_resource_name.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['userResourceName'] = user_resource_name unless user_resource_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists unmapped user identities for an identity source.
        # @param [String] parent
        #   The name of the identity source, in the following format:
        #   identitysources/`source_id`
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [Fixnum] page_size
        #   Maximum number of items to fetch in a request.
        #   Defaults to 100.
        # @param [String] page_token
        #   The next_page_token value returned from a previous List request, if any.
        # @param [String] resolution_status_code
        #   Limit users selection to this status.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::ListUnmappedIdentitiesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::ListUnmappedIdentitiesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_debug_identitysource_unmappedids(parent, debug_options_enable_debugging: nil, page_size: nil, page_token: nil, resolution_status_code: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/debug/{+parent}/unmappedids', options)
          command.response_representation = Google::Apis::CloudsearchV1::ListUnmappedIdentitiesResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::ListUnmappedIdentitiesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['resolutionStatusCode'] = resolution_status_code unless resolution_status_code.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the schema of a data source.
        # @param [String] name
        #   Name of the data source to delete Schema.  Format:
        #   datasources/`source_id`
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_indexing_datasource_schema(name, debug_options_enable_debugging: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/indexing/{+name}/schema', options)
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the schema of a data source.
        # @param [String] name
        #   Name of the data source to get Schema.  Format:
        #   datasources/`source_id`
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Schema] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Schema]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_indexing_datasource_schema(name, debug_options_enable_debugging: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/indexing/{+name}/schema', options)
          command.response_representation = Google::Apis::CloudsearchV1::Schema::Representation
          command.response_class = Google::Apis::CloudsearchV1::Schema
          command.params['name'] = name unless name.nil?
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the schema of a data source.
        # @param [String] name
        #   Name of the data source to update Schema.  Format:
        #   datasources/`source_id`
        # @param [Google::Apis::CloudsearchV1::UpdateSchemaRequest] update_schema_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_datasource_schema(name, update_schema_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1/indexing/{+name}/schema', options)
          command.request_representation = Google::Apis::CloudsearchV1::UpdateSchemaRequest::Representation
          command.request_object = update_schema_request_object
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes Item resource for the
        # specified resource name. This API requires an admin or service account
        # to execute. The service account used is the one whitelisted in the
        # corresponding data source.
        # @param [String] name
        #   Required. Name of the item to delete.
        #   Format: datasources/`source_id`/items/`item_id`
        # @param [String] connector_name
        #   Name of connector making this call.
        #   <br />Format: datasources/`source_id`/connectors/`ID`
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [String] mode
        #   Required. The RequestMode for this request.
        # @param [String] version
        #   Required. The incremented version of the item to delete from the index.
        #   The indexing system stores the version from the datasource as a
        #   byte string and compares the Item version in the index
        #   to the version of the queued Item using lexical ordering.
        #   <br /><br />
        #   Cloud Search Indexing won't delete any queued item with
        #   a version value that is less than or equal to
        #   the version of the currently indexed item.
        #   The maximum length for this field is 1024 bytes.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_indexing_datasource_item(name, connector_name: nil, debug_options_enable_debugging: nil, mode: nil, version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/indexing/{+name}', options)
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['connectorName'] = connector_name unless connector_name.nil?
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['mode'] = mode unless mode.nil?
          command.query['version'] = version unless version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes all items in a queue. This method is useful for deleting stale
        # items.
        # This API requires an admin or service account to execute. The service
        # account used is the one whitelisted in the corresponding data source.
        # @param [String] name
        #   Name of the Data Source to delete items in a queue.
        #   Format: datasources/`source_id`
        # @param [Google::Apis::CloudsearchV1::DeleteQueueItemsRequest] delete_queue_items_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_queue_items(name, delete_queue_items_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/indexing/{+name}/items:deleteQueueItems', options)
          command.request_representation = Google::Apis::CloudsearchV1::DeleteQueueItemsRequest::Representation
          command.request_object = delete_queue_items_request_object
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets Item resource by item name.
        # This API requires an admin or service account to execute.  The service
        # account used is the one whitelisted in the corresponding data source.
        # @param [String] name
        #   Name of the item to get info.
        #   Format: datasources/`source_id`/items/`item_id`
        # @param [String] connector_name
        #   Name of connector making this call.
        #   <br />Format: datasources/`source_id`/connectors/`ID`
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Item] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Item]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_indexing_datasource_item(name, connector_name: nil, debug_options_enable_debugging: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/indexing/{+name}', options)
          command.response_representation = Google::Apis::CloudsearchV1::Item::Representation
          command.response_class = Google::Apis::CloudsearchV1::Item
          command.params['name'] = name unless name.nil?
          command.query['connectorName'] = connector_name unless connector_name.nil?
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates Item ACL, metadata, and
        # content. It will insert the Item if it
        # does not exist.
        # This method does not support partial updates.  Fields with no provided
        # values are cleared out in the Cloud Search index.
        # This API requires an admin or service account to execute. The service
        # account used is the one whitelisted in the corresponding data source.
        # @param [String] name
        #   Name of the Item. Format:
        #   datasources/`source_id`/items/`item_id`
        #   <br />This is a required field.
        #   The maximum length is 1536 characters.
        # @param [Google::Apis::CloudsearchV1::IndexItemRequest] index_item_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def index_item(name, index_item_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/indexing/{+name}:index', options)
          command.request_representation = Google::Apis::CloudsearchV1::IndexItemRequest::Representation
          command.request_object = index_item_request_object
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all or a subset of Item resources.
        # This API requires an admin or service account to execute. The service
        # account used is the one whitelisted in the corresponding data source.
        # @param [String] name
        #   Name of the Data Source to list Items.  Format:
        #   datasources/`source_id`
        # @param [Boolean] brief
        #   When set to true, the indexing system only populates the following fields:
        #   name,
        #   version,
        #   queue.
        #   metadata.hash,
        #   metadata.title,
        #   metadata.sourceRepositoryURL,
        #   metadata.objectType,
        #   metadata.createTime,
        #   metadata.updateTime,
        #   metadata.contentLanguage,
        #   metadata.mimeType,
        #   structured_data.hash,
        #   content.hash,
        #   itemType,
        #   itemStatus.code,
        #   itemStatus.processingError.code,
        #   itemStatus.repositoryError.type,
        #   <br />If this value is false, then all the fields are populated in Item.
        # @param [String] connector_name
        #   Name of connector making this call.
        #   <br />Format: datasources/`source_id`/connectors/`ID`
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [Fixnum] page_size
        #   Maximum number of items to fetch in a request.
        #   The max value is 1000 when brief is true.  The max value is 10 if brief
        #   is false.
        #   <br />The default value is 10
        # @param [String] page_token
        #   The next_page_token value returned from a previous List request, if any.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::ListItemsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::ListItemsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_indexing_datasource_items(name, brief: nil, connector_name: nil, debug_options_enable_debugging: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/indexing/{+name}/items', options)
          command.response_representation = Google::Apis::CloudsearchV1::ListItemsResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::ListItemsResponse
          command.params['name'] = name unless name.nil?
          command.query['brief'] = brief unless brief.nil?
          command.query['connectorName'] = connector_name unless connector_name.nil?
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Polls for unreserved items from the indexing queue and marks a
        # set as reserved, starting with items that have
        # the oldest timestamp from the highest priority
        # ItemStatus.
        # The priority order is as follows: <br />
        # ERROR
        # <br />
        # MODIFIED
        # <br />
        # NEW_ITEM
        # <br />
        # ACCEPTED
        # <br />
        # Reserving items ensures that polling from other threads
        # cannot create overlapping sets.
        # After handling the reserved items, the client should put items back
        # into the unreserved state, either by calling
        # index,
        # or by calling
        # push with
        # the type REQUEUE.
        # Items automatically become available (unreserved) after 4 hours even if no
        # update or push method is called.
        # This API requires an admin or service account to execute. The service
        # account used is the one whitelisted in the corresponding data source.
        # @param [String] name
        #   Name of the Data Source to poll items.
        #   Format: datasources/`source_id`
        # @param [Google::Apis::CloudsearchV1::PollItemsRequest] poll_items_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::PollItemsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::PollItemsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def poll_items(name, poll_items_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/indexing/{+name}/items:poll', options)
          command.request_representation = Google::Apis::CloudsearchV1::PollItemsRequest::Representation
          command.request_object = poll_items_request_object
          command.response_representation = Google::Apis::CloudsearchV1::PollItemsResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::PollItemsResponse
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Pushes an item onto a queue for later polling and updating.
        # This API requires an admin or service account to execute. The service
        # account used is the one whitelisted in the corresponding data source.
        # @param [String] name
        #   Name of the item to
        #   push into the indexing queue.<br />
        #   Format: datasources/`source_id`/items/`ID`
        #   <br />This is a required field.
        #   The maximum length is 1536 characters.
        # @param [Google::Apis::CloudsearchV1::PushItemRequest] push_item_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Item] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Item]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def push_item(name, push_item_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/indexing/{+name}:push', options)
          command.request_representation = Google::Apis::CloudsearchV1::PushItemRequest::Representation
          command.request_object = push_item_request_object
          command.response_representation = Google::Apis::CloudsearchV1::Item::Representation
          command.response_class = Google::Apis::CloudsearchV1::Item
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Unreserves all items from a queue, making them all eligible to be
        # polled.  This method is useful for resetting the indexing queue
        # after a connector has been restarted.
        # This API requires an admin or service account to execute. The service
        # account used is the one whitelisted in the corresponding data source.
        # @param [String] name
        #   Name of the Data Source to unreserve all items.
        #   Format: datasources/`source_id`
        # @param [Google::Apis::CloudsearchV1::UnreserveItemsRequest] unreserve_items_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def unreserve_items(name, unreserve_items_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/indexing/{+name}/items:unreserve', options)
          command.request_representation = Google::Apis::CloudsearchV1::UnreserveItemsRequest::Representation
          command.request_object = unreserve_items_request_object
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an upload session for uploading item content. For items smaller
        # than 100 KB, it's easier to embed the content
        # inline within
        # an index request.
        # This API requires an admin or service account to execute. The service
        # account used is the one whitelisted in the corresponding data source.
        # @param [String] name
        #   Name of the Item to start a resumable upload.
        #   Format: datasources/`source_id`/items/`item_id`.
        # @param [Google::Apis::CloudsearchV1::StartUploadItemRequest] start_upload_item_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::UploadItemRef] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::UploadItemRef]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def upload_indexing_datasource_item(name, start_upload_item_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/indexing/{+name}:upload', options)
          command.request_representation = Google::Apis::CloudsearchV1::StartUploadItemRequest::Representation
          command.request_object = start_upload_item_request_object
          command.response_representation = Google::Apis::CloudsearchV1::UploadItemRef::Representation
          command.response_class = Google::Apis::CloudsearchV1::UploadItemRef
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Uploads media for indexing.
        # The upload endpoint supports direct and resumable upload protocols and
        # is intended for large items that can not be
        # [inlined during index requests](https://developers.google.com/cloud-search/
        # docs/reference/rest/v1/indexing.datasources.items#itemcontent).
        # To index large content:
        # 1. Call
        # indexing.datasources.items.upload
        # with the resource name to begin an upload session and retrieve the
        # UploadItemRef.
        # 1. Call media.upload to upload the content using the same resource name from
        # step 1.
        # 1. Call indexing.datasources.items.index
        # to index the item. Populate the
        # [ItemContent](/cloud-search/docs/reference/rest/v1/indexing.datasources.
        # items#ItemContent)
        # with the UploadItemRef from step 1.
        # For additional information, see
        # [Create a content connector using the REST API](https://developers.google.com/
        # cloud-search/docs/guides/content-connector#rest).
        # @param [String] resource_name
        #   Name of the media that is being downloaded.  See
        #   ReadRequest.resource_name.
        # @param [Google::Apis::CloudsearchV1::Media] media_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Media] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Media]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def upload_medium(resource_name, media_object = nil, fields: nil, quota_user: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'v1/media/{+resourceName}', options)
          else
            command = make_upload_command(:post, 'v1/media/{+resourceName}', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::CloudsearchV1::Media::Representation
          command.request_object = media_object
          command.response_representation = Google::Apis::CloudsearchV1::Media::Representation
          command.response_class = Google::Apis::CloudsearchV1::Media
          command.params['resourceName'] = resource_name unless resource_name.nil?
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
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # The Cloud Search Query API provides the search method, which returns
        # the most relevant results from a user query.  The results can come from
        # G Suite Apps, such as Gmail or Google Drive, or they can come from data
        # that you have indexed from a third party.
        # @param [Google::Apis::CloudsearchV1::SearchRequest] search_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::SearchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::SearchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_query(search_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/query/search', options)
          command.request_representation = Google::Apis::CloudsearchV1::SearchRequest::Representation
          command.request_object = search_request_object
          command.response_representation = Google::Apis::CloudsearchV1::SearchResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::SearchResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Provides suggestions for autocompleting the query.
        # @param [Google::Apis::CloudsearchV1::SuggestRequest] suggest_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::SuggestResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::SuggestResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def suggest_query(suggest_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/query/suggest', options)
          command.request_representation = Google::Apis::CloudsearchV1::SuggestRequest::Representation
          command.request_object = suggest_request_object
          command.response_representation = Google::Apis::CloudsearchV1::SuggestResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::SuggestResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns list of sources that user can use for Search and Suggest APIs.
        # @param [String] page_token
        #   Number of sources to return in the response.
        # @param [Boolean] request_options_debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [String] request_options_language_code
        #   The BCP-47 language code, such as "en-US" or "sr-Latn".
        #   For more information, see
        #   http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        #   For translations.
        #   Set this field using the language set in browser or for the page. In the
        #   event that the user's language preference is known, set this field to the
        #   known user language.
        #   When specified, the documents in search results are biased towards the
        #   specified language.
        #   The suggest API does not use this parameter. Instead, suggest autocompletes
        #   only based on characters in the query.
        # @param [String] request_options_search_application_id
        #   Id of the application created using SearchApplicationsService.
        # @param [String] request_options_time_zone
        #   Current user's time zone id, such as "America/Los_Angeles" or
        #   "Australia/Sydney". These IDs are defined by
        #   [Unicode Common Locale Data Repository (CLDR)](http://cldr.unicode.org/)
        #   project, and currently available in the file
        #   [timezone.xml](http://unicode.org/repos/cldr/trunk/common/bcp47/timezone.xml).
        #   This field is used to correctly interpret date and time queries.
        #   If this field is not specified, the default time zone (UTC) is used.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::ListQuerySourcesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::ListQuerySourcesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_query_sources(page_token: nil, request_options_debug_options_enable_debugging: nil, request_options_language_code: nil, request_options_search_application_id: nil, request_options_time_zone: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/query/sources', options)
          command.response_representation = Google::Apis::CloudsearchV1::ListQuerySourcesResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::ListQuerySourcesResponse
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['requestOptions.debugOptions.enableDebugging'] = request_options_debug_options_enable_debugging unless request_options_debug_options_enable_debugging.nil?
          command.query['requestOptions.languageCode'] = request_options_language_code unless request_options_language_code.nil?
          command.query['requestOptions.searchApplicationId'] = request_options_search_application_id unless request_options_search_application_id.nil?
          command.query['requestOptions.timeZone'] = request_options_time_zone unless request_options_time_zone.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a datasource.
        # @param [Google::Apis::CloudsearchV1::DataSource] data_source_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_setting_datasource(data_source_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/settings/datasources', options)
          command.request_representation = Google::Apis::CloudsearchV1::DataSource::Representation
          command.request_object = data_source_object
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a datasource.
        # @param [String] name
        #   Name of the datasource.
        #   Format: datasources/`source_id`.
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_setting_datasource(name, debug_options_enable_debugging: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/settings/{+name}', options)
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a datasource.
        # @param [String] name
        #   Name of the datasource resource.
        #   Format: datasources/`source_id`.
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::DataSource] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::DataSource]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_setting_datasource(name, debug_options_enable_debugging: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/settings/{+name}', options)
          command.response_representation = Google::Apis::CloudsearchV1::DataSource::Representation
          command.response_class = Google::Apis::CloudsearchV1::DataSource
          command.params['name'] = name unless name.nil?
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists datasources.
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [Fixnum] page_size
        #   Maximum number of datasources to fetch in a request.
        #   The max value is 100.
        #   <br />The default value is 10
        # @param [String] page_token
        #   Starting index of the results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::ListDataSourceResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::ListDataSourceResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_setting_datasources(debug_options_enable_debugging: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/settings/datasources', options)
          command.response_representation = Google::Apis::CloudsearchV1::ListDataSourceResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::ListDataSourceResponse
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a datasource.
        # @param [String] name
        #   Name of the datasource resource.
        #   Format: datasources/`source_id`.
        #   <br />The name is ignored when creating a datasource.
        # @param [Google::Apis::CloudsearchV1::UpdateDataSourceRequest] update_data_source_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_datasource_data_source(name, update_data_source_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1/settings/{+name}', options)
          command.request_representation = Google::Apis::CloudsearchV1::UpdateDataSourceRequest::Representation
          command.request_object = update_data_source_request_object
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a search application.
        # @param [Google::Apis::CloudsearchV1::SearchApplication] search_application_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_setting_searchapplication(search_application_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/settings/searchapplications', options)
          command.request_representation = Google::Apis::CloudsearchV1::SearchApplication::Representation
          command.request_object = search_application_object
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a search application.
        # @param [String] name
        #   The name of the search application to be deleted.
        #   <br />Format: applications/`application_id`.
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_setting_searchapplication(name, debug_options_enable_debugging: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/settings/{+name}', options)
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified search application.
        # @param [String] name
        #   Name of the search application.
        #   <br />Format: applications/`application_id`.
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::SearchApplication] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::SearchApplication]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_setting_searchapplication(name, debug_options_enable_debugging: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/settings/{+name}', options)
          command.response_representation = Google::Apis::CloudsearchV1::SearchApplication::Representation
          command.response_class = Google::Apis::CloudsearchV1::SearchApplication
          command.params['name'] = name unless name.nil?
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all search applications.
        # @param [Boolean] debug_options_enable_debugging
        #   If you are asked by Google to help with debugging, set this field.
        #   Otherwise, ignore this field.
        # @param [Fixnum] page_size
        #   The maximum number of items to return.
        # @param [String] page_token
        #   The next_page_token value returned from a previous List request, if any.
        #   <br/> The default value is 10
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::ListSearchApplicationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::ListSearchApplicationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_setting_searchapplications(debug_options_enable_debugging: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/settings/searchapplications', options)
          command.response_representation = Google::Apis::CloudsearchV1::ListSearchApplicationsResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::ListSearchApplicationsResponse
          command.query['debugOptions.enableDebugging'] = debug_options_enable_debugging unless debug_options_enable_debugging.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Resets a search application to default settings. This will return an empty
        # response.
        # @param [String] name
        #   The name of the search application to be reset.
        #   <br />Format: applications/`application_id`.
        # @param [Google::Apis::CloudsearchV1::ResetSearchApplicationRequest] reset_search_application_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def reset_searchapplication_search_application(name, reset_search_application_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/settings/{+name}:reset', options)
          command.request_representation = Google::Apis::CloudsearchV1::ResetSearchApplicationRequest::Representation
          command.request_object = reset_search_application_request_object
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a search application.
        # @param [String] name
        #   Name of the Search Application.
        #   <br />Format: searchapplications/`application_id`.
        # @param [Google::Apis::CloudsearchV1::SearchApplication] search_application_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_setting_searchapplication(name, search_application_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1/settings/{+name}', options)
          command.request_representation = Google::Apis::CloudsearchV1::SearchApplication::Representation
          command.request_object = search_application_object
          command.response_representation = Google::Apis::CloudsearchV1::Operation::Representation
          command.response_class = Google::Apis::CloudsearchV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets indexed item statistics aggreggated across all data sources. This
        # API only returns statistics for previous dates; it doesn't return
        # statistics for the current day.
        # @param [Fixnum] from_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] from_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] from_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [Fixnum] to_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] to_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] to_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::GetCustomerIndexStatsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::GetCustomerIndexStatsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_stat_index(from_date_day: nil, from_date_month: nil, from_date_year: nil, to_date_day: nil, to_date_month: nil, to_date_year: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/stats/index', options)
          command.response_representation = Google::Apis::CloudsearchV1::GetCustomerIndexStatsResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::GetCustomerIndexStatsResponse
          command.query['fromDate.day'] = from_date_day unless from_date_day.nil?
          command.query['fromDate.month'] = from_date_month unless from_date_month.nil?
          command.query['fromDate.year'] = from_date_year unless from_date_year.nil?
          command.query['toDate.day'] = to_date_day unless to_date_day.nil?
          command.query['toDate.month'] = to_date_month unless to_date_month.nil?
          command.query['toDate.year'] = to_date_year unless to_date_year.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the query statistics for customer
        # @param [Fixnum] from_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] from_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] from_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [Fixnum] to_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] to_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] to_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::GetCustomerQueryStatsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::GetCustomerQueryStatsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_stat_query(from_date_day: nil, from_date_month: nil, from_date_year: nil, to_date_day: nil, to_date_month: nil, to_date_year: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/stats/query', options)
          command.response_representation = Google::Apis::CloudsearchV1::GetCustomerQueryStatsResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::GetCustomerQueryStatsResponse
          command.query['fromDate.day'] = from_date_day unless from_date_day.nil?
          command.query['fromDate.month'] = from_date_month unless from_date_month.nil?
          command.query['fromDate.year'] = from_date_year unless from_date_year.nil?
          command.query['toDate.day'] = to_date_day unless to_date_day.nil?
          command.query['toDate.month'] = to_date_month unless to_date_month.nil?
          command.query['toDate.year'] = to_date_year unless to_date_year.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the # of search sessions for the customer
        # @param [Fixnum] from_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] from_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] from_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [Fixnum] to_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] to_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] to_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::GetCustomerSessionStatsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::GetCustomerSessionStatsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_stat_session(from_date_day: nil, from_date_month: nil, from_date_year: nil, to_date_day: nil, to_date_month: nil, to_date_year: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/stats/session', options)
          command.response_representation = Google::Apis::CloudsearchV1::GetCustomerSessionStatsResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::GetCustomerSessionStatsResponse
          command.query['fromDate.day'] = from_date_day unless from_date_day.nil?
          command.query['fromDate.month'] = from_date_month unless from_date_month.nil?
          command.query['fromDate.year'] = from_date_year unless from_date_year.nil?
          command.query['toDate.day'] = to_date_day unless to_date_day.nil?
          command.query['toDate.month'] = to_date_month unless to_date_month.nil?
          command.query['toDate.year'] = to_date_year unless to_date_year.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the users statistics for customer
        # @param [Fixnum] from_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] from_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] from_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [Fixnum] to_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] to_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] to_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::GetCustomerUserStatsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::GetCustomerUserStatsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_stat_user(from_date_day: nil, from_date_month: nil, from_date_year: nil, to_date_day: nil, to_date_month: nil, to_date_year: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/stats/user', options)
          command.response_representation = Google::Apis::CloudsearchV1::GetCustomerUserStatsResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::GetCustomerUserStatsResponse
          command.query['fromDate.day'] = from_date_day unless from_date_day.nil?
          command.query['fromDate.month'] = from_date_month unless from_date_month.nil?
          command.query['fromDate.year'] = from_date_year unless from_date_year.nil?
          command.query['toDate.day'] = to_date_day unless to_date_day.nil?
          command.query['toDate.month'] = to_date_month unless to_date_month.nil?
          command.query['toDate.year'] = to_date_year unless to_date_year.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets indexed item statistics for a single data source.
        # @param [String] name
        #   The resource id of the data source to retrieve statistics for,
        #   in the following format: "datasources/`source_id`"
        # @param [Fixnum] from_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] from_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] from_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [Fixnum] to_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] to_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] to_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::GetDataSourceIndexStatsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::GetDataSourceIndexStatsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_stat_index_datasource(name, from_date_day: nil, from_date_month: nil, from_date_year: nil, to_date_day: nil, to_date_month: nil, to_date_year: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/stats/index/{+name}', options)
          command.response_representation = Google::Apis::CloudsearchV1::GetDataSourceIndexStatsResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::GetDataSourceIndexStatsResponse
          command.params['name'] = name unless name.nil?
          command.query['fromDate.day'] = from_date_day unless from_date_day.nil?
          command.query['fromDate.month'] = from_date_month unless from_date_month.nil?
          command.query['fromDate.year'] = from_date_year unless from_date_year.nil?
          command.query['toDate.day'] = to_date_day unless to_date_day.nil?
          command.query['toDate.month'] = to_date_month unless to_date_month.nil?
          command.query['toDate.year'] = to_date_year unless to_date_year.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the query statistics for search application
        # @param [String] name
        #   The resource id of the search application query stats, in the following
        #   format: searchapplications/`application_id`
        # @param [Fixnum] from_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] from_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] from_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [Fixnum] to_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] to_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] to_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::GetSearchApplicationQueryStatsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::GetSearchApplicationQueryStatsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_stat_query_searchapplication(name, from_date_day: nil, from_date_month: nil, from_date_year: nil, to_date_day: nil, to_date_month: nil, to_date_year: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/stats/query/{+name}', options)
          command.response_representation = Google::Apis::CloudsearchV1::GetSearchApplicationQueryStatsResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::GetSearchApplicationQueryStatsResponse
          command.params['name'] = name unless name.nil?
          command.query['fromDate.day'] = from_date_day unless from_date_day.nil?
          command.query['fromDate.month'] = from_date_month unless from_date_month.nil?
          command.query['fromDate.year'] = from_date_year unless from_date_year.nil?
          command.query['toDate.day'] = to_date_day unless to_date_day.nil?
          command.query['toDate.month'] = to_date_month unless to_date_month.nil?
          command.query['toDate.year'] = to_date_year unless to_date_year.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the # of search sessions for the search application
        # @param [String] name
        #   The resource id of the search application session stats, in the following
        #   format: searchapplications/`application_id`
        # @param [Fixnum] from_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] from_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] from_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [Fixnum] to_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] to_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] to_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::GetSearchApplicationSessionStatsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::GetSearchApplicationSessionStatsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_stat_session_searchapplication(name, from_date_day: nil, from_date_month: nil, from_date_year: nil, to_date_day: nil, to_date_month: nil, to_date_year: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/stats/session/{+name}', options)
          command.response_representation = Google::Apis::CloudsearchV1::GetSearchApplicationSessionStatsResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::GetSearchApplicationSessionStatsResponse
          command.params['name'] = name unless name.nil?
          command.query['fromDate.day'] = from_date_day unless from_date_day.nil?
          command.query['fromDate.month'] = from_date_month unless from_date_month.nil?
          command.query['fromDate.year'] = from_date_year unless from_date_year.nil?
          command.query['toDate.day'] = to_date_day unless to_date_day.nil?
          command.query['toDate.month'] = to_date_month unless to_date_month.nil?
          command.query['toDate.year'] = to_date_year unless to_date_year.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the users statistics for search application
        # @param [String] name
        #   The resource id of the search application session stats, in the following
        #   format: searchapplications/`application_id`
        # @param [Fixnum] from_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] from_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] from_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [Fixnum] to_date_day
        #   Day of month. Must be from 1 to 31 and valid for the year and month.
        # @param [Fixnum] to_date_month
        #   Month of date. Must be from 1 to 12.
        # @param [Fixnum] to_date_year
        #   Year of date. Must be from 1 to 9999.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::CloudsearchV1::GetSearchApplicationUserStatsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CloudsearchV1::GetSearchApplicationUserStatsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_stat_user_searchapplication(name, from_date_day: nil, from_date_month: nil, from_date_year: nil, to_date_day: nil, to_date_month: nil, to_date_year: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/stats/user/{+name}', options)
          command.response_representation = Google::Apis::CloudsearchV1::GetSearchApplicationUserStatsResponse::Representation
          command.response_class = Google::Apis::CloudsearchV1::GetSearchApplicationUserStatsResponse
          command.params['name'] = name unless name.nil?
          command.query['fromDate.day'] = from_date_day unless from_date_day.nil?
          command.query['fromDate.month'] = from_date_month unless from_date_month.nil?
          command.query['fromDate.year'] = from_date_year unless from_date_year.nil?
          command.query['toDate.day'] = to_date_day unless to_date_day.nil?
          command.query['toDate.month'] = to_date_month unless to_date_month.nil?
          command.query['toDate.year'] = to_date_year unless to_date_year.nil?
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
