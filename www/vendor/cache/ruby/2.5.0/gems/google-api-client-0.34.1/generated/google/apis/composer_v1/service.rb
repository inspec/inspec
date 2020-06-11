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
    module ComposerV1
      # Cloud Composer API
      #
      # Manages Apache Airflow environments on Google Cloud Platform.
      #
      # @example
      #    require 'google/apis/composer_v1'
      #
      #    Composer = Google::Apis::ComposerV1 # Alias the module
      #    service = Composer::CloudComposerService.new
      #
      # @see https://cloud.google.com/composer/
      class CloudComposerService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://composer.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Create a new environment.
        # @param [String] parent
        #   The parent must be of the form
        #   "projects/`projectId`/locations/`locationId`".
        # @param [Google::Apis::ComposerV1::Environment] environment_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ComposerV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ComposerV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_environment(parent, environment_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/{+parent}/environments', options)
          command.request_representation = Google::Apis::ComposerV1::Environment::Representation
          command.request_object = environment_object
          command.response_representation = Google::Apis::ComposerV1::Operation::Representation
          command.response_class = Google::Apis::ComposerV1::Operation
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Delete an environment.
        # @param [String] name
        #   The environment to delete, in the form:
        #   "projects/`projectId`/locations/`locationId`/environments/`environmentId`"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ComposerV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ComposerV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_environment(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::ComposerV1::Operation::Representation
          command.response_class = Google::Apis::ComposerV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get an existing environment.
        # @param [String] name
        #   The resource name of the environment to get, in the form:
        #   "projects/`projectId`/locations/`locationId`/environments/`environmentId`"
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ComposerV1::Environment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ComposerV1::Environment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_environment(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::ComposerV1::Environment::Representation
          command.response_class = Google::Apis::ComposerV1::Environment
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List environments.
        # @param [String] parent
        #   List environments in the given project and location, in the form:
        #   "projects/`projectId`/locations/`locationId`"
        # @param [Fixnum] page_size
        #   The maximum number of environments to return.
        # @param [String] page_token
        #   The next_page_token value returned from a previous List request, if any.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ComposerV1::ListEnvironmentsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ComposerV1::ListEnvironmentsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_environments(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/environments', options)
          command.response_representation = Google::Apis::ComposerV1::ListEnvironmentsResponse::Representation
          command.response_class = Google::Apis::ComposerV1::ListEnvironmentsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Update an environment.
        # @param [String] name
        #   The relative resource name of the environment to update, in the form:
        #   "projects/`projectId`/locations/`locationId`/environments/`environmentId`"
        # @param [Google::Apis::ComposerV1::Environment] environment_object
        # @param [String] update_mask
        #   Required. A comma-separated list of paths, relative to `Environment`, of
        #   fields to update.
        #   For example, to set the version of scikit-learn to install in the
        #   environment to 0.19.0 and to remove an existing installation of
        #   numpy, the `updateMask` parameter would include the following two
        #   `paths` values: "config.softwareConfig.pypiPackages.scikit-learn" and
        #   "config.softwareConfig.pypiPackages.numpy". The included patch
        #   environment would specify the scikit-learn version as follows:
        #   `
        #   "config":`
        #   "softwareConfig":`
        #   "pypiPackages":`
        #   "scikit-learn":"==0.19.0"
        #   `
        #   `
        #   `
        #   `
        #   Note that in the above example, any existing PyPI packages
        #   other than scikit-learn and numpy will be unaffected.
        #   Only one update type may be included in a single request's `updateMask`.
        #   For example, one cannot update both the PyPI packages and
        #   labels in the same request. However, it is possible to update multiple
        #   members of a map field simultaneously in the same request. For example,
        #   to set the labels "label1" and "label2" while clearing "label3" (assuming
        #   it already exists), one can
        #   provide the paths "labels.label1", "labels.label2", and "labels.label3"
        #   and populate the patch environment as follows:
        #   `
        #   "labels":`
        #   "label1":"new-label1-value"
        #   "label2":"new-label2-value"
        #   `
        #   `
        #   Note that in the above example, any existing labels that are not
        #   included in the `updateMask` will be unaffected.
        #   It is also possible to replace an entire map field by providing the
        #   map field's path in the `updateMask`. The new value of the field will
        #   be that which is provided in the patch environment. For example, to
        #   delete all pre-existing user-specified PyPI packages and
        #   install botocore at version 1.7.14, the `updateMask` would contain
        #   the path "config.softwareConfig.pypiPackages", and
        #   the patch environment would be the following:
        #   `
        #   "config":`
        #   "softwareConfig":`
        #   "pypiPackages":`
        #   "botocore":"==1.7.14"
        #   `
        #   `
        #   `
        #   `
        #   **Note:** Only the following fields can be updated:
        #   <table>
        #   <tbody>
        #   <tr>
        #   <td><strong>Mask</strong></td>
        #   <td><strong>Purpose</strong></td>
        #   </tr>
        #   <tr>
        #   <td>config.softwareConfig.pypiPackages
        #   </td>
        #   <td>Replace all custom custom PyPI packages. If a replacement
        #   package map is not included in `environment`, all custom
        #   PyPI packages are cleared. It is an error to provide both this mask and a
        #   mask specifying an individual package.</td>
        #   </tr>
        #   <tr>
        #   <td>config.softwareConfig.pypiPackages.<var>packagename</var></td>
        #   <td>Update the custom PyPI package <var>packagename</var>,
        #   preserving other packages. To delete the package, include it in
        #   `updateMask`, and omit the mapping for it in
        #   `environment.config.softwareConfig.pypiPackages`. It is an error
        #   to provide both a mask of this form and the
        #   "config.softwareConfig.pypiPackages" mask.</td>
        #   </tr>
        #   <tr>
        #   <td>labels</td>
        #   <td>Replace all environment labels. If a replacement labels map is not
        #   included in `environment`, all labels are cleared. It is an error to
        #   provide both this mask and a mask specifying one or more individual
        #   labels.</td>
        #   </tr>
        #   <tr>
        #   <td>labels.<var>labelName</var></td>
        #   <td>Set the label named <var>labelName</var>, while preserving other
        #   labels. To delete the label, include it in `updateMask` and omit its
        #   mapping in `environment.labels`. It is an error to provide both a
        #   mask of this form and the "labels" mask.</td>
        #   </tr>
        #   <tr>
        #   <td>config.nodeCount</td>
        #   <td>Horizontally scale the number of nodes in the environment. An integer
        #   greater than or equal to 3 must be provided in the `config.nodeCount`
        #   field.
        #   </td>
        #   </tr>
        #   <tr>
        #   <td>config.softwareConfig.airflowConfigOverrides</td>
        #   <td>Replace all Apache Airflow config overrides. If a replacement config
        #   overrides map is not included in `environment`, all config overrides
        #   are cleared.
        #   It is an error to provide both this mask and a mask specifying one or
        #   more individual config overrides.</td>
        #   </tr>
        #   <tr>
        #   <td>config.softwareConfig.airflowConfigOverrides.<var>section</var>-<var>name
        #   </var></td>
        #   <td>Override the Apache Airflow config property <var>name</var> in the
        #   section named <var>section</var>, preserving other properties. To delete
        #   the property override, include it in `updateMask` and omit its mapping
        #   in `environment.config.softwareConfig.airflowConfigOverrides`.
        #   It is an error to provide both a mask of this form and the
        #   "config.softwareConfig.airflowConfigOverrides" mask.</td>
        #   </tr>
        #   <tr>
        #   <td>config.softwareConfig.envVariables</td>
        #   <td>Replace all environment variables. If a replacement environment
        #   variable map is not included in `environment`, all custom environment
        #   variables  are cleared.
        #   It is an error to provide both this mask and a mask specifying one or
        #   more individual environment variables.</td>
        #   </tr>
        #   </tbody>
        #   </table>
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ComposerV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ComposerV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_project_location_environment(name, environment_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:patch, 'v1/{+name}', options)
          command.request_representation = Google::Apis::ComposerV1::Environment::Representation
          command.request_object = environment_object
          command.response_representation = Google::Apis::ComposerV1::Operation::Representation
          command.response_class = Google::Apis::ComposerV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List ImageVersions for provided location.
        # @param [String] parent
        #   List ImageVersions in the given project and location, in the form:
        #   "projects/`projectId`/locations/`locationId`"
        # @param [Fixnum] page_size
        #   The maximum number of image_versions to return.
        # @param [String] page_token
        #   The next_page_token value returned from a previous List request, if any.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ComposerV1::ListImageVersionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ComposerV1::ListImageVersionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_image_versions(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+parent}/imageVersions', options)
          command.response_representation = Google::Apis::ComposerV1::ListImageVersionsResponse::Representation
          command.response_class = Google::Apis::ComposerV1::ListImageVersionsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a long-running operation. This method indicates that the client is
        # no longer interested in the operation result. It does not cancel the
        # operation. If the server doesn't support this method, it returns
        # `google.rpc.Code.UNIMPLEMENTED`.
        # @param [String] name
        #   The name of the operation resource to be deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::ComposerV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ComposerV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::ComposerV1::Empty::Representation
          command.response_class = Google::Apis::ComposerV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
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
        # @yieldparam result [Google::Apis::ComposerV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ComposerV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::ComposerV1::Operation::Representation
          command.response_class = Google::Apis::ComposerV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists operations that match the specified filter in the request. If the
        # server doesn't support this method, it returns `UNIMPLEMENTED`.
        # NOTE: the `name` binding allows API services to override the binding
        # to use different resource name schemes, such as `users/*/operations`. To
        # override the binding, API services can add a binding such as
        # `"/v1/`name=users/*`/operations"` to their service configuration.
        # For backwards compatibility, the default name includes the operations
        # collection id, however overriding users must ensure the name binding
        # is the parent resource, without the operations collection id.
        # @param [String] name
        #   The name of the operation's parent resource.
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
        # @yieldparam result [Google::Apis::ComposerV1::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::ComposerV1::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_operations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/{+name}/operations', options)
          command.response_representation = Google::Apis::ComposerV1::ListOperationsResponse::Representation
          command.response_class = Google::Apis::ComposerV1::ListOperationsResponse
          command.params['name'] = name unless name.nil?
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
