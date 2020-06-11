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
    module DomainsrdapV1
      # Domains RDAP API
      #
      # Read-only public API that lets users search for information about domain names.
      #
      # @example
      #    require 'google/apis/domainsrdap_v1'
      #
      #    Domainsrdap = Google::Apis::DomainsrdapV1 # Alias the module
      #    service = Domainsrdap::DomainsRDAPService.new
      #
      # @see https://developers.google.com/domains/rdap/
      class DomainsRDAPService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://domainsrdap.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # The RDAP API recognizes this command from the RDAP specification but
        # does not support it. The response is a formatted 501 error.
        # @param [String] autnum_id
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DomainsrdapV1::RdapResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DomainsrdapV1::RdapResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_autnum(autnum_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/autnum/{autnumId}', options)
          command.response_representation = Google::Apis::DomainsrdapV1::RdapResponse::Representation
          command.response_class = Google::Apis::DomainsrdapV1::RdapResponse
          command.params['autnumId'] = autnum_id unless autnum_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Look up RDAP information for a domain by name.
        # @param [String] domain_name
        #   Full domain name to look up. Example: "example.com"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DomainsrdapV1::HttpBody] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DomainsrdapV1::HttpBody]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_domain(domain_name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/domain/{+domainName}', options)
          command.response_representation = Google::Apis::DomainsrdapV1::HttpBody::Representation
          command.response_class = Google::Apis::DomainsrdapV1::HttpBody
          command.params['domainName'] = domain_name unless domain_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # The RDAP API recognizes this command from the RDAP specification but
        # does not support it. The response is a formatted 501 error.
        # @param [String] entity_id
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DomainsrdapV1::RdapResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DomainsrdapV1::RdapResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_entity(entity_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/entity/{entityId}', options)
          command.response_representation = Google::Apis::DomainsrdapV1::RdapResponse::Representation
          command.response_class = Google::Apis::DomainsrdapV1::RdapResponse
          command.params['entityId'] = entity_id unless entity_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # The RDAP API recognizes this command from the RDAP specification but
        # does not support it. The response is a formatted 501 error.
        # @param [String] ip_id
        # @param [String] ip_id1
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DomainsrdapV1::RdapResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DomainsrdapV1::RdapResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def ip_get(ip_id, ip_id1, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/ip/{ipId}/{ipId1}', options)
          command.response_representation = Google::Apis::DomainsrdapV1::RdapResponse::Representation
          command.response_class = Google::Apis::DomainsrdapV1::RdapResponse
          command.params['ipId'] = ip_id unless ip_id.nil?
          command.params['ipId1'] = ip_id1 unless ip_id1.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # The RDAP API recognizes this command from the RDAP specification but
        # does not support it. The response is a formatted 501 error.
        # @param [String] nameserver_id
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DomainsrdapV1::RdapResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DomainsrdapV1::RdapResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_nameserver(nameserver_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/nameserver/{nameserverId}', options)
          command.response_representation = Google::Apis::DomainsrdapV1::RdapResponse::Representation
          command.response_class = Google::Apis::DomainsrdapV1::RdapResponse
          command.params['nameserverId'] = nameserver_id unless nameserver_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # The RDAP API recognizes this command from the RDAP specification but
        # does not support it. The response is a formatted 501 error.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DomainsrdapV1::RdapResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DomainsrdapV1::RdapResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_domains(fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/domains', options)
          command.response_representation = Google::Apis::DomainsrdapV1::RdapResponse::Representation
          command.response_class = Google::Apis::DomainsrdapV1::RdapResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # The RDAP API recognizes this command from the RDAP specification but
        # does not support it. The response is a formatted 501 error.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DomainsrdapV1::RdapResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DomainsrdapV1::RdapResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_entities(fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/entities', options)
          command.response_representation = Google::Apis::DomainsrdapV1::RdapResponse::Representation
          command.response_class = Google::Apis::DomainsrdapV1::RdapResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get help information for the RDAP API, including links to documentation.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DomainsrdapV1::HttpBody] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DomainsrdapV1::HttpBody]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_help(fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/help', options)
          command.response_representation = Google::Apis::DomainsrdapV1::HttpBody::Representation
          command.response_class = Google::Apis::DomainsrdapV1::HttpBody
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # The RDAP API recognizes this command from the RDAP specification but
        # does not support it. The response is a formatted 501 error.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DomainsrdapV1::HttpBody] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DomainsrdapV1::HttpBody]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_ip(fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/ip', options)
          command.response_representation = Google::Apis::DomainsrdapV1::HttpBody::Representation
          command.response_class = Google::Apis::DomainsrdapV1::HttpBody
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # The RDAP API recognizes this command from the RDAP specification but
        # does not support it. The response is a formatted 501 error.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DomainsrdapV1::RdapResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DomainsrdapV1::RdapResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_nameservers(fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/nameservers', options)
          command.response_representation = Google::Apis::DomainsrdapV1::RdapResponse::Representation
          command.response_class = Google::Apis::DomainsrdapV1::RdapResponse
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
