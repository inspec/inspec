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
    module AppengineV1
      # App Engine Admin API
      #
      # Provisions and manages developers' App Engine applications.
      #
      # @example
      #    require 'google/apis/appengine_v1'
      #
      #    Appengine = Google::Apis::AppengineV1 # Alias the module
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
        
        # Creates an App Engine application for a Google Cloud Platform project.
        # Required fields:
        # id - The ID of the target Cloud Platform project.
        # location - The region (https://cloud.google.com/appengine/docs/locations)
        # where you want the App Engine application located.For more information about
        # App Engine applications, see Managing Projects, Applications, and Billing (
        # https://cloud.google.com/appengine/docs/standard/python/console/).
        # @param [Google::Apis::AppengineV1::Application] application_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_app(application_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/apps', options)
          command.request_representation = Google::Apis::AppengineV1::Application::Representation
          command.request_object = application_object
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information about an application.
        # @param [String] apps_id
        #   Part of `name`. Name of the Application resource to get. Example: apps/myapp.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1::Application] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Application]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app(apps_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}', options)
          command.response_representation = Google::Apis::AppengineV1::Application::Representation
          command.response_class = Google::Apis::AppengineV1::Application
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified Application resource. You can update the following
        # fields:
        # auth_domain - Google authentication domain for controlling user access to the
        # application.
        # default_cookie_expiration - Cookie expiration policy for the application.
        # @param [String] apps_id
        #   Part of `name`. Name of the Application resource to update. Example: apps/
        #   myapp.
        # @param [Google::Apis::AppengineV1::Application] application_object
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
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_app(apps_id, application_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/apps/{appsId}', options)
          command.request_representation = Google::Apis::AppengineV1::Application::Representation
          command.request_object = application_object
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Recreates the required App Engine features for the specified App Engine
        # application, for example a Cloud Storage bucket or App Engine service account.
        # Use this method if you receive an error message about a missing feature, for
        # example, Error retrieving the App Engine service account. If you have deleted
        # your App Engine service account, this will not be able to recreate it. Instead,
        # you should attempt to use the IAM undelete API if possible at https://cloud.
        # google.com/iam/reference/rest/v1/projects.serviceAccounts/undelete?apix_params=
        # %7B"name"%3A"projects%2F-%2FserviceAccounts%2Funique_id"%2C"resource"%3A%7B%7D%
        # 7D . If the deletion was recent, the numeric ID can be found in the Cloud
        # Console Activity Log.
        # @param [String] apps_id
        #   Part of `name`. Name of the application to repair. Example: apps/myapp
        # @param [Google::Apis::AppengineV1::RepairApplicationRequest] repair_application_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def repair_application(apps_id, repair_application_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/apps/{appsId}:repair', options)
          command.request_representation = Google::Apis::AppengineV1::RepairApplicationRequest::Representation
          command.request_object = repair_application_request_object
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Uploads the specified SSL certificate.
        # @param [String] apps_id
        #   Part of `parent`. Name of the parent Application resource. Example: apps/myapp.
        # @param [Google::Apis::AppengineV1::AuthorizedCertificate] authorized_certificate_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1::AuthorizedCertificate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::AuthorizedCertificate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_app_authorized_certificate(apps_id, authorized_certificate_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/apps/{appsId}/authorizedCertificates', options)
          command.request_representation = Google::Apis::AppengineV1::AuthorizedCertificate::Representation
          command.request_object = authorized_certificate_object
          command.response_representation = Google::Apis::AppengineV1::AuthorizedCertificate::Representation
          command.response_class = Google::Apis::AppengineV1::AuthorizedCertificate
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
        # @yieldparam result [Google::Apis::AppengineV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_app_authorized_certificate(apps_id, authorized_certificates_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/apps/{appsId}/authorizedCertificates/{authorizedCertificatesId}', options)
          command.response_representation = Google::Apis::AppengineV1::Empty::Representation
          command.response_class = Google::Apis::AppengineV1::Empty
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
        # @yieldparam result [Google::Apis::AppengineV1::AuthorizedCertificate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::AuthorizedCertificate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_authorized_certificate(apps_id, authorized_certificates_id, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/authorizedCertificates/{authorizedCertificatesId}', options)
          command.response_representation = Google::Apis::AppengineV1::AuthorizedCertificate::Representation
          command.response_class = Google::Apis::AppengineV1::AuthorizedCertificate
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
        # @yieldparam result [Google::Apis::AppengineV1::ListAuthorizedCertificatesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::ListAuthorizedCertificatesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_authorized_certificates(apps_id, page_size: nil, page_token: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/authorizedCertificates', options)
          command.response_representation = Google::Apis::AppengineV1::ListAuthorizedCertificatesResponse::Representation
          command.response_class = Google::Apis::AppengineV1::ListAuthorizedCertificatesResponse
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
        # @param [Google::Apis::AppengineV1::AuthorizedCertificate] authorized_certificate_object
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
        # @yieldparam result [Google::Apis::AppengineV1::AuthorizedCertificate] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::AuthorizedCertificate]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_app_authorized_certificate(apps_id, authorized_certificates_id, authorized_certificate_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/apps/{appsId}/authorizedCertificates/{authorizedCertificatesId}', options)
          command.request_representation = Google::Apis::AppengineV1::AuthorizedCertificate::Representation
          command.request_object = authorized_certificate_object
          command.response_representation = Google::Apis::AppengineV1::AuthorizedCertificate::Representation
          command.response_class = Google::Apis::AppengineV1::AuthorizedCertificate
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
        # @yieldparam result [Google::Apis::AppengineV1::ListAuthorizedDomainsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::ListAuthorizedDomainsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_authorized_domains(apps_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/authorizedDomains', options)
          command.response_representation = Google::Apis::AppengineV1::ListAuthorizedDomainsResponse::Representation
          command.response_class = Google::Apis::AppengineV1::ListAuthorizedDomainsResponse
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
        # @param [Google::Apis::AppengineV1::DomainMapping] domain_mapping_object
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
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_app_domain_mapping(apps_id, domain_mapping_object = nil, override_strategy: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/apps/{appsId}/domainMappings', options)
          command.request_representation = Google::Apis::AppengineV1::DomainMapping::Representation
          command.request_object = domain_mapping_object
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
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
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_app_domain_mapping(apps_id, domain_mappings_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/apps/{appsId}/domainMappings/{domainMappingsId}', options)
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
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
        # @yieldparam result [Google::Apis::AppengineV1::DomainMapping] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::DomainMapping]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_domain_mapping(apps_id, domain_mappings_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/domainMappings/{domainMappingsId}', options)
          command.response_representation = Google::Apis::AppengineV1::DomainMapping::Representation
          command.response_class = Google::Apis::AppengineV1::DomainMapping
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
        # @yieldparam result [Google::Apis::AppengineV1::ListDomainMappingsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::ListDomainMappingsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_domain_mappings(apps_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/domainMappings', options)
          command.response_representation = Google::Apis::AppengineV1::ListDomainMappingsResponse::Representation
          command.response_class = Google::Apis::AppengineV1::ListDomainMappingsResponse
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
        # @param [Google::Apis::AppengineV1::DomainMapping] domain_mapping_object
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
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_app_domain_mapping(apps_id, domain_mappings_id, domain_mapping_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/apps/{appsId}/domainMappings/{domainMappingsId}', options)
          command.request_representation = Google::Apis::AppengineV1::DomainMapping::Representation
          command.request_object = domain_mapping_object
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['domainMappingsId'] = domain_mappings_id unless domain_mappings_id.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Replaces the entire firewall ruleset in one bulk operation. This overrides and
        # replaces the rules of an existing firewall with the new rules.If the final
        # rule does not match traffic with the '*' wildcard IP range, then an "allow all"
        # rule is explicitly added to the end of the list.
        # @param [String] apps_id
        #   Part of `name`. Name of the Firewall collection to set. Example: apps/myapp/
        #   firewall/ingressRules.
        # @param [Google::Apis::AppengineV1::BatchUpdateIngressRulesRequest] batch_update_ingress_rules_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1::BatchUpdateIngressRulesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::BatchUpdateIngressRulesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_update_ingress_rules(apps_id, batch_update_ingress_rules_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/apps/{appsId}/firewall/ingressRules:batchUpdate', options)
          command.request_representation = Google::Apis::AppengineV1::BatchUpdateIngressRulesRequest::Representation
          command.request_object = batch_update_ingress_rules_request_object
          command.response_representation = Google::Apis::AppengineV1::BatchUpdateIngressRulesResponse::Representation
          command.response_class = Google::Apis::AppengineV1::BatchUpdateIngressRulesResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a firewall rule for the application.
        # @param [String] apps_id
        #   Part of `parent`. Name of the parent Firewall collection in which to create a
        #   new rule. Example: apps/myapp/firewall/ingressRules.
        # @param [Google::Apis::AppengineV1::FirewallRule] firewall_rule_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1::FirewallRule] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::FirewallRule]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_app_firewall_ingress_rule(apps_id, firewall_rule_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/apps/{appsId}/firewall/ingressRules', options)
          command.request_representation = Google::Apis::AppengineV1::FirewallRule::Representation
          command.request_object = firewall_rule_object
          command.response_representation = Google::Apis::AppengineV1::FirewallRule::Representation
          command.response_class = Google::Apis::AppengineV1::FirewallRule
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified firewall rule.
        # @param [String] apps_id
        #   Part of `name`. Name of the Firewall resource to delete. Example: apps/myapp/
        #   firewall/ingressRules/100.
        # @param [String] ingress_rules_id
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
        # @yieldparam result [Google::Apis::AppengineV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_app_firewall_ingress_rule(apps_id, ingress_rules_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/apps/{appsId}/firewall/ingressRules/{ingressRulesId}', options)
          command.response_representation = Google::Apis::AppengineV1::Empty::Representation
          command.response_class = Google::Apis::AppengineV1::Empty
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['ingressRulesId'] = ingress_rules_id unless ingress_rules_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified firewall rule.
        # @param [String] apps_id
        #   Part of `name`. Name of the Firewall resource to retrieve. Example: apps/myapp/
        #   firewall/ingressRules/100.
        # @param [String] ingress_rules_id
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
        # @yieldparam result [Google::Apis::AppengineV1::FirewallRule] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::FirewallRule]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_firewall_ingress_rule(apps_id, ingress_rules_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/firewall/ingressRules/{ingressRulesId}', options)
          command.response_representation = Google::Apis::AppengineV1::FirewallRule::Representation
          command.response_class = Google::Apis::AppengineV1::FirewallRule
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['ingressRulesId'] = ingress_rules_id unless ingress_rules_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the firewall rules of an application.
        # @param [String] apps_id
        #   Part of `parent`. Name of the Firewall collection to retrieve. Example: apps/
        #   myapp/firewall/ingressRules.
        # @param [String] matching_address
        #   A valid IP Address. If set, only rules matching this address will be returned.
        #   The first returned rule will be the rule that fires on requests from this IP.
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
        # @yieldparam result [Google::Apis::AppengineV1::ListIngressRulesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::ListIngressRulesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_firewall_ingress_rules(apps_id, matching_address: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/firewall/ingressRules', options)
          command.response_representation = Google::Apis::AppengineV1::ListIngressRulesResponse::Representation
          command.response_class = Google::Apis::AppengineV1::ListIngressRulesResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['matchingAddress'] = matching_address unless matching_address.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified firewall rule.
        # @param [String] apps_id
        #   Part of `name`. Name of the Firewall resource to update. Example: apps/myapp/
        #   firewall/ingressRules/100.
        # @param [String] ingress_rules_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [Google::Apis::AppengineV1::FirewallRule] firewall_rule_object
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
        # @yieldparam result [Google::Apis::AppengineV1::FirewallRule] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::FirewallRule]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_app_firewall_ingress_rule(apps_id, ingress_rules_id, firewall_rule_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/apps/{appsId}/firewall/ingressRules/{ingressRulesId}', options)
          command.request_representation = Google::Apis::AppengineV1::FirewallRule::Representation
          command.request_object = firewall_rule_object
          command.response_representation = Google::Apis::AppengineV1::FirewallRule::Representation
          command.response_class = Google::Apis::AppengineV1::FirewallRule
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['ingressRulesId'] = ingress_rules_id unless ingress_rules_id.nil?
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
        # @yieldparam result [Google::Apis::AppengineV1::Location] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Location]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_location(apps_id, locations_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/locations/{locationsId}', options)
          command.response_representation = Google::Apis::AppengineV1::Location::Representation
          command.response_class = Google::Apis::AppengineV1::Location
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
        # @yieldparam result [Google::Apis::AppengineV1::ListLocationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::ListLocationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_locations(apps_id, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/locations', options)
          command.response_representation = Google::Apis::AppengineV1::ListLocationsResponse::Representation
          command.response_class = Google::Apis::AppengineV1::ListLocationsResponse
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
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_operation(apps_id, operations_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/operations/{operationsId}', options)
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
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
        # @yieldparam result [Google::Apis::AppengineV1::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_operations(apps_id, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/operations', options)
          command.response_representation = Google::Apis::AppengineV1::ListOperationsResponse::Representation
          command.response_class = Google::Apis::AppengineV1::ListOperationsResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified service and all enclosed versions.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/services/
        #   default.
        # @param [String] services_id
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
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_app_service(apps_id, services_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/apps/{appsId}/services/{servicesId}', options)
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['servicesId'] = services_id unless services_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the current configuration of the specified service.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/services/
        #   default.
        # @param [String] services_id
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
        # @yieldparam result [Google::Apis::AppengineV1::Service] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Service]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_service(apps_id, services_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/services/{servicesId}', options)
          command.response_representation = Google::Apis::AppengineV1::Service::Representation
          command.response_class = Google::Apis::AppengineV1::Service
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['servicesId'] = services_id unless services_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the services in the application.
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
        # @yieldparam result [Google::Apis::AppengineV1::ListServicesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::ListServicesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_services(apps_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/services', options)
          command.response_representation = Google::Apis::AppengineV1::ListServicesResponse::Representation
          command.response_class = Google::Apis::AppengineV1::ListServicesResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the configuration of the specified service.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource to update. Example: apps/myapp/services/
        #   default.
        # @param [String] services_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [Google::Apis::AppengineV1::Service] service_object
        # @param [Boolean] migrate_traffic
        #   Set to true to gradually shift traffic to one or more versions that you
        #   specify. By default, traffic is shifted immediately. For gradual traffic
        #   migration, the target versions must be located within instances that are
        #   configured for both warmup requests (https://cloud.google.com/appengine/docs/
        #   admin-api/reference/rest/v1/apps.services.versions#InboundServiceType) and
        #   automatic scaling (https://cloud.google.com/appengine/docs/admin-api/reference/
        #   rest/v1/apps.services.versions#AutomaticScaling). You must specify the shardBy
        #   (https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.
        #   services#ShardBy) field in the Service resource. Gradual traffic migration is
        #   not supported in the App Engine flexible environment. For examples, see
        #   Migrating and Splitting Traffic (https://cloud.google.com/appengine/docs/admin-
        #   api/migrating-splitting-traffic).
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
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_app_service(apps_id, services_id, service_object = nil, migrate_traffic: nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/apps/{appsId}/services/{servicesId}', options)
          command.request_representation = Google::Apis::AppengineV1::Service::Representation
          command.request_object = service_object
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['servicesId'] = services_id unless services_id.nil?
          command.query['migrateTraffic'] = migrate_traffic unless migrate_traffic.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deploys code and resource files to a new version.
        # @param [String] apps_id
        #   Part of `parent`. Name of the parent resource to create this version under.
        #   Example: apps/myapp/services/default.
        # @param [String] services_id
        #   Part of `parent`. See documentation of `appsId`.
        # @param [Google::Apis::AppengineV1::Version] version_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_app_service_version(apps_id, services_id, version_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/apps/{appsId}/services/{servicesId}/versions', options)
          command.request_representation = Google::Apis::AppengineV1::Version::Representation
          command.request_object = version_object
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['servicesId'] = services_id unless services_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing Version resource.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/services/
        #   default/versions/v1.
        # @param [String] services_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] versions_id
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
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_app_service_version(apps_id, services_id, versions_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/apps/{appsId}/services/{servicesId}/versions/{versionsId}', options)
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['servicesId'] = services_id unless services_id.nil?
          command.params['versionsId'] = versions_id unless versions_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified Version resource. By default, only a BASIC_VIEW will be
        # returned. Specify the FULL_VIEW parameter to get the full resource.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/services/
        #   default/versions/v1.
        # @param [String] services_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] versions_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] view
        #   Controls the set of fields returned in the Get response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1::Version] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Version]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_service_version(apps_id, services_id, versions_id, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/services/{servicesId}/versions/{versionsId}', options)
          command.response_representation = Google::Apis::AppengineV1::Version::Representation
          command.response_class = Google::Apis::AppengineV1::Version
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['servicesId'] = services_id unless services_id.nil?
          command.params['versionsId'] = versions_id unless versions_id.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the versions of a service.
        # @param [String] apps_id
        #   Part of `parent`. Name of the parent Service resource. Example: apps/myapp/
        #   services/default.
        # @param [String] services_id
        #   Part of `parent`. See documentation of `appsId`.
        # @param [Fixnum] page_size
        #   Maximum results to return per page.
        # @param [String] page_token
        #   Continuation token for fetching the next page of results.
        # @param [String] view
        #   Controls the set of fields returned in the List response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1::ListVersionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::ListVersionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_service_versions(apps_id, services_id, page_size: nil, page_token: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/services/{servicesId}/versions', options)
          command.response_representation = Google::Apis::AppengineV1::ListVersionsResponse::Representation
          command.response_class = Google::Apis::AppengineV1::ListVersionsResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['servicesId'] = services_id unless services_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified Version resource. You can specify the following fields
        # depending on the App Engine environment and type of scaling that the version
        # resource uses:Standard environment
        # instance_class (https://cloud.google.com/appengine/docs/admin-api/reference/
        # rest/v1/apps.services.versions#Version.FIELDS.instance_class)automatic scaling
        # in the standard environment:
        # automatic_scaling.min_idle_instances (https://cloud.google.com/appengine/docs/
        # admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.
        # automatic_scaling)
        # automatic_scaling.max_idle_instances (https://cloud.google.com/appengine/docs/
        # admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.
        # automatic_scaling)
        # automaticScaling.standard_scheduler_settings.max_instances (https://cloud.
        # google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#
        # StandardSchedulerSettings)
        # automaticScaling.standard_scheduler_settings.min_instances (https://cloud.
        # google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.versions#
        # StandardSchedulerSettings)
        # automaticScaling.standard_scheduler_settings.target_cpu_utilization (https://
        # cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services.
        # versions#StandardSchedulerSettings)
        # automaticScaling.standard_scheduler_settings.target_throughput_utilization (
        # https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.
        # services.versions#StandardSchedulerSettings)basic scaling or manual scaling in
        # the standard environment:
        # serving_status (https://cloud.google.com/appengine/docs/admin-api/reference/
        # rest/v1/apps.services.versions#Version.FIELDS.serving_status)Flexible
        # environment
        # serving_status (https://cloud.google.com/appengine/docs/admin-api/reference/
        # rest/v1/apps.services.versions#Version.FIELDS.serving_status)automatic scaling
        # in the flexible environment:
        # automatic_scaling.min_total_instances (https://cloud.google.com/appengine/docs/
        # admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.
        # automatic_scaling)
        # automatic_scaling.max_total_instances (https://cloud.google.com/appengine/docs/
        # admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.
        # automatic_scaling)
        # automatic_scaling.cool_down_period_sec (https://cloud.google.com/appengine/
        # docs/admin-api/reference/rest/v1/apps.services.versions#Version.FIELDS.
        # automatic_scaling)
        # automatic_scaling.cpu_utilization.target_utilization (https://cloud.google.com/
        # appengine/docs/admin-api/reference/rest/v1/apps.services.versions#Version.
        # FIELDS.automatic_scaling)
        # @param [String] apps_id
        #   Part of `name`. Name of the resource to update. Example: apps/myapp/services/
        #   default/versions/1.
        # @param [String] services_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] versions_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [Google::Apis::AppengineV1::Version] version_object
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
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_app_service_version(apps_id, services_id, versions_id, version_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/apps/{appsId}/services/{servicesId}/versions/{versionsId}', options)
          command.request_representation = Google::Apis::AppengineV1::Version::Representation
          command.request_object = version_object
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['servicesId'] = services_id unless services_id.nil?
          command.params['versionsId'] = versions_id unless versions_id.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Enables debugging on a VM instance. This allows you to use the SSH command to
        # connect to the virtual machine where the instance lives. While in "debug mode",
        # the instance continues to serve live traffic. You should delete the instance
        # when you are done debugging and then allow the system to take over and
        # determine if another instance should be started.Only applicable for instances
        # in App Engine flexible environment.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/services/
        #   default/versions/v1/instances/instance-1.
        # @param [String] services_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] versions_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] instances_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [Google::Apis::AppengineV1::DebugInstanceRequest] debug_instance_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def debug_instance(apps_id, services_id, versions_id, instances_id, debug_instance_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/apps/{appsId}/services/{servicesId}/versions/{versionsId}/instances/{instancesId}:debug', options)
          command.request_representation = Google::Apis::AppengineV1::DebugInstanceRequest::Representation
          command.request_object = debug_instance_request_object
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['servicesId'] = services_id unless services_id.nil?
          command.params['versionsId'] = versions_id unless versions_id.nil?
          command.params['instancesId'] = instances_id unless instances_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Stops a running instance.The instance might be automatically recreated based
        # on the scaling settings of the version. For more information, see "How
        # Instances are Managed" (standard environment (https://cloud.google.com/
        # appengine/docs/standard/python/how-instances-are-managed) | flexible
        # environment (https://cloud.google.com/appengine/docs/flexible/python/how-
        # instances-are-managed)).To ensure that instances are not re-created and avoid
        # getting billed, you can stop all instances within the target version by
        # changing the serving status of the version to STOPPED with the apps.services.
        # versions.patch (https://cloud.google.com/appengine/docs/admin-api/reference/
        # rest/v1/apps.services.versions/patch) method.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/services/
        #   default/versions/v1/instances/instance-1.
        # @param [String] services_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] versions_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] instances_id
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
        # @yieldparam result [Google::Apis::AppengineV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_app_service_version_instance(apps_id, services_id, versions_id, instances_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/apps/{appsId}/services/{servicesId}/versions/{versionsId}/instances/{instancesId}', options)
          command.response_representation = Google::Apis::AppengineV1::Operation::Representation
          command.response_class = Google::Apis::AppengineV1::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['servicesId'] = services_id unless services_id.nil?
          command.params['versionsId'] = versions_id unless versions_id.nil?
          command.params['instancesId'] = instances_id unless instances_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets instance information.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/services/
        #   default/versions/v1/instances/instance-1.
        # @param [String] services_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] versions_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] instances_id
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
        # @yieldparam result [Google::Apis::AppengineV1::Instance] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::Instance]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_service_version_instance(apps_id, services_id, versions_id, instances_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/services/{servicesId}/versions/{versionsId}/instances/{instancesId}', options)
          command.response_representation = Google::Apis::AppengineV1::Instance::Representation
          command.response_class = Google::Apis::AppengineV1::Instance
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['servicesId'] = services_id unless services_id.nil?
          command.params['versionsId'] = versions_id unless versions_id.nil?
          command.params['instancesId'] = instances_id unless instances_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the instances of a version.Tip: To aggregate details about instances
        # over time, see the Stackdriver Monitoring API (https://cloud.google.com/
        # monitoring/api/ref_v3/rest/v3/projects.timeSeries/list).
        # @param [String] apps_id
        #   Part of `parent`. Name of the parent Version resource. Example: apps/myapp/
        #   services/default/versions/v1.
        # @param [String] services_id
        #   Part of `parent`. See documentation of `appsId`.
        # @param [String] versions_id
        #   Part of `parent`. See documentation of `appsId`.
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
        # @yieldparam result [Google::Apis::AppengineV1::ListInstancesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1::ListInstancesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_service_version_instances(apps_id, services_id, versions_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/apps/{appsId}/services/{servicesId}/versions/{versionsId}/instances', options)
          command.response_representation = Google::Apis::AppengineV1::ListInstancesResponse::Representation
          command.response_class = Google::Apis::AppengineV1::ListInstancesResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['servicesId'] = services_id unless services_id.nil?
          command.params['versionsId'] = versions_id unless versions_id.nil?
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
