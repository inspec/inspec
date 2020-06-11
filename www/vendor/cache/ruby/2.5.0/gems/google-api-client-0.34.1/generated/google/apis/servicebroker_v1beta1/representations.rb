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
      
      class GoogleCloudServicebrokerV1beta1Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1Broker
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1CreateBindingResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1CreateServiceInstanceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1DashboardClient
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1DeleteBindingResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1DeleteServiceInstanceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1GetBindingResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1ListBindingsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1ListBrokersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1ListCatalogResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1ListServiceInstancesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1Plan
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1Service
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1ServiceInstance
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1UpdateServiceInstanceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1SetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1TestIamPermissionsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1TestIamPermissionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleProtobufEmpty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleTypeExpr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1beta1Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :bind_resource, as: 'bind_resource'
          property :binding_id, as: 'binding_id'
          property :create_time, as: 'createTime'
          property :deployment_name, as: 'deploymentName'
          hash :parameters, as: 'parameters'
          property :plan_id, as: 'plan_id'
          property :resource_name, as: 'resourceName'
          property :service_id, as: 'service_id'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1Broker
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :name, as: 'name'
          property :title, as: 'title'
          property :url, as: 'url'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1CreateBindingResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :credentials, as: 'credentials'
          property :description, as: 'description'
          property :operation, as: 'operation'
          property :route_service_url, as: 'route_service_url'
          property :syslog_drain_url, as: 'syslog_drain_url'
          collection :volume_mounts, as: 'volume_mounts'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1CreateServiceInstanceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :operation, as: 'operation'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1DashboardClient
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :redirect_uri, as: 'redirect_uri'
          property :secret, as: 'secret'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1DeleteBindingResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :operation, as: 'operation'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1DeleteServiceInstanceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :operation, as: 'operation'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1GetBindingResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :credentials, as: 'credentials'
          property :deployment_name, as: 'deploymentName'
          property :description, as: 'description'
          property :resource_name, as: 'resourceName'
          property :route_service_url, as: 'route_service_url'
          property :syslog_drain_url, as: 'syslog_drain_url'
          collection :volume_mounts, as: 'volume_mounts'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1ListBindingsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bindings, as: 'bindings', class: Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1Binding, decorator: Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1Binding::Representation
      
          property :description, as: 'description'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1ListBrokersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :brokers, as: 'brokers', class: Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1Broker, decorator: Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1Broker::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1ListCatalogResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :next_page_token, as: 'nextPageToken'
          collection :services, as: 'services', class: Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1Service, decorator: Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1Service::Representation
      
        end
      end
      
      class GoogleCloudServicebrokerV1beta1ListServiceInstancesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          collection :instances, as: 'instances', class: Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1ServiceInstance, decorator: Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1ServiceInstance::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :state, as: 'state'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1Plan
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bindable, as: 'bindable'
          property :description, as: 'description'
          property :free, as: 'free'
          property :id, as: 'id'
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :schemas, as: 'schemas'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1Service
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bindable, as: 'bindable'
          property :binding_retrievable, as: 'binding_retrievable'
          property :bindings_retrievable, as: 'bindings_retrievable'
          property :dashboard_client, as: 'dashboard_client', class: Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1DashboardClient, decorator: Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1DashboardClient::Representation
      
          property :description, as: 'description'
          property :id, as: 'id'
          property :instances_retrievable, as: 'instances_retrievable'
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          property :plan_updateable, as: 'plan_updateable'
          collection :plans, as: 'plans', class: Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1Plan, decorator: Google::Apis::ServicebrokerV1beta1::GoogleCloudServicebrokerV1beta1Plan::Representation
      
          collection :tags, as: 'tags'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1ServiceInstance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :context, as: 'context'
          property :create_time, as: 'createTime'
          property :deployment_name, as: 'deploymentName'
          property :description, as: 'description'
          property :instance_id, as: 'instance_id'
          property :organization_guid, as: 'organization_guid'
          hash :parameters, as: 'parameters'
          property :plan_id, as: 'plan_id'
          hash :previous_values, as: 'previous_values'
          property :resource_name, as: 'resourceName'
          property :service_id, as: 'service_id'
          property :space_guid, as: 'space_guid'
        end
      end
      
      class GoogleCloudServicebrokerV1beta1UpdateServiceInstanceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :operation, as: 'operation'
        end
      end
      
      class GoogleIamV1Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::ServicebrokerV1beta1::GoogleTypeExpr, decorator: Google::Apis::ServicebrokerV1beta1::GoogleTypeExpr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class GoogleIamV1Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bindings, as: 'bindings', class: Google::Apis::ServicebrokerV1beta1::GoogleIamV1Binding, decorator: Google::Apis::ServicebrokerV1beta1::GoogleIamV1Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class GoogleIamV1SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::ServicebrokerV1beta1::GoogleIamV1Policy, decorator: Google::Apis::ServicebrokerV1beta1::GoogleIamV1Policy::Representation
      
        end
      end
      
      class GoogleIamV1TestIamPermissionsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class GoogleIamV1TestIamPermissionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class GoogleProtobufEmpty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GoogleTypeExpr
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :expression, as: 'expression'
          property :location, as: 'location'
          property :title, as: 'title'
        end
      end
    end
  end
end
