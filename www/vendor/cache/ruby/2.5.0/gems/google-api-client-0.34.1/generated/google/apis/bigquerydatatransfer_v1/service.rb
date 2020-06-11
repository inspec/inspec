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
    module BigquerydatatransferV1
      # BigQuery Data Transfer API
      #
      # Schedule queries or transfer external data from SaaS applications to Google
      #  BigQuery on a regular basis.
      #
      # @example
      #    require 'google/apis/bigquerydatatransfer_v1'
      #
      #    Bigquerydatatransfer = Google::Apis::BigquerydatatransferV1 # Alias the module
      #    service = Bigquerydatatransfer::BigQueryDataTransferService.new
      #
      # @see https://cloud.google.com/bigquery/
      class BigQueryDataTransferService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://bigquerydatatransfer.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Returns true if valid credentials exist for the given data source and
        # requesting user.
        # Some data sources doesn't support service account, so we need to talk to
        # them on behalf of the end user. This API just checks whether we have OAuth
        # token for the particular user, which is a pre-requisite before user can
        # create a transfer config.
        # @param [String] name
        #   Required. The data source in the form:
        #   `projects/`project_id`/dataSources/`data_source_id``
        # @param [Google::Apis::BigquerydatatransferV1::CheckValidCredsRequest] check_valid_creds_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::CheckValidCredsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::CheckValidCredsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def check_project_data_source_valid_creds(name, check_valid_creds_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:checkValidCreds', options)
          command.request_representation = Google::Apis::BigquerydatatransferV1::CheckValidCredsRequest::Representation
          command.request_object = check_valid_creds_request_object
          command.response_representation = Google::Apis::BigquerydatatransferV1::CheckValidCredsResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::CheckValidCredsResponse
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a supported data source and returns its settings,
        # which can be used for UI rendering.
        # @param [String] name
        #   Required. The field will contain name of the resource requested, for example:
        #   `projects/`project_id`/dataSources/`data_source_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::DataSource] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::DataSource]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_data_source(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::DataSource::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::DataSource
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists supported data sources and returns their settings,
        # which can be used for UI rendering.
        # @param [String] parent
        #   Required. The BigQuery project id for which data sources should be returned.
        #   Must be in the form: `projects/`project_id``
        # @param [Fixnum] page_size
        #   Page size. The default page size is the maximum value of 1000 results.
        # @param [String] page_token
        #   Pagination token, which can be used to request a specific page
        #   of `ListDataSourcesRequest` list results. For multiple-page
        #   results, `ListDataSourcesResponse` outputs
        #   a `next_page` token, which can be used as the
        #   `page_token` value to request the next page of list results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::ListDataSourcesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::ListDataSourcesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_data_sources(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/dataSources', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::ListDataSourcesResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::ListDataSourcesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
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
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::Location] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::Location]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::Location::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::Location
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
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::ListLocationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::ListLocationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_locations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/locations', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::ListLocationsResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::ListLocationsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns true if valid credentials exist for the given data source and
        # requesting user.
        # Some data sources doesn't support service account, so we need to talk to
        # them on behalf of the end user. This API just checks whether we have OAuth
        # token for the particular user, which is a pre-requisite before user can
        # create a transfer config.
        # @param [String] name
        #   Required. The data source in the form:
        #   `projects/`project_id`/dataSources/`data_source_id``
        # @param [Google::Apis::BigquerydatatransferV1::CheckValidCredsRequest] check_valid_creds_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::CheckValidCredsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::CheckValidCredsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def check_project_location_data_source_valid_creds(name, check_valid_creds_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+name}:checkValidCreds', options)
          command.request_representation = Google::Apis::BigquerydatatransferV1::CheckValidCredsRequest::Representation
          command.request_object = check_valid_creds_request_object
          command.response_representation = Google::Apis::BigquerydatatransferV1::CheckValidCredsResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::CheckValidCredsResponse
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a supported data source and returns its settings,
        # which can be used for UI rendering.
        # @param [String] name
        #   Required. The field will contain name of the resource requested, for example:
        #   `projects/`project_id`/dataSources/`data_source_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::DataSource] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::DataSource]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_data_source(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::DataSource::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::DataSource
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists supported data sources and returns their settings,
        # which can be used for UI rendering.
        # @param [String] parent
        #   Required. The BigQuery project id for which data sources should be returned.
        #   Must be in the form: `projects/`project_id``
        # @param [Fixnum] page_size
        #   Page size. The default page size is the maximum value of 1000 results.
        # @param [String] page_token
        #   Pagination token, which can be used to request a specific page
        #   of `ListDataSourcesRequest` list results. For multiple-page
        #   results, `ListDataSourcesResponse` outputs
        #   a `next_page` token, which can be used as the
        #   `page_token` value to request the next page of list results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::ListDataSourcesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::ListDataSourcesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_data_sources(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/dataSources', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::ListDataSourcesResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::ListDataSourcesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new data transfer configuration.
        # @param [String] parent
        #   Required. The BigQuery project id where the transfer configuration should be
        #   created.
        #   Must be in the format projects/`project_id`/locations/`location_id`
        #   If specified location and location of the destination bigquery dataset
        #   do not match - the request will fail.
        # @param [Google::Apis::BigquerydatatransferV1::TransferConfig] transfer_config_object
        # @param [String] authorization_code
        #   Optional OAuth2 authorization code to use with this transfer configuration.
        #   This is required if new credentials are needed, as indicated by
        #   `CheckValidCreds`.
        #   In order to obtain authorization_code, please make a
        #   request to
        #   https://www.gstatic.com/bigquerydatatransfer/oauthz/auth?client_id=<
        #   datatransferapiclientid>&scope=<data_source_scopes>&redirect_uri=<redirect_uri>
        #   * client_id should be OAuth client_id of BigQuery DTS API for the given
        #   data source returned by ListDataSources method.
        #   * data_source_scopes are the scopes returned by ListDataSources method.
        #   * redirect_uri is an optional parameter. If not specified, then
        #   authorization code is posted to the opener of authorization flow window.
        #   Otherwise it will be sent to the redirect uri. A special value of
        #   urn:ietf:wg:oauth:2.0:oob means that authorization code should be
        #   returned in the title bar of the browser, with the page text prompting
        #   the user to copy the code and paste it in the application.
        # @param [String] version_info
        #   Optional version info. If users want to find a very recent access token,
        #   that is, immediately after approving access, users have to set the
        #   version_info claim in the token request. To obtain the version_info, users
        #   must use the "none+gsession" response type. which be return a
        #   version_info back in the authorization response which be be put in a JWT
        #   claim in the token request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::TransferConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::TransferConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_transfer_config(parent, transfer_config_object = nil, authorization_code: nil, version_info: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/transferConfigs', options)
          command.request_representation = Google::Apis::BigquerydatatransferV1::TransferConfig::Representation
          command.request_object = transfer_config_object
          command.response_representation = Google::Apis::BigquerydatatransferV1::TransferConfig::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::TransferConfig
          command.params['parent'] = parent unless parent.nil?
          command.query['authorizationCode'] = authorization_code unless authorization_code.nil?
          command.query['versionInfo'] = version_info unless version_info.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a data transfer configuration,
        # including any associated transfer runs and logs.
        # @param [String] name
        #   Required. The field will contain name of the resource requested, for example:
        #   `projects/`project_id`/transferConfigs/`config_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_transfer_config(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::Empty::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns information about a data transfer config.
        # @param [String] name
        #   Required. The field will contain name of the resource requested, for example:
        #   `projects/`project_id`/transferConfigs/`config_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::TransferConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::TransferConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_transfer_config(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::TransferConfig::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::TransferConfig
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns information about all data transfers in the project.
        # @param [String] parent
        #   Required. The BigQuery project id for which data sources
        #   should be returned: `projects/`project_id``.
        # @param [Array<String>, String] data_source_ids
        #   When specified, only configurations of requested data sources are returned.
        # @param [Fixnum] page_size
        #   Page size. The default page size is the maximum value of 1000 results.
        # @param [String] page_token
        #   Pagination token, which can be used to request a specific page
        #   of `ListTransfersRequest` list results. For multiple-page
        #   results, `ListTransfersResponse` outputs
        #   a `next_page` token, which can be used as the
        #   `page_token` value to request the next page of list results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::ListTransferConfigsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::ListTransferConfigsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_transfer_configs(parent, data_source_ids: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/transferConfigs', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::ListTransferConfigsResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::ListTransferConfigsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['dataSourceIds'] = data_source_ids unless data_source_ids.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a data transfer configuration.
        # All fields must be set, even if they are not updated.
        # @param [String] name
        #   The resource name of the transfer config.
        #   Transfer config names have the form of
        #   `projects/`project_id`/locations/`region`/transferConfigs/`config_id``.
        #   The name is automatically generated based on the config_id specified in
        #   CreateTransferConfigRequest along with project_id and region. If config_id
        #   is not provided, usually a uuid, even though it is not guaranteed or
        #   required, will be generated for config_id.
        # @param [Google::Apis::BigquerydatatransferV1::TransferConfig] transfer_config_object
        # @param [String] authorization_code
        #   Optional OAuth2 authorization code to use with this transfer configuration.
        #   If it is provided, the transfer configuration will be associated with the
        #   authorizing user.
        #   In order to obtain authorization_code, please make a
        #   request to
        #   https://www.gstatic.com/bigquerydatatransfer/oauthz/auth?client_id=<
        #   datatransferapiclientid>&scope=<data_source_scopes>&redirect_uri=<redirect_uri>
        #   * client_id should be OAuth client_id of BigQuery DTS API for the given
        #   data source returned by ListDataSources method.
        #   * data_source_scopes are the scopes returned by ListDataSources method.
        #   * redirect_uri is an optional parameter. If not specified, then
        #   authorization code is posted to the opener of authorization flow window.
        #   Otherwise it will be sent to the redirect uri. A special value of
        #   urn:ietf:wg:oauth:2.0:oob means that authorization code should be
        #   returned in the title bar of the browser, with the page text prompting
        #   the user to copy the code and paste it in the application.
        # @param [String] update_mask
        #   Required. Required list of fields to be updated in this request.
        # @param [String] version_info
        #   Optional version info. If users want to find a very recent access token,
        #   that is, immediately after approving access, users have to set the
        #   version_info claim in the token request. To obtain the version_info, users
        #   must use the "none+gsession" response type. which be return a
        #   version_info back in the authorization response which be be put in a JWT
        #   claim in the token request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::TransferConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::TransferConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_location_transfer_config(name, transfer_config_object = nil, authorization_code: nil, update_mask: nil, version_info: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::BigquerydatatransferV1::TransferConfig::Representation
          command.request_object = transfer_config_object
          command.response_representation = Google::Apis::BigquerydatatransferV1::TransferConfig::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::TransferConfig
          command.params['name'] = name unless name.nil?
          command.query['authorizationCode'] = authorization_code unless authorization_code.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['versionInfo'] = version_info unless version_info.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates transfer runs for a time range [start_time, end_time].
        # For each date - or whatever granularity the data source supports - in the
        # range, one transfer run is created.
        # Note that runs are created per UTC time in the time range.
        # DEPRECATED: use StartManualTransferRuns instead.
        # @param [String] parent
        #   Required. Transfer configuration name in the form:
        #   `projects/`project_id`/transferConfigs/`config_id``.
        # @param [Google::Apis::BigquerydatatransferV1::ScheduleTransferRunsRequest] schedule_transfer_runs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::ScheduleTransferRunsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::ScheduleTransferRunsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def schedule_project_location_transfer_config_runs(parent, schedule_transfer_runs_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}:scheduleRuns', options)
          command.request_representation = Google::Apis::BigquerydatatransferV1::ScheduleTransferRunsRequest::Representation
          command.request_object = schedule_transfer_runs_request_object
          command.response_representation = Google::Apis::BigquerydatatransferV1::ScheduleTransferRunsResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::ScheduleTransferRunsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Start manual transfer runs to be executed now with schedule_time equal to
        # current time. The transfer runs can be created for a time range where the
        # run_time is between start_time (inclusive) and end_time (exclusive), or for
        # a specific run_time.
        # @param [String] parent
        #   Transfer configuration name in the form:
        #   `projects/`project_id`/transferConfigs/`config_id``.
        # @param [Google::Apis::BigquerydatatransferV1::StartManualTransferRunsRequest] start_manual_transfer_runs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::StartManualTransferRunsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::StartManualTransferRunsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def start_project_location_transfer_config_manual_runs(parent, start_manual_transfer_runs_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}:startManualRuns', options)
          command.request_representation = Google::Apis::BigquerydatatransferV1::StartManualTransferRunsRequest::Representation
          command.request_object = start_manual_transfer_runs_request_object
          command.response_representation = Google::Apis::BigquerydatatransferV1::StartManualTransferRunsResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::StartManualTransferRunsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified transfer run.
        # @param [String] name
        #   Required. The field will contain name of the resource requested, for example:
        #   `projects/`project_id`/transferConfigs/`config_id`/runs/`run_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_transfer_config_run(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::Empty::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns information about the particular transfer run.
        # @param [String] name
        #   Required. The field will contain name of the resource requested, for example:
        #   `projects/`project_id`/transferConfigs/`config_id`/runs/`run_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::TransferRun] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::TransferRun]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_transfer_config_run(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::TransferRun::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::TransferRun
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns information about running and completed jobs.
        # @param [String] parent
        #   Required. Name of transfer configuration for which transfer runs should be
        #   retrieved.
        #   Format of transfer configuration resource name is:
        #   `projects/`project_id`/transferConfigs/`config_id``.
        # @param [Fixnum] page_size
        #   Page size. The default page size is the maximum value of 1000 results.
        # @param [String] page_token
        #   Pagination token, which can be used to request a specific page
        #   of `ListTransferRunsRequest` list results. For multiple-page
        #   results, `ListTransferRunsResponse` outputs
        #   a `next_page` token, which can be used as the
        #   `page_token` value to request the next page of list results.
        # @param [String] run_attempt
        #   Indicates how run attempts are to be pulled.
        # @param [Array<String>, String] states
        #   When specified, only transfer runs with requested states are returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::ListTransferRunsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::ListTransferRunsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_transfer_config_runs(parent, page_size: nil, page_token: nil, run_attempt: nil, states: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/runs', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::ListTransferRunsResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::ListTransferRunsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['runAttempt'] = run_attempt unless run_attempt.nil?
          command.query['states'] = states unless states.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns user facing log messages for the data transfer run.
        # @param [String] parent
        #   Required. Transfer run name in the form:
        #   `projects/`project_id`/transferConfigs/`config_Id`/runs/`run_id``.
        # @param [Array<String>, String] message_types
        #   Message types to return. If not populated - INFO, WARNING and ERROR
        #   messages are returned.
        # @param [Fixnum] page_size
        #   Page size. The default page size is the maximum value of 1000 results.
        # @param [String] page_token
        #   Pagination token, which can be used to request a specific page
        #   of `ListTransferLogsRequest` list results. For multiple-page
        #   results, `ListTransferLogsResponse` outputs
        #   a `next_page` token, which can be used as the
        #   `page_token` value to request the next page of list results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::ListTransferLogsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::ListTransferLogsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_transfer_config_run_transfer_logs(parent, message_types: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/transferLogs', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::ListTransferLogsResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::ListTransferLogsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['messageTypes'] = message_types unless message_types.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new data transfer configuration.
        # @param [String] parent
        #   Required. The BigQuery project id where the transfer configuration should be
        #   created.
        #   Must be in the format projects/`project_id`/locations/`location_id`
        #   If specified location and location of the destination bigquery dataset
        #   do not match - the request will fail.
        # @param [Google::Apis::BigquerydatatransferV1::TransferConfig] transfer_config_object
        # @param [String] authorization_code
        #   Optional OAuth2 authorization code to use with this transfer configuration.
        #   This is required if new credentials are needed, as indicated by
        #   `CheckValidCreds`.
        #   In order to obtain authorization_code, please make a
        #   request to
        #   https://www.gstatic.com/bigquerydatatransfer/oauthz/auth?client_id=<
        #   datatransferapiclientid>&scope=<data_source_scopes>&redirect_uri=<redirect_uri>
        #   * client_id should be OAuth client_id of BigQuery DTS API for the given
        #   data source returned by ListDataSources method.
        #   * data_source_scopes are the scopes returned by ListDataSources method.
        #   * redirect_uri is an optional parameter. If not specified, then
        #   authorization code is posted to the opener of authorization flow window.
        #   Otherwise it will be sent to the redirect uri. A special value of
        #   urn:ietf:wg:oauth:2.0:oob means that authorization code should be
        #   returned in the title bar of the browser, with the page text prompting
        #   the user to copy the code and paste it in the application.
        # @param [String] version_info
        #   Optional version info. If users want to find a very recent access token,
        #   that is, immediately after approving access, users have to set the
        #   version_info claim in the token request. To obtain the version_info, users
        #   must use the "none+gsession" response type. which be return a
        #   version_info back in the authorization response which be be put in a JWT
        #   claim in the token request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::TransferConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::TransferConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_transfer_config(parent, transfer_config_object = nil, authorization_code: nil, version_info: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/transferConfigs', options)
          command.request_representation = Google::Apis::BigquerydatatransferV1::TransferConfig::Representation
          command.request_object = transfer_config_object
          command.response_representation = Google::Apis::BigquerydatatransferV1::TransferConfig::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::TransferConfig
          command.params['parent'] = parent unless parent.nil?
          command.query['authorizationCode'] = authorization_code unless authorization_code.nil?
          command.query['versionInfo'] = version_info unless version_info.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a data transfer configuration,
        # including any associated transfer runs and logs.
        # @param [String] name
        #   Required. The field will contain name of the resource requested, for example:
        #   `projects/`project_id`/transferConfigs/`config_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_transfer_config(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::Empty::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns information about a data transfer config.
        # @param [String] name
        #   Required. The field will contain name of the resource requested, for example:
        #   `projects/`project_id`/transferConfigs/`config_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::TransferConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::TransferConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_transfer_config(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::TransferConfig::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::TransferConfig
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns information about all data transfers in the project.
        # @param [String] parent
        #   Required. The BigQuery project id for which data sources
        #   should be returned: `projects/`project_id``.
        # @param [Array<String>, String] data_source_ids
        #   When specified, only configurations of requested data sources are returned.
        # @param [Fixnum] page_size
        #   Page size. The default page size is the maximum value of 1000 results.
        # @param [String] page_token
        #   Pagination token, which can be used to request a specific page
        #   of `ListTransfersRequest` list results. For multiple-page
        #   results, `ListTransfersResponse` outputs
        #   a `next_page` token, which can be used as the
        #   `page_token` value to request the next page of list results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::ListTransferConfigsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::ListTransferConfigsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_transfer_configs(parent, data_source_ids: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/transferConfigs', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::ListTransferConfigsResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::ListTransferConfigsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['dataSourceIds'] = data_source_ids unless data_source_ids.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a data transfer configuration.
        # All fields must be set, even if they are not updated.
        # @param [String] name
        #   The resource name of the transfer config.
        #   Transfer config names have the form of
        #   `projects/`project_id`/locations/`region`/transferConfigs/`config_id``.
        #   The name is automatically generated based on the config_id specified in
        #   CreateTransferConfigRequest along with project_id and region. If config_id
        #   is not provided, usually a uuid, even though it is not guaranteed or
        #   required, will be generated for config_id.
        # @param [Google::Apis::BigquerydatatransferV1::TransferConfig] transfer_config_object
        # @param [String] authorization_code
        #   Optional OAuth2 authorization code to use with this transfer configuration.
        #   If it is provided, the transfer configuration will be associated with the
        #   authorizing user.
        #   In order to obtain authorization_code, please make a
        #   request to
        #   https://www.gstatic.com/bigquerydatatransfer/oauthz/auth?client_id=<
        #   datatransferapiclientid>&scope=<data_source_scopes>&redirect_uri=<redirect_uri>
        #   * client_id should be OAuth client_id of BigQuery DTS API for the given
        #   data source returned by ListDataSources method.
        #   * data_source_scopes are the scopes returned by ListDataSources method.
        #   * redirect_uri is an optional parameter. If not specified, then
        #   authorization code is posted to the opener of authorization flow window.
        #   Otherwise it will be sent to the redirect uri. A special value of
        #   urn:ietf:wg:oauth:2.0:oob means that authorization code should be
        #   returned in the title bar of the browser, with the page text prompting
        #   the user to copy the code and paste it in the application.
        # @param [String] update_mask
        #   Required. Required list of fields to be updated in this request.
        # @param [String] version_info
        #   Optional version info. If users want to find a very recent access token,
        #   that is, immediately after approving access, users have to set the
        #   version_info claim in the token request. To obtain the version_info, users
        #   must use the "none+gsession" response type. which be return a
        #   version_info back in the authorization response which be be put in a JWT
        #   claim in the token request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::TransferConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::TransferConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_transfer_config(name, transfer_config_object = nil, authorization_code: nil, update_mask: nil, version_info: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::BigquerydatatransferV1::TransferConfig::Representation
          command.request_object = transfer_config_object
          command.response_representation = Google::Apis::BigquerydatatransferV1::TransferConfig::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::TransferConfig
          command.params['name'] = name unless name.nil?
          command.query['authorizationCode'] = authorization_code unless authorization_code.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['versionInfo'] = version_info unless version_info.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates transfer runs for a time range [start_time, end_time].
        # For each date - or whatever granularity the data source supports - in the
        # range, one transfer run is created.
        # Note that runs are created per UTC time in the time range.
        # DEPRECATED: use StartManualTransferRuns instead.
        # @param [String] parent
        #   Required. Transfer configuration name in the form:
        #   `projects/`project_id`/transferConfigs/`config_id``.
        # @param [Google::Apis::BigquerydatatransferV1::ScheduleTransferRunsRequest] schedule_transfer_runs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::ScheduleTransferRunsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::ScheduleTransferRunsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def schedule_project_transfer_config_runs(parent, schedule_transfer_runs_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}:scheduleRuns', options)
          command.request_representation = Google::Apis::BigquerydatatransferV1::ScheduleTransferRunsRequest::Representation
          command.request_object = schedule_transfer_runs_request_object
          command.response_representation = Google::Apis::BigquerydatatransferV1::ScheduleTransferRunsResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::ScheduleTransferRunsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Start manual transfer runs to be executed now with schedule_time equal to
        # current time. The transfer runs can be created for a time range where the
        # run_time is between start_time (inclusive) and end_time (exclusive), or for
        # a specific run_time.
        # @param [String] parent
        #   Transfer configuration name in the form:
        #   `projects/`project_id`/transferConfigs/`config_id``.
        # @param [Google::Apis::BigquerydatatransferV1::StartManualTransferRunsRequest] start_manual_transfer_runs_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::StartManualTransferRunsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::StartManualTransferRunsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def start_project_transfer_config_manual_runs(parent, start_manual_transfer_runs_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}:startManualRuns', options)
          command.request_representation = Google::Apis::BigquerydatatransferV1::StartManualTransferRunsRequest::Representation
          command.request_object = start_manual_transfer_runs_request_object
          command.response_representation = Google::Apis::BigquerydatatransferV1::StartManualTransferRunsResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::StartManualTransferRunsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified transfer run.
        # @param [String] name
        #   Required. The field will contain name of the resource requested, for example:
        #   `projects/`project_id`/transferConfigs/`config_id`/runs/`run_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_transfer_config_run(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::Empty::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns information about the particular transfer run.
        # @param [String] name
        #   Required. The field will contain name of the resource requested, for example:
        #   `projects/`project_id`/transferConfigs/`config_id`/runs/`run_id``
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::TransferRun] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::TransferRun]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_transfer_config_run(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::TransferRun::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::TransferRun
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns information about running and completed jobs.
        # @param [String] parent
        #   Required. Name of transfer configuration for which transfer runs should be
        #   retrieved.
        #   Format of transfer configuration resource name is:
        #   `projects/`project_id`/transferConfigs/`config_id``.
        # @param [Fixnum] page_size
        #   Page size. The default page size is the maximum value of 1000 results.
        # @param [String] page_token
        #   Pagination token, which can be used to request a specific page
        #   of `ListTransferRunsRequest` list results. For multiple-page
        #   results, `ListTransferRunsResponse` outputs
        #   a `next_page` token, which can be used as the
        #   `page_token` value to request the next page of list results.
        # @param [String] run_attempt
        #   Indicates how run attempts are to be pulled.
        # @param [Array<String>, String] states
        #   When specified, only transfer runs with requested states are returned.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::ListTransferRunsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::ListTransferRunsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_transfer_config_runs(parent, page_size: nil, page_token: nil, run_attempt: nil, states: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/runs', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::ListTransferRunsResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::ListTransferRunsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['runAttempt'] = run_attempt unless run_attempt.nil?
          command.query['states'] = states unless states.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns user facing log messages for the data transfer run.
        # @param [String] parent
        #   Required. Transfer run name in the form:
        #   `projects/`project_id`/transferConfigs/`config_Id`/runs/`run_id``.
        # @param [Array<String>, String] message_types
        #   Message types to return. If not populated - INFO, WARNING and ERROR
        #   messages are returned.
        # @param [Fixnum] page_size
        #   Page size. The default page size is the maximum value of 1000 results.
        # @param [String] page_token
        #   Pagination token, which can be used to request a specific page
        #   of `ListTransferLogsRequest` list results. For multiple-page
        #   results, `ListTransferLogsResponse` outputs
        #   a `next_page` token, which can be used as the
        #   `page_token` value to request the next page of list results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::BigquerydatatransferV1::ListTransferLogsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::BigquerydatatransferV1::ListTransferLogsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_transfer_config_run_transfer_logs(parent, message_types: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/transferLogs', options)
          command.response_representation = Google::Apis::BigquerydatatransferV1::ListTransferLogsResponse::Representation
          command.response_class = Google::Apis::BigquerydatatransferV1::ListTransferLogsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['messageTypes'] = message_types unless message_types.nil?
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
