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
    module DoubleclicksearchV2
      # Search Ads 360 API
      #
      # Reports and modifies your advertising data in DoubleClick Search (for example,
      #  campaigns, ad groups, keywords, and conversions).
      #
      # @example
      #    require 'google/apis/doubleclicksearch_v2'
      #
      #    Doubleclicksearch = Google::Apis::DoubleclicksearchV2 # Alias the module
      #    service = Doubleclicksearch::DoubleclicksearchService.new
      #
      # @see https://developers.google.com/doubleclick-search/
      class DoubleclicksearchService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'doubleclicksearch/v2/')
          @batch_path = 'batch/doubleclicksearch/v2'
        end
        
        # Retrieves a list of conversions from a DoubleClick Search engine account.
        # @param [Fixnum] agency_id
        #   Numeric ID of the agency.
        # @param [Fixnum] advertiser_id
        #   Numeric ID of the advertiser.
        # @param [Fixnum] engine_account_id
        #   Numeric ID of the engine account.
        # @param [Fixnum] end_date
        #   Last date (inclusive) on which to retrieve conversions. Format is yyyymmdd.
        # @param [Fixnum] row_count
        #   The number of conversions to return per call.
        # @param [Fixnum] start_date
        #   First date (inclusive) on which to retrieve conversions. Format is yyyymmdd.
        # @param [Fixnum] start_row
        #   The 0-based starting index for retrieving conversions results.
        # @param [Fixnum] ad_group_id
        #   Numeric ID of the ad group.
        # @param [Fixnum] ad_id
        #   Numeric ID of the ad.
        # @param [Fixnum] campaign_id
        #   Numeric ID of the campaign.
        # @param [Fixnum] criterion_id
        #   Numeric ID of the criterion.
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
        # @yieldparam result [Google::Apis::DoubleclicksearchV2::ConversionList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DoubleclicksearchV2::ConversionList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_conversion(agency_id, advertiser_id, engine_account_id, end_date, row_count, start_date, start_row, ad_group_id: nil, ad_id: nil, campaign_id: nil, criterion_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'agency/{agencyId}/advertiser/{advertiserId}/engine/{engineAccountId}/conversion', options)
          command.response_representation = Google::Apis::DoubleclicksearchV2::ConversionList::Representation
          command.response_class = Google::Apis::DoubleclicksearchV2::ConversionList
          command.params['agencyId'] = agency_id unless agency_id.nil?
          command.params['advertiserId'] = advertiser_id unless advertiser_id.nil?
          command.params['engineAccountId'] = engine_account_id unless engine_account_id.nil?
          command.query['adGroupId'] = ad_group_id unless ad_group_id.nil?
          command.query['adId'] = ad_id unless ad_id.nil?
          command.query['campaignId'] = campaign_id unless campaign_id.nil?
          command.query['criterionId'] = criterion_id unless criterion_id.nil?
          command.query['endDate'] = end_date unless end_date.nil?
          command.query['rowCount'] = row_count unless row_count.nil?
          command.query['startDate'] = start_date unless start_date.nil?
          command.query['startRow'] = start_row unless start_row.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a batch of new conversions into DoubleClick Search.
        # @param [Google::Apis::DoubleclicksearchV2::ConversionList] conversion_list_object
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
        # @yieldparam result [Google::Apis::DoubleclicksearchV2::ConversionList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DoubleclicksearchV2::ConversionList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def insert_conversion(conversion_list_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'conversion', options)
          command.request_representation = Google::Apis::DoubleclicksearchV2::ConversionList::Representation
          command.request_object = conversion_list_object
          command.response_representation = Google::Apis::DoubleclicksearchV2::ConversionList::Representation
          command.response_class = Google::Apis::DoubleclicksearchV2::ConversionList
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a batch of conversions in DoubleClick Search. This method supports
        # patch semantics.
        # @param [Fixnum] advertiser_id
        #   Numeric ID of the advertiser.
        # @param [Fixnum] agency_id
        #   Numeric ID of the agency.
        # @param [Fixnum] end_date
        #   Last date (inclusive) on which to retrieve conversions. Format is yyyymmdd.
        # @param [Fixnum] engine_account_id
        #   Numeric ID of the engine account.
        # @param [Fixnum] row_count
        #   The number of conversions to return per call.
        # @param [Fixnum] start_date
        #   First date (inclusive) on which to retrieve conversions. Format is yyyymmdd.
        # @param [Fixnum] start_row
        #   The 0-based starting index for retrieving conversions results.
        # @param [Google::Apis::DoubleclicksearchV2::ConversionList] conversion_list_object
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
        # @yieldparam result [Google::Apis::DoubleclicksearchV2::ConversionList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DoubleclicksearchV2::ConversionList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_conversion(advertiser_id, agency_id, end_date, engine_account_id, row_count, start_date, start_row, conversion_list_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, 'conversion', options)
          command.request_representation = Google::Apis::DoubleclicksearchV2::ConversionList::Representation
          command.request_object = conversion_list_object
          command.response_representation = Google::Apis::DoubleclicksearchV2::ConversionList::Representation
          command.response_class = Google::Apis::DoubleclicksearchV2::ConversionList
          command.query['advertiserId'] = advertiser_id unless advertiser_id.nil?
          command.query['agencyId'] = agency_id unless agency_id.nil?
          command.query['endDate'] = end_date unless end_date.nil?
          command.query['engineAccountId'] = engine_account_id unless engine_account_id.nil?
          command.query['rowCount'] = row_count unless row_count.nil?
          command.query['startDate'] = start_date unless start_date.nil?
          command.query['startRow'] = start_row unless start_row.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a batch of conversions in DoubleClick Search.
        # @param [Google::Apis::DoubleclicksearchV2::ConversionList] conversion_list_object
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
        # @yieldparam result [Google::Apis::DoubleclicksearchV2::ConversionList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DoubleclicksearchV2::ConversionList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_conversion(conversion_list_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, 'conversion', options)
          command.request_representation = Google::Apis::DoubleclicksearchV2::ConversionList::Representation
          command.request_object = conversion_list_object
          command.response_representation = Google::Apis::DoubleclicksearchV2::ConversionList::Representation
          command.response_class = Google::Apis::DoubleclicksearchV2::ConversionList
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the availabilities of a batch of floodlight activities in DoubleClick
        # Search.
        # @param [Google::Apis::DoubleclicksearchV2::UpdateAvailabilityRequest] update_availability_request_object
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
        # @yieldparam result [Google::Apis::DoubleclicksearchV2::UpdateAvailabilityResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DoubleclicksearchV2::UpdateAvailabilityResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_conversion_availability(update_availability_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'conversion/updateAvailability', options)
          command.request_representation = Google::Apis::DoubleclicksearchV2::UpdateAvailabilityRequest::Representation
          command.request_object = update_availability_request_object
          command.response_representation = Google::Apis::DoubleclicksearchV2::UpdateAvailabilityResponse::Representation
          command.response_class = Google::Apis::DoubleclicksearchV2::UpdateAvailabilityResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generates and returns a report immediately.
        # @param [Google::Apis::DoubleclicksearchV2::ReportRequest] report_request_object
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
        # @yieldparam result [Google::Apis::DoubleclicksearchV2::Report] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DoubleclicksearchV2::Report]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def generate_report(report_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'reports/generate', options)
          command.request_representation = Google::Apis::DoubleclicksearchV2::ReportRequest::Representation
          command.request_object = report_request_object
          command.response_representation = Google::Apis::DoubleclicksearchV2::Report::Representation
          command.response_class = Google::Apis::DoubleclicksearchV2::Report
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Polls for the status of a report request.
        # @param [String] report_id
        #   ID of the report request being polled.
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
        # @yieldparam result [Google::Apis::DoubleclicksearchV2::Report] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DoubleclicksearchV2::Report]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_report(report_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'reports/{reportId}', options)
          command.response_representation = Google::Apis::DoubleclicksearchV2::Report::Representation
          command.response_class = Google::Apis::DoubleclicksearchV2::Report
          command.params['reportId'] = report_id unless report_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Downloads a report file encoded in UTF-8.
        # @param [String] report_id
        #   ID of the report.
        # @param [Fixnum] report_fragment
        #   The index of the report fragment to download.
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
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_report_file(report_id, report_fragment, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command = make_simple_command(:get, 'reports/{reportId}/files/{reportFragment}', options)
          else
            command = make_download_command(:get, 'reports/{reportId}/files/{reportFragment}', options)
            command.download_dest = download_dest
          end
          command.params['reportId'] = report_id unless report_id.nil?
          command.params['reportFragment'] = report_fragment unless report_fragment.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Inserts a report request into the reporting system.
        # @param [Google::Apis::DoubleclicksearchV2::ReportRequest] report_request_object
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
        # @yieldparam result [Google::Apis::DoubleclicksearchV2::Report] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DoubleclicksearchV2::Report]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def request_report(report_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, 'reports', options)
          command.request_representation = Google::Apis::DoubleclicksearchV2::ReportRequest::Representation
          command.request_object = report_request_object
          command.response_representation = Google::Apis::DoubleclicksearchV2::Report::Representation
          command.response_class = Google::Apis::DoubleclicksearchV2::Report
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Retrieve the list of saved columns for a specified advertiser.
        # @param [Fixnum] agency_id
        #   DS ID of the agency.
        # @param [Fixnum] advertiser_id
        #   DS ID of the advertiser.
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
        # @yieldparam result [Google::Apis::DoubleclicksearchV2::SavedColumnList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DoubleclicksearchV2::SavedColumnList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_saved_columns(agency_id, advertiser_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'agency/{agencyId}/advertiser/{advertiserId}/savedcolumns', options)
          command.response_representation = Google::Apis::DoubleclicksearchV2::SavedColumnList::Representation
          command.response_class = Google::Apis::DoubleclicksearchV2::SavedColumnList
          command.params['agencyId'] = agency_id unless agency_id.nil?
          command.params['advertiserId'] = advertiser_id unless advertiser_id.nil?
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
