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
    module AppengineV1alpha
      # App Engine Admin API
      #
      # Provisions and manages developers' App Engine applications.
      #
      # @example
      #    require 'google/apis/appengine_v1alpha'
      #
      #    Appengine = Google::Apis::AppengineV1alpha # Alias the module
      #    service = Appengine::AppengineService.new
      #
      # @see https://cloud.google.com/appengine/docs/admin-api/
      class AppengineService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://appengine.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Uploads the specified SSL certificate.
        # @param [String] apps_id
        #   Part of `parent`. Name of the parent Application resource. Example: apps/myapp.
        # @param [Google::Apis::AppengineV1alpha::AuthorizedCertificate] authorized_certificate_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1alpha::AuthorizedCertificate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::AuthorizedCertificate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_app_authorized_certificate(apps_id, authorized_certificate_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha/apps/{appsId}/authorizedCertificates', options)
          command.request_representation = Google::Apis::AppengineV1alpha::AuthorizedCertificate::Representation
          command.request_object = authorized_certificate_object
          command.response_representation = Google::Apis::AppengineV1alpha::AuthorizedCertificate::Representation
          command.response_class = Google::Apis::AppengineV1alpha::AuthorizedCertificate
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified SSL certificate.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource to delete. Example: apps/myapp/
        #   authorizedCertificates/12345.
        # @param [String] authorized_certificates_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1alpha::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_app_authorized_certificate(apps_id, authorized_certificates_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha/apps/{appsId}/authorizedCertificates/{authorizedCertificatesId}', options)
          command.response_representation = Google::Apis::AppengineV1alpha::Empty::Representation
          command.response_class = Google::Apis::AppengineV1alpha::Empty
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['authorizedCertificatesId'] = authorized_certificates_id unless authorized_certificates_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified SSL certificate.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/
        #   authorizedCertificates/12345.
        # @param [String] authorized_certificates_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] view
        #   Controls the set of fields returned in the GET response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1alpha::AuthorizedCertificate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::AuthorizedCertificate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_authorized_certificate(apps_id, authorized_certificates_id, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/apps/{appsId}/authorizedCertificates/{authorizedCertificatesId}', options)
          command.response_representation = Google::Apis::AppengineV1alpha::AuthorizedCertificate::Representation
          command.response_class = Google::Apis::AppengineV1alpha::AuthorizedCertificate
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['authorizedCertificatesId'] = authorized_certificates_id unless authorized_certificates_id.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all SSL certificates the user is authorized to administer.
        # @param [String] apps_id
        #   Part of `parent`. Name of the parent Application resource. Example: apps/myapp.
        # @param [Fixnum] page_size
        #   Maximum results to return per page.
        # @param [String] page_token
        #   Continuation token for fetching the next page of results.
        # @param [String] view
        #   Controls the set of fields returned in the LIST response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1alpha::ListAuthorizedCertificatesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::ListAuthorizedCertificatesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_authorized_certificates(apps_id, page_size: nil, page_token: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/apps/{appsId}/authorizedCertificates', options)
          command.response_representation = Google::Apis::AppengineV1alpha::ListAuthorizedCertificatesResponse::Representation
          command.response_class = Google::Apis::AppengineV1alpha::ListAuthorizedCertificatesResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified SSL certificate. To renew a certificate and maintain its
        # existing domain mappings, update certificate_data with a new certificate. The
        # new certificate must be applicable to the same domains as the original
        # certificate. The certificate display_name may also be updated.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource to update. Example: apps/myapp/
        #   authorizedCertificates/12345.
        # @param [String] authorized_certificates_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [Google::Apis::AppengineV1alpha::AuthorizedCertificate] authorized_certificate_object
        # @param [String] update_mask
        #   Standard field mask for the set of fields to be updated. Updates are only
        #   supported on the certificate_raw_data and display_name fields.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1alpha::AuthorizedCertificate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::AuthorizedCertificate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_app_authorized_certificate(apps_id, authorized_certificates_id, authorized_certificate_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1alpha/apps/{appsId}/authorizedCertificates/{authorizedCertificatesId}', options)
          command.request_representation = Google::Apis::AppengineV1alpha::AuthorizedCertificate::Representation
          command.request_object = authorized_certificate_object
          command.response_representation = Google::Apis::AppengineV1alpha::AuthorizedCertificate::Representation
          command.response_class = Google::Apis::AppengineV1alpha::AuthorizedCertificate
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['authorizedCertificatesId'] = authorized_certificates_id unless authorized_certificates_id.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all domains the user is authorized to administer.
        # @param [String] apps_id
        #   Part of `parent`. Name of the parent Application resource. Example: apps/myapp.
        # @param [Fixnum] page_size
        #   Maximum results to return per page.
        # @param [String] page_token
        #   Continuation token for fetching the next page of results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1alpha::ListAuthorizedDomainsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::ListAuthorizedDomainsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_authorized_domains(apps_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/apps/{appsId}/authorizedDomains', options)
          command.response_representation = Google::Apis::AppengineV1alpha::ListAuthorizedDomainsResponse::Representation
          command.response_class = Google::Apis::AppengineV1alpha::ListAuthorizedDomainsResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Maps a domain to an application. A user must be authorized to administer a
        # domain in order to map it to an application. For a list of available
        # authorized domains, see AuthorizedDomains.ListAuthorizedDomains.
        # @param [String] apps_id
        #   Part of `parent`. Name of the parent Application resource. Example: apps/myapp.
        # @param [Google::Apis::AppengineV1alpha::DomainMapping] domain_mapping_object
        # @param [Boolean] no_managed_certificate
        #   Whether a managed certificate should be provided by App Engine. If true, a
        #   certificate ID must be manaually set in the DomainMapping resource to
        #   configure SSL for this domain. If false, a managed certificate will be
        #   provisioned and a certificate ID will be automatically populated.
        # @param [String] override_strategy
        #   Whether the domain creation should override any existing mappings for this
        #   domain. By default, overrides are rejected.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1alpha::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_app_domain_mapping(apps_id, domain_mapping_object = nil, no_managed_certificate: nil, override_strategy: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha/apps/{appsId}/domainMappings', options)
          command.request_representation = Google::Apis::AppengineV1alpha::DomainMapping::Representation
          command.request_object = domain_mapping_object
          command.response_representation = Google::Apis::AppengineV1alpha::Operation::Representation
          command.response_class = Google::Apis::AppengineV1alpha::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['noManagedCertificate'] = no_managed_certificate unless no_managed_certificate.nil?
          command.query['overrideStrategy'] = override_strategy unless override_strategy.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified domain mapping. A user must be authorized to administer
        # the associated domain in order to delete a DomainMapping resource.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource to delete. Example: apps/myapp/
        #   domainMappings/example.com.
        # @param [String] domain_mappings_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1alpha::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_app_domain_mapping(apps_id, domain_mappings_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha/apps/{appsId}/domainMappings/{domainMappingsId}', options)
          command.response_representation = Google::Apis::AppengineV1alpha::Operation::Representation
          command.response_class = Google::Apis::AppengineV1alpha::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['domainMappingsId'] = domain_mappings_id unless domain_mappings_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified domain mapping.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/
        #   domainMappings/example.com.
        # @param [String] domain_mappings_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1alpha::DomainMapping] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::DomainMapping]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_domain_mapping(apps_id, domain_mappings_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/apps/{appsId}/domainMappings/{domainMappingsId}', options)
          command.response_representation = Google::Apis::AppengineV1alpha::DomainMapping::Representation
          command.response_class = Google::Apis::AppengineV1alpha::DomainMapping
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['domainMappingsId'] = domain_mappings_id unless domain_mappings_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the domain mappings on an application.
        # @param [String] apps_id
        #   Part of `parent`. Name of the parent Application resource. Example: apps/myapp.
        # @param [Fixnum] page_size
        #   Maximum results to return per page.
        # @param [String] page_token
        #   Continuation token for fetching the next page of results.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1alpha::ListDomainMappingsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::ListDomainMappingsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_domain_mappings(apps_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/apps/{appsId}/domainMappings', options)
          command.response_representation = Google::Apis::AppengineV1alpha::ListDomainMappingsResponse::Representation
          command.response_class = Google::Apis::AppengineV1alpha::ListDomainMappingsResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified domain mapping. To map an SSL certificate to a domain
        # mapping, update certificate_id to point to an AuthorizedCertificate resource.
        # A user must be authorized to administer the associated domain in order to
        # update a DomainMapping resource.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource to update. Example: apps/myapp/
        #   domainMappings/example.com.
        # @param [String] domain_mappings_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [Google::Apis::AppengineV1alpha::DomainMapping] domain_mapping_object
        # @param [Boolean] no_managed_certificate
        #   Whether a managed certificate should be provided by App Engine. If true, a
        #   certificate ID must be manually set in the DomainMapping resource to configure
        #   SSL for this domain. If false, a managed certificate will be provisioned and a
        #   certificate ID will be automatically populated. Only applicable if
        #   ssl_settings.certificate_id is specified in the update mask.
        # @param [String] update_mask
        #   Standard field mask for the set of fields to be updated.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1alpha::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_app_domain_mapping(apps_id, domain_mappings_id, domain_mapping_object = nil, no_managed_certificate: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1alpha/apps/{appsId}/domainMappings/{domainMappingsId}', options)
          command.request_representation = Google::Apis::AppengineV1alpha::DomainMapping::Representation
          command.request_object = domain_mapping_object
          command.response_representation = Google::Apis::AppengineV1alpha::Operation::Representation
          command.response_class = Google::Apis::AppengineV1alpha::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['domainMappingsId'] = domain_mappings_id unless domain_mappings_id.nil?
          command.query['noManagedCertificate'] = no_managed_certificate unless no_managed_certificate.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information about a location.
        # @param [String] apps_id
        #   Part of `name`. Resource name for the location.
        # @param [String] locations_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1alpha::Location] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::Location]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_location(apps_id, locations_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/apps/{appsId}/locations/{locationsId}', options)
          command.response_representation = Google::Apis::AppengineV1alpha::Location::Representation
          command.response_class = Google::Apis::AppengineV1alpha::Location
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['locationsId'] = locations_id unless locations_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists information about the supported locations for this service.
        # @param [String] apps_id
        #   Part of `name`. The resource that owns the locations collection, if applicable.
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
        # @yieldparam result [Google::Apis::AppengineV1alpha::ListLocationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::ListLocationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_locations(apps_id, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/apps/{appsId}/locations', options)
          command.response_representation = Google::Apis::AppengineV1alpha::ListLocationsResponse::Representation
          command.response_class = Google::Apis::AppengineV1alpha::ListLocationsResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the latest state of a long-running operation. Clients can use this method
        # to poll the operation result at intervals as recommended by the API service.
        # @param [String] apps_id
        #   Part of `name`. The name of the operation resource.
        # @param [String] operations_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1alpha::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_operation(apps_id, operations_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/apps/{appsId}/operations/{operationsId}', options)
          command.response_representation = Google::Apis::AppengineV1alpha::Operation::Representation
          command.response_class = Google::Apis::AppengineV1alpha::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['operationsId'] = operations_id unless operations_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists operations that match the specified filter in the request. If the server
        # doesn't support this method, it returns UNIMPLEMENTED.NOTE: the name binding
        # allows API services to override the binding to use different resource name
        # schemes, such as users/*/operations. To override the binding, API services can
        # add a binding such as "/v1/`name=users/*`/operations" to their service
        # configuration. For backwards compatibility, the default name includes the
        # operations collection id, however overriding users must ensure the name
        # binding is the parent resource, without the operations collection id.
        # @param [String] apps_id
        #   Part of `name`. The name of the operation's parent resource.
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
        # @yieldparam result [Google::Apis::AppengineV1alpha::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1alpha::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_operations(apps_id, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha/apps/{appsId}/operations', options)
          command.response_representation = Google::Apis::AppengineV1alpha::ListOperationsResponse::Representation
          command.response_class = Google::Apis::AppengineV1alpha::ListOperationsResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['filter'] = filter unless filter.nil?
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
