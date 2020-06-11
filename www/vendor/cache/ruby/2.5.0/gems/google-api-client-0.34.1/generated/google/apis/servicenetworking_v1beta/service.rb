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
    module ServicenetworkingV1beta
      # Service Networking API
      #
      # Provides automatic management of network configurations necessary for certain
      #  services.
      #
      # @example
      #    require 'google/apis/servicenetworking_v1beta'
      #
      #    Servicenetworking = Google::Apis::ServicenetworkingV1beta # Alias the module
      #    service = Servicenetworking::ServiceNetworkingService.new
      #
      # @see https://cloud.google.com/service-infrastructure/docs/service-networking/getting-started
      class ServiceNetworkingService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://servicenetworking.googleapis.com/', '')
          @batch_path = 'batch'
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
        # @yieldparam result [Google::Apis::ServicenetworkingV1beta::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicenetworkingV1beta::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta/{+name}', options)
          command.response_representation = Google::Apis::ServicenetworkingV1beta::Operation::Representation
          command.response_class = Google::Apis::ServicenetworkingV1beta::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # For service producers, provisions a new subnet in a
        # peered service's shared VPC network in the requested region and with the
        # requested size that's expressed as a CIDR range (number of leading bits of
        # ipV4 network mask). The method checks against the assigned allocated ranges
        # to find a non-conflicting IP address range. The method will reuse a subnet
        # if subsequent calls contain the same subnet name, region, and prefix
        # length. This method will make producer's tenant project to be a shared VPC
        # service project as needed. The response from the `get` operation will be of
        # type `Subnetwork` if the operation successfully completes.
        # @param [String] parent
        #   Required. A tenant project in the service producer organization, in the
        #   following format: services/`service`/`collection-id`/`resource-id`.
        #   `collection-id` is the cloud resource collection type that represents the
        #   tenant project. Only `projects` are supported.
        #   `resource-id` is the tenant project numeric id, such as
        #   `123456`. `service` the name of the peering service, such as
        #   `service-peering.example.com`. This service must already be
        #   enabled in the service consumer's project.
        # @param [Google::Apis::ServicenetworkingV1beta::AddSubnetworkRequest] add_subnetwork_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicenetworkingV1beta::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicenetworkingV1beta::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def add_service_subnetwork(parent, add_subnetwork_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta/{+parent}:addSubnetwork', options)
          command.request_representation = Google::Apis::ServicenetworkingV1beta::AddSubnetworkRequest::Representation
          command.request_object = add_subnetwork_request_object
          command.response_representation = Google::Apis::ServicenetworkingV1beta::Operation::Representation
          command.response_class = Google::Apis::ServicenetworkingV1beta::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Service producers can use this method to find a currently unused range
        # within consumer allocated ranges.   This returned range is not reserved,
        # and not guaranteed to remain unused.
        # It will validate previously provided allocated ranges, find
        # non-conflicting sub-range of requested size (expressed in
        # number of leading bits of ipv4 network mask, as in CIDR range
        # notation).
        # Operation<response: Range>
        # @param [String] parent
        #   Required. This is in a form services/`service`.
        #   `service` the name of the private access management service, for example
        #   'service-peering.example.com'.
        # @param [Google::Apis::ServicenetworkingV1beta::SearchRangeRequest] search_range_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicenetworkingV1beta::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicenetworkingV1beta::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_service_range(parent, search_range_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta/{+parent}:searchRange', options)
          command.request_representation = Google::Apis::ServicenetworkingV1beta::SearchRangeRequest::Representation
          command.request_object = search_range_request_object
          command.response_representation = Google::Apis::ServicenetworkingV1beta::Operation::Representation
          command.response_class = Google::Apis::ServicenetworkingV1beta::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the allocated ranges that are assigned to a connection.
        # The response from the `get` operation will be of type `Connection` if the
        # operation successfully completes.
        # @param [String] name
        #   The service producer peering service that is managing peering connectivity
        #   for a service producer organization.
        #   For Google services that support this functionality, this is
        #   `services/servicenetworking.googleapis.com`.
        # @param [Google::Apis::ServicenetworkingV1beta::Connection] connection_object
        # @param [Boolean] force
        #   If a previously defined allocated range is removed, force flag must be
        #   set to true.
        # @param [String] update_mask
        #   The update mask. If this is omitted, it defaults to "*". You can only
        #   update the listed peering ranges.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicenetworkingV1beta::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicenetworkingV1beta::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_service_connections(name, connection_object = nil, force: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta/{+name}/connections', options)
          command.request_representation = Google::Apis::ServicenetworkingV1beta::Connection::Representation
          command.request_object = connection_object
          command.response_representation = Google::Apis::ServicenetworkingV1beta::Operation::Representation
          command.response_class = Google::Apis::ServicenetworkingV1beta::Operation
          command.params['name'] = name unless name.nil?
          command.query['force'] = force unless force.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a private connection that establishes a VPC Network Peering
        # connection to a VPC network in the service producer's organization.
        # The administrator of the service consumer's VPC network invokes this
        # method. The administrator must assign one or more allocated IP ranges for
        # provisioning subnetworks in the service producer's VPC network. This
        # connection is used for all supported services in the service producer's
        # organization, so it only needs to be invoked once. The response from the
        # `get` operation will be of type `Connection` if the operation successfully
        # completes.
        # @param [String] parent
        #   The service that is managing peering connectivity for a service producer's
        #   organization. For Google services that support this functionality, this
        #   value is `services/servicenetworking.googleapis.com`.
        # @param [Google::Apis::ServicenetworkingV1beta::Connection] connection_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicenetworkingV1beta::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicenetworkingV1beta::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_service_connection(parent, connection_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta/{+parent}/connections', options)
          command.request_representation = Google::Apis::ServicenetworkingV1beta::Connection::Representation
          command.request_object = connection_object
          command.response_representation = Google::Apis::ServicenetworkingV1beta::Operation::Representation
          command.response_class = Google::Apis::ServicenetworkingV1beta::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List the private connections that are configured in a service consumer's
        # VPC network.
        # @param [String] parent
        #   The service that is managing peering connectivity for a service producer's
        #   organization. For Google services that support this functionality, this
        #   value is `services/servicenetworking.googleapis.com`.
        #   If you specify `-` as the parameter value, all configured public peering
        #   services are listed.
        # @param [String] network
        #   The name of service consumer's VPC network that's connected with service
        #   producer network through a private connection. The network name must be in
        #   the following format:
        #   `projects/`project`/global/networks/`network``. `project` is a
        #   project number, such as in `12345` that includes the VPC service
        #   consumer's VPC network. `network` is the name of the service consumer's VPC
        #   network.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ServicenetworkingV1beta::ListConnectionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ServicenetworkingV1beta::ListConnectionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_service_connections(parent, network: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta/{+parent}/connections', options)
          command.response_representation = Google::Apis::ServicenetworkingV1beta::ListConnectionsResponse::Representation
          command.response_class = Google::Apis::ServicenetworkingV1beta::ListConnectionsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['network'] = network unless network.nil?
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
