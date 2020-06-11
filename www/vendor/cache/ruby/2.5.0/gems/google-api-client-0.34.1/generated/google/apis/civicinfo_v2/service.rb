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
    module CivicinfoV2
      # Google Civic Information API
      #
      # Provides polling places, early vote locations, contest data, election
      #  officials, and government representatives for U.S. residential addresses.
      #
      # @example
      #    require 'google/apis/civicinfo_v2'
      #
      #    Civicinfo = Google::Apis::CivicinfoV2 # Alias the module
      #    service = Civicinfo::CivicInfoService.new
      #
      # @see https://developers.google.com/civic-information
      class CivicInfoService < Google::Apis::Core::BaseService
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
          super('https://www.googleapis.com/', 'civicinfo/v2/')
          @batch_path = 'batch/civicinfo/v2'
        end
        
        # Searches for political divisions by their natural name or OCD ID.
        # @param [Google::Apis::CivicinfoV2::DivisionSearchRequest] division_search_request_object
        # @param [String] query
        #   The search query. Queries can cover any parts of a OCD ID or a human readable
        #   division name. All words given in the query are treated as required patterns.
        #   In addition to that, most query operators of the Apache Lucene library are
        #   supported. See http://lucene.apache.org/core/2_9_4/queryparsersyntax.html
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
        # @yieldparam result [Google::Apis::CivicinfoV2::SearchDivisionResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CivicinfoV2::SearchDivisionResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_divisions(division_search_request_object = nil, query: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'divisions', options)
          command.request_representation = Google::Apis::CivicinfoV2::DivisionSearchRequest::Representation
          command.request_object = division_search_request_object
          command.response_representation = Google::Apis::CivicinfoV2::SearchDivisionResponse::Representation
          command.response_class = Google::Apis::CivicinfoV2::SearchDivisionResponse
          command.query['query'] = query unless query.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List of available elections to query.
        # @param [Google::Apis::CivicinfoV2::ElectionsQueryRequest] elections_query_request_object
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
        # @yieldparam result [Google::Apis::CivicinfoV2::QueryElectionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CivicinfoV2::QueryElectionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def query_election(elections_query_request_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'elections', options)
          command.request_representation = Google::Apis::CivicinfoV2::ElectionsQueryRequest::Representation
          command.request_object = elections_query_request_object
          command.response_representation = Google::Apis::CivicinfoV2::QueryElectionsResponse::Representation
          command.response_class = Google::Apis::CivicinfoV2::QueryElectionsResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Looks up information relevant to a voter based on the voter's registered
        # address.
        # @param [String] address
        #   The registered address of the voter to look up.
        # @param [Google::Apis::CivicinfoV2::VoterInfoRequest] voter_info_request_object
        # @param [Fixnum] election_id
        #   The unique ID of the election to look up. A list of election IDs can be
        #   obtained at https://www.googleapis.com/civicinfo/`version`/electionsIf no
        #   election ID is specified in the query and there is more than one election with
        #   data for the given voter, the additional elections are provided in the
        #   otherElections response field.
        # @param [Boolean] official_only
        #   If set to true, only data from official state sources will be returned.
        # @param [Boolean] return_all_available_data
        #   If set to true, the query will return the success codeand include any partial
        #   information when it is unable to determine a matching address or unable to
        #   determine the election for electionId=0 queries.
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
        # @yieldparam result [Google::Apis::CivicinfoV2::VoterInfoResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CivicinfoV2::VoterInfoResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def query_voter_info(address, voter_info_request_object = nil, election_id: nil, official_only: nil, return_all_available_data: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'voterinfo', options)
          command.request_representation = Google::Apis::CivicinfoV2::VoterInfoRequest::Representation
          command.request_object = voter_info_request_object
          command.response_representation = Google::Apis::CivicinfoV2::VoterInfoResponse::Representation
          command.response_class = Google::Apis::CivicinfoV2::VoterInfoResponse
          command.query['address'] = address unless address.nil?
          command.query['electionId'] = election_id unless election_id.nil?
          command.query['officialOnly'] = official_only unless official_only.nil?
          command.query['returnAllAvailableData'] = return_all_available_data unless return_all_available_data.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Looks up political geography and representative information for a single
        # address.
        # @param [Google::Apis::CivicinfoV2::RepresentativeInfoRequest] representative_info_request_object
        # @param [String] address
        #   The address to look up. May only be specified if the field ocdId is not given
        #   in the URL.
        # @param [Boolean] include_offices
        #   Whether to return information about offices and officials. If false, only the
        #   top-level district information will be returned.
        # @param [Array<String>, String] levels
        #   A list of office levels to filter by. Only offices that serve at least one of
        #   these levels will be returned. Divisions that don't contain a matching office
        #   will not be returned.
        # @param [Array<String>, String] roles
        #   A list of office roles to filter by. Only offices fulfilling one of these
        #   roles will be returned. Divisions that don't contain a matching office will
        #   not be returned.
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
        # @yieldparam result [Google::Apis::CivicinfoV2::RepresentativeInfoResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CivicinfoV2::RepresentativeInfoResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def representative_info_by_address(representative_info_request_object = nil, address: nil, include_offices: nil, levels: nil, roles: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'representatives', options)
          command.request_representation = Google::Apis::CivicinfoV2::RepresentativeInfoRequest::Representation
          command.request_object = representative_info_request_object
          command.response_representation = Google::Apis::CivicinfoV2::RepresentativeInfoResponse::Representation
          command.response_class = Google::Apis::CivicinfoV2::RepresentativeInfoResponse
          command.query['address'] = address unless address.nil?
          command.query['includeOffices'] = include_offices unless include_offices.nil?
          command.query['levels'] = levels unless levels.nil?
          command.query['roles'] = roles unless roles.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Looks up representative information for a single geographic division.
        # @param [String] ocd_id
        #   The Open Civic Data division identifier of the division to look up.
        # @param [Google::Apis::CivicinfoV2::DivisionRepresentativeInfoRequest] division_representative_info_request_object
        # @param [Array<String>, String] levels
        #   A list of office levels to filter by. Only offices that serve at least one of
        #   these levels will be returned. Divisions that don't contain a matching office
        #   will not be returned.
        # @param [Boolean] recursive
        #   If true, information about all divisions contained in the division requested
        #   will be included as well. For example, if querying ocd-division/country:us/
        #   district:dc, this would also return all DC's wards and ANCs.
        # @param [Array<String>, String] roles
        #   A list of office roles to filter by. Only offices fulfilling one of these
        #   roles will be returned. Divisions that don't contain a matching office will
        #   not be returned.
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
        # @yieldparam result [Google::Apis::CivicinfoV2::RepresentativeInfoData] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::CivicinfoV2::RepresentativeInfoData]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def representative_info_by_division(ocd_id, division_representative_info_request_object = nil, levels: nil, recursive: nil, roles: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'representatives/{ocdId}', options)
          command.request_representation = Google::Apis::CivicinfoV2::DivisionRepresentativeInfoRequest::Representation
          command.request_object = division_representative_info_request_object
          command.response_representation = Google::Apis::CivicinfoV2::RepresentativeInfoData::Representation
          command.response_class = Google::Apis::CivicinfoV2::RepresentativeInfoData
          command.params['ocdId'] = ocd_id unless ocd_id.nil?
          command.query['levels'] = levels unless levels.nil?
          command.query['recursive'] = recursive unless recursive.nil?
          command.query['roles'] = roles unless roles.nil?
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
