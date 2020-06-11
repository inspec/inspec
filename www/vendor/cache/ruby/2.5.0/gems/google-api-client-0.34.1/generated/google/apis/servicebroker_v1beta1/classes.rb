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

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module ServicebrokerV1beta1
      
      # Describes the binding.
      class GoogleCloudServicebrokerV1beta1Binding
        include Google::Apis::Core::Hashable
      
        # A JSON object that contains data for platform resources associated with
        # the binding to be created.
        # Corresponds to the JSON property `bind_resource`
        # @return [Hash<String,Object>]
        attr_accessor :bind_resource
      
        # The id of the binding. Must be unique within GCP project.
        # Maximum length is 64, GUID recommended.
        # Required.
        # Corresponds to the JSON property `binding_id`
        # @return [String]
        attr_accessor :binding_id
      
        # Output only. Timestamp for when the binding was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. String containing the Deployment Manager deployment name that was
        # created
        # for this binding,
        # Corresponds to the JSON property `deploymentName`
        # @return [String]
        attr_accessor :deployment_name
      
        # Configuration options for the service binding.
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,Object>]
        attr_accessor :parameters
      
        # The ID of the plan. See `Service` and `Plan` resources for details.
        # Maximum length is 64, GUID recommended.
        # Required.
        # Corresponds to the JSON property `plan_id`
        # @return [String]
        attr_accessor :plan_id
      
        # Output only. The resource name of the binding, e.g.
        # projects/project_id/brokers/broker_id/service_instances/instance_id/bindings/
        # binding_id.
        # Corresponds to the JSON property `resourceName`
        # @return [String]
        attr_accessor :resource_name
      
        # The id of the service. Must be a valid identifier of a service
        # contained in the list from a `ListServices()` call.
        # Maximum length is 64, GUID recommended.
        # Required.
        # Corresponds to the JSON property `service_id`
        # @return [String]
        attr_accessor :service_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bind_resource = args[:bind_resource] if args.key?(:bind_resource)
          @binding_id = args[:binding_id] if args.key?(:binding_id)
          @create_time = args[:create_time] if args.key?(:create_time)
          @deployment_name = args[:deployment_name] if args.key?(:deployment_name)
          @parameters = args[:parameters] if args.key?(:parameters)
          @plan_id = args[:plan_id] if args.key?(:plan_id)
          @resource_name = args[:resource_name] if args.key?(:resource_name)
          @service_id = args[:service_id] if args.key?(:service_id)
        end
      end
      
      # Broker represents a consumable collection of Service Registry catalogs
      # exposed as an OSB Broker.
      class GoogleCloudServicebrokerV1beta1Broker
        include Google::Apis::Core::Hashable
      
        # Output only. Timestamp for when the broker was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Name of the broker in the format:
        # <projects>/<project-id>/brokers/<broker>.
        # This allows for multiple brokers per project which can be used to
        # enable having custom brokers per GKE cluster, for example.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User friendly title of the broker.
        # Limited to 1024 characters. Requests with longer titles will be rejected.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Output only. URL of the broker OSB-compliant endpoint, for example:
        # https://servicebroker.googleapis.com/projects/<project>/brokers/<broker>
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @name = args[:name] if args.key?(:name)
          @title = args[:title] if args.key?(:title)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Response for the `CreateBinding()` method.
      class GoogleCloudServicebrokerV1beta1CreateBindingResponse
        include Google::Apis::Core::Hashable
      
        # Credentials to use the binding.
        # Corresponds to the JSON property `credentials`
        # @return [Hash<String,Object>]
        attr_accessor :credentials
      
        # Used to communicate description of the response. Usually for non-standard
        # error codes.
        # https://github.com/openservicebrokerapi/servicebroker/blob/master/spec.md#
        # service-broker-errors
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # If broker executes operation asynchronously, this is the operation ID that
        # can be polled to check the completion status of said operation.
        # This broker always executes all create/delete operations asynchronously.
        # Corresponds to the JSON property `operation`
        # @return [String]
        attr_accessor :operation
      
        # A URL to which the platform may proxy requests for the address sent with
        # bind_resource.route
        # Corresponds to the JSON property `route_service_url`
        # @return [String]
        attr_accessor :route_service_url
      
        # From where to read system logs.
        # Corresponds to the JSON property `syslog_drain_url`
        # @return [String]
        attr_accessor :syslog_drain_url
      
        # An array of configuration for mounting volumes.
        # Corresponds to the JSON property `volume_mounts`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :volume_mounts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @credentials = args[:credentials] if args.key?(:credentials)
          @description = args[:description] if args.key?(:description)
          @operation = args[:operation] if args.key?(:operation)
          @route_service_url = args[:route_service_url] if args.key?(:route_service_url)
          @syslog_drain_url = args[:syslog_drain_url] if args.key?(:syslog_drain_url)
          @volume_mounts = args[:volume_mounts] if args.key?(:volume_mounts)
        end
      end
      
      # Response for the `CreateServiceInstance()` method.
      class GoogleCloudServicebrokerV1beta1CreateServiceInstanceResponse
        include Google::Apis::Core::Hashable
      
        # Used to communicate description of the response. Usually for non-standard
        # error codes.
        # https://github.com/openservicebrokerapi/servicebroker/blob/master/spec.md#
        # service-broker-errors
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # If broker executes operation asynchronously, this is the operation ID that
        # can be polled to check the completion status of said operation.
        # This broker always will return a non-empty operation on success.
        # Corresponds to the JSON property `operation`
        # @return [String]
        attr_accessor :operation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @operation = args[:operation] if args.key?(:operation)
        end
      end
      
      # Message containing information required to activate Dashboard SSO feature.
      class GoogleCloudServicebrokerV1beta1DashboardClient
        include Google::Apis::Core::Hashable
      
        # The id of the Oauth client that the dashboard will use.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # A URI for the service dashboard.
        # Validated by the OAuth token server when the dashboard requests a token.
        # Corresponds to the JSON property `redirect_uri`
        # @return [String]
        attr_accessor :redirect_uri
      
        # A secret for the dashboard client.
        # Corresponds to the JSON property `secret`
        # @return [String]
        attr_accessor :secret
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @redirect_uri = args[:redirect_uri] if args.key?(:redirect_uri)
          @secret = args[:secret] if args.key?(:secret)
        end
      end
      
      # Response for the `DeleteBinding()` method.
      class GoogleCloudServicebrokerV1beta1DeleteBindingResponse
        include Google::Apis::Core::Hashable
      
        # Used to communicate description of the response. Usually for non-standard
        # error codes.
        # https://github.com/openservicebrokerapi/servicebroker/blob/master/spec.md#
        # service-broker-errors
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # If broker executes operation asynchronously, this is the operation ID that
        # can be polled to check the completion status of said operation.
        # Corresponds to the JSON property `operation`
        # @return [String]
        attr_accessor :operation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @operation = args[:operation] if args.key?(:operation)
        end
      end
      
      # Response for the `DeleteServiceInstance()` method.
      class GoogleCloudServicebrokerV1beta1DeleteServiceInstanceResponse
        include Google::Apis::Core::Hashable
      
        # Used to communicate description of the response. Usually for non-standard
        # error codes.
        # https://github.com/openservicebrokerapi/servicebroker/blob/master/spec.md#
        # service-broker-errors
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # If broker executes operation asynchronously, this is the operation ID that
        # can be polled to check the completion status of said operation.
        # Corresponds to the JSON property `operation`
        # @return [String]
        attr_accessor :operation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @operation = args[:operation] if args.key?(:operation)
        end
      end
      
      # Response for the `GetBinding()` method.
      class GoogleCloudServicebrokerV1beta1GetBindingResponse
        include Google::Apis::Core::Hashable
      
        # Credentials to use the binding.
        # Corresponds to the JSON property `credentials`
        # @return [Hash<String,Object>]
        attr_accessor :credentials
      
        # String containing the Deployment Manager deployment name that was created
        # for this binding,
        # Corresponds to the JSON property `deploymentName`
        # @return [String]
        attr_accessor :deployment_name
      
        # Used to communicate description of the response. Usually for non-standard
        # error codes.
        # https://github.com/openservicebrokerapi/servicebroker/blob/master/spec.md#
        # service-broker-errors
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Output only. The resource name of the binding, e.g.
        # projects/project_id/brokers/broker_id/service_instances/instance_id/bindings/
        # binding_id.
        # Corresponds to the JSON property `resourceName`
        # @return [String]
        attr_accessor :resource_name
      
        # A URL to which the platform may proxy requests for the address sent with
        # bind_resource.route
        # Corresponds to the JSON property `route_service_url`
        # @return [String]
        attr_accessor :route_service_url
      
        # From where to read system logs.
        # Corresponds to the JSON property `syslog_drain_url`
        # @return [String]
        attr_accessor :syslog_drain_url
      
        # An array of configurations for mounting volumes.
        # Corresponds to the JSON property `volume_mounts`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :volume_mounts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @credentials = args[:credentials] if args.key?(:credentials)
          @deployment_name = args[:deployment_name] if args.key?(:deployment_name)
          @description = args[:description] if args.key?(:description)
          @resource_name = args[:resource_name] if args.key?(:resource_name)
          @route_service_url = args[:route_service_url] if args.key?(:route_service_url)
          @syslog_drain_url = args[:syslog_drain_url] if args.key?(:syslog_drain_url)
          @volume_mounts = args[:volume_mounts] if args.key?(:volume_mounts)
        end
      end
      
      # The response for the `ListBindings()` method.
      class GoogleCloudServicebrokerV1beta1ListBindingsResponse
        include Google::Apis::Core::Hashable
      
        # The list of bindings in the instance.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1Binding>]
        attr_accessor :bindings
      
        # Used to communicate description of the response. Usually for non-standard
        # error codes.
        # https://github.com/openservicebrokerapi/servicebroker/blob/master/spec.md#
        # service-broker-errors
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # This token allows you to get the next page of results for list requests.
        # If the number of results is larger than `pageSize`, use the `nextPageToken`
        # as a value for the query parameter `pageToken` in the next list request.
        # Subsequent list requests will have their own `nextPageToken` to continue
        # paging through the results
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bindings = args[:bindings] if args.key?(:bindings)
          @description = args[:description] if args.key?(:description)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response for the `ListBrokers()` method.
      class GoogleCloudServicebrokerV1beta1ListBrokersResponse
        include Google::Apis::Core::Hashable
      
        # The list of brokers in the container.
        # Corresponds to the JSON property `brokers`
        # @return [Array<Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1Broker>]
        attr_accessor :brokers
      
        # This token allows you to get the next page of results for list requests.
        # If the number of results is larger than `pageSize`, use the `nextPageToken`
        # as a value for the query parameter `pageToken` in the next list request.
        # Subsequent list requests will have their own `nextPageToken` to continue
        # paging through the results
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @brokers = args[:brokers] if args.key?(:brokers)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for the `ListCatalog()` method.
      class GoogleCloudServicebrokerV1beta1ListCatalogResponse
        include Google::Apis::Core::Hashable
      
        # Used to communicate description of the response. Usually for non-standard
        # error codes.
        # https://github.com/openservicebrokerapi/servicebroker/blob/master/spec.md#
        # service-broker-errors
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # This token allows you to get the next page of results for list requests.
        # If the number of results is larger than `pageSize`, use the `nextPageToken`
        # as a value for the query parameter `pageToken` in the next list request.
        # Subsequent list requests will have their own `nextPageToken` to continue
        # paging through the results
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The services available for the requested GCP project.
        # Corresponds to the JSON property `services`
        # @return [Array<Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1Service>]
        attr_accessor :services
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @services = args[:services] if args.key?(:services)
        end
      end
      
      # The response for the `ListServiceInstances()` method.
      class GoogleCloudServicebrokerV1beta1ListServiceInstancesResponse
        include Google::Apis::Core::Hashable
      
        # Used to communicate description of the response. Usually for non-standard
        # error codes.
        # https://github.com/openservicebrokerapi/servicebroker/blob/master/spec.md#
        # service-broker-errors
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The list of instances in the broker.
        # Corresponds to the JSON property `instances`
        # @return [Array<Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1ServiceInstance>]
        attr_accessor :instances
      
        # This token allows you to get the next page of results for list requests.
        # If the number of results is larger than `pageSize`, use the `nextPageToken`
        # as a value for the query parameter `pageToken` in the next list request.
        # Subsequent list requests will have their own `nextPageToken` to continue
        # paging through the results
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @instances = args[:instances] if args.key?(:instances)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Describes a long running operation, which conforms to OpenService API.
      class GoogleCloudServicebrokerV1beta1Operation
        include Google::Apis::Core::Hashable
      
        # Optional description of the Operation state.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The state of the operation.
        # Valid values are: "in progress", "succeeded", and "failed".
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # Plan message describes a Service Plan.
      class GoogleCloudServicebrokerV1beta1Plan
        include Google::Apis::Core::Hashable
      
        # Specifies whether instances of the service can be bound to applications.
        # If not specified, `Service.bindable` will be presumed.
        # Corresponds to the JSON property `bindable`
        # @return [Boolean]
        attr_accessor :bindable
        alias_method :bindable?, :bindable
      
        # Textual description of the plan. Optional.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Whether the service is free.
        # Corresponds to the JSON property `free`
        # @return [Boolean]
        attr_accessor :free
        alias_method :free?, :free
      
        # ID is a globally unique identifier used to uniquely identify the plan.
        # User must make no presumption about the format of this field.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # A list of metadata for a service offering.
        # Metadata is an arbitrary JSON object.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # User friendly name of the plan.
        # The name must be globally unique within GCP project.
        # Note, which is different from ("This must be globally unique within a
        # platform marketplace").
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Schema definitions for service instances and bindings for the plan.
        # Corresponds to the JSON property `schemas`
        # @return [Hash<String,Object>]
        attr_accessor :schemas
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bindable = args[:bindable] if args.key?(:bindable)
          @description = args[:description] if args.key?(:description)
          @free = args[:free] if args.key?(:free)
          @id = args[:id] if args.key?(:id)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @schemas = args[:schemas] if args.key?(:schemas)
        end
      end
      
      # The resource model mostly follows the Open Service Broker API, as
      # described here:
      # https://github.com/openservicebrokerapi/servicebroker/blob/master/_spec.md
      # Though due to Google Specifics it has additional optional fields.
      class GoogleCloudServicebrokerV1beta1Service
        include Google::Apis::Core::Hashable
      
        # Specifies whether instances of the service can be bound to applications.
        # Required.
        # Corresponds to the JSON property `bindable`
        # @return [Boolean]
        attr_accessor :bindable
        alias_method :bindable?, :bindable
      
        # Whether the service provides an endpoint to get service bindings.
        # Corresponds to the JSON property `binding_retrievable`
        # @return [Boolean]
        attr_accessor :binding_retrievable
        alias_method :binding_retrievable?, :binding_retrievable
      
        # Whether the service provides an endpoint to get service bindings.
        # Corresponds to the JSON property `bindings_retrievable`
        # @return [Boolean]
        attr_accessor :bindings_retrievable
        alias_method :bindings_retrievable?, :bindings_retrievable
      
        # Message containing information required to activate Dashboard SSO feature.
        # Corresponds to the JSON property `dashboard_client`
        # @return [Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1DashboardClient]
        attr_accessor :dashboard_client
      
        # Textual description of the service. Required.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # ID is a globally unique identifier used to uniquely identify the service.
        # ID is an opaque string.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Whether the service provides an endpoint to get service instances.
        # Corresponds to the JSON property `instances_retrievable`
        # @return [Boolean]
        attr_accessor :instances_retrievable
        alias_method :instances_retrievable?, :instances_retrievable
      
        # A list of metadata for a service offering.
        # Metadata is an arbitrary JSON object.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # User friendly service name.
        # Name must match [a-z0-9]+ regexp.
        # The name must be globally unique within GCP project.
        # Note, which is different from ("This must be globally unique within a
        # platform marketplace").
        # Required.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Whether the service supports upgrade/downgrade for some plans.
        # Corresponds to the JSON property `plan_updateable`
        # @return [Boolean]
        attr_accessor :plan_updateable
        alias_method :plan_updateable?, :plan_updateable
      
        # A list of plans for this service.
        # At least one plan is required.
        # Corresponds to the JSON property `plans`
        # @return [Array<Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1Plan>]
        attr_accessor :plans
      
        # Tags provide a flexible mechanism to expose a classification, attribute, or
        # base technology of a service.
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bindable = args[:bindable] if args.key?(:bindable)
          @binding_retrievable = args[:binding_retrievable] if args.key?(:binding_retrievable)
          @bindings_retrievable = args[:bindings_retrievable] if args.key?(:bindings_retrievable)
          @dashboard_client = args[:dashboard_client] if args.key?(:dashboard_client)
          @description = args[:description] if args.key?(:description)
          @id = args[:id] if args.key?(:id)
          @instances_retrievable = args[:instances_retrievable] if args.key?(:instances_retrievable)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @plan_updateable = args[:plan_updateable] if args.key?(:plan_updateable)
          @plans = args[:plans] if args.key?(:plans)
          @tags = args[:tags] if args.key?(:tags)
        end
      end
      
      # Message describing inputs to Provision and Update Service instance requests.
      class GoogleCloudServicebrokerV1beta1ServiceInstance
        include Google::Apis::Core::Hashable
      
        # Platform specific contextual information under which the service instance
        # is to be provisioned. This replaces organization_guid and space_guid.
        # But can also contain anything.
        # Currently only used for logging context information.
        # Corresponds to the JSON property `context`
        # @return [Hash<String,Object>]
        attr_accessor :context
      
        # Output only. Timestamp for when the instance was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. String containing the Deployment Manager deployment name that was
        # created
        # for this instance,
        # Corresponds to the JSON property `deploymentName`
        # @return [String]
        attr_accessor :deployment_name
      
        # To return errors when GetInstance call is done via HTTP to be unified with
        # other methods.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The id of the service instance. Must be unique within GCP project.
        # Maximum length is 64, GUID recommended.
        # Required.
        # Corresponds to the JSON property `instance_id`
        # @return [String]
        attr_accessor :instance_id
      
        # The platform GUID for the organization under which the service is to be
        # provisioned.
        # Required.
        # Corresponds to the JSON property `organization_guid`
        # @return [String]
        attr_accessor :organization_guid
      
        # Configuration options for the service instance.
        # Parameters is JSON object serialized to string.
        # Corresponds to the JSON property `parameters`
        # @return [Hash<String,Object>]
        attr_accessor :parameters
      
        # The ID of the plan. See `Service` and `Plan` resources for details.
        # Maximum length is 64, GUID recommended.
        # Required.
        # Corresponds to the JSON property `plan_id`
        # @return [String]
        attr_accessor :plan_id
      
        # Used only in UpdateServiceInstance request to optionally specify previous
        # fields.
        # Corresponds to the JSON property `previous_values`
        # @return [Hash<String,Object>]
        attr_accessor :previous_values
      
        # Output only. The resource name of the instance, e.g.
        # projects/project_id/brokers/broker_id/service_instances/instance_id
        # Corresponds to the JSON property `resourceName`
        # @return [String]
        attr_accessor :resource_name
      
        # The id of the service. Must be a valid identifier of a service
        # contained in the list from a `ListServices()` call.
        # Maximum length is 64, GUID recommended.
        # Required.
        # Corresponds to the JSON property `service_id`
        # @return [String]
        attr_accessor :service_id
      
        # The identifier for the project space within the platform organization.
        # Required.
        # Corresponds to the JSON property `space_guid`
        # @return [String]
        attr_accessor :space_guid
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @create_time = args[:create_time] if args.key?(:create_time)
          @deployment_name = args[:deployment_name] if args.key?(:deployment_name)
          @description = args[:description] if args.key?(:description)
          @instance_id = args[:instance_id] if args.key?(:instance_id)
          @organization_guid = args[:organization_guid] if args.key?(:organization_guid)
          @parameters = args[:parameters] if args.key?(:parameters)
          @plan_id = args[:plan_id] if args.key?(:plan_id)
          @previous_values = args[:previous_values] if args.key?(:previous_values)
          @resource_name = args[:resource_name] if args.key?(:resource_name)
          @service_id = args[:service_id] if args.key?(:service_id)
          @space_guid = args[:space_guid] if args.key?(:space_guid)
        end
      end
      
      # Response for the `UpdateServiceInstance()` method.
      class GoogleCloudServicebrokerV1beta1UpdateServiceInstanceResponse
        include Google::Apis::Core::Hashable
      
        # Used to communicate description of the response. Usually for non-standard
        # error codes.
        # https://github.com/openservicebrokerapi/servicebroker/blob/master/spec.md#
        # service-broker-errors
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # If broker executes operation asynchronously, this is the operation ID that
        # can be polled to check the completion status of said operation.
        # Corresponds to the JSON property `operation`
        # @return [String]
        attr_accessor :operation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @operation = args[:operation] if args.key?(:operation)
        end
      end
      
      # Associates `members` with a `role`.
      class GoogleIamV1Binding
        include Google::Apis::Core::Hashable
      
        # Represents an expression text. Example:
        # title: "User account presence"
        # description: "Determines whether the request has a user account"
        # expression: "size(request.user) > 0"
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::ServicebrokerV1beta1::GoogleTypeExpr]
        attr_accessor :condition
      
        # Specifies the identities requesting access for a Cloud Platform resource.
        # `members` can have the following values:
        # * `allUsers`: A special identifier that represents anyone who is
        # on the internet; with or without a Google account.
        # * `allAuthenticatedUsers`: A special identifier that represents anyone
        # who is authenticated with a Google account or a service account.
        # * `user:`emailid``: An email address that represents a specific Google
        # account. For example, `alice@example.com` .
        # * `serviceAccount:`emailid``: An email address that represents a service
        # account. For example, `my-other-app@appspot.gserviceaccount.com`.
        # * `group:`emailid``: An email address that represents a Google group.
        # For example, `admins@example.com`.
        # * `domain:`domain``: The G Suite domain (primary) that represents all the
        # users of that domain. For example, `google.com` or `example.com`.
        # Corresponds to the JSON property `members`
        # @return [Array<String>]
        attr_accessor :members
      
        # Role that is assigned to `members`.
        # For example, `roles/viewer`, `roles/editor`, or `roles/owner`.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
          @members = args[:members] if args.key?(:members)
          @role = args[:role] if args.key?(:role)
        end
      end
      
      # Defines an Identity and Access Management (IAM) policy. It is used to
      # specify access control policies for Cloud Platform resources.
      # A `Policy` is a collection of `bindings`. A `binding` binds one or more
      # `members` to a single `role`. Members can be user accounts, service accounts,
      # Google groups, and domains (such as G Suite). A `role` is a named list of
      # permissions (defined by IAM or configured by users). A `binding` can
      # optionally specify a `condition`, which is a logic expression that further
      # constrains the role binding based on attributes about the request and/or
      # target resource.
      # **JSON Example**
      # `
      # "bindings": [
      # `
      # "role": "roles/resourcemanager.organizationAdmin",
      # "members": [
      # "user:mike@example.com",
      # "group:admins@example.com",
      # "domain:google.com",
      # "serviceAccount:my-project-id@appspot.gserviceaccount.com"
      # ]
      # `,
      # `
      # "role": "roles/resourcemanager.organizationViewer",
      # "members": ["user:eve@example.com"],
      # "condition": `
      # "title": "expirable access",
      # "description": "Does not grant access after Sep 2020",
      # "expression": "request.time <
      # timestamp('2020-10-01T00:00:00.000Z')",
      # `
      # `
      # ]
      # `
      # **YAML Example**
      # bindings:
      # - members:
      # - user:mike@example.com
      # - group:admins@example.com
      # - domain:google.com
      # - serviceAccount:my-project-id@appspot.gserviceaccount.com
      # role: roles/resourcemanager.organizationAdmin
      # - members:
      # - user:eve@example.com
      # role: roles/resourcemanager.organizationViewer
      # condition:
      # title: expirable access
      # description: Does not grant access after Sep 2020
      # expression: request.time < timestamp('2020-10-01T00:00:00.000Z')
      # For a description of IAM and its features, see the
      # [IAM developer's guide](https://cloud.google.com/iam/docs).
      class GoogleIamV1Policy
        include Google::Apis::Core::Hashable
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::ServicebrokerV1beta1::GoogleIamV1Binding>]
        attr_accessor :bindings
      
        # `etag` is used for optimistic concurrency control as a way to help
        # prevent simultaneous updates of a policy from overwriting each other.
        # It is strongly suggested that systems make use of the `etag` in the
        # read-modify-write cycle to perform policy updates in order to avoid race
        # conditions: An `etag` is returned in the response to `getIamPolicy`, and
        # systems are expected to put that etag in the request to `setIamPolicy` to
        # ensure that their change will be applied to the same version of the policy.
        # If no `etag` is provided in the call to `setIamPolicy`, then the existing
        # policy is overwritten. Due to blind-set semantics of an etag-less policy,
        # 'setIamPolicy' will not fail even if either of incoming or stored policy
        # does not meet the version requirements.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Specifies the format of the policy.
        # Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        # rejected.
        # Operations affecting conditional bindings must specify version 3. This can
        # be either setting a conditional policy, modifying a conditional binding,
        # or removing a conditional binding from the stored conditional policy.
        # Operations on non-conditional policies may specify any valid value or
        # leave the field unset.
        # If no etag is provided in the call to `setIamPolicy`, any version
        # compliance checks on the incoming and/or stored policy is skipped.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bindings = args[:bindings] if args.key?(:bindings)
          @etag = args[:etag] if args.key?(:etag)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Request message for `SetIamPolicy` method.
      class GoogleIamV1SetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Defines an Identity and Access Management (IAM) policy. It is used to
        # specify access control policies for Cloud Platform resources.
        # A `Policy` is a collection of `bindings`. A `binding` binds one or more
        # `members` to a single `role`. Members can be user accounts, service accounts,
        # Google groups, and domains (such as G Suite). A `role` is a named list of
        # permissions (defined by IAM or configured by users). A `binding` can
        # optionally specify a `condition`, which is a logic expression that further
        # constrains the role binding based on attributes about the request and/or
        # target resource.
        # **JSON Example**
        # `
        # "bindings": [
        # `
        # "role": "roles/resourcemanager.organizationAdmin",
        # "members": [
        # "user:mike@example.com",
        # "group:admins@example.com",
        # "domain:google.com",
        # "serviceAccount:my-project-id@appspot.gserviceaccount.com"
        # ]
        # `,
        # `
        # "role": "roles/resourcemanager.organizationViewer",
        # "members": ["user:eve@example.com"],
        # "condition": `
        # "title": "expirable access",
        # "description": "Does not grant access after Sep 2020",
        # "expression": "request.time <
        # timestamp('2020-10-01T00:00:00.000Z')",
        # `
        # `
        # ]
        # `
        # **YAML Example**
        # bindings:
        # - members:
        # - user:mike@example.com
        # - group:admins@example.com
        # - domain:google.com
        # - serviceAccount:my-project-id@appspot.gserviceaccount.com
        # role: roles/resourcemanager.organizationAdmin
        # - members:
        # - user:eve@example.com
        # role: roles/resourcemanager.organizationViewer
        # condition:
        # title: expirable access
        # description: Does not grant access after Sep 2020
        # expression: request.time < timestamp('2020-10-01T00:00:00.000Z')
        # For a description of IAM and its features, see the
        # [IAM developer's guide](https://cloud.google.com/iam/docs).
        # Corresponds to the JSON property `policy`
        # @return [Google::Apis::ServicebrokerV1beta1::GoogleIamV1Policy]
        attr_accessor :policy
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy = args[:policy] if args.key?(:policy)
        end
      end
      
      # Request message for `TestIamPermissions` method.
      class GoogleIamV1TestIamPermissionsRequest
        include Google::Apis::Core::Hashable
      
        # The set of permissions to check for the `resource`. Permissions with
        # wildcards (such as '*' or 'storage.*') are not allowed. For more
        # information see
        # [IAM Overview](https://cloud.google.com/iam/docs/overview#permissions).
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # Response message for `TestIamPermissions` method.
      class GoogleIamV1TestIamPermissionsResponse
        include Google::Apis::Core::Hashable
      
        # A subset of `TestPermissionsRequest.permissions` that the caller is
        # allowed.
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class GoogleProtobufEmpty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Represents an expression text. Example:
      # title: "User account presence"
      # description: "Determines whether the request has a user account"
      # expression: "size(request.user) > 0"
      class GoogleTypeExpr
        include Google::Apis::Core::Hashable
      
        # An optional description of the expression. This is a longer text which
        # describes the expression, e.g. when hovered over it in a UI.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Textual representation of an expression in
        # Common Expression Language syntax.
        # The application context of the containing message determines which
        # well-known feature set of CEL is supported.
        # Corresponds to the JSON property `expression`
        # @return [String]
        attr_accessor :expression
      
        # An optional string indicating the location of the expression for error
        # reporting, e.g. a file name and a position in the file.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # An optional title for the expression, i.e. a short string describing
        # its purpose. This can be used e.g. in UIs which allow to enter the
        # expression.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @expression = args[:expression] if args.key?(:expression)
          @location = args[:location] if args.key?(:location)
          @title = args[:title] if args.key?(:title)
        end
      end
    end
  end
end
