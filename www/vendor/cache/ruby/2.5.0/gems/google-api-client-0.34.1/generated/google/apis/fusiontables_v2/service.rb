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
    module FusiontablesV2
      # Fusion Tables API
      #
      # API for working with Fusion Tables data.
      #
      # @example
      #    require 'google/apis/fusiontables_v2'
      #
      #    Fusiontables = Google::Apis::FusiontablesV2 # Alias the module
      #    service = Fusiontables::FusiontablesService.new
      #
      # @see https://developers.google.com/fusiontables
      class FusiontablesService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  An opaque string that represents a user for quota purposes. Must not exceed 40
        #  characters.
        attr_accessor :quota_user

        # @return [String]
        #  Deprecated. Please use quotaUser instead.
        attr_accessor :user_ip

        def initialize
          super('https://www.googleapis.com/', 'fusiontables/v2/')
          @batch_path = 'batch/fusiontables/v2'
        end
        
        # Deletes the specified column.
        # @param [String] table_id
        #   Table from which the column is being deleted.
        # @param [String] column_id
        #   Name or identifier for the column being deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_column(table_id, column_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'tables/{tableId}/columns/{columnId}', options)
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['columnId'] = column_id unless column_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a specific column by its ID.
        # @param [String] table_id
        #   Table to which the column belongs.
        # @param [String] column_id
        #   Name or identifier for the column that is being requested.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Column] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Column]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_column(table_id, column_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'tables/{tableId}/columns/{columnId}', options)
          command.response_representation = Google::Apis::FusiontablesV2::Column::Representation
          command.response_class = Google::Apis::FusiontablesV2::Column
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['columnId'] = column_id unless column_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a new column to the table.
        # @param [String] table_id
        #   Table for which a new column is being added.
        # @param [Google::Apis::FusiontablesV2::Column] column_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Column] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Column]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_column(table_id, column_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'tables/{tableId}/columns', options)
          command.request_representation = Google::Apis::FusiontablesV2::Column::Representation
          command.request_object = column_object
          command.response_representation = Google::Apis::FusiontablesV2::Column::Representation
          command.response_class = Google::Apis::FusiontablesV2::Column
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of columns.
        # @param [String] table_id
        #   Table whose columns are being listed.
        # @param [Fixnum] max_results
        #   Maximum number of columns to return. Default is 5.
        # @param [String] page_token
        #   Continuation token specifying which result page to return.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::ColumnList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::ColumnList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_columns(table_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'tables/{tableId}/columns', options)
          command.response_representation = Google::Apis::FusiontablesV2::ColumnList::Representation
          command.response_class = Google::Apis::FusiontablesV2::ColumnList
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the name or type of an existing column. This method supports patch
        # semantics.
        # @param [String] table_id
        #   Table for which the column is being updated.
        # @param [String] column_id
        #   Name or identifier for the column that is being updated.
        # @param [Google::Apis::FusiontablesV2::Column] column_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Column] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Column]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_column(table_id, column_id, column_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'tables/{tableId}/columns/{columnId}', options)
          command.request_representation = Google::Apis::FusiontablesV2::Column::Representation
          command.request_object = column_object
          command.response_representation = Google::Apis::FusiontablesV2::Column::Representation
          command.response_class = Google::Apis::FusiontablesV2::Column
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['columnId'] = column_id unless column_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the name or type of an existing column.
        # @param [String] table_id
        #   Table for which the column is being updated.
        # @param [String] column_id
        #   Name or identifier for the column that is being updated.
        # @param [Google::Apis::FusiontablesV2::Column] column_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Column] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Column]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_column(table_id, column_id, column_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'tables/{tableId}/columns/{columnId}', options)
          command.request_representation = Google::Apis::FusiontablesV2::Column::Representation
          command.request_object = column_object
          command.response_representation = Google::Apis::FusiontablesV2::Column::Representation
          command.response_class = Google::Apis::FusiontablesV2::Column
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['columnId'] = column_id unless column_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Executes a Fusion Tables SQL statement, which can be any of
        # - SELECT
        # - INSERT
        # - UPDATE
        # - DELETE
        # - SHOW
        # - DESCRIBE
        # - CREATE statement.
        # @param [String] sql
        #   A Fusion Tables SQL statement, which can be any of
        #   - SELECT
        #   - INSERT
        #   - UPDATE
        #   - DELETE
        #   - SHOW
        #   - DESCRIBE
        #   - CREATE
        # @param [Boolean] hdrs
        #   Whether column names are included in the first row. Default is true.
        # @param [Boolean] typed
        #   Whether typed values are returned in the (JSON) response: numbers for numeric
        #   values and parsed geometries for KML values. Default is true.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Sqlresponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Sqlresponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def sql_query(sql, hdrs: nil, typed: nil, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command = make_simple_command(:post, 'query', options)
          else
            command = make_download_command(:post, 'query', options)
            command.download_dest = download_dest
          end
          command.response_representation = Google::Apis::FusiontablesV2::Sqlresponse::Representation
          command.response_class = Google::Apis::FusiontablesV2::Sqlresponse
          command.query['hdrs'] = hdrs unless hdrs.nil?
          command.query['sql'] = sql unless sql.nil?
          command.query['typed'] = typed unless typed.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Executes a SQL statement which can be any of
        # - SELECT
        # - SHOW
        # - DESCRIBE
        # @param [String] sql
        #   A SQL statement which can be any of
        #   - SELECT
        #   - SHOW
        #   - DESCRIBE
        # @param [Boolean] hdrs
        #   Whether column names are included (in the first row). Default is true.
        # @param [Boolean] typed
        #   Whether typed values are returned in the (JSON) response: numbers for numeric
        #   values and parsed geometries for KML values. Default is true.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Sqlresponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Sqlresponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def sql_query_get(sql, hdrs: nil, typed: nil, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command = make_simple_command(:get, 'query', options)
          else
            command = make_download_command(:get, 'query', options)
            command.download_dest = download_dest
          end
          command.response_representation = Google::Apis::FusiontablesV2::Sqlresponse::Representation
          command.response_class = Google::Apis::FusiontablesV2::Sqlresponse
          command.query['hdrs'] = hdrs unless hdrs.nil?
          command.query['sql'] = sql unless sql.nil?
          command.query['typed'] = typed unless typed.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a style.
        # @param [String] table_id
        #   Table from which the style is being deleted
        # @param [Fixnum] style_id
        #   Identifier (within a table) for the style being deleted
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_style(table_id, style_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'tables/{tableId}/styles/{styleId}', options)
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['styleId'] = style_id unless style_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a specific style.
        # @param [String] table_id
        #   Table to which the requested style belongs
        # @param [Fixnum] style_id
        #   Identifier (integer) for a specific style in a table
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::StyleSetting] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::StyleSetting]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_style(table_id, style_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'tables/{tableId}/styles/{styleId}', options)
          command.response_representation = Google::Apis::FusiontablesV2::StyleSetting::Representation
          command.response_class = Google::Apis::FusiontablesV2::StyleSetting
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['styleId'] = style_id unless style_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds a new style for the table.
        # @param [String] table_id
        #   Table for which a new style is being added
        # @param [Google::Apis::FusiontablesV2::StyleSetting] style_setting_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::StyleSetting] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::StyleSetting]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_style(table_id, style_setting_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'tables/{tableId}/styles', options)
          command.request_representation = Google::Apis::FusiontablesV2::StyleSetting::Representation
          command.request_object = style_setting_object
          command.response_representation = Google::Apis::FusiontablesV2::StyleSetting::Representation
          command.response_class = Google::Apis::FusiontablesV2::StyleSetting
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of styles.
        # @param [String] table_id
        #   Table whose styles are being listed
        # @param [Fixnum] max_results
        #   Maximum number of styles to return. Optional. Default is 5.
        # @param [String] page_token
        #   Continuation token specifying which result page to return. Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::StyleSettingList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::StyleSettingList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_styles(table_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'tables/{tableId}/styles', options)
          command.response_representation = Google::Apis::FusiontablesV2::StyleSettingList::Representation
          command.response_class = Google::Apis::FusiontablesV2::StyleSettingList
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing style. This method supports patch semantics.
        # @param [String] table_id
        #   Table whose style is being updated.
        # @param [Fixnum] style_id
        #   Identifier (within a table) for the style being updated.
        # @param [Google::Apis::FusiontablesV2::StyleSetting] style_setting_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::StyleSetting] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::StyleSetting]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_style(table_id, style_id, style_setting_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'tables/{tableId}/styles/{styleId}', options)
          command.request_representation = Google::Apis::FusiontablesV2::StyleSetting::Representation
          command.request_object = style_setting_object
          command.response_representation = Google::Apis::FusiontablesV2::StyleSetting::Representation
          command.response_class = Google::Apis::FusiontablesV2::StyleSetting
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['styleId'] = style_id unless style_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing style.
        # @param [String] table_id
        #   Table whose style is being updated.
        # @param [Fixnum] style_id
        #   Identifier (within a table) for the style being updated.
        # @param [Google::Apis::FusiontablesV2::StyleSetting] style_setting_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::StyleSetting] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::StyleSetting]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_style(table_id, style_id, style_setting_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'tables/{tableId}/styles/{styleId}', options)
          command.request_representation = Google::Apis::FusiontablesV2::StyleSetting::Representation
          command.request_object = style_setting_object
          command.response_representation = Google::Apis::FusiontablesV2::StyleSetting::Representation
          command.response_class = Google::Apis::FusiontablesV2::StyleSetting
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['styleId'] = style_id unless style_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Copies a table.
        # @param [String] table_id
        #   ID of the table that is being copied.
        # @param [Boolean] copy_presentation
        #   Whether to also copy tabs, styles, and templates. Default is false.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Table] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Table]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def copy_table(table_id, copy_presentation: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'tables/{tableId}/copy', options)
          command.response_representation = Google::Apis::FusiontablesV2::Table::Representation
          command.response_class = Google::Apis::FusiontablesV2::Table
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['copyPresentation'] = copy_presentation unless copy_presentation.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a table.
        # @param [String] table_id
        #   ID of the table to be deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_table(table_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'tables/{tableId}', options)
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a specific table by its ID.
        # @param [String] table_id
        #   Identifier for the table being requested.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Table] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Table]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_table(table_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'tables/{tableId}', options)
          command.response_representation = Google::Apis::FusiontablesV2::Table::Representation
          command.response_class = Google::Apis::FusiontablesV2::Table
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Imports more rows into a table.
        # @param [String] table_id
        #   The table into which new rows are being imported.
        # @param [String] delimiter
        #   The delimiter used to separate cell values. This can only consist of a single
        #   character. Default is ,.
        # @param [String] encoding
        #   The encoding of the content. Default is UTF-8. Use auto-detect if you are
        #   unsure of the encoding.
        # @param [Fixnum] end_line
        #   The index of the line up to which data will be imported. Default is to import
        #   the entire file. If endLine is negative, it is an offset from the end of the
        #   file; the imported content will exclude the last endLine lines.
        # @param [Boolean] is_strict
        #   Whether the imported CSV must have the same number of values for each row. If
        #   false, rows with fewer values will be padded with empty values. Default is
        #   true.
        # @param [Fixnum] start_line
        #   The index of the first line from which to start importing, inclusive. Default
        #   is 0.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Import] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Import]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def import_rows(table_id, delimiter: nil, encoding: nil, end_line: nil, is_strict: nil, start_line: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'tables/{tableId}/import', options)
          else
            command = make_upload_command(:post, 'tables/{tableId}/import', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.response_representation = Google::Apis::FusiontablesV2::Import::Representation
          command.response_class = Google::Apis::FusiontablesV2::Import
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['delimiter'] = delimiter unless delimiter.nil?
          command.query['encoding'] = encoding unless encoding.nil?
          command.query['endLine'] = end_line unless end_line.nil?
          command.query['isStrict'] = is_strict unless is_strict.nil?
          command.query['startLine'] = start_line unless start_line.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Imports a new table.
        # @param [String] name
        #   The name to be assigned to the new table.
        # @param [String] delimiter
        #   The delimiter used to separate cell values. This can only consist of a single
        #   character. Default is ,.
        # @param [String] encoding
        #   The encoding of the content. Default is UTF-8. Use auto-detect if you are
        #   unsure of the encoding.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Table] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Table]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def import_table(name, delimiter: nil, encoding: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'tables/import', options)
          else
            command = make_upload_command(:post, 'tables/import', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.response_representation = Google::Apis::FusiontablesV2::Table::Representation
          command.response_class = Google::Apis::FusiontablesV2::Table
          command.query['delimiter'] = delimiter unless delimiter.nil?
          command.query['encoding'] = encoding unless encoding.nil?
          command.query['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new table.
        # @param [Google::Apis::FusiontablesV2::Table] table_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Table] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Table]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_table(table_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'tables', options)
          command.request_representation = Google::Apis::FusiontablesV2::Table::Representation
          command.request_object = table_object
          command.response_representation = Google::Apis::FusiontablesV2::Table::Representation
          command.response_class = Google::Apis::FusiontablesV2::Table
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of tables a user owns.
        # @param [Fixnum] max_results
        #   Maximum number of tables to return. Default is 5.
        # @param [String] page_token
        #   Continuation token specifying which result page to return.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::TableList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::TableList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_tables(max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'tables', options)
          command.response_representation = Google::Apis::FusiontablesV2::TableList::Representation
          command.response_class = Google::Apis::FusiontablesV2::TableList
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing table. Unless explicitly requested, only the name,
        # description, and attribution will be updated. This method supports patch
        # semantics.
        # @param [String] table_id
        #   ID of the table that is being updated.
        # @param [Google::Apis::FusiontablesV2::Table] table_object
        # @param [Boolean] replace_view_definition
        #   Whether the view definition is also updated. The specified view definition
        #   replaces the existing one. Only a view can be updated with a new definition.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Table] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Table]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_table(table_id, table_object = nil, replace_view_definition: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'tables/{tableId}', options)
          command.request_representation = Google::Apis::FusiontablesV2::Table::Representation
          command.request_object = table_object
          command.response_representation = Google::Apis::FusiontablesV2::Table::Representation
          command.response_class = Google::Apis::FusiontablesV2::Table
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['replaceViewDefinition'] = replace_view_definition unless replace_view_definition.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Replaces rows of the table with the rows of the spreadsheet that is first
        # imported from. Current rows remain visible until all replacement rows are
        # ready.
        # @param [String] table_id
        #   Table whose rows will be replaced from the spreadsheet.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Task] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Task]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def refetch_table_sheet(table_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'tables/{tableId}/refetch', options)
          command.response_representation = Google::Apis::FusiontablesV2::Task::Representation
          command.response_class = Google::Apis::FusiontablesV2::Task
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Replaces rows of an existing table. Current rows remain visible until all
        # replacement rows are ready.
        # @param [String] table_id
        #   Table whose rows will be replaced.
        # @param [String] delimiter
        #   The delimiter used to separate cell values. This can only consist of a single
        #   character. Default is ,.
        # @param [String] encoding
        #   The encoding of the content. Default is UTF-8. Use 'auto-detect' if you are
        #   unsure of the encoding.
        # @param [Fixnum] end_line
        #   The index of the line up to which data will be imported. Default is to import
        #   the entire file. If endLine is negative, it is an offset from the end of the
        #   file; the imported content will exclude the last endLine lines.
        # @param [Boolean] is_strict
        #   Whether the imported CSV must have the same number of column values for each
        #   row. If true, throws an exception if the CSV does not have the same number of
        #   columns. If false, rows with fewer column values will be padded with empty
        #   values. Default is true.
        # @param [Fixnum] start_line
        #   The index of the first line from which to start importing, inclusive. Default
        #   is 0.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Task] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Task]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def replace_table_rows(table_id, delimiter: nil, encoding: nil, end_line: nil, is_strict: nil, start_line: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command = make_simple_command(:post, 'tables/{tableId}/replace', options)
          else
            command = make_upload_command(:post, 'tables/{tableId}/replace', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.response_representation = Google::Apis::FusiontablesV2::Task::Representation
          command.response_class = Google::Apis::FusiontablesV2::Task
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['delimiter'] = delimiter unless delimiter.nil?
          command.query['encoding'] = encoding unless encoding.nil?
          command.query['endLine'] = end_line unless end_line.nil?
          command.query['isStrict'] = is_strict unless is_strict.nil?
          command.query['startLine'] = start_line unless start_line.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing table. Unless explicitly requested, only the name,
        # description, and attribution will be updated.
        # @param [String] table_id
        #   ID of the table that is being updated.
        # @param [Google::Apis::FusiontablesV2::Table] table_object
        # @param [Boolean] replace_view_definition
        #   Whether the view definition is also updated. The specified view definition
        #   replaces the existing one. Only a view can be updated with a new definition.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Table] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Table]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_table(table_id, table_object = nil, replace_view_definition: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'tables/{tableId}', options)
          command.request_representation = Google::Apis::FusiontablesV2::Table::Representation
          command.request_object = table_object
          command.response_representation = Google::Apis::FusiontablesV2::Table::Representation
          command.response_class = Google::Apis::FusiontablesV2::Table
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['replaceViewDefinition'] = replace_view_definition unless replace_view_definition.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a specific task by its ID, unless that task has already started
        # running.
        # @param [String] table_id
        #   Table from which the task is being deleted.
        # @param [String] task_id
        #   The identifier of the task to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_task(table_id, task_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'tables/{tableId}/tasks/{taskId}', options)
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['taskId'] = task_id unless task_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a specific task by its ID.
        # @param [String] table_id
        #   Table to which the task belongs.
        # @param [String] task_id
        #   The identifier of the task to get.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Task] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Task]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_task(table_id, task_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'tables/{tableId}/tasks/{taskId}', options)
          command.response_representation = Google::Apis::FusiontablesV2::Task::Representation
          command.response_class = Google::Apis::FusiontablesV2::Task
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['taskId'] = task_id unless task_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of tasks.
        # @param [String] table_id
        #   Table whose tasks are being listed.
        # @param [Fixnum] max_results
        #   Maximum number of tasks to return. Default is 5.
        # @param [String] page_token
        #   Continuation token specifying which result page to return.
        # @param [Fixnum] start_index
        #   Index of the first result returned in the current page.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::TaskList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::TaskList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_tasks(table_id, max_results: nil, page_token: nil, start_index: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'tables/{tableId}/tasks', options)
          command.response_representation = Google::Apis::FusiontablesV2::TaskList::Representation
          command.response_class = Google::Apis::FusiontablesV2::TaskList
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startIndex'] = start_index unless start_index.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a template
        # @param [String] table_id
        #   Table from which the template is being deleted
        # @param [Fixnum] template_id
        #   Identifier for the template which is being deleted
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_template(table_id, template_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, 'tables/{tableId}/templates/{templateId}', options)
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['templateId'] = template_id unless template_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a specific template by its id
        # @param [String] table_id
        #   Table to which the template belongs
        # @param [Fixnum] template_id
        #   Identifier for the template that is being requested
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Template] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Template]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_template(table_id, template_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'tables/{tableId}/templates/{templateId}', options)
          command.response_representation = Google::Apis::FusiontablesV2::Template::Representation
          command.response_class = Google::Apis::FusiontablesV2::Template
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['templateId'] = template_id unless template_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new template for the table.
        # @param [String] table_id
        #   Table for which a new template is being created
        # @param [Google::Apis::FusiontablesV2::Template] template_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Template] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Template]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_template(table_id, template_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'tables/{tableId}/templates', options)
          command.request_representation = Google::Apis::FusiontablesV2::Template::Representation
          command.request_object = template_object
          command.response_representation = Google::Apis::FusiontablesV2::Template::Representation
          command.response_class = Google::Apis::FusiontablesV2::Template
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieves a list of templates.
        # @param [String] table_id
        #   Identifier for the table whose templates are being requested
        # @param [Fixnum] max_results
        #   Maximum number of templates to return. Optional. Default is 5.
        # @param [String] page_token
        #   Continuation token specifying which results page to return. Optional.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::TemplateList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::TemplateList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_templates(table_id, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'tables/{tableId}/templates', options)
          command.response_representation = Google::Apis::FusiontablesV2::TemplateList::Representation
          command.response_class = Google::Apis::FusiontablesV2::TemplateList
          command.params['tableId'] = table_id unless table_id.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing template. This method supports patch semantics.
        # @param [String] table_id
        #   Table to which the updated template belongs
        # @param [Fixnum] template_id
        #   Identifier for the template that is being updated
        # @param [Google::Apis::FusiontablesV2::Template] template_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Template] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Template]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_template(table_id, template_id, template_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'tables/{tableId}/templates/{templateId}', options)
          command.request_representation = Google::Apis::FusiontablesV2::Template::Representation
          command.request_object = template_object
          command.response_representation = Google::Apis::FusiontablesV2::Template::Representation
          command.response_class = Google::Apis::FusiontablesV2::Template
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['templateId'] = template_id unless template_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates an existing template
        # @param [String] table_id
        #   Table to which the updated template belongs
        # @param [Fixnum] template_id
        #   Identifier for the template that is being updated
        # @param [Google::Apis::FusiontablesV2::Template] template_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FusiontablesV2::Template] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FusiontablesV2::Template]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_template(table_id, template_id, template_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'tables/{tableId}/templates/{templateId}', options)
          command.request_representation = Google::Apis::FusiontablesV2::Template::Representation
          command.request_object = template_object
          command.response_representation = Google::Apis::FusiontablesV2::Template::Representation
          command.response_class = Google::Apis::FusiontablesV2::Template
          command.params['tableId'] = table_id unless table_id.nil?
          command.params['templateId'] = template_id unless template_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
        end
      end
    end
  end
end
