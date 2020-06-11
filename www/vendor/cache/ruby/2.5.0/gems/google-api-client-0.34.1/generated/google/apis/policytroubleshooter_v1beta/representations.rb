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
    module PolicytroubleshooterV1beta
      
      class GoogleCloudPolicytroubleshooterV1betaAccessTuple
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPolicytroubleshooterV1betaBindingExplanation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPolicytroubleshooterV1betaBindingExplanationAnnotatedMembership
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPolicytroubleshooterV1betaExplainedPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPolicytroubleshooterV1betaTroubleshootIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPolicytroubleshooterV1betaTroubleshootIamPolicyResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1AuditConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleIamV1AuditLogConfig
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
      
      class GoogleTypeExpr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPolicytroubleshooterV1betaAccessTuple
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :full_resource_name, as: 'fullResourceName'
          property :permission, as: 'permission'
          property :principal, as: 'principal'
        end
      end
      
      class GoogleCloudPolicytroubleshooterV1betaBindingExplanation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access, as: 'access'
          property :condition, as: 'condition', class: Google::Apis::PolicytroubleshooterV1beta::GoogleTypeExpr, decorator: Google::Apis::PolicytroubleshooterV1beta::GoogleTypeExpr::Representation
      
          hash :memberships, as: 'memberships', class: Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaBindingExplanationAnnotatedMembership, decorator: Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaBindingExplanationAnnotatedMembership::Representation
      
          property :relevance, as: 'relevance'
          property :role, as: 'role'
          property :role_permission, as: 'rolePermission'
          property :role_permission_relevance, as: 'rolePermissionRelevance'
        end
      end
      
      class GoogleCloudPolicytroubleshooterV1betaBindingExplanationAnnotatedMembership
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :membership, as: 'membership'
          property :relevance, as: 'relevance'
        end
      end
      
      class GoogleCloudPolicytroubleshooterV1betaExplainedPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access, as: 'access'
          collection :binding_explanations, as: 'bindingExplanations', class: Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaBindingExplanation, decorator: Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaBindingExplanation::Representation
      
          property :full_resource_name, as: 'fullResourceName'
          property :policy, as: 'policy', class: Google::Apis::PolicytroubleshooterV1beta::GoogleIamV1Policy, decorator: Google::Apis::PolicytroubleshooterV1beta::GoogleIamV1Policy::Representation
      
          property :relevance, as: 'relevance'
        end
      end
      
      class GoogleCloudPolicytroubleshooterV1betaTroubleshootIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access_tuple, as: 'accessTuple', class: Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaAccessTuple, decorator: Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaAccessTuple::Representation
      
        end
      end
      
      class GoogleCloudPolicytroubleshooterV1betaTroubleshootIamPolicyResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access, as: 'access'
          collection :explained_policies, as: 'explainedPolicies', class: Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaExplainedPolicy, decorator: Google::Apis::PolicytroubleshooterV1beta::GoogleCloudPolicytroubleshooterV1betaExplainedPolicy::Representation
      
        end
      end
      
      class GoogleIamV1AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::PolicytroubleshooterV1beta::GoogleIamV1AuditLogConfig, decorator: Google::Apis::PolicytroubleshooterV1beta::GoogleIamV1AuditLogConfig::Representation
      
          property :service, as: 'service'
        end
      end
      
      class GoogleIamV1AuditLogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :exempted_members, as: 'exemptedMembers'
          property :log_type, as: 'logType'
        end
      end
      
      class GoogleIamV1Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::PolicytroubleshooterV1beta::GoogleTypeExpr, decorator: Google::Apis::PolicytroubleshooterV1beta::GoogleTypeExpr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class GoogleIamV1Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::PolicytroubleshooterV1beta::GoogleIamV1AuditConfig, decorator: Google::Apis::PolicytroubleshooterV1beta::GoogleIamV1AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::PolicytroubleshooterV1beta::GoogleIamV1Binding, decorator: Google::Apis::PolicytroubleshooterV1beta::GoogleIamV1Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
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
