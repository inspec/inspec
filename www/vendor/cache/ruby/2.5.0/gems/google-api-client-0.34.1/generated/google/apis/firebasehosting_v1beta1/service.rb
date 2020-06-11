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
    module FirebasehostingV1beta1
      # Firebase Hosting API
      #
      # The Firebase Hosting REST API enables programmatic and customizable
      #  deployments to your Firebase-hosted sites. Use this REST API to deploy new or
      #  updated hosting configurations and content files.
      #
      # @example
      #    require 'google/apis/firebasehosting_v1beta1'
      #
      #    Firebasehosting = Google::Apis::FirebasehostingV1beta1 # Alias the module
      #    service = Firebasehosting::FirebaseHostingService.new
      #
      # @see https://firebase.google.com/docs/hosting/
      class FirebaseHostingService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://firebasehosting.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Gets the Hosting metadata for a specific site.
        # @param [String] name
        #   Required. The site for which to get the SiteConfig, in the format:
        #   <code>sites/<var>site-name</var>/config</code>
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::SiteConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::SiteConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_site_config(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::FirebasehostingV1beta1::SiteConfig::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::SiteConfig
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the Hosting metadata for a specific site.
        # @param [String] name
        #   Required. The site for which to update the SiteConfig, in the format:
        #   <code>sites/<var>site-name</var>/config</code>
        # @param [Google::Apis::FirebasehostingV1beta1::SiteConfig] site_config_object
        # @param [String] update_mask
        #   A set of field names from your [site configuration](../sites.SiteConfig)
        #   that you want to update.
        #   <br>A field will be overwritten if, and only if, it's in the mask.
        #   <br>If a mask is not provided then a default mask of only
        #   [`max_versions`](../sites.SiteConfig.max_versions) will be used.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::SiteConfig] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::SiteConfig]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_site_config(name, site_config_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::FirebasehostingV1beta1::SiteConfig::Representation
          command.request_object = site_config_object
          command.response_representation = Google::Apis::FirebasehostingV1beta1::SiteConfig::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::SiteConfig
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a domain mapping on the specified site.
        # @param [String] parent
        #   Required. The parent to create the domain association for, in the format:
        #   <code>sites/<var>site-name</var></code>
        # @param [Google::Apis::FirebasehostingV1beta1::Domain] domain_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::Domain] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::Domain]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_site_domain(parent, domain_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/domains', options)
          command.request_representation = Google::Apis::FirebasehostingV1beta1::Domain::Representation
          command.request_object = domain_object
          command.response_representation = Google::Apis::FirebasehostingV1beta1::Domain::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::Domain
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the existing domain mapping on the specified site.
        # @param [String] name
        #   Required. The name of the domain association to delete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_site_domain(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::FirebasehostingV1beta1::Empty::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a domain mapping on the specified site.
        # @param [String] name
        #   Required. The name of the domain configuration to get.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::Domain] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::Domain]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_site_domain(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::FirebasehostingV1beta1::Domain::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::Domain
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the domains for the specified site.
        # @param [String] parent
        #   Required. The parent for which to list domains, in the format:
        #   <code>sites/<var>site-name</var></code>
        # @param [Fixnum] page_size
        #   The page size to return. Defaults to 50.
        # @param [String] page_token
        #   The next_page_token from a previous request, if provided.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::ListDomainsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::ListDomainsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_site_domains(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/domains', options)
          command.response_representation = Google::Apis::FirebasehostingV1beta1::ListDomainsResponse::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::ListDomainsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified domain mapping, creating the mapping as if it does
        # not exist.
        # @param [String] name
        #   Required. The name of the domain association to update or create, if an
        #   association doesn't already exist.
        # @param [Google::Apis::FirebasehostingV1beta1::Domain] domain_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::Domain] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::Domain]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_site_domain(name, domain_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::FirebasehostingV1beta1::Domain::Representation
          command.request_object = domain_object
          command.response_representation = Google::Apis::FirebasehostingV1beta1::Domain::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::Domain
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new release which makes the content of the specified version
        # actively display on the site.
        # @param [String] parent
        #   The site that the release belongs to, in the format:
        #   <code>sites/<var>site-name</var></code>
        # @param [Google::Apis::FirebasehostingV1beta1::Release] release_object
        # @param [String] version_name
        #   The unique identifier for a version, in the format:
        #   <code>/sites/<var>site-name</var>/versions/<var>versionID</var></code>
        #   The <var>site-name</var> in this version identifier must match the
        #   <var>site-name</var> in the `parent` parameter.
        #   <br>
        #   <br>This query parameter must be empty if the `type` field in the
        #   request body is `SITE_DISABLE`.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::Release] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::Release]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_site_release(parent, release_object = nil, version_name: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/releases', options)
          command.request_representation = Google::Apis::FirebasehostingV1beta1::Release::Representation
          command.request_object = release_object
          command.response_representation = Google::Apis::FirebasehostingV1beta1::Release::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::Release
          command.params['parent'] = parent unless parent.nil?
          command.query['versionName'] = version_name unless version_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the releases that have been created on the specified site.
        # @param [String] parent
        #   Required. The parent for which to list files, in the format:
        #   <code>sites/<var>site-name</var></code>
        # @param [Fixnum] page_size
        #   The page size to return. Defaults to 100.
        # @param [String] page_token
        #   The next_page_token from a previous request, if provided.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::ListReleasesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::ListReleasesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_site_releases(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/releases', options)
          command.response_representation = Google::Apis::FirebasehostingV1beta1::ListReleasesResponse::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::ListReleasesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new version for a site.
        # @param [String] parent
        #   Required. The parent to create the version for, in the format:
        #   <code>sites/<var>site-name</var></code>
        # @param [Google::Apis::FirebasehostingV1beta1::Version] version_object
        # @param [Fixnum] size_bytes
        #   The self-reported size of the version. This value is used for a pre-emptive
        #   quota check for legacy version uploads.
        # @param [String] version_id
        #   A unique id for the new version. This is only specified for legacy version
        #   creations.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::Version] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::Version]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_site_version(parent, version_object = nil, size_bytes: nil, version_id: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}/versions', options)
          command.request_representation = Google::Apis::FirebasehostingV1beta1::Version::Representation
          command.request_object = version_object
          command.response_representation = Google::Apis::FirebasehostingV1beta1::Version::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::Version
          command.params['parent'] = parent unless parent.nil?
          command.query['sizeBytes'] = size_bytes unless size_bytes.nil?
          command.query['versionId'] = version_id unless version_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified version.
        # @param [String] name
        #   Required. The name of the version to be deleted, in the format:
        #   <code>sites/<var>site-name</var>/versions/<var>versionID</var></code>
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_site_version(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::FirebasehostingV1beta1::Empty::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified metadata for a version. Note that this method will
        # fail with `FAILED_PRECONDITION` in the event of an invalid state
        # transition. The only valid transition for a version is currently from a
        # `CREATED` status to a `FINALIZED` status.
        # Use [`DeleteVersion`](../sites.versions/delete) to set the status of a
        # version to `DELETED`.
        # @param [String] name
        #   The unique identifier for a version, in the format:
        #   <code>sites/<var>site-name</var>/versions/<var>versionID</var></code>
        #   This name is provided in the response body when you call the
        #   [`CreateVersion`](../sites.versions/create) endpoint.
        # @param [Google::Apis::FirebasehostingV1beta1::Version] version_object
        # @param [String] update_mask
        #   A set of field names from your [version](../sites.versions) that you want
        #   to update.
        #   <br>A field will be overwritten if, and only if, it's in the mask.
        #   <br>If a mask is not provided then a default mask of only
        #   [`status`](../sites.versions#Version.FIELDS.status) will be used.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::Version] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::Version]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_site_version(name, version_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta1/{+name}', options)
          command.request_representation = Google::Apis::FirebasehostingV1beta1::Version::Representation
          command.request_object = version_object
          command.response_representation = Google::Apis::FirebasehostingV1beta1::Version::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::Version
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds content files to a version.
        # @param [String] parent
        #   Required. The version to add files to, in the format:
        #   <code>sites/<var>site-name</var>/versions/<var>versionID</var></code>
        # @param [Google::Apis::FirebasehostingV1beta1::PopulateVersionFilesRequest] populate_version_files_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::PopulateVersionFilesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::PopulateVersionFilesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def populate_site_version_files(parent, populate_version_files_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta1/{+parent}:populateFiles', options)
          command.request_representation = Google::Apis::FirebasehostingV1beta1::PopulateVersionFilesRequest::Representation
          command.request_object = populate_version_files_request_object
          command.response_representation = Google::Apis::FirebasehostingV1beta1::PopulateVersionFilesResponse::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::PopulateVersionFilesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the remaining files to be uploaded for the specified version.
        # @param [String] parent
        #   Required. The parent to list files for, in the format:
        #   <code>sites/<var>site-name</var>/versions/<var>versionID</var></code>
        # @param [Fixnum] page_size
        #   The page size to return. Defaults to 1000.
        # @param [String] page_token
        #   The next_page_token from a previous request, if provided. This will be the
        #   encoded version of a firebase.hosting.proto.metadata.ListFilesPageToken.
        # @param [String] status
        #   The type of files in the version that should be listed.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::FirebasehostingV1beta1::ListVersionFilesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::FirebasehostingV1beta1::ListVersionFilesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_site_version_files(parent, page_size: nil, page_token: nil, status: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/files', options)
          command.response_representation = Google::Apis::FirebasehostingV1beta1::ListVersionFilesResponse::Representation
          command.response_class = Google::Apis::FirebasehostingV1beta1::ListVersionFilesResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['status'] = status unless status.nil?
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
