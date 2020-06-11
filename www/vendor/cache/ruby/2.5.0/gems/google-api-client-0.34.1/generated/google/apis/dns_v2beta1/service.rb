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
    module DnsV2beta1
      # Google Cloud DNS API
      #
      # Configures and serves authoritative DNS records.
      #
      # @example
      #    require 'google/apis/dns_v2beta1'
      #
      #    Dns = Google::Apis::DnsV2beta1 # Alias the module
      #    service = Dns::DnsService.new
      #
      # @see https://developers.google.com/cloud-dns
      class DnsService < Google::Apis::Core::BaseService
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
          super('https://dns.googleapis.com/', 'dns/v2beta1/projects/')
          @batch_path = 'batch/dns/v2beta1'
        end
        
        # Atomically update the ResourceRecordSet collection.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] managed_zone
        #   Identifies the managed zone addressed by this request. Can be the managed zone
        #   name or id.
        # @param [Google::Apis::DnsV2beta1::Change] change_object
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::Change] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::Change]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_change(project, managed_zone, change_object = nil, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{project}/managedZones/{managedZone}/changes', options)
          command.request_representation = Google::Apis::DnsV2beta1::Change::Representation
          command.request_object = change_object
          command.response_representation = Google::Apis::DnsV2beta1::Change::Representation
          command.response_class = Google::Apis::DnsV2beta1::Change
          command.params['project'] = project unless project.nil?
          command.params['managedZone'] = managed_zone unless managed_zone.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Fetch the representation of an existing Change.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] managed_zone
        #   Identifies the managed zone addressed by this request. Can be the managed zone
        #   name or id.
        # @param [String] change_id
        #   The identifier of the requested change, from a previous
        #   ResourceRecordSetsChangeResponse.
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::Change] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::Change]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_change(project, managed_zone, change_id, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/managedZones/{managedZone}/changes/{changeId}', options)
          command.response_representation = Google::Apis::DnsV2beta1::Change::Representation
          command.response_class = Google::Apis::DnsV2beta1::Change
          command.params['project'] = project unless project.nil?
          command.params['managedZone'] = managed_zone unless managed_zone.nil?
          command.params['changeId'] = change_id unless change_id.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Enumerate Changes to a ResourceRecordSet collection.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] managed_zone
        #   Identifies the managed zone addressed by this request. Can be the managed zone
        #   name or id.
        # @param [Fixnum] max_results
        #   Optional. Maximum number of results to be returned. If unspecified, the server
        #   will decide how many results to return.
        # @param [String] page_token
        #   Optional. A tag returned by a previous list request that was truncated. Use
        #   this parameter to continue a previous list request.
        # @param [String] sort_by
        #   Sorting criterion. The only supported value is change sequence.
        # @param [String] sort_order
        #   Sorting order direction: 'ascending' or 'descending'.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::ChangesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::ChangesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_changes(project, managed_zone, max_results: nil, page_token: nil, sort_by: nil, sort_order: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/managedZones/{managedZone}/changes', options)
          command.response_representation = Google::Apis::DnsV2beta1::ChangesListResponse::Representation
          command.response_class = Google::Apis::DnsV2beta1::ChangesListResponse
          command.params['project'] = project unless project.nil?
          command.params['managedZone'] = managed_zone unless managed_zone.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['sortBy'] = sort_by unless sort_by.nil?
          command.query['sortOrder'] = sort_order unless sort_order.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Fetch the representation of an existing DnsKey.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] managed_zone
        #   Identifies the managed zone addressed by this request. Can be the managed zone
        #   name or id.
        # @param [String] dns_key_id
        #   The identifier of the requested DnsKey.
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
        # @param [String] digest_type
        #   An optional comma-separated list of digest types to compute and display for
        #   key signing keys. If omitted, the recommended digest type will be computed and
        #   displayed.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::DnsKey] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::DnsKey]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_dns_key(project, managed_zone, dns_key_id, client_operation_id: nil, digest_type: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/managedZones/{managedZone}/dnsKeys/{dnsKeyId}', options)
          command.response_representation = Google::Apis::DnsV2beta1::DnsKey::Representation
          command.response_class = Google::Apis::DnsV2beta1::DnsKey
          command.params['project'] = project unless project.nil?
          command.params['managedZone'] = managed_zone unless managed_zone.nil?
          command.params['dnsKeyId'] = dns_key_id unless dns_key_id.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['digestType'] = digest_type unless digest_type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Enumerate DnsKeys to a ResourceRecordSet collection.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] managed_zone
        #   Identifies the managed zone addressed by this request. Can be the managed zone
        #   name or id.
        # @param [String] digest_type
        #   An optional comma-separated list of digest types to compute and display for
        #   key signing keys. If omitted, the recommended digest type will be computed and
        #   displayed.
        # @param [Fixnum] max_results
        #   Optional. Maximum number of results to be returned. If unspecified, the server
        #   will decide how many results to return.
        # @param [String] page_token
        #   Optional. A tag returned by a previous list request that was truncated. Use
        #   this parameter to continue a previous list request.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::DnsKeysListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::DnsKeysListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_dns_keys(project, managed_zone, digest_type: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/managedZones/{managedZone}/dnsKeys', options)
          command.response_representation = Google::Apis::DnsV2beta1::DnsKeysListResponse::Representation
          command.response_class = Google::Apis::DnsV2beta1::DnsKeysListResponse
          command.params['project'] = project unless project.nil?
          command.params['managedZone'] = managed_zone unless managed_zone.nil?
          command.query['digestType'] = digest_type unless digest_type.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Fetch the representation of an existing Operation.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] managed_zone
        #   Identifies the managed zone addressed by this request.
        # @param [String] operation
        #   Identifies the operation addressed by this request.
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_managed_zone_operation(project, managed_zone, operation, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/managedZones/{managedZone}/operations/{operation}', options)
          command.response_representation = Google::Apis::DnsV2beta1::Operation::Representation
          command.response_class = Google::Apis::DnsV2beta1::Operation
          command.params['project'] = project unless project.nil?
          command.params['managedZone'] = managed_zone unless managed_zone.nil?
          command.params['operation'] = operation unless operation.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Enumerate Operations for the given ManagedZone.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] managed_zone
        #   Identifies the managed zone addressed by this request.
        # @param [Fixnum] max_results
        #   Optional. Maximum number of results to be returned. If unspecified, the server
        #   will decide how many results to return.
        # @param [String] page_token
        #   Optional. A tag returned by a previous list request that was truncated. Use
        #   this parameter to continue a previous list request.
        # @param [String] sort_by
        #   Sorting criterion. The only supported values are START_TIME and ID.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::ManagedZoneOperationsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::ManagedZoneOperationsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_managed_zone_operations(project, managed_zone, max_results: nil, page_token: nil, sort_by: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/managedZones/{managedZone}/operations', options)
          command.response_representation = Google::Apis::DnsV2beta1::ManagedZoneOperationsListResponse::Representation
          command.response_class = Google::Apis::DnsV2beta1::ManagedZoneOperationsListResponse
          command.params['project'] = project unless project.nil?
          command.params['managedZone'] = managed_zone unless managed_zone.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['sortBy'] = sort_by unless sort_by.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new ManagedZone.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [Google::Apis::DnsV2beta1::ManagedZone] managed_zone_object
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::ManagedZone] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::ManagedZone]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_managed_zone(project, managed_zone_object = nil, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{project}/managedZones', options)
          command.request_representation = Google::Apis::DnsV2beta1::ManagedZone::Representation
          command.request_object = managed_zone_object
          command.response_representation = Google::Apis::DnsV2beta1::ManagedZone::Representation
          command.response_class = Google::Apis::DnsV2beta1::ManagedZone
          command.params['project'] = project unless project.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a previously created ManagedZone.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] managed_zone
        #   Identifies the managed zone addressed by this request. Can be the managed zone
        #   name or id.
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        def delete_managed_zone(project, managed_zone, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{project}/managedZones/{managedZone}', options)
          command.params['project'] = project unless project.nil?
          command.params['managedZone'] = managed_zone unless managed_zone.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Fetch the representation of an existing ManagedZone.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] managed_zone
        #   Identifies the managed zone addressed by this request. Can be the managed zone
        #   name or id.
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::ManagedZone] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::ManagedZone]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_managed_zone(project, managed_zone, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/managedZones/{managedZone}', options)
          command.response_representation = Google::Apis::DnsV2beta1::ManagedZone::Representation
          command.response_class = Google::Apis::DnsV2beta1::ManagedZone
          command.params['project'] = project unless project.nil?
          command.params['managedZone'] = managed_zone unless managed_zone.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Enumerate ManagedZones that have been created but not yet deleted.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] dns_name
        #   Restricts the list to return only zones with this domain name.
        # @param [Fixnum] max_results
        #   Optional. Maximum number of results to be returned. If unspecified, the server
        #   will decide how many results to return.
        # @param [String] page_token
        #   Optional. A tag returned by a previous list request that was truncated. Use
        #   this parameter to continue a previous list request.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::ManagedZonesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::ManagedZonesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_managed_zones(project, dns_name: nil, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/managedZones', options)
          command.response_representation = Google::Apis::DnsV2beta1::ManagedZonesListResponse::Representation
          command.response_class = Google::Apis::DnsV2beta1::ManagedZonesListResponse
          command.params['project'] = project unless project.nil?
          command.query['dnsName'] = dns_name unless dns_name.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Apply a partial update to an existing ManagedZone.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] managed_zone
        #   Identifies the managed zone addressed by this request. Can be the managed zone
        #   name or id.
        # @param [Google::Apis::DnsV2beta1::ManagedZone] managed_zone_object
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_managed_zone(project, managed_zone, managed_zone_object = nil, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, '{project}/managedZones/{managedZone}', options)
          command.request_representation = Google::Apis::DnsV2beta1::ManagedZone::Representation
          command.request_object = managed_zone_object
          command.response_representation = Google::Apis::DnsV2beta1::Operation::Representation
          command.response_class = Google::Apis::DnsV2beta1::Operation
          command.params['project'] = project unless project.nil?
          command.params['managedZone'] = managed_zone unless managed_zone.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update an existing ManagedZone.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] managed_zone
        #   Identifies the managed zone addressed by this request. Can be the managed zone
        #   name or id.
        # @param [Google::Apis::DnsV2beta1::ManagedZone] managed_zone_object
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_managed_zone(project, managed_zone, managed_zone_object = nil, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{project}/managedZones/{managedZone}', options)
          command.request_representation = Google::Apis::DnsV2beta1::ManagedZone::Representation
          command.request_object = managed_zone_object
          command.response_representation = Google::Apis::DnsV2beta1::Operation::Representation
          command.response_class = Google::Apis::DnsV2beta1::Operation
          command.params['project'] = project unless project.nil?
          command.params['managedZone'] = managed_zone unless managed_zone.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Create a new Policy
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [Google::Apis::DnsV2beta1::Policy] policy_object
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_policy(project, policy_object = nil, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:post, '{project}/policies', options)
          command.request_representation = Google::Apis::DnsV2beta1::Policy::Representation
          command.request_object = policy_object
          command.response_representation = Google::Apis::DnsV2beta1::Policy::Representation
          command.response_class = Google::Apis::DnsV2beta1::Policy
          command.params['project'] = project unless project.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete a previously created Policy. Will fail if the policy is still being
        # referenced by a network.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] policy
        #   User given friendly name of the policy addressed by this request.
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        def delete_policy(project, policy, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:delete, '{project}/policies/{policy}', options)
          command.params['project'] = project unless project.nil?
          command.params['policy'] = policy unless policy.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Fetch the representation of an existing Policy.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] policy
        #   User given friendly name of the policy addressed by this request.
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_policy(project, policy, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/policies/{policy}', options)
          command.response_representation = Google::Apis::DnsV2beta1::Policy::Representation
          command.response_class = Google::Apis::DnsV2beta1::Policy
          command.params['project'] = project unless project.nil?
          command.params['policy'] = policy unless policy.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Enumerate all Policies associated with a project.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [Fixnum] max_results
        #   Optional. Maximum number of results to be returned. If unspecified, the server
        #   will decide how many results to return.
        # @param [String] page_token
        #   Optional. A tag returned by a previous list request that was truncated. Use
        #   this parameter to continue a previous list request.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::PoliciesListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::PoliciesListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_policies(project, max_results: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/policies', options)
          command.response_representation = Google::Apis::DnsV2beta1::PoliciesListResponse::Representation
          command.response_class = Google::Apis::DnsV2beta1::PoliciesListResponse
          command.params['project'] = project unless project.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Apply a partial update to an existing Policy.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] policy
        #   User given friendly name of the policy addressed by this request.
        # @param [Google::Apis::DnsV2beta1::Policy] policy_object
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::PoliciesPatchResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::PoliciesPatchResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_policy(project, policy, policy_object = nil, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:patch, '{project}/policies/{policy}', options)
          command.request_representation = Google::Apis::DnsV2beta1::Policy::Representation
          command.request_object = policy_object
          command.response_representation = Google::Apis::DnsV2beta1::PoliciesPatchResponse::Representation
          command.response_class = Google::Apis::DnsV2beta1::PoliciesPatchResponse
          command.params['project'] = project unless project.nil?
          command.params['policy'] = policy unless policy.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update an existing Policy.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] policy
        #   User given friendly name of the policy addressed by this request.
        # @param [Google::Apis::DnsV2beta1::Policy] policy_object
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::PoliciesUpdateResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::PoliciesUpdateResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_policy(project, policy, policy_object = nil, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:put, '{project}/policies/{policy}', options)
          command.request_representation = Google::Apis::DnsV2beta1::Policy::Representation
          command.request_object = policy_object
          command.response_representation = Google::Apis::DnsV2beta1::PoliciesUpdateResponse::Representation
          command.response_class = Google::Apis::DnsV2beta1::PoliciesUpdateResponse
          command.params['project'] = project unless project.nil?
          command.params['policy'] = policy unless policy.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Fetch the representation of an existing Project.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] client_operation_id
        #   For mutating operation requests only. An optional identifier specified by the
        #   client. Must be unique for operation resources in the Operations collection.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::Project] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::Project]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project(project, client_operation_id: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}', options)
          command.response_representation = Google::Apis::DnsV2beta1::Project::Representation
          command.response_class = Google::Apis::DnsV2beta1::Project
          command.params['project'] = project unless project.nil?
          command.query['clientOperationId'] = client_operation_id unless client_operation_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Enumerate ResourceRecordSets that have been created but not yet deleted.
        # @param [String] project
        #   Identifies the project addressed by this request.
        # @param [String] managed_zone
        #   Identifies the managed zone addressed by this request. Can be the managed zone
        #   name or id.
        # @param [Fixnum] max_results
        #   Optional. Maximum number of results to be returned. If unspecified, the server
        #   will decide how many results to return.
        # @param [String] name
        #   Restricts the list to return only records with this fully qualified domain
        #   name.
        # @param [String] page_token
        #   Optional. A tag returned by a previous list request that was truncated. Use
        #   this parameter to continue a previous list request.
        # @param [String] type
        #   Restricts the list to return only records of this type. If present, the "name"
        #   parameter must also be present.
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
        # @yieldparam result [Google::Apis::DnsV2beta1::ResourceRecordSetsListResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DnsV2beta1::ResourceRecordSetsListResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_resource_record_sets(project, managed_zone, max_results: nil, name: nil, page_token: nil, type: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, '{project}/managedZones/{managedZone}/rrsets', options)
          command.response_representation = Google::Apis::DnsV2beta1::ResourceRecordSetsListResponse::Representation
          command.response_class = Google::Apis::DnsV2beta1::ResourceRecordSetsListResponse
          command.params['project'] = project unless project.nil?
          command.params['managedZone'] = managed_zone unless managed_zone.nil?
          command.query['maxResults'] = max_results unless max_results.nil?
          command.query['name'] = name unless name.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['type'] = type unless type.nil?
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
