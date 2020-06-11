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
    module AppengineV1beta4
      # App Engine Admin API
      #
      # Provisions and manages developers' App Engine applications.
      #
      # @example
      #    require 'google/apis/appengine_v1beta4'
      #
      #    Appengine = Google::Apis::AppengineV1beta4 # Alias the module
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
        # https://cloud.google.com/appengine/docs/python/console/).
        # @param [Google::Apis::AppengineV1beta4::Application] application_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_app(application_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta4/apps', options)
          command.request_representation = Google::Apis::AppengineV1beta4::Application::Representation
          command.request_object = application_object
          command.response_representation = Google::Apis::AppengineV1beta4::Operation::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Operation
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets information about an application.
        # @param [String] apps_id
        #   Part of `name`. Name of the application to get. Example: apps/myapp.
        # @param [Boolean] ensure_resources_exist
        #   Certain resources associated with an application are created on-demand.
        #   Controls whether these resources should be created when performing the GET
        #   operation. If specified and any resources could not be created, the request
        #   will fail with an error code. Additionally, this parameter can cause the
        #   request to take longer to complete.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1beta4::Application] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Application]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app(apps_id, ensure_resources_exist: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta4/apps/{appsId}', options)
          command.response_representation = Google::Apis::AppengineV1beta4::Application::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Application
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['ensureResourcesExist'] = ensure_resources_exist unless ensure_resources_exist.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified Application resource. You can update the following
        # fields:
        # auth_domain (https://cloud.google.com/appengine/docs/admin-api/reference/rest/
        # v1beta4/apps#Application.FIELDS.auth_domain)
        # default_cookie_expiration (https://cloud.google.com/appengine/docs/admin-api/
        # reference/rest/v1beta4/apps#Application.FIELDS.default_cookie_expiration)
        # @param [String] apps_id
        #   Part of `name`. Name of the Application resource to update. Example: apps/
        #   myapp.
        # @param [Google::Apis::AppengineV1beta4::Application] application_object
        # @param [String] mask
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_app(apps_id, application_object = nil, mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta4/apps/{appsId}', options)
          command.request_representation = Google::Apis::AppengineV1beta4::Application::Representation
          command.request_object = application_object
          command.response_representation = Google::Apis::AppengineV1beta4::Operation::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['mask'] = mask unless mask.nil?
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::Location] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Location]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_location(apps_id, locations_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta4/apps/{appsId}/locations/{locationsId}', options)
          command.response_representation = Google::Apis::AppengineV1beta4::Location::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Location
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::ListLocationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::ListLocationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_locations(apps_id, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta4/apps/{appsId}/locations', options)
          command.response_representation = Google::Apis::AppengineV1beta4::ListLocationsResponse::Representation
          command.response_class = Google::Apis::AppengineV1beta4::ListLocationsResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the specified module and all enclosed versions.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/modules/
        #   default.
        # @param [String] modules_id
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_app_module(apps_id, modules_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta4/apps/{appsId}/modules/{modulesId}', options)
          command.response_representation = Google::Apis::AppengineV1beta4::Operation::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['modulesId'] = modules_id unless modules_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the current configuration of the specified module.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/modules/
        #   default.
        # @param [String] modules_id
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::Module] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Module]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_module(apps_id, modules_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta4/apps/{appsId}/modules/{modulesId}', options)
          command.response_representation = Google::Apis::AppengineV1beta4::Module::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Module
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['modulesId'] = modules_id unless modules_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all the modules in the application.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp.
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::ListModulesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::ListModulesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_modules(apps_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta4/apps/{appsId}/modules', options)
          command.response_representation = Google::Apis::AppengineV1beta4::ListModulesResponse::Representation
          command.response_class = Google::Apis::AppengineV1beta4::ListModulesResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the configuration of the specified module.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource to update. Example: apps/myapp/modules/
        #   default.
        # @param [String] modules_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [Google::Apis::AppengineV1beta4::Module] module_object
        # @param [String] mask
        #   Standard field mask for the set of fields to be updated.
        # @param [Boolean] migrate_traffic
        #   Set to true to gradually shift traffic to one or more versions that you
        #   specify. By default, traffic is shifted immediately. For gradual traffic
        #   migration, the target versions must be located within instances that are
        #   configured for both warmup requests (https://cloud.google.com/appengine/docs/
        #   admin-api/reference/rest/v1beta4/apps.modules.versions#inboundservicetype) and
        #   automatic scaling (https://cloud.google.com/appengine/docs/admin-api/reference/
        #   rest/v1beta4/apps.modules.versions#automaticscaling). You must specify the
        #   shardBy (https://cloud.google.com/appengine/docs/admin-api/reference/rest/
        #   v1beta4/apps.modules#shardby) field in the Module resource. Gradual traffic
        #   migration is not supported in the App Engine flexible environment. For
        #   examples, see Migrating and Splitting Traffic (https://cloud.google.com/
        #   appengine/docs/admin-api/migrating-splitting-traffic).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_app_module(apps_id, modules_id, module_object = nil, mask: nil, migrate_traffic: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta4/apps/{appsId}/modules/{modulesId}', options)
          command.request_representation = Google::Apis::AppengineV1beta4::Module::Representation
          command.request_object = module_object
          command.response_representation = Google::Apis::AppengineV1beta4::Operation::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['modulesId'] = modules_id unless modules_id.nil?
          command.query['mask'] = mask unless mask.nil?
          command.query['migrateTraffic'] = migrate_traffic unless migrate_traffic.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deploys code and resource files to a new version.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource to update. Example: apps/myapp/modules/
        #   default.
        # @param [String] modules_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [Google::Apis::AppengineV1beta4::Version] version_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_app_module_version(apps_id, modules_id, version_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta4/apps/{appsId}/modules/{modulesId}/versions', options)
          command.request_representation = Google::Apis::AppengineV1beta4::Version::Representation
          command.request_object = version_object
          command.response_representation = Google::Apis::AppengineV1beta4::Operation::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['modulesId'] = modules_id unless modules_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes an existing version.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/modules/
        #   default/versions/v1.
        # @param [String] modules_id
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_app_module_version(apps_id, modules_id, versions_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta4/apps/{appsId}/modules/{modulesId}/versions/{versionsId}', options)
          command.response_representation = Google::Apis::AppengineV1beta4::Operation::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['modulesId'] = modules_id unless modules_id.nil?
          command.params['versionsId'] = versions_id unless versions_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the specified Version resource. By default, only a BASIC_VIEW will be
        # returned. Specify the FULL_VIEW parameter to get the full resource.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/modules/
        #   default/versions/v1.
        # @param [String] modules_id
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::Version] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Version]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_module_version(apps_id, modules_id, versions_id, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta4/apps/{appsId}/modules/{modulesId}/versions/{versionsId}', options)
          command.response_representation = Google::Apis::AppengineV1beta4::Version::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Version
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['modulesId'] = modules_id unless modules_id.nil?
          command.params['versionsId'] = versions_id unless versions_id.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists the versions of a module.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/modules/
        #   default.
        # @param [String] modules_id
        #   Part of `name`. See documentation of `appsId`.
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::ListVersionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::ListVersionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_module_versions(apps_id, modules_id, page_size: nil, page_token: nil, view: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta4/apps/{appsId}/modules/{modulesId}/versions', options)
          command.response_representation = Google::Apis::AppengineV1beta4::ListVersionsResponse::Representation
          command.response_class = Google::Apis::AppengineV1beta4::ListVersionsResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['modulesId'] = modules_id unless modules_id.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['view'] = view unless view.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the specified Version resource. You can specify the following fields
        # depending on the App Engine environment and type of scaling that the version
        # resource uses:
        # serving_status (https://cloud.google.com/appengine/docs/admin-api/reference/
        # rest/v1beta4/apps.modules.versions#Version.FIELDS.serving_status):  For
        # Version resources that use basic scaling, manual scaling, or run in  the App
        # Engine flexible environment.
        # instance_class (https://cloud.google.com/appengine/docs/admin-api/reference/
        # rest/v1beta4/apps.modules.versions#Version.FIELDS.instance_class):  For
        # Version resources that run in the App Engine standard environment.
        # automatic_scaling.min_idle_instances (https://cloud.google.com/appengine/docs/
        # admin-api/reference/rest/v1beta4/apps.modules.versions#Version.FIELDS.
        # automatic_scaling):  For Version resources that use automatic scaling and run
        # in the App  Engine standard environment.
        # automatic_scaling.max_idle_instances (https://cloud.google.com/appengine/docs/
        # admin-api/reference/rest/v1beta4/apps.modules.versions#Version.FIELDS.
        # automatic_scaling):  For Version resources that use automatic scaling and run
        # in the App  Engine standard environment.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource to update. Example: apps/myapp/modules/
        #   default/versions/1.
        # @param [String] modules_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] versions_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [Google::Apis::AppengineV1beta4::Version] version_object
        # @param [String] mask
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_app_module_version(apps_id, modules_id, versions_id, version_object = nil, mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1beta4/apps/{appsId}/modules/{modulesId}/versions/{versionsId}', options)
          command.request_representation = Google::Apis::AppengineV1beta4::Version::Representation
          command.request_object = version_object
          command.response_representation = Google::Apis::AppengineV1beta4::Operation::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['modulesId'] = modules_id unless modules_id.nil?
          command.params['versionsId'] = versions_id unless versions_id.nil?
          command.query['mask'] = mask unless mask.nil?
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
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/modules/
        #   default/versions/v1/instances/instance-1.
        # @param [String] modules_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] versions_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] instances_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [Google::Apis::AppengineV1beta4::DebugInstanceRequest] debug_instance_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::AppengineV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def debug_instance(apps_id, modules_id, versions_id, instances_id, debug_instance_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1beta4/apps/{appsId}/modules/{modulesId}/versions/{versionsId}/instances/{instancesId}:debug', options)
          command.request_representation = Google::Apis::AppengineV1beta4::DebugInstanceRequest::Representation
          command.request_object = debug_instance_request_object
          command.response_representation = Google::Apis::AppengineV1beta4::Operation::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['modulesId'] = modules_id unless modules_id.nil?
          command.params['versionsId'] = versions_id unless versions_id.nil?
          command.params['instancesId'] = instances_id unless instances_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Stops a running instance.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/modules/
        #   default/versions/v1/instances/instance-1.
        # @param [String] modules_id
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_app_module_version_instance(apps_id, modules_id, versions_id, instances_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1beta4/apps/{appsId}/modules/{modulesId}/versions/{versionsId}/instances/{instancesId}', options)
          command.response_representation = Google::Apis::AppengineV1beta4::Operation::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Operation
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['modulesId'] = modules_id unless modules_id.nil?
          command.params['versionsId'] = versions_id unless versions_id.nil?
          command.params['instancesId'] = instances_id unless instances_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets instance information.
        # @param [String] apps_id
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/modules/
        #   default/versions/v1/instances/instance-1.
        # @param [String] modules_id
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::Instance] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Instance]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_module_version_instance(apps_id, modules_id, versions_id, instances_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta4/apps/{appsId}/modules/{modulesId}/versions/{versionsId}/instances/{instancesId}', options)
          command.response_representation = Google::Apis::AppengineV1beta4::Instance::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Instance
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['modulesId'] = modules_id unless modules_id.nil?
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
        #   Part of `name`. Name of the resource requested. Example: apps/myapp/modules/
        #   default/versions/v1.
        # @param [String] modules_id
        #   Part of `name`. See documentation of `appsId`.
        # @param [String] versions_id
        #   Part of `name`. See documentation of `appsId`.
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::ListInstancesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::ListInstancesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_module_version_instances(apps_id, modules_id, versions_id, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta4/apps/{appsId}/modules/{modulesId}/versions/{versionsId}/instances', options)
          command.response_representation = Google::Apis::AppengineV1beta4::ListInstancesResponse::Representation
          command.response_class = Google::Apis::AppengineV1beta4::ListInstancesResponse
          command.params['appsId'] = apps_id unless apps_id.nil?
          command.params['modulesId'] = modules_id unless modules_id.nil?
          command.params['versionsId'] = versions_id unless versions_id.nil?
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_app_operation(apps_id, operations_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta4/apps/{appsId}/operations/{operationsId}', options)
          command.response_representation = Google::Apis::AppengineV1beta4::Operation::Representation
          command.response_class = Google::Apis::AppengineV1beta4::Operation
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
        # @yieldparam result [Google::Apis::AppengineV1beta4::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::AppengineV1beta4::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_app_operations(apps_id, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta4/apps/{appsId}/operations', options)
          command.response_representation = Google::Apis::AppengineV1beta4::ListOperationsResponse::Representation
          command.response_class = Google::Apis::AppengineV1beta4::ListOperationsResponse
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
