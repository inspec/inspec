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
    module RunV1beta1
      # Cloud Run API
      #
      # Deploy and manage user provided container images that scale automatically
      #  based on HTTP traffic.
      #
      # @example
      #    require 'google/apis/run_v1beta1'
      #
      #    Run = Google::Apis::RunV1beta1 # Alias the module
      #    service = Run::CloudRunService.new
      #
      # @see https://cloud.google.com/run/
      class CloudRunService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://run.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Rpc to list custom resource definitions.
        # @param [String] continue
        #   Optional encoded string to continue paging.
        # @param [String] field_selector
        #   Allows to filter resources based on a specific value for a field name.
        #   Send this in a query string format. i.e. 'metadata.name%3Dlorem'.
        #   Not currently used by Cloud Run.
        # @param [Boolean] include_uninitialized
        #   Not currently used by Cloud Run.
        # @param [String] label_selector
        #   Allows to filter resources based on a label. Supported operations are
        #   =, !=, exists, in, and notIn.
        # @param [Fixnum] limit
        # @param [String] parent
        #   The project ID or project number from which the storages should
        #   be listed.
        # @param [String] resource_version
        #   The baseline resource version from which the list or watch operation should
        #   start. Not currently used by Cloud Run.
        # @param [Boolean] watch
        #   Flag that indicates that the client expects to watch this resource as well.
        #   Not currently used by Cloud Run.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1beta1::ListCustomResourceDefinitionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1beta1::ListCustomResourceDefinitionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_customresourcedefinitions(continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, parent: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions', options)
          command.response_representation = Google::Apis::RunV1beta1::ListCustomResourceDefinitionsResponse::Representation
          command.response_class = Google::Apis::RunV1beta1::ListCustomResourceDefinitionsResponse
          command.query['continue'] = continue unless continue.nil?
          command.query['fieldSelector'] = field_selector unless field_selector.nil?
          command.query['includeUninitialized'] = include_uninitialized unless include_uninitialized.nil?
          command.query['labelSelector'] = label_selector unless label_selector.nil?
          command.query['limit'] = limit unless limit.nil?
          command.query['parent'] = parent unless parent.nil?
          command.query['resourceVersion'] = resource_version unless resource_version.nil?
          command.query['watch'] = watch unless watch.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a CustomResourceDefinition.
        # @param [String] name
        #   The name of the CustomResourceDefinition being retrieved. If needed,
        #   replace `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1beta1::CustomResourceDefinition] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1beta1::CustomResourceDefinition]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_namespace_customresourcedefinition(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/apiextensions.k8s.io/v1beta1/{+name}', options)
          command.response_representation = Google::Apis::RunV1beta1::CustomResourceDefinition::Representation
          command.response_class = Google::Apis::RunV1beta1::CustomResourceDefinition
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a CustomResourceDefinition.
        # @param [String] name
        #   The name of the CustomResourceDefinition being retrieved. If needed,
        #   replace `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1beta1::CustomResourceDefinition] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1beta1::CustomResourceDefinition]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_customresourcedefinition(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+name}', options)
          command.response_representation = Google::Apis::RunV1beta1::CustomResourceDefinition::Representation
          command.response_class = Google::Apis::RunV1beta1::CustomResourceDefinition
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list custom resource definitions.
        # @param [String] parent
        #   The project ID or project number from which the storages should
        #   be listed.
        # @param [String] continue
        #   Optional encoded string to continue paging.
        # @param [String] field_selector
        #   Allows to filter resources based on a specific value for a field name.
        #   Send this in a query string format. i.e. 'metadata.name%3Dlorem'.
        #   Not currently used by Cloud Run.
        # @param [Boolean] include_uninitialized
        #   Not currently used by Cloud Run.
        # @param [String] label_selector
        #   Allows to filter resources based on a label. Supported operations are
        #   =, !=, exists, in, and notIn.
        # @param [Fixnum] limit
        # @param [String] resource_version
        #   The baseline resource version from which the list or watch operation should
        #   start. Not currently used by Cloud Run.
        # @param [Boolean] watch
        #   Flag that indicates that the client expects to watch this resource as well.
        #   Not currently used by Cloud Run.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1beta1::ListCustomResourceDefinitionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1beta1::ListCustomResourceDefinitionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_customresourcedefinitions(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1beta1/{+parent}/customresourcedefinitions', options)
          command.response_representation = Google::Apis::RunV1beta1::ListCustomResourceDefinitionsResponse::Representation
          command.response_class = Google::Apis::RunV1beta1::ListCustomResourceDefinitionsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['continue'] = continue unless continue.nil?
          command.query['fieldSelector'] = field_selector unless field_selector.nil?
          command.query['includeUninitialized'] = include_uninitialized unless include_uninitialized.nil?
          command.query['labelSelector'] = label_selector unless label_selector.nil?
          command.query['limit'] = limit unless limit.nil?
          command.query['resourceVersion'] = resource_version unless resource_version.nil?
          command.query['watch'] = watch unless watch.nil?
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
