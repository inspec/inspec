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
    module RunV1alpha1
      # Cloud Run API
      #
      # Deploy and manage user provided container images that scale automatically
      #  based on HTTP traffic.
      #
      # @example
      #    require 'google/apis/run_v1alpha1'
      #
      #    Run = Google::Apis::RunV1alpha1 # Alias the module
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
        
        # RPC to list authorized domains.
        # @param [String] parent
        #   Name of the parent Application resource. Example: `apps/myapp`.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListAuthorizedDomainsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListAuthorizedDomainsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_namespace_authorizeddomains(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/domains.cloudrun.com/v1alpha1/{+parent}/authorizeddomains', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListAuthorizedDomainsResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListAuthorizedDomainsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a configuration.
        # @param [String] name
        #   The name of the configuration being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Configuration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Configuration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_namespace_configuration(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/serving.knative.dev/v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Configuration::Representation
          command.response_class = Google::Apis::RunV1alpha1::Configuration
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list configurations.
        # @param [String] parent
        #   The project ID or project number from which the configurations should be
        #   listed.
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListConfigurationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListConfigurationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_namespace_configurations(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/serving.knative.dev/v1alpha1/{+parent}/configurations', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListConfigurationsResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListConfigurationsResponse
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
        
        # Creates a new domain mapping.
        # @param [String] parent
        #   The project ID or project number in which this domain mapping should be
        #   created.
        # @param [Google::Apis::RunV1alpha1::DomainMapping] domain_mapping_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::DomainMapping] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::DomainMapping]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_namespace_domainmapping(parent, domain_mapping_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'apis/domains.cloudrun.com/v1alpha1/{+parent}/domainmappings', options)
          command.request_representation = Google::Apis::RunV1alpha1::DomainMapping::Representation
          command.request_object = domain_mapping_object
          command.response_representation = Google::Apis::RunV1alpha1::DomainMapping::Representation
          command.response_class = Google::Apis::RunV1alpha1::DomainMapping
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to delete a domain mapping.
        # @param [String] name
        #   The name of the domain mapping being deleted. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] api_version
        #   Cloud Run currently ignores this parameter.
        # @param [String] kind
        #   Cloud Run currently ignores this parameter.
        # @param [Boolean] orphan_dependents
        #   Deprecated.
        #   Specifies the cascade behavior on delete.
        #   Cloud Run only supports cascading behavior, so this must be false.
        #   This attribute is deprecated, and is now replaced with PropagationPolicy
        #   See https://github.com/kubernetes/kubernetes/issues/46659 for more info.
        # @param [String] propagation_policy
        #   Specifies the propagation policy of delete. Cloud Run currently ignores
        #   this setting, and deletes in the background. Please see
        #   kubernetes.io/docs/concepts/workloads/controllers/garbage-collection/ for
        #   more information.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_namespace_domainmapping(name, api_version: nil, kind: nil, orphan_dependents: nil, propagation_policy: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'apis/domains.cloudrun.com/v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Empty::Representation
          command.response_class = Google::Apis::RunV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['apiVersion'] = api_version unless api_version.nil?
          command.query['kind'] = kind unless kind.nil?
          command.query['orphanDependents'] = orphan_dependents unless orphan_dependents.nil?
          command.query['propagationPolicy'] = propagation_policy unless propagation_policy.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a domain mapping.
        # @param [String] name
        #   The name of the domain mapping being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::DomainMapping] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::DomainMapping]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_namespace_domainmapping(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/domains.cloudrun.com/v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::DomainMapping::Representation
          command.response_class = Google::Apis::RunV1alpha1::DomainMapping
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list domain mappings.
        # @param [String] parent
        #   The project ID or project number from which the domain mappings should be
        #   listed.
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListDomainMappingsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListDomainMappingsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_namespace_domainmappings(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/domains.cloudrun.com/v1alpha1/{+parent}/domainmappings', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListDomainMappingsResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListDomainMappingsResponse
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
        
        # Rpc to get information about an EventType.
        # @param [String] name
        #   The name of the trigger being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::EventType] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::EventType]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_namespace_eventtype(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/eventing.knative.dev/v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::EventType::Representation
          command.response_class = Google::Apis::RunV1alpha1::EventType
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list EventTypes.
        # @param [String] parent
        #   The project ID or project number from which the EventTypes should be
        #   listed.
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListEventTypesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListEventTypesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_namespace_eventtypes(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/eventing.knative.dev/v1alpha1/{+parent}/eventtypes', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListEventTypesResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListEventTypesResponse
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
        
        # Creates a new pubsub.
        # @param [String] parent
        #   The project ID or project number in which this pubsub should
        #   be created.
        # @param [Google::Apis::RunV1alpha1::PubSub] pub_sub_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::PubSub] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::PubSub]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_namespace_pubsub(parent, pub_sub_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'apis/events.cloud.google.com/v1alpha1/{+parent}/pubsubs', options)
          command.request_representation = Google::Apis::RunV1alpha1::PubSub::Representation
          command.request_object = pub_sub_object
          command.response_representation = Google::Apis::RunV1alpha1::PubSub::Representation
          command.response_class = Google::Apis::RunV1alpha1::PubSub
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to delete a pubsub.
        # @param [String] name
        #   The name of the pubsub being deleted. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] api_version
        #   Cloud Run currently ignores this parameter.
        # @param [String] kind
        #   Cloud Run currently ignores this parameter.
        # @param [String] propagation_policy
        #   Specifies the propagation policy of delete. Cloud Run currently ignores
        #   this setting, and deletes in the background. Please see
        #   kubernetes.io/docs/concepts/workloads/controllers/garbage-collection/ for
        #   more information.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_namespace_pubsub(name, api_version: nil, kind: nil, propagation_policy: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'apis/events.cloud.google.com/v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Empty::Representation
          command.response_class = Google::Apis::RunV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['apiVersion'] = api_version unless api_version.nil?
          command.query['kind'] = kind unless kind.nil?
          command.query['propagationPolicy'] = propagation_policy unless propagation_policy.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a pubsub.
        # @param [String] name
        #   The name of the pubsub being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::PubSub] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::PubSub]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_namespace_pubsub(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/events.cloud.google.com/v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::PubSub::Representation
          command.response_class = Google::Apis::RunV1alpha1::PubSub
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list pubsubs.
        # @param [String] parent
        #   The project ID or project number from which the pubsubs should
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListPubSubsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListPubSubsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_namespace_pubsubs(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/events.cloud.google.com/v1alpha1/{+parent}/pubsubs', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListPubSubsResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListPubSubsResponse
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
        
        # Rpc to replace a pubsub.
        # Only the spec and metadata labels and annotations are modifiable. After
        # the Update request, Cloud Run will work to make the 'status'
        # match the requested 'spec'.
        # May provide metadata.resourceVersion to enforce update from last read for
        # optimistic concurrency control.
        # @param [String] name
        #   The name of the pubsub being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [Google::Apis::RunV1alpha1::PubSub] pub_sub_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::PubSub] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::PubSub]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def replace_namespace_pubsub_pub_sub(name, pub_sub_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'apis/events.cloud.google.com/v1alpha1/{+name}', options)
          command.request_representation = Google::Apis::RunV1alpha1::PubSub::Representation
          command.request_object = pub_sub_object
          command.response_representation = Google::Apis::RunV1alpha1::PubSub::Representation
          command.response_class = Google::Apis::RunV1alpha1::PubSub
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to delete a revision.
        # @param [String] name
        #   The name of the revision being deleted. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] api_version
        #   Cloud Run currently ignores this parameter.
        # @param [String] kind
        #   Cloud Run currently ignores this parameter.
        # @param [Boolean] orphan_dependents
        #   Deprecated.
        #   Specifies the cascade behavior on delete.
        #   Cloud Run only supports cascading behavior, so this must be false.
        #   This attribute is deprecated, and is now replaced with PropagationPolicy
        #   See https://github.com/kubernetes/kubernetes/issues/46659 for more info.
        # @param [String] propagation_policy
        #   Specifies the propagation policy of delete. Cloud Run currently ignores
        #   this setting, and deletes in the background. Please see
        #   kubernetes.io/docs/concepts/workloads/controllers/garbage-collection/ for
        #   more information.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_namespace_revision(name, api_version: nil, kind: nil, orphan_dependents: nil, propagation_policy: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'apis/serving.knative.dev/v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Empty::Representation
          command.response_class = Google::Apis::RunV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['apiVersion'] = api_version unless api_version.nil?
          command.query['kind'] = kind unless kind.nil?
          command.query['orphanDependents'] = orphan_dependents unless orphan_dependents.nil?
          command.query['propagationPolicy'] = propagation_policy unless propagation_policy.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a revision.
        # @param [String] name
        #   The name of the revision being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Revision] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Revision]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_namespace_revision(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/serving.knative.dev/v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Revision::Representation
          command.response_class = Google::Apis::RunV1alpha1::Revision
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list revisions.
        # @param [String] parent
        #   The project ID or project number from which the revisions should be listed.
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListRevisionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListRevisionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_namespace_revisions(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/serving.knative.dev/v1alpha1/{+parent}/revisions', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListRevisionsResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListRevisionsResponse
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
        
        # Rpc to get information about a route.
        # @param [String] name
        #   The name of the route being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Route] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Route]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_namespace_route(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/serving.knative.dev/v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Route::Representation
          command.response_class = Google::Apis::RunV1alpha1::Route
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list routes.
        # @param [String] parent
        #   The project ID or project number from which the routes should be listed.
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListRoutesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListRoutesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_namespace_routes(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/serving.knative.dev/v1alpha1/{+parent}/routes', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListRoutesResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListRoutesResponse
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
        
        # Rpc to create a service.
        # @param [String] parent
        #   The project ID or project number in which this service should be created.
        # @param [Google::Apis::RunV1alpha1::Service] service_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Service] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Service]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_namespace_service(parent, service_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'apis/serving.knative.dev/v1alpha1/{+parent}/services', options)
          command.request_representation = Google::Apis::RunV1alpha1::Service::Representation
          command.request_object = service_object
          command.response_representation = Google::Apis::RunV1alpha1::Service::Representation
          command.response_class = Google::Apis::RunV1alpha1::Service
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to delete a service.
        # This will cause the Service to stop serving traffic and will delete the
        # child entities like Routes, Configurations and Revisions.
        # @param [String] name
        #   The name of the service being deleted. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] api_version
        #   Cloud Run currently ignores this parameter.
        # @param [String] kind
        #   Cloud Run currently ignores this parameter.
        # @param [Boolean] orphan_dependents
        #   Deprecated.
        #   Specifies the cascade behavior on delete.
        #   Cloud Run only supports cascading behavior, so this must be false.
        #   This attribute is deprecated, and is now replaced with PropagationPolicy
        #   See https://github.com/kubernetes/kubernetes/issues/46659 for more info.
        # @param [String] propagation_policy
        #   Specifies the propagation policy of delete. Cloud Run currently ignores
        #   this setting, and deletes in the background. Please see
        #   kubernetes.io/docs/concepts/workloads/controllers/garbage-collection/ for
        #   more information.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_namespace_service(name, api_version: nil, kind: nil, orphan_dependents: nil, propagation_policy: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'apis/serving.knative.dev/v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Empty::Representation
          command.response_class = Google::Apis::RunV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['apiVersion'] = api_version unless api_version.nil?
          command.query['kind'] = kind unless kind.nil?
          command.query['orphanDependents'] = orphan_dependents unless orphan_dependents.nil?
          command.query['propagationPolicy'] = propagation_policy unless propagation_policy.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a service.
        # @param [String] name
        #   The name of the service being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Service] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Service]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_namespace_service(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/serving.knative.dev/v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Service::Representation
          command.response_class = Google::Apis::RunV1alpha1::Service
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list services.
        # @param [String] parent
        #   The project ID or project number from which the services should be listed.
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListServicesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListServicesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_namespace_services(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/serving.knative.dev/v1alpha1/{+parent}/services', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListServicesResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListServicesResponse
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
        
        # Rpc to replace a service.
        # Only the spec and metadata labels and annotations are modifiable. After
        # the Update request, Cloud Run will work to make the 'status'
        # match the requested 'spec'.
        # May provide metadata.resourceVersion to enforce update from last read for
        # optimistic concurrency control.
        # @param [String] name
        #   The name of the service being replaced. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [Google::Apis::RunV1alpha1::Service] service_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Service] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Service]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def replace_namespace_service_service(name, service_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'apis/serving.knative.dev/v1alpha1/{+name}', options)
          command.request_representation = Google::Apis::RunV1alpha1::Service::Representation
          command.request_object = service_object
          command.response_representation = Google::Apis::RunV1alpha1::Service::Representation
          command.response_class = Google::Apis::RunV1alpha1::Service
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new trigger.
        # @param [String] parent
        #   The project ID or project number in which this trigger should
        #   be created.
        # @param [Google::Apis::RunV1alpha1::Trigger] trigger_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Trigger] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Trigger]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_namespace_trigger(parent, trigger_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'apis/eventing.knative.dev/v1alpha1/{+parent}/triggers', options)
          command.request_representation = Google::Apis::RunV1alpha1::Trigger::Representation
          command.request_object = trigger_object
          command.response_representation = Google::Apis::RunV1alpha1::Trigger::Representation
          command.response_class = Google::Apis::RunV1alpha1::Trigger
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to delete a trigger.
        # @param [String] name
        #   The name of the trigger being deleted. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] api_version
        #   Cloud Run currently ignores this parameter.
        # @param [String] kind
        #   Cloud Run currently ignores this parameter.
        # @param [String] propagation_policy
        #   Specifies the propagation policy of delete. Cloud Run currently ignores
        #   this setting, and deletes in the background. Please see
        #   kubernetes.io/docs/concepts/workloads/controllers/garbage-collection/ for
        #   more information.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_namespace_trigger(name, api_version: nil, kind: nil, propagation_policy: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'apis/eventing.knative.dev/v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Empty::Representation
          command.response_class = Google::Apis::RunV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['apiVersion'] = api_version unless api_version.nil?
          command.query['kind'] = kind unless kind.nil?
          command.query['propagationPolicy'] = propagation_policy unless propagation_policy.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a trigger.
        # @param [String] name
        #   The name of the trigger being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Trigger] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Trigger]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_namespace_trigger(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/eventing.knative.dev/v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Trigger::Representation
          command.response_class = Google::Apis::RunV1alpha1::Trigger
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list triggers.
        # @param [String] parent
        #   The project ID or project number from which the triggers should
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListTriggersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListTriggersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_namespace_triggers(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'apis/eventing.knative.dev/v1alpha1/{+parent}/triggers', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListTriggersResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListTriggersResponse
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
        
        # Rpc to replace a trigger.
        # Only the spec and metadata labels and annotations are modifiable. After
        # the Update request, Cloud Run will work to make the 'status'
        # match the requested 'spec'.
        # May provide metadata.resourceVersion to enforce update from last read for
        # optimistic concurrency control.
        # @param [String] name
        #   The name of the trigger being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [Google::Apis::RunV1alpha1::Trigger] trigger_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Trigger] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Trigger]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def replace_namespace_trigger_trigger(name, trigger_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'apis/eventing.knative.dev/v1alpha1/{+name}', options)
          command.request_representation = Google::Apis::RunV1alpha1::Trigger::Representation
          command.request_object = trigger_object
          command.response_representation = Google::Apis::RunV1alpha1::Trigger::Representation
          command.response_class = Google::Apis::RunV1alpha1::Trigger
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists information about the supported locations for this service.
        # @param [String] name
        #   The resource that owns the locations collection, if applicable.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListLocationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListLocationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_locations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}/locations', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListLocationsResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListLocationsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # RPC to list authorized domains.
        # @param [String] parent
        #   Name of the parent Application resource. Example: `apps/myapp`.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListAuthorizedDomainsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListAuthorizedDomainsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_authorizeddomains(parent, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+parent}/authorizeddomains', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListAuthorizedDomainsResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListAuthorizedDomainsResponse
          command.params['parent'] = parent unless parent.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a configuration.
        # @param [String] name
        #   The name of the configuration being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Configuration] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Configuration]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_configuration(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Configuration::Representation
          command.response_class = Google::Apis::RunV1alpha1::Configuration
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list configurations.
        # @param [String] parent
        #   The project ID or project number from which the configurations should be
        #   listed.
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListConfigurationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListConfigurationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_configurations(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+parent}/configurations', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListConfigurationsResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListConfigurationsResponse
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
        
        # Creates a new domain mapping.
        # @param [String] parent
        #   The project ID or project number in which this domain mapping should be
        #   created.
        # @param [Google::Apis::RunV1alpha1::DomainMapping] domain_mapping_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::DomainMapping] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::DomainMapping]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_domainmapping(parent, domain_mapping_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+parent}/domainmappings', options)
          command.request_representation = Google::Apis::RunV1alpha1::DomainMapping::Representation
          command.request_object = domain_mapping_object
          command.response_representation = Google::Apis::RunV1alpha1::DomainMapping::Representation
          command.response_class = Google::Apis::RunV1alpha1::DomainMapping
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to delete a domain mapping.
        # @param [String] name
        #   The name of the domain mapping being deleted. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] api_version
        #   Cloud Run currently ignores this parameter.
        # @param [String] kind
        #   Cloud Run currently ignores this parameter.
        # @param [Boolean] orphan_dependents
        #   Deprecated.
        #   Specifies the cascade behavior on delete.
        #   Cloud Run only supports cascading behavior, so this must be false.
        #   This attribute is deprecated, and is now replaced with PropagationPolicy
        #   See https://github.com/kubernetes/kubernetes/issues/46659 for more info.
        # @param [String] propagation_policy
        #   Specifies the propagation policy of delete. Cloud Run currently ignores
        #   this setting, and deletes in the background. Please see
        #   kubernetes.io/docs/concepts/workloads/controllers/garbage-collection/ for
        #   more information.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_domainmapping(name, api_version: nil, kind: nil, orphan_dependents: nil, propagation_policy: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Empty::Representation
          command.response_class = Google::Apis::RunV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['apiVersion'] = api_version unless api_version.nil?
          command.query['kind'] = kind unless kind.nil?
          command.query['orphanDependents'] = orphan_dependents unless orphan_dependents.nil?
          command.query['propagationPolicy'] = propagation_policy unless propagation_policy.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a domain mapping.
        # @param [String] name
        #   The name of the domain mapping being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::DomainMapping] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::DomainMapping]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_domainmapping(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::DomainMapping::Representation
          command.response_class = Google::Apis::RunV1alpha1::DomainMapping
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list domain mappings.
        # @param [String] parent
        #   The project ID or project number from which the domain mappings should be
        #   listed.
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListDomainMappingsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListDomainMappingsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_domainmappings(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+parent}/domainmappings', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListDomainMappingsResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListDomainMappingsResponse
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
        
        # Rpc to get information about an EventType.
        # @param [String] name
        #   The name of the trigger being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::EventType] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::EventType]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_eventtype(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::EventType::Representation
          command.response_class = Google::Apis::RunV1alpha1::EventType
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list EventTypes.
        # @param [String] parent
        #   The project ID or project number from which the EventTypes should be
        #   listed.
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListEventTypesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListEventTypesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_eventtypes(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+parent}/eventtypes', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListEventTypesResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListEventTypesResponse
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
        
        # Creates a new pubsub.
        # @param [String] parent
        #   The project ID or project number in which this pubsub should
        #   be created.
        # @param [Google::Apis::RunV1alpha1::PubSub] pub_sub_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::PubSub] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::PubSub]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_pubsub(parent, pub_sub_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+parent}/pubsubs', options)
          command.request_representation = Google::Apis::RunV1alpha1::PubSub::Representation
          command.request_object = pub_sub_object
          command.response_representation = Google::Apis::RunV1alpha1::PubSub::Representation
          command.response_class = Google::Apis::RunV1alpha1::PubSub
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to delete a pubsub.
        # @param [String] name
        #   The name of the pubsub being deleted. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] api_version
        #   Cloud Run currently ignores this parameter.
        # @param [String] kind
        #   Cloud Run currently ignores this parameter.
        # @param [String] propagation_policy
        #   Specifies the propagation policy of delete. Cloud Run currently ignores
        #   this setting, and deletes in the background. Please see
        #   kubernetes.io/docs/concepts/workloads/controllers/garbage-collection/ for
        #   more information.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_pubsub(name, api_version: nil, kind: nil, propagation_policy: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Empty::Representation
          command.response_class = Google::Apis::RunV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['apiVersion'] = api_version unless api_version.nil?
          command.query['kind'] = kind unless kind.nil?
          command.query['propagationPolicy'] = propagation_policy unless propagation_policy.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a pubsub.
        # @param [String] name
        #   The name of the pubsub being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::PubSub] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::PubSub]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_pubsub(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::PubSub::Representation
          command.response_class = Google::Apis::RunV1alpha1::PubSub
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list pubsubs.
        # @param [String] parent
        #   The project ID or project number from which the pubsubs should
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListPubSubsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListPubSubsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_pubsubs(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+parent}/pubsubs', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListPubSubsResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListPubSubsResponse
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
        
        # Rpc to replace a pubsub.
        # Only the spec and metadata labels and annotations are modifiable. After
        # the Update request, Cloud Run will work to make the 'status'
        # match the requested 'spec'.
        # May provide metadata.resourceVersion to enforce update from last read for
        # optimistic concurrency control.
        # @param [String] name
        #   The name of the pubsub being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [Google::Apis::RunV1alpha1::PubSub] pub_sub_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::PubSub] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::PubSub]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def replace_project_location_pubsub_pub_sub(name, pub_sub_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1alpha1/{+name}', options)
          command.request_representation = Google::Apis::RunV1alpha1::PubSub::Representation
          command.request_object = pub_sub_object
          command.response_representation = Google::Apis::RunV1alpha1::PubSub::Representation
          command.response_class = Google::Apis::RunV1alpha1::PubSub
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to delete a revision.
        # @param [String] name
        #   The name of the revision being deleted. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] api_version
        #   Cloud Run currently ignores this parameter.
        # @param [String] kind
        #   Cloud Run currently ignores this parameter.
        # @param [Boolean] orphan_dependents
        #   Deprecated.
        #   Specifies the cascade behavior on delete.
        #   Cloud Run only supports cascading behavior, so this must be false.
        #   This attribute is deprecated, and is now replaced with PropagationPolicy
        #   See https://github.com/kubernetes/kubernetes/issues/46659 for more info.
        # @param [String] propagation_policy
        #   Specifies the propagation policy of delete. Cloud Run currently ignores
        #   this setting, and deletes in the background. Please see
        #   kubernetes.io/docs/concepts/workloads/controllers/garbage-collection/ for
        #   more information.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_revision(name, api_version: nil, kind: nil, orphan_dependents: nil, propagation_policy: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Empty::Representation
          command.response_class = Google::Apis::RunV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['apiVersion'] = api_version unless api_version.nil?
          command.query['kind'] = kind unless kind.nil?
          command.query['orphanDependents'] = orphan_dependents unless orphan_dependents.nil?
          command.query['propagationPolicy'] = propagation_policy unless propagation_policy.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a revision.
        # @param [String] name
        #   The name of the revision being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Revision] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Revision]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_revision(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Revision::Representation
          command.response_class = Google::Apis::RunV1alpha1::Revision
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list revisions.
        # @param [String] parent
        #   The project ID or project number from which the revisions should be listed.
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListRevisionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListRevisionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_revisions(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+parent}/revisions', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListRevisionsResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListRevisionsResponse
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
        
        # Rpc to get information about a route.
        # @param [String] name
        #   The name of the route being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Route] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Route]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_route(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Route::Representation
          command.response_class = Google::Apis::RunV1alpha1::Route
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list routes.
        # @param [String] parent
        #   The project ID or project number from which the routes should be listed.
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListRoutesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListRoutesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_routes(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+parent}/routes', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListRoutesResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListRoutesResponse
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
        
        # Rpc to create a service.
        # @param [String] parent
        #   The project ID or project number in which this service should be created.
        # @param [Google::Apis::RunV1alpha1::Service] service_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Service] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Service]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_service(parent, service_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+parent}/services', options)
          command.request_representation = Google::Apis::RunV1alpha1::Service::Representation
          command.request_object = service_object
          command.response_representation = Google::Apis::RunV1alpha1::Service::Representation
          command.response_class = Google::Apis::RunV1alpha1::Service
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to delete a service.
        # This will cause the Service to stop serving traffic and will delete the
        # child entities like Routes, Configurations and Revisions.
        # @param [String] name
        #   The name of the service being deleted. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] api_version
        #   Cloud Run currently ignores this parameter.
        # @param [String] kind
        #   Cloud Run currently ignores this parameter.
        # @param [Boolean] orphan_dependents
        #   Deprecated.
        #   Specifies the cascade behavior on delete.
        #   Cloud Run only supports cascading behavior, so this must be false.
        #   This attribute is deprecated, and is now replaced with PropagationPolicy
        #   See https://github.com/kubernetes/kubernetes/issues/46659 for more info.
        # @param [String] propagation_policy
        #   Specifies the propagation policy of delete. Cloud Run currently ignores
        #   this setting, and deletes in the background. Please see
        #   kubernetes.io/docs/concepts/workloads/controllers/garbage-collection/ for
        #   more information.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_service(name, api_version: nil, kind: nil, orphan_dependents: nil, propagation_policy: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Empty::Representation
          command.response_class = Google::Apis::RunV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['apiVersion'] = api_version unless api_version.nil?
          command.query['kind'] = kind unless kind.nil?
          command.query['orphanDependents'] = orphan_dependents unless orphan_dependents.nil?
          command.query['propagationPolicy'] = propagation_policy unless propagation_policy.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a service.
        # @param [String] name
        #   The name of the service being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Service] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Service]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_service(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Service::Representation
          command.response_class = Google::Apis::RunV1alpha1::Service
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the IAM Access Control policy currently in effect for the given
        # Cloud Run service. This result does not include any inherited policies.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Fixnum] options_requested_policy_version
        #   Optional. The policy format version to be returned.
        #   Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        #   rejected.
        #   Requests for policies with any conditional bindings must specify version 3.
        #   Policies without any conditional bindings may specify any valid value or
        #   leave the field unset.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_service_iam_policy(resource, options_requested_policy_version: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+resource}:getIamPolicy', options)
          command.response_representation = Google::Apis::RunV1alpha1::Policy::Representation
          command.response_class = Google::Apis::RunV1alpha1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['options.requestedPolicyVersion'] = options_requested_policy_version unless options_requested_policy_version.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list services.
        # @param [String] parent
        #   The project ID or project number from which the services should be listed.
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListServicesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListServicesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_services(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+parent}/services', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListServicesResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListServicesResponse
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
        
        # Rpc to replace a service.
        # Only the spec and metadata labels and annotations are modifiable. After
        # the Update request, Cloud Run will work to make the 'status'
        # match the requested 'spec'.
        # May provide metadata.resourceVersion to enforce update from last read for
        # optimistic concurrency control.
        # @param [String] name
        #   The name of the service being replaced. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [Google::Apis::RunV1alpha1::Service] service_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Service] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Service]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def replace_project_location_service_service(name, service_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1alpha1/{+name}', options)
          command.request_representation = Google::Apis::RunV1alpha1::Service::Representation
          command.request_object = service_object
          command.response_representation = Google::Apis::RunV1alpha1::Service::Representation
          command.response_class = Google::Apis::RunV1alpha1::Service
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Sets the IAM Access control policy for the specified Service. Overwrites
        # any existing policy.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy is being specified.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::RunV1alpha1::SetIamPolicyRequest] set_iam_policy_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Policy] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Policy]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def set_service_iam_policy(resource, set_iam_policy_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+resource}:setIamPolicy', options)
          command.request_representation = Google::Apis::RunV1alpha1::SetIamPolicyRequest::Representation
          command.request_object = set_iam_policy_request_object
          command.response_representation = Google::Apis::RunV1alpha1::Policy::Representation
          command.response_class = Google::Apis::RunV1alpha1::Policy
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns permissions that a caller has on the specified Project.
        # There are no permissions required for making this API call.
        # @param [String] resource
        #   REQUIRED: The resource for which the policy detail is being requested.
        #   See the operation documentation for the appropriate value for this field.
        # @param [Google::Apis::RunV1alpha1::TestIamPermissionsRequest] test_iam_permissions_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::TestIamPermissionsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::TestIamPermissionsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def test_service_iam_permissions(resource, test_iam_permissions_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+resource}:testIamPermissions', options)
          command.request_representation = Google::Apis::RunV1alpha1::TestIamPermissionsRequest::Representation
          command.request_object = test_iam_permissions_request_object
          command.response_representation = Google::Apis::RunV1alpha1::TestIamPermissionsResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::TestIamPermissionsResponse
          command.params['resource'] = resource unless resource.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new trigger.
        # @param [String] parent
        #   The project ID or project number in which this trigger should
        #   be created.
        # @param [Google::Apis::RunV1alpha1::Trigger] trigger_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Trigger] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Trigger]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_trigger(parent, trigger_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1alpha1/{+parent}/triggers', options)
          command.request_representation = Google::Apis::RunV1alpha1::Trigger::Representation
          command.request_object = trigger_object
          command.response_representation = Google::Apis::RunV1alpha1::Trigger::Representation
          command.response_class = Google::Apis::RunV1alpha1::Trigger
          command.params['parent'] = parent unless parent.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to delete a trigger.
        # @param [String] name
        #   The name of the trigger being deleted. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] api_version
        #   Cloud Run currently ignores this parameter.
        # @param [String] kind
        #   Cloud Run currently ignores this parameter.
        # @param [String] propagation_policy
        #   Specifies the propagation policy of delete. Cloud Run currently ignores
        #   this setting, and deletes in the background. Please see
        #   kubernetes.io/docs/concepts/workloads/controllers/garbage-collection/ for
        #   more information.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_project_location_trigger(name, api_version: nil, kind: nil, propagation_policy: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:delete, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Empty::Representation
          command.response_class = Google::Apis::RunV1alpha1::Empty
          command.params['name'] = name unless name.nil?
          command.query['apiVersion'] = api_version unless api_version.nil?
          command.query['kind'] = kind unless kind.nil?
          command.query['propagationPolicy'] = propagation_policy unless propagation_policy.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to get information about a trigger.
        # @param [String] name
        #   The name of the trigger being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Trigger] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Trigger]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_trigger(name, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+name}', options)
          command.response_representation = Google::Apis::RunV1alpha1::Trigger::Representation
          command.response_class = Google::Apis::RunV1alpha1::Trigger
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Rpc to list triggers.
        # @param [String] parent
        #   The project ID or project number from which the triggers should
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
        #   The maximum number of records that should be returned.
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
        # @yieldparam result [Google::Apis::RunV1alpha1::ListTriggersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::ListTriggersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_triggers(parent, continue: nil, field_selector: nil, include_uninitialized: nil, label_selector: nil, limit: nil, resource_version: nil, watch: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1alpha1/{+parent}/triggers', options)
          command.response_representation = Google::Apis::RunV1alpha1::ListTriggersResponse::Representation
          command.response_class = Google::Apis::RunV1alpha1::ListTriggersResponse
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
        
        # Rpc to replace a trigger.
        # Only the spec and metadata labels and annotations are modifiable. After
        # the Update request, Cloud Run will work to make the 'status'
        # match the requested 'spec'.
        # May provide metadata.resourceVersion to enforce update from last read for
        # optimistic concurrency control.
        # @param [String] name
        #   The name of the trigger being retrieved. If needed, replace
        #   `namespace_id` with the project ID.
        # @param [Google::Apis::RunV1alpha1::Trigger] trigger_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::RunV1alpha1::Trigger] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::RunV1alpha1::Trigger]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def replace_project_location_trigger_trigger(name, trigger_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:put, 'v1alpha1/{+name}', options)
          command.request_representation = Google::Apis::RunV1alpha1::Trigger::Representation
          command.request_object = trigger_object
          command.response_representation = Google::Apis::RunV1alpha1::Trigger::Representation
          command.response_class = Google::Apis::RunV1alpha1::Trigger
          command.params['name'] = name unless name.nil?
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
