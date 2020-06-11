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
    module SheetsV4
      # Google Sheets API
      #
      # Reads and writes Google Sheets.
      #
      # @example
      #    require 'google/apis/sheets_v4'
      #
      #    Sheets = Google::Apis::SheetsV4 # Alias the module
      #    service = Sheets::SheetsService.new
      #
      # @see https://developers.google.com/sheets/
      class SheetsService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://sheets.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Applies one or more updates to the spreadsheet.
        # Each request is validated before
        # being applied. If any request is not valid then the entire request will
        # fail and nothing will be applied.
        # Some requests have replies to
        # give you some information about how
        # they are applied. The replies will mirror the requests.  For example,
        # if you applied 4 updates and the 3rd one had a reply, then the
        # response will have 2 empty replies, the actual reply, and another empty
        # reply, in that order.
        # Due to the collaborative nature of spreadsheets, it is not guaranteed that
        # the spreadsheet will reflect exactly your changes after this completes,
        # however it is guaranteed that the updates in the request will be
        # applied together atomically. Your changes may be altered with respect to
        # collaborator changes. If there are no collaborators, the spreadsheet
        # should reflect your changes.
        # @param [String] spreadsheet_id
        #   The spreadsheet to apply the updates to.
        # @param [Google::Apis::SheetsV4::BatchUpdateSpreadsheetRequest] batch_update_spreadsheet_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::BatchUpdateSpreadsheetResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::BatchUpdateSpreadsheetResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_update_spreadsheet(spreadsheet_id, batch_update_spreadsheet_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/spreadsheets/{spreadsheetId}:batchUpdate', options)
          command.request_representation = Google::Apis::SheetsV4::BatchUpdateSpreadsheetRequest::Representation
          command.request_object = batch_update_spreadsheet_request_object
          command.response_representation = Google::Apis::SheetsV4::BatchUpdateSpreadsheetResponse::Representation
          command.response_class = Google::Apis::SheetsV4::BatchUpdateSpreadsheetResponse
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a spreadsheet, returning the newly created spreadsheet.
        # @param [Google::Apis::SheetsV4::Spreadsheet] spreadsheet_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::Spreadsheet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::Spreadsheet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_spreadsheet(spreadsheet_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/spreadsheets', options)
          command.request_representation = Google::Apis::SheetsV4::Spreadsheet::Representation
          command.request_object = spreadsheet_object
          command.response_representation = Google::Apis::SheetsV4::Spreadsheet::Representation
          command.response_class = Google::Apis::SheetsV4::Spreadsheet
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the spreadsheet at the given ID.
        # The caller must specify the spreadsheet ID.
        # By default, data within grids will not be returned.
        # You can include grid data one of two ways:
        # * Specify a field mask listing your desired fields using the `fields` URL
        # parameter in HTTP
        # * Set the includeGridData
        # URL parameter to true.  If a field mask is set, the `includeGridData`
        # parameter is ignored
        # For large spreadsheets, it is recommended to retrieve only the specific
        # fields of the spreadsheet that you want.
        # To retrieve only subsets of the spreadsheet, use the
        # ranges URL parameter.
        # Multiple ranges can be specified.  Limiting the range will
        # return only the portions of the spreadsheet that intersect the requested
        # ranges. Ranges are specified using A1 notation.
        # @param [String] spreadsheet_id
        #   The spreadsheet to request.
        # @param [Boolean] include_grid_data
        #   True if grid data should be returned.
        #   This parameter is ignored if a field mask was set in the request.
        # @param [Array<String>, String] ranges
        #   The ranges to retrieve from the spreadsheet.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::Spreadsheet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::Spreadsheet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_spreadsheet(spreadsheet_id, include_grid_data: nil, ranges: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v4/spreadsheets/{spreadsheetId}', options)
          command.response_representation = Google::Apis::SheetsV4::Spreadsheet::Representation
          command.response_class = Google::Apis::SheetsV4::Spreadsheet
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['includeGridData'] = include_grid_data unless include_grid_data.nil?
          command.query['ranges'] = ranges unless ranges.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the spreadsheet at the given ID.
        # The caller must specify the spreadsheet ID.
        # This method differs from GetSpreadsheet in that it allows selecting
        # which subsets of spreadsheet data to return by specifying a
        # dataFilters parameter.
        # Multiple DataFilters can be specified.  Specifying one or
        # more data filters will return the portions of the spreadsheet that
        # intersect ranges matched by any of the filters.
        # By default, data within grids will not be returned.
        # You can include grid data one of two ways:
        # * Specify a field mask listing your desired fields using the `fields` URL
        # parameter in HTTP
        # * Set the includeGridData
        # parameter to true.  If a field mask is set, the `includeGridData`
        # parameter is ignored
        # For large spreadsheets, it is recommended to retrieve only the specific
        # fields of the spreadsheet that you want.
        # @param [String] spreadsheet_id
        #   The spreadsheet to request.
        # @param [Google::Apis::SheetsV4::GetSpreadsheetByDataFilterRequest] get_spreadsheet_by_data_filter_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::Spreadsheet] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::Spreadsheet]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_spreadsheet_by_data_filter(spreadsheet_id, get_spreadsheet_by_data_filter_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/spreadsheets/{spreadsheetId}:getByDataFilter', options)
          command.request_representation = Google::Apis::SheetsV4::GetSpreadsheetByDataFilterRequest::Representation
          command.request_object = get_spreadsheet_by_data_filter_request_object
          command.response_representation = Google::Apis::SheetsV4::Spreadsheet::Representation
          command.response_class = Google::Apis::SheetsV4::Spreadsheet
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the developer metadata with the specified ID.
        # The caller must specify the spreadsheet ID and the developer metadata's
        # unique metadataId.
        # @param [String] spreadsheet_id
        #   The ID of the spreadsheet to retrieve metadata from.
        # @param [Fixnum] metadata_id
        #   The ID of the developer metadata to retrieve.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::DeveloperMetadata] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::DeveloperMetadata]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_spreadsheet_developer_metadatum(spreadsheet_id, metadata_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v4/spreadsheets/{spreadsheetId}/developerMetadata/{metadataId}', options)
          command.response_representation = Google::Apis::SheetsV4::DeveloperMetadata::Representation
          command.response_class = Google::Apis::SheetsV4::DeveloperMetadata
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.params['metadataId'] = metadata_id unless metadata_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns all developer metadata matching the specified DataFilter.
        # If the provided DataFilter represents a DeveloperMetadataLookup object,
        # this will return all DeveloperMetadata entries selected by it. If the
        # DataFilter represents a location in a spreadsheet, this will return all
        # developer metadata associated with locations intersecting that region.
        # @param [String] spreadsheet_id
        #   The ID of the spreadsheet to retrieve metadata from.
        # @param [Google::Apis::SheetsV4::SearchDeveloperMetadataRequest] search_developer_metadata_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::SearchDeveloperMetadataResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::SearchDeveloperMetadataResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_developer_metadatum_developer_metadata(spreadsheet_id, search_developer_metadata_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/spreadsheets/{spreadsheetId}/developerMetadata:search', options)
          command.request_representation = Google::Apis::SheetsV4::SearchDeveloperMetadataRequest::Representation
          command.request_object = search_developer_metadata_request_object
          command.response_representation = Google::Apis::SheetsV4::SearchDeveloperMetadataResponse::Representation
          command.response_class = Google::Apis::SheetsV4::SearchDeveloperMetadataResponse
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Copies a single sheet from a spreadsheet to another spreadsheet.
        # Returns the properties of the newly created sheet.
        # @param [String] spreadsheet_id
        #   The ID of the spreadsheet containing the sheet to copy.
        # @param [Fixnum] sheet_id
        #   The ID of the sheet to copy.
        # @param [Google::Apis::SheetsV4::CopySheetToAnotherSpreadsheetRequest] copy_sheet_to_another_spreadsheet_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::SheetProperties] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::SheetProperties]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def copy_spreadsheet(spreadsheet_id, sheet_id, copy_sheet_to_another_spreadsheet_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/spreadsheets/{spreadsheetId}/sheets/{sheetId}:copyTo', options)
          command.request_representation = Google::Apis::SheetsV4::CopySheetToAnotherSpreadsheetRequest::Representation
          command.request_object = copy_sheet_to_another_spreadsheet_request_object
          command.response_representation = Google::Apis::SheetsV4::SheetProperties::Representation
          command.response_class = Google::Apis::SheetsV4::SheetProperties
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.params['sheetId'] = sheet_id unless sheet_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Appends values to a spreadsheet. The input range is used to search for
        # existing data and find a "table" within that range. Values will be
        # appended to the next row of the table, starting with the first column of
        # the table. See the
        # [guide](/sheets/api/guides/values#appending_values)
        # and
        # [sample code](/sheets/api/samples/writing#append_values)
        # for specific details of how tables are detected and data is appended.
        # The caller must specify the spreadsheet ID, range, and
        # a valueInputOption.  The `valueInputOption` only
        # controls how the input data will be added to the sheet (column-wise or
        # row-wise), it does not influence what cell the data starts being written
        # to.
        # @param [String] spreadsheet_id
        #   The ID of the spreadsheet to update.
        # @param [String] range
        #   The A1 notation of a range to search for a logical table of data.
        #   Values will be appended after the last row of the table.
        # @param [Google::Apis::SheetsV4::ValueRange] value_range_object
        # @param [Boolean] include_values_in_response
        #   Determines if the update response should include the values
        #   of the cells that were appended. By default, responses
        #   do not include the updated values.
        # @param [String] insert_data_option
        #   How the input data should be inserted.
        # @param [String] response_date_time_render_option
        #   Determines how dates, times, and durations in the response should be
        #   rendered. This is ignored if response_value_render_option is
        #   FORMATTED_VALUE.
        #   The default dateTime render option is [DateTimeRenderOption.SERIAL_NUMBER].
        # @param [String] response_value_render_option
        #   Determines how values in the response should be rendered.
        #   The default render option is ValueRenderOption.FORMATTED_VALUE.
        # @param [String] value_input_option
        #   How the input data should be interpreted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::AppendValuesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::AppendValuesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def append_spreadsheet_value(spreadsheet_id, range, value_range_object = nil, include_values_in_response: nil, insert_data_option: nil, response_date_time_render_option: nil, response_value_render_option: nil, value_input_option: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/spreadsheets/{spreadsheetId}/values/{range}:append', options)
          command.request_representation = Google::Apis::SheetsV4::ValueRange::Representation
          command.request_object = value_range_object
          command.response_representation = Google::Apis::SheetsV4::AppendValuesResponse::Representation
          command.response_class = Google::Apis::SheetsV4::AppendValuesResponse
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.params['range'] = range unless range.nil?
          command.query['includeValuesInResponse'] = include_values_in_response unless include_values_in_response.nil?
          command.query['insertDataOption'] = insert_data_option unless insert_data_option.nil?
          command.query['responseDateTimeRenderOption'] = response_date_time_render_option unless response_date_time_render_option.nil?
          command.query['responseValueRenderOption'] = response_value_render_option unless response_value_render_option.nil?
          command.query['valueInputOption'] = value_input_option unless value_input_option.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Clears one or more ranges of values from a spreadsheet.
        # The caller must specify the spreadsheet ID and one or more ranges.
        # Only values are cleared -- all other properties of the cell (such as
        # formatting, data validation, etc..) are kept.
        # @param [String] spreadsheet_id
        #   The ID of the spreadsheet to update.
        # @param [Google::Apis::SheetsV4::BatchClearValuesRequest] batch_clear_values_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::BatchClearValuesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::BatchClearValuesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_clear_values(spreadsheet_id, batch_clear_values_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/spreadsheets/{spreadsheetId}/values:batchClear', options)
          command.request_representation = Google::Apis::SheetsV4::BatchClearValuesRequest::Representation
          command.request_object = batch_clear_values_request_object
          command.response_representation = Google::Apis::SheetsV4::BatchClearValuesResponse::Representation
          command.response_class = Google::Apis::SheetsV4::BatchClearValuesResponse
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Clears one or more ranges of values from a spreadsheet.
        # The caller must specify the spreadsheet ID and one or more
        # DataFilters. Ranges matching any of the specified data
        # filters will be cleared.  Only values are cleared -- all other properties
        # of the cell (such as formatting, data validation, etc..) are kept.
        # @param [String] spreadsheet_id
        #   The ID of the spreadsheet to update.
        # @param [Google::Apis::SheetsV4::BatchClearValuesByDataFilterRequest] batch_clear_values_by_data_filter_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::BatchClearValuesByDataFilterResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::BatchClearValuesByDataFilterResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_spreadsheet_value_clear_by_data_filter(spreadsheet_id, batch_clear_values_by_data_filter_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/spreadsheets/{spreadsheetId}/values:batchClearByDataFilter', options)
          command.request_representation = Google::Apis::SheetsV4::BatchClearValuesByDataFilterRequest::Representation
          command.request_object = batch_clear_values_by_data_filter_request_object
          command.response_representation = Google::Apis::SheetsV4::BatchClearValuesByDataFilterResponse::Representation
          command.response_class = Google::Apis::SheetsV4::BatchClearValuesByDataFilterResponse
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns one or more ranges of values from a spreadsheet.
        # The caller must specify the spreadsheet ID and one or more ranges.
        # @param [String] spreadsheet_id
        #   The ID of the spreadsheet to retrieve data from.
        # @param [String] date_time_render_option
        #   How dates, times, and durations should be represented in the output.
        #   This is ignored if value_render_option is
        #   FORMATTED_VALUE.
        #   The default dateTime render option is [DateTimeRenderOption.SERIAL_NUMBER].
        # @param [String] major_dimension
        #   The major dimension that results should use.
        #   For example, if the spreadsheet data is: `A1=1,B1=2,A2=3,B2=4`,
        #   then requesting `range=A1:B2,majorDimension=ROWS` will return
        #   `[[1,2],[3,4]]`,
        #   whereas requesting `range=A1:B2,majorDimension=COLUMNS` will return
        #   `[[1,3],[2,4]]`.
        # @param [Array<String>, String] ranges
        #   The A1 notation of the values to retrieve.
        # @param [String] value_render_option
        #   How values should be represented in the output.
        #   The default render option is ValueRenderOption.FORMATTED_VALUE.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::BatchGetValuesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::BatchGetValuesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_get_spreadsheet_values(spreadsheet_id, date_time_render_option: nil, major_dimension: nil, ranges: nil, value_render_option: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v4/spreadsheets/{spreadsheetId}/values:batchGet', options)
          command.response_representation = Google::Apis::SheetsV4::BatchGetValuesResponse::Representation
          command.response_class = Google::Apis::SheetsV4::BatchGetValuesResponse
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['dateTimeRenderOption'] = date_time_render_option unless date_time_render_option.nil?
          command.query['majorDimension'] = major_dimension unless major_dimension.nil?
          command.query['ranges'] = ranges unless ranges.nil?
          command.query['valueRenderOption'] = value_render_option unless value_render_option.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns one or more ranges of values that match the specified data filters.
        # The caller must specify the spreadsheet ID and one or more
        # DataFilters.  Ranges that match any of the data filters in
        # the request will be returned.
        # @param [String] spreadsheet_id
        #   The ID of the spreadsheet to retrieve data from.
        # @param [Google::Apis::SheetsV4::BatchGetValuesByDataFilterRequest] batch_get_values_by_data_filter_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::BatchGetValuesByDataFilterResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::BatchGetValuesByDataFilterResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_spreadsheet_value_get_by_data_filter(spreadsheet_id, batch_get_values_by_data_filter_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/spreadsheets/{spreadsheetId}/values:batchGetByDataFilter', options)
          command.request_representation = Google::Apis::SheetsV4::BatchGetValuesByDataFilterRequest::Representation
          command.request_object = batch_get_values_by_data_filter_request_object
          command.response_representation = Google::Apis::SheetsV4::BatchGetValuesByDataFilterResponse::Representation
          command.response_class = Google::Apis::SheetsV4::BatchGetValuesByDataFilterResponse
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets values in one or more ranges of a spreadsheet.
        # The caller must specify the spreadsheet ID,
        # a valueInputOption, and one or more
        # ValueRanges.
        # @param [String] spreadsheet_id
        #   The ID of the spreadsheet to update.
        # @param [Google::Apis::SheetsV4::BatchUpdateValuesRequest] batch_update_values_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::BatchUpdateValuesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::BatchUpdateValuesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_update_values(spreadsheet_id, batch_update_values_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/spreadsheets/{spreadsheetId}/values:batchUpdate', options)
          command.request_representation = Google::Apis::SheetsV4::BatchUpdateValuesRequest::Representation
          command.request_object = batch_update_values_request_object
          command.response_representation = Google::Apis::SheetsV4::BatchUpdateValuesResponse::Representation
          command.response_class = Google::Apis::SheetsV4::BatchUpdateValuesResponse
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets values in one or more ranges of a spreadsheet.
        # The caller must specify the spreadsheet ID,
        # a valueInputOption, and one or more
        # DataFilterValueRanges.
        # @param [String] spreadsheet_id
        #   The ID of the spreadsheet to update.
        # @param [Google::Apis::SheetsV4::BatchUpdateValuesByDataFilterRequest] batch_update_values_by_data_filter_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::BatchUpdateValuesByDataFilterResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::BatchUpdateValuesByDataFilterResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_spreadsheet_value_update_by_data_filter(spreadsheet_id, batch_update_values_by_data_filter_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/spreadsheets/{spreadsheetId}/values:batchUpdateByDataFilter', options)
          command.request_representation = Google::Apis::SheetsV4::BatchUpdateValuesByDataFilterRequest::Representation
          command.request_object = batch_update_values_by_data_filter_request_object
          command.response_representation = Google::Apis::SheetsV4::BatchUpdateValuesByDataFilterResponse::Representation
          command.response_class = Google::Apis::SheetsV4::BatchUpdateValuesByDataFilterResponse
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Clears values from a spreadsheet.
        # The caller must specify the spreadsheet ID and range.
        # Only values are cleared -- all other properties of the cell (such as
        # formatting, data validation, etc..) are kept.
        # @param [String] spreadsheet_id
        #   The ID of the spreadsheet to update.
        # @param [String] range
        #   The A1 notation of the values to clear.
        # @param [Google::Apis::SheetsV4::ClearValuesRequest] clear_values_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::ClearValuesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::ClearValuesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def clear_values(spreadsheet_id, range, clear_values_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v4/spreadsheets/{spreadsheetId}/values/{range}:clear', options)
          command.request_representation = Google::Apis::SheetsV4::ClearValuesRequest::Representation
          command.request_object = clear_values_request_object
          command.response_representation = Google::Apis::SheetsV4::ClearValuesResponse::Representation
          command.response_class = Google::Apis::SheetsV4::ClearValuesResponse
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.params['range'] = range unless range.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns a range of values from a spreadsheet.
        # The caller must specify the spreadsheet ID and a range.
        # @param [String] spreadsheet_id
        #   The ID of the spreadsheet to retrieve data from.
        # @param [String] range
        #   The A1 notation of the values to retrieve.
        # @param [String] date_time_render_option
        #   How dates, times, and durations should be represented in the output.
        #   This is ignored if value_render_option is
        #   FORMATTED_VALUE.
        #   The default dateTime render option is [DateTimeRenderOption.SERIAL_NUMBER].
        # @param [String] major_dimension
        #   The major dimension that results should use.
        #   For example, if the spreadsheet data is: `A1=1,B1=2,A2=3,B2=4`,
        #   then requesting `range=A1:B2,majorDimension=ROWS` will return
        #   `[[1,2],[3,4]]`,
        #   whereas requesting `range=A1:B2,majorDimension=COLUMNS` will return
        #   `[[1,3],[2,4]]`.
        # @param [String] value_render_option
        #   How values should be represented in the output.
        #   The default render option is ValueRenderOption.FORMATTED_VALUE.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::ValueRange] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::ValueRange]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_spreadsheet_values(spreadsheet_id, range, date_time_render_option: nil, major_dimension: nil, value_render_option: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v4/spreadsheets/{spreadsheetId}/values/{range}', options)
          command.response_representation = Google::Apis::SheetsV4::ValueRange::Representation
          command.response_class = Google::Apis::SheetsV4::ValueRange
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.params['range'] = range unless range.nil?
          command.query['dateTimeRenderOption'] = date_time_render_option unless date_time_render_option.nil?
          command.query['majorDimension'] = major_dimension unless major_dimension.nil?
          command.query['valueRenderOption'] = value_render_option unless value_render_option.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets values in a range of a spreadsheet.
        # The caller must specify the spreadsheet ID, range, and
        # a valueInputOption.
        # @param [String] spreadsheet_id
        #   The ID of the spreadsheet to update.
        # @param [String] range
        #   The A1 notation of the values to update.
        # @param [Google::Apis::SheetsV4::ValueRange] value_range_object
        # @param [Boolean] include_values_in_response
        #   Determines if the update response should include the values
        #   of the cells that were updated. By default, responses
        #   do not include the updated values.
        #   If the range to write was larger than than the range actually written,
        #   the response will include all values in the requested range (excluding
        #   trailing empty rows and columns).
        # @param [String] response_date_time_render_option
        #   Determines how dates, times, and durations in the response should be
        #   rendered. This is ignored if response_value_render_option is
        #   FORMATTED_VALUE.
        #   The default dateTime render option is
        #   DateTimeRenderOption.SERIAL_NUMBER.
        # @param [String] response_value_render_option
        #   Determines how values in the response should be rendered.
        #   The default render option is ValueRenderOption.FORMATTED_VALUE.
        # @param [String] value_input_option
        #   How the input data should be interpreted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::SheetsV4::UpdateValuesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::SheetsV4::UpdateValuesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_spreadsheet_value(spreadsheet_id, range, value_range_object = nil, include_values_in_response: nil, response_date_time_render_option: nil, response_value_render_option: nil, value_input_option: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v4/spreadsheets/{spreadsheetId}/values/{range}', options)
          command.request_representation = Google::Apis::SheetsV4::ValueRange::Representation
          command.request_object = value_range_object
          command.response_representation = Google::Apis::SheetsV4::UpdateValuesResponse::Representation
          command.response_class = Google::Apis::SheetsV4::UpdateValuesResponse
          command.params['spreadsheetId'] = spreadsheet_id unless spreadsheet_id.nil?
          command.params['range'] = range unless range.nil?
          command.query['includeValuesInResponse'] = include_values_in_response unless include_values_in_response.nil?
          command.query['responseDateTimeRenderOption'] = response_date_time_render_option unless response_date_time_render_option.nil?
          command.query['responseValueRenderOption'] = response_value_render_option unless response_value_render_option.nil?
          command.query['valueInputOption'] = value_input_option unless value_input_option.nil?
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
