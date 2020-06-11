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
    module CloudresourcemanagerV1
      
      class Ancestor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuditConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuditLogConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Binding
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BooleanConstraint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BooleanPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClearOrgPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Constraint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Expr
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FolderOperation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FolderOperationError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetAncestryRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetAncestryResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetEffectiveOrgPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetOrgPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetPolicyOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Lien
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAvailableOrgPolicyConstraintsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAvailableOrgPolicyConstraintsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListConstraint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLiensResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOrgPoliciesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOrgPoliciesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListProjectsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrgPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Organization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrganizationOwner
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Project
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProjectCreationStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResourceId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RestoreDefault
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SearchOrganizationsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SearchOrganizationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetIamPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetOrgPolicyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TestIamPermissionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UndeleteProjectRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Ancestor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource_id, as: 'resourceId', class: Google::Apis::CloudresourcemanagerV1::ResourceId, decorator: Google::Apis::CloudresourcemanagerV1::ResourceId::Representation
      
        end
      end
      
      class AuditConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_log_configs, as: 'auditLogConfigs', class: Google::Apis::CloudresourcemanagerV1::AuditLogConfig, decorator: Google::Apis::CloudresourcemanagerV1::AuditLogConfig::Representation
      
          property :service, as: 'service'
        end
      end
      
      class AuditLogConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :exempted_members, as: 'exemptedMembers'
          property :log_type, as: 'logType'
        end
      end
      
      class Binding
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :condition, as: 'condition', class: Google::Apis::CloudresourcemanagerV1::Expr, decorator: Google::Apis::CloudresourcemanagerV1::Expr::Representation
      
          collection :members, as: 'members'
          property :role, as: 'role'
        end
      end
      
      class BooleanConstraint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class BooleanPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enforced, as: 'enforced'
        end
      end
      
      class ClearOrgPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :constraint, as: 'constraint'
          property :etag, :base64 => true, as: 'etag'
        end
      end
      
      class Constraint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :boolean_constraint, as: 'booleanConstraint', class: Google::Apis::CloudresourcemanagerV1::BooleanConstraint, decorator: Google::Apis::CloudresourcemanagerV1::BooleanConstraint::Representation
      
          property :constraint_default, as: 'constraintDefault'
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :list_constraint, as: 'listConstraint', class: Google::Apis::CloudresourcemanagerV1::ListConstraint, decorator: Google::Apis::CloudresourcemanagerV1::ListConstraint::Representation
      
          property :name, as: 'name'
          property :version, as: 'version'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Expr
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :expression, as: 'expression'
          property :location, as: 'location'
          property :title, as: 'title'
        end
      end
      
      class FolderOperation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :destination_parent, as: 'destinationParent'
          property :display_name, as: 'displayName'
          property :operation_type, as: 'operationType'
          property :source_parent, as: 'sourceParent'
        end
      end
      
      class FolderOperationError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :error_message_id, as: 'errorMessageId'
        end
      end
      
      class GetAncestryRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class GetAncestryResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ancestor, as: 'ancestor', class: Google::Apis::CloudresourcemanagerV1::Ancestor, decorator: Google::Apis::CloudresourcemanagerV1::Ancestor::Representation
      
        end
      end
      
      class GetEffectiveOrgPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :constraint, as: 'constraint'
        end
      end
      
      class GetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :options, as: 'options', class: Google::Apis::CloudresourcemanagerV1::GetPolicyOptions, decorator: Google::Apis::CloudresourcemanagerV1::GetPolicyOptions::Representation
      
        end
      end
      
      class GetOrgPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :constraint, as: 'constraint'
        end
      end
      
      class GetPolicyOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :requested_policy_version, as: 'requestedPolicyVersion'
        end
      end
      
      class Lien
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :name, as: 'name'
          property :origin, as: 'origin'
          property :parent, as: 'parent'
          property :reason, as: 'reason'
          collection :restrictions, as: 'restrictions'
        end
      end
      
      class ListAvailableOrgPolicyConstraintsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :page_size, as: 'pageSize'
          property :page_token, as: 'pageToken'
        end
      end
      
      class ListAvailableOrgPolicyConstraintsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :constraints, as: 'constraints', class: Google::Apis::CloudresourcemanagerV1::Constraint, decorator: Google::Apis::CloudresourcemanagerV1::Constraint::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListConstraint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :suggested_value, as: 'suggestedValue'
          property :supports_under, as: 'supportsUnder'
        end
      end
      
      class ListLiensResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :liens, as: 'liens', class: Google::Apis::CloudresourcemanagerV1::Lien, decorator: Google::Apis::CloudresourcemanagerV1::Lien::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListOrgPoliciesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :page_size, as: 'pageSize'
          property :page_token, as: 'pageToken'
        end
      end
      
      class ListOrgPoliciesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :policies, as: 'policies', class: Google::Apis::CloudresourcemanagerV1::OrgPolicy, decorator: Google::Apis::CloudresourcemanagerV1::OrgPolicy::Representation
      
        end
      end
      
      class ListPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :all_values, as: 'allValues'
          collection :allowed_values, as: 'allowedValues'
          collection :denied_values, as: 'deniedValues'
          property :inherit_from_parent, as: 'inheritFromParent'
          property :suggested_value, as: 'suggestedValue'
        end
      end
      
      class ListProjectsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :projects, as: 'projects', class: Google::Apis::CloudresourcemanagerV1::Project, decorator: Google::Apis::CloudresourcemanagerV1::Project::Representation
      
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::CloudresourcemanagerV1::Status, decorator: Google::Apis::CloudresourcemanagerV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OrgPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :boolean_policy, as: 'booleanPolicy', class: Google::Apis::CloudresourcemanagerV1::BooleanPolicy, decorator: Google::Apis::CloudresourcemanagerV1::BooleanPolicy::Representation
      
          property :constraint, as: 'constraint'
          property :etag, :base64 => true, as: 'etag'
          property :list_policy, as: 'listPolicy', class: Google::Apis::CloudresourcemanagerV1::ListPolicy, decorator: Google::Apis::CloudresourcemanagerV1::ListPolicy::Representation
      
          property :restore_default, as: 'restoreDefault', class: Google::Apis::CloudresourcemanagerV1::RestoreDefault, decorator: Google::Apis::CloudresourcemanagerV1::RestoreDefault::Representation
      
          property :update_time, as: 'updateTime'
          property :version, as: 'version'
        end
      end
      
      class Organization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_time, as: 'creationTime'
          property :display_name, as: 'displayName'
          property :lifecycle_state, as: 'lifecycleState'
          property :name, as: 'name'
          property :owner, as: 'owner', class: Google::Apis::CloudresourcemanagerV1::OrganizationOwner, decorator: Google::Apis::CloudresourcemanagerV1::OrganizationOwner::Representation
      
        end
      end
      
      class OrganizationOwner
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :directory_customer_id, as: 'directoryCustomerId'
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audit_configs, as: 'auditConfigs', class: Google::Apis::CloudresourcemanagerV1::AuditConfig, decorator: Google::Apis::CloudresourcemanagerV1::AuditConfig::Representation
      
          collection :bindings, as: 'bindings', class: Google::Apis::CloudresourcemanagerV1::Binding, decorator: Google::Apis::CloudresourcemanagerV1::Binding::Representation
      
          property :etag, :base64 => true, as: 'etag'
          property :version, as: 'version'
        end
      end
      
      class Project
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          hash :labels, as: 'labels'
          property :lifecycle_state, as: 'lifecycleState'
          property :name, as: 'name'
          property :parent, as: 'parent', class: Google::Apis::CloudresourcemanagerV1::ResourceId, decorator: Google::Apis::CloudresourcemanagerV1::ResourceId::Representation
      
          property :project_id, as: 'projectId'
          property :project_number, :numeric_string => true, as: 'projectNumber'
        end
      end
      
      class ProjectCreationStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :gettable, as: 'gettable'
          property :ready, as: 'ready'
        end
      end
      
      class ResourceId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :type, as: 'type'
        end
      end
      
      class RestoreDefault
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class SearchOrganizationsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :filter, as: 'filter'
          property :page_size, as: 'pageSize'
          property :page_token, as: 'pageToken'
        end
      end
      
      class SearchOrganizationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :organizations, as: 'organizations', class: Google::Apis::CloudresourcemanagerV1::Organization, decorator: Google::Apis::CloudresourcemanagerV1::Organization::Representation
      
        end
      end
      
      class SetIamPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::CloudresourcemanagerV1::Policy, decorator: Google::Apis::CloudresourcemanagerV1::Policy::Representation
      
          property :update_mask, as: 'updateMask'
        end
      end
      
      class SetOrgPolicyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :policy, as: 'policy', class: Google::Apis::CloudresourcemanagerV1::OrgPolicy, decorator: Google::Apis::CloudresourcemanagerV1::OrgPolicy::Representation
      
        end
      end
      
      class Status
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
        end
      end
      
      class TestIamPermissionsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class TestIamPermissionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permissions, as: 'permissions'
        end
      end
      
      class UndeleteProjectRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
    end
  end
end
