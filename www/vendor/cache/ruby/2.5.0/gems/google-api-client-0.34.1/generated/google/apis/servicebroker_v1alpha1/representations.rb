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
    module ServicebrokerV1alpha1
      
      class GoogleCloudServicebrokerV1alpha1Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1CreateBindingResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1CreateServiceInstanceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1DashboardClient
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1DeleteBindingResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1DeleteServiceInstanceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1GetBindingResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1ListBindingsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1ListCatalogResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1ListServiceInstancesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1Plan
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1Service
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1ServiceInstance
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1UpdateServiceInstanceResponse
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
      
      class GoogleTypeExpr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudServicebrokerV1alpha1Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :bind_resource, as: 'bind_resource'
          property :binding_id, as: 'binding_id'
          property :create_time, as: 'createTime'
          hash :parameters, as: 'parameters'
          property :plan_id, as: 'plan_id'
          property :service_id, as: 'service_id'
        end
      end
      
      class GoogleCloudServicebrokerV1alpha1CreateBindingResponse
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
      
      class GoogleCloudServicebrokerV1alpha1CreateServiceInstanceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :operation, as: 'operation'
        end
      end
      
      class GoogleCloudServicebrokerV1alpha1DashboardClient
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :redirect_uri, as: 'redirect_uri'
          property :secret, as: 'secret'
        end
      end
      
      class GoogleCloudServicebrokerV1alpha1DeleteBindingResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :operation, as: 'operation'
        end
      end
      
      class GoogleCloudServicebrokerV1alpha1DeleteServiceInstanceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :operation, as: 'operation'
        end
      end
      
      class GoogleCloudServicebrokerV1alpha1GetBindingResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :credentials, as: 'credentials'
          property :description, as: 'description'
          property :route_service_url, as: 'route_service_url'
          property :syslog_drain_url, as: 'syslog_drain_url'
          collection :volume_mounts, as: 'volume_mounts'
        end
      end
      
      class GoogleCloudServicebrokerV1alpha1ListBindingsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bindings, as: 'bindings', class: Google::Apis::ServicebrokerV1alpha1::GoogleCloudServicebrokerV1alpha1Binding, decorator: Google::Apis::ServicebrokerV1alpha1::GoogleCloudServicebrokerV1alpha1Binding::Representation
      
          property :description, as: 'description'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleCloudServicebrokerV1alpha1ListCatalogResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :next_page_token, as: 'nextPageToken'
          collection :services, as: 'services', class: Google::Apis::ServicebrokerV1alpha1::GoogleCloudServicebrokerV1alpha1Service, decorator: Google::Apis::ServicebrokerV1alpha1::GoogleCloudServicebrokerV1alpha1Service::Representation
      
        end
      end
      
      class GoogleCloudServicebrokerV1alpha1ListServiceInstancesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          collection :instances, as: 'instances', class: Google::Apis::ServicebrokerV1alpha1::GoogleCloudServicebrokerV1alpha1ServiceInstance, decorator: Google::Apis::ServicebrokerV1alpha1::GoogleCloudServicebrokerV1alpha1ServiceInstance::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleCloudServicebrokerV1alpha1Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :state, as: 'state'
        end
      end
      
      class GoogleCloudServicebrokerV1alpha1Plan
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
      
      class GoogleCloudServicebrokerV1alpha1Service
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bindable, as: 'bindable'
          property :binding_retrievable, as: 'binding_retrievable'
          property :dashboard_client, as: 'dashboard_client', class: Google::Apis::ServicebrokerV1alpha1::GoogleCloudServicebrokerV1alpha1DashboardClient, decorator: Google::Apis::ServicebrokerV1alpha1::GoogleCloudServicebrokerV1alpha1DashboardClient::Representation
      
          property :description, as: 'description'
          property :id, as: 'id'
          property :instance_retrievable, as: 'instance_retrievable'
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          property :plan_updateable, as: 'plan_updateable'
          collection :plans, as: 'plans', class: Google::Apis::ServicebrokerV1alpha1::GoogleCloudServicebrokerV1alpha1Plan, decorator: Google::Apis::ServicebrokerV1alpha1::GoogleCloudServicebrokerV1alpha1Plan::Representation
      
          collection :tags, as: 'tags'
        end
      end
      
      class GoogleCloudServicebrokerV1alpha1ServiceInstance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :context, as: 'context'
          property :create_time, as: 'createTime'
          property :deployment_name, as: 'deploymentName'
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
      
      class GoogleCloudServicebrokerV1alpha1UpdateServiceInstanceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :operation, as: 'operation'
        end
      end
      
      class GoogleIamV1Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::ServicebrokerV1alpha1::GoogleTypeExpr, decorator: Google::Apis::ServicebrokerV1alpha1::GoogleTypeExpr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class GoogleIamV1Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bindings, as: 'bindings', class: Google::Apis::ServicebrokerV1alpha1::GoogleIamV1Binding, decorator: Google::Apis::ServicebrokerV1alpha1::GoogleIamV1Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class GoogleIamV1SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::ServicebrokerV1alpha1::GoogleIamV1Policy, decorator: Google::Apis::ServicebrokerV1alpha1::GoogleIamV1Policy::Representation
      
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
