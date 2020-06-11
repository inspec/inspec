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
    module TagmanagerV2
      
      class Account
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountAccess
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuiltInVariable
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Condition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Container
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContainerAccess
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContainerVersion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContainerVersionHeader
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateBuiltInVariableResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateContainerVersionRequestVersionOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateContainerVersionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomTemplate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Entity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Environment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Folder
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FolderEntities
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetWorkspaceStatusResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAccountsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListContainerVersionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListContainersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListEnabledBuiltInVariablesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListEnvironmentsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListFoldersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTagsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTemplatesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTriggersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListUserPermissionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListVariablesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListWorkspacesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListZonesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MergeConflict
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Parameter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublishContainerVersionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QuickPreviewResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RevertBuiltInVariableResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RevertFolderResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RevertTagResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RevertTemplateResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RevertTriggerResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RevertVariableResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RevertZoneResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetupTag
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SyncStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SyncWorkspaceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Tag
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TeardownTag
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Trigger
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserPermission
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Variable
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VariableFormatValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Workspace
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Zone
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ZoneBoundary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ZoneChildContainer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ZoneTypeRestriction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Account
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :fingerprint, as: 'fingerprint'
          property :name, as: 'name'
          property :path, as: 'path'
          property :share_data, as: 'shareData'
          property :tag_manager_url, as: 'tagManagerUrl'
        end
      end
      
      class AccountAccess
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :permission, as: 'permission'
        end
      end
      
      class BuiltInVariable
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :container_id, as: 'containerId'
          property :name, as: 'name'
          property :path, as: 'path'
          property :type, as: 'type'
          property :workspace_id, as: 'workspaceId'
        end
      end
      
      class Condition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :parameter, as: 'parameter', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :type, as: 'type'
        end
      end
      
      class Container
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :container_id, as: 'containerId'
          collection :domain_name, as: 'domainName'
          property :fingerprint, as: 'fingerprint'
          property :name, as: 'name'
          property :notes, as: 'notes'
          property :path, as: 'path'
          property :public_id, as: 'publicId'
          property :tag_manager_url, as: 'tagManagerUrl'
          collection :usage_context, as: 'usageContext'
        end
      end
      
      class ContainerAccess
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :container_id, as: 'containerId'
          property :permission, as: 'permission'
        end
      end
      
      class ContainerVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          collection :built_in_variable, as: 'builtInVariable', class: Google::Apis::TagmanagerV2::BuiltInVariable, decorator: Google::Apis::TagmanagerV2::BuiltInVariable::Representation
      
          property :container, as: 'container', class: Google::Apis::TagmanagerV2::Container, decorator: Google::Apis::TagmanagerV2::Container::Representation
      
          property :container_id, as: 'containerId'
          property :container_version_id, as: 'containerVersionId'
          collection :custom_template, as: 'customTemplate', class: Google::Apis::TagmanagerV2::CustomTemplate, decorator: Google::Apis::TagmanagerV2::CustomTemplate::Representation
      
          property :deleted, as: 'deleted'
          property :description, as: 'description'
          property :fingerprint, as: 'fingerprint'
          collection :folder, as: 'folder', class: Google::Apis::TagmanagerV2::Folder, decorator: Google::Apis::TagmanagerV2::Folder::Representation
      
          property :name, as: 'name'
          property :path, as: 'path'
          collection :tag, as: 'tag', class: Google::Apis::TagmanagerV2::Tag, decorator: Google::Apis::TagmanagerV2::Tag::Representation
      
          property :tag_manager_url, as: 'tagManagerUrl'
          collection :trigger, as: 'trigger', class: Google::Apis::TagmanagerV2::Trigger, decorator: Google::Apis::TagmanagerV2::Trigger::Representation
      
          collection :variable, as: 'variable', class: Google::Apis::TagmanagerV2::Variable, decorator: Google::Apis::TagmanagerV2::Variable::Representation
      
          collection :zone, as: 'zone', class: Google::Apis::TagmanagerV2::Zone, decorator: Google::Apis::TagmanagerV2::Zone::Representation
      
        end
      end
      
      class ContainerVersionHeader
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :container_id, as: 'containerId'
          property :container_version_id, as: 'containerVersionId'
          property :deleted, as: 'deleted'
          property :name, as: 'name'
          property :num_custom_templates, as: 'numCustomTemplates'
          property :num_macros, as: 'numMacros'
          property :num_rules, as: 'numRules'
          property :num_tags, as: 'numTags'
          property :num_triggers, as: 'numTriggers'
          property :num_variables, as: 'numVariables'
          property :num_zones, as: 'numZones'
          property :path, as: 'path'
        end
      end
      
      class CreateBuiltInVariableResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :built_in_variable, as: 'builtInVariable', class: Google::Apis::TagmanagerV2::BuiltInVariable, decorator: Google::Apis::TagmanagerV2::BuiltInVariable::Representation
      
        end
      end
      
      class CreateContainerVersionRequestVersionOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :notes, as: 'notes'
        end
      end
      
      class CreateContainerVersionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :compiler_error, as: 'compilerError'
          property :container_version, as: 'containerVersion', class: Google::Apis::TagmanagerV2::ContainerVersion, decorator: Google::Apis::TagmanagerV2::ContainerVersion::Representation
      
          property :new_workspace_path, as: 'newWorkspacePath'
          property :sync_status, as: 'syncStatus', class: Google::Apis::TagmanagerV2::SyncStatus, decorator: Google::Apis::TagmanagerV2::SyncStatus::Representation
      
        end
      end
      
      class CustomTemplate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :container_id, as: 'containerId'
          property :fingerprint, as: 'fingerprint'
          property :name, as: 'name'
          property :path, as: 'path'
          property :tag_manager_url, as: 'tagManagerUrl'
          property :template_data, as: 'templateData'
          property :template_id, as: 'templateId'
          property :workspace_id, as: 'workspaceId'
        end
      end
      
      class Entity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :change_status, as: 'changeStatus'
          property :folder, as: 'folder', class: Google::Apis::TagmanagerV2::Folder, decorator: Google::Apis::TagmanagerV2::Folder::Representation
      
          property :tag, as: 'tag', class: Google::Apis::TagmanagerV2::Tag, decorator: Google::Apis::TagmanagerV2::Tag::Representation
      
          property :trigger, as: 'trigger', class: Google::Apis::TagmanagerV2::Trigger, decorator: Google::Apis::TagmanagerV2::Trigger::Representation
      
          property :variable, as: 'variable', class: Google::Apis::TagmanagerV2::Variable, decorator: Google::Apis::TagmanagerV2::Variable::Representation
      
        end
      end
      
      class Environment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :authorization_code, as: 'authorizationCode'
          property :authorization_timestamp, as: 'authorizationTimestamp'
          property :container_id, as: 'containerId'
          property :container_version_id, as: 'containerVersionId'
          property :description, as: 'description'
          property :enable_debug, as: 'enableDebug'
          property :environment_id, as: 'environmentId'
          property :fingerprint, as: 'fingerprint'
          property :name, as: 'name'
          property :path, as: 'path'
          property :tag_manager_url, as: 'tagManagerUrl'
          property :type, as: 'type'
          property :url, as: 'url'
          property :workspace_id, as: 'workspaceId'
        end
      end
      
      class Folder
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :container_id, as: 'containerId'
          property :fingerprint, as: 'fingerprint'
          property :folder_id, as: 'folderId'
          property :name, as: 'name'
          property :notes, as: 'notes'
          property :path, as: 'path'
          property :tag_manager_url, as: 'tagManagerUrl'
          property :workspace_id, as: 'workspaceId'
        end
      end
      
      class FolderEntities
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :tag, as: 'tag', class: Google::Apis::TagmanagerV2::Tag, decorator: Google::Apis::TagmanagerV2::Tag::Representation
      
          collection :trigger, as: 'trigger', class: Google::Apis::TagmanagerV2::Trigger, decorator: Google::Apis::TagmanagerV2::Trigger::Representation
      
          collection :variable, as: 'variable', class: Google::Apis::TagmanagerV2::Variable, decorator: Google::Apis::TagmanagerV2::Variable::Representation
      
        end
      end
      
      class GetWorkspaceStatusResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :merge_conflict, as: 'mergeConflict', class: Google::Apis::TagmanagerV2::MergeConflict, decorator: Google::Apis::TagmanagerV2::MergeConflict::Representation
      
          collection :workspace_change, as: 'workspaceChange', class: Google::Apis::TagmanagerV2::Entity, decorator: Google::Apis::TagmanagerV2::Entity::Representation
      
        end
      end
      
      class ListAccountsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :account, as: 'account', class: Google::Apis::TagmanagerV2::Account, decorator: Google::Apis::TagmanagerV2::Account::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListContainerVersionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :container_version_header, as: 'containerVersionHeader', class: Google::Apis::TagmanagerV2::ContainerVersionHeader, decorator: Google::Apis::TagmanagerV2::ContainerVersionHeader::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListContainersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :container, as: 'container', class: Google::Apis::TagmanagerV2::Container, decorator: Google::Apis::TagmanagerV2::Container::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListEnabledBuiltInVariablesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :built_in_variable, as: 'builtInVariable', class: Google::Apis::TagmanagerV2::BuiltInVariable, decorator: Google::Apis::TagmanagerV2::BuiltInVariable::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListEnvironmentsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :environment, as: 'environment', class: Google::Apis::TagmanagerV2::Environment, decorator: Google::Apis::TagmanagerV2::Environment::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListFoldersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :folder, as: 'folder', class: Google::Apis::TagmanagerV2::Folder, decorator: Google::Apis::TagmanagerV2::Folder::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListTagsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :tag, as: 'tag', class: Google::Apis::TagmanagerV2::Tag, decorator: Google::Apis::TagmanagerV2::Tag::Representation
      
        end
      end
      
      class ListTemplatesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :template, as: 'template', class: Google::Apis::TagmanagerV2::CustomTemplate, decorator: Google::Apis::TagmanagerV2::CustomTemplate::Representation
      
        end
      end
      
      class ListTriggersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :trigger, as: 'trigger', class: Google::Apis::TagmanagerV2::Trigger, decorator: Google::Apis::TagmanagerV2::Trigger::Representation
      
        end
      end
      
      class ListUserPermissionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :user_permission, as: 'userPermission', class: Google::Apis::TagmanagerV2::UserPermission, decorator: Google::Apis::TagmanagerV2::UserPermission::Representation
      
        end
      end
      
      class ListVariablesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :variable, as: 'variable', class: Google::Apis::TagmanagerV2::Variable, decorator: Google::Apis::TagmanagerV2::Variable::Representation
      
        end
      end
      
      class ListWorkspacesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :workspace, as: 'workspace', class: Google::Apis::TagmanagerV2::Workspace, decorator: Google::Apis::TagmanagerV2::Workspace::Representation
      
        end
      end
      
      class ListZonesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :zone, as: 'zone', class: Google::Apis::TagmanagerV2::Zone, decorator: Google::Apis::TagmanagerV2::Zone::Representation
      
        end
      end
      
      class MergeConflict
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :entity_in_base_version, as: 'entityInBaseVersion', class: Google::Apis::TagmanagerV2::Entity, decorator: Google::Apis::TagmanagerV2::Entity::Representation
      
          property :entity_in_workspace, as: 'entityInWorkspace', class: Google::Apis::TagmanagerV2::Entity, decorator: Google::Apis::TagmanagerV2::Entity::Representation
      
        end
      end
      
      class Parameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          collection :list, as: 'list', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          collection :map, as: 'map', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class PublishContainerVersionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :compiler_error, as: 'compilerError'
          property :container_version, as: 'containerVersion', class: Google::Apis::TagmanagerV2::ContainerVersion, decorator: Google::Apis::TagmanagerV2::ContainerVersion::Representation
      
        end
      end
      
      class QuickPreviewResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :compiler_error, as: 'compilerError'
          property :container_version, as: 'containerVersion', class: Google::Apis::TagmanagerV2::ContainerVersion, decorator: Google::Apis::TagmanagerV2::ContainerVersion::Representation
      
          property :sync_status, as: 'syncStatus', class: Google::Apis::TagmanagerV2::SyncStatus, decorator: Google::Apis::TagmanagerV2::SyncStatus::Representation
      
        end
      end
      
      class RevertBuiltInVariableResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enabled, as: 'enabled'
        end
      end
      
      class RevertFolderResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :folder, as: 'folder', class: Google::Apis::TagmanagerV2::Folder, decorator: Google::Apis::TagmanagerV2::Folder::Representation
      
        end
      end
      
      class RevertTagResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :tag, as: 'tag', class: Google::Apis::TagmanagerV2::Tag, decorator: Google::Apis::TagmanagerV2::Tag::Representation
      
        end
      end
      
      class RevertTemplateResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :template, as: 'template', class: Google::Apis::TagmanagerV2::CustomTemplate, decorator: Google::Apis::TagmanagerV2::CustomTemplate::Representation
      
        end
      end
      
      class RevertTriggerResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :trigger, as: 'trigger', class: Google::Apis::TagmanagerV2::Trigger, decorator: Google::Apis::TagmanagerV2::Trigger::Representation
      
        end
      end
      
      class RevertVariableResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :variable, as: 'variable', class: Google::Apis::TagmanagerV2::Variable, decorator: Google::Apis::TagmanagerV2::Variable::Representation
      
        end
      end
      
      class RevertZoneResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :zone, as: 'zone', class: Google::Apis::TagmanagerV2::Zone, decorator: Google::Apis::TagmanagerV2::Zone::Representation
      
        end
      end
      
      class SetupTag
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :stop_on_setup_failure, as: 'stopOnSetupFailure'
          property :tag_name, as: 'tagName'
        end
      end
      
      class SyncStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :merge_conflict, as: 'mergeConflict'
          property :sync_error, as: 'syncError'
        end
      end
      
      class SyncWorkspaceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :merge_conflict, as: 'mergeConflict', class: Google::Apis::TagmanagerV2::MergeConflict, decorator: Google::Apis::TagmanagerV2::MergeConflict::Representation
      
          property :sync_status, as: 'syncStatus', class: Google::Apis::TagmanagerV2::SyncStatus, decorator: Google::Apis::TagmanagerV2::SyncStatus::Representation
      
        end
      end
      
      class Tag
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          collection :blocking_rule_id, as: 'blockingRuleId'
          collection :blocking_trigger_id, as: 'blockingTriggerId'
          property :container_id, as: 'containerId'
          property :fingerprint, as: 'fingerprint'
          collection :firing_rule_id, as: 'firingRuleId'
          collection :firing_trigger_id, as: 'firingTriggerId'
          property :live_only, as: 'liveOnly'
          property :name, as: 'name'
          property :notes, as: 'notes'
          collection :parameter, as: 'parameter', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :parent_folder_id, as: 'parentFolderId'
          property :path, as: 'path'
          property :paused, as: 'paused'
          property :priority, as: 'priority', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :schedule_end_ms, :numeric_string => true, as: 'scheduleEndMs'
          property :schedule_start_ms, :numeric_string => true, as: 'scheduleStartMs'
          collection :setup_tag, as: 'setupTag', class: Google::Apis::TagmanagerV2::SetupTag, decorator: Google::Apis::TagmanagerV2::SetupTag::Representation
      
          property :tag_firing_option, as: 'tagFiringOption'
          property :tag_id, as: 'tagId'
          property :tag_manager_url, as: 'tagManagerUrl'
          collection :teardown_tag, as: 'teardownTag', class: Google::Apis::TagmanagerV2::TeardownTag, decorator: Google::Apis::TagmanagerV2::TeardownTag::Representation
      
          property :type, as: 'type'
          property :workspace_id, as: 'workspaceId'
        end
      end
      
      class TeardownTag
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :stop_teardown_on_failure, as: 'stopTeardownOnFailure'
          property :tag_name, as: 'tagName'
        end
      end
      
      class Trigger
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          collection :auto_event_filter, as: 'autoEventFilter', class: Google::Apis::TagmanagerV2::Condition, decorator: Google::Apis::TagmanagerV2::Condition::Representation
      
          property :check_validation, as: 'checkValidation', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :container_id, as: 'containerId'
          property :continuous_time_min_milliseconds, as: 'continuousTimeMinMilliseconds', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          collection :custom_event_filter, as: 'customEventFilter', class: Google::Apis::TagmanagerV2::Condition, decorator: Google::Apis::TagmanagerV2::Condition::Representation
      
          property :event_name, as: 'eventName', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          collection :filter, as: 'filter', class: Google::Apis::TagmanagerV2::Condition, decorator: Google::Apis::TagmanagerV2::Condition::Representation
      
          property :fingerprint, as: 'fingerprint'
          property :horizontal_scroll_percentage_list, as: 'horizontalScrollPercentageList', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :interval, as: 'interval', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :interval_seconds, as: 'intervalSeconds', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :limit, as: 'limit', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :max_timer_length_seconds, as: 'maxTimerLengthSeconds', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :name, as: 'name'
          property :notes, as: 'notes'
          collection :parameter, as: 'parameter', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :parent_folder_id, as: 'parentFolderId'
          property :path, as: 'path'
          property :selector, as: 'selector', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :tag_manager_url, as: 'tagManagerUrl'
          property :total_time_min_milliseconds, as: 'totalTimeMinMilliseconds', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :trigger_id, as: 'triggerId'
          property :type, as: 'type'
          property :unique_trigger_id, as: 'uniqueTriggerId', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :vertical_scroll_percentage_list, as: 'verticalScrollPercentageList', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :visibility_selector, as: 'visibilitySelector', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :visible_percentage_max, as: 'visiblePercentageMax', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :visible_percentage_min, as: 'visiblePercentageMin', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :wait_for_tags, as: 'waitForTags', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :wait_for_tags_timeout, as: 'waitForTagsTimeout', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :workspace_id, as: 'workspaceId'
        end
      end
      
      class UserPermission
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_access, as: 'accountAccess', class: Google::Apis::TagmanagerV2::AccountAccess, decorator: Google::Apis::TagmanagerV2::AccountAccess::Representation
      
          property :account_id, as: 'accountId'
          collection :container_access, as: 'containerAccess', class: Google::Apis::TagmanagerV2::ContainerAccess, decorator: Google::Apis::TagmanagerV2::ContainerAccess::Representation
      
          property :email_address, as: 'emailAddress'
          property :path, as: 'path'
        end
      end
      
      class Variable
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :container_id, as: 'containerId'
          collection :disabling_trigger_id, as: 'disablingTriggerId'
          collection :enabling_trigger_id, as: 'enablingTriggerId'
          property :fingerprint, as: 'fingerprint'
          property :format_value, as: 'formatValue', class: Google::Apis::TagmanagerV2::VariableFormatValue, decorator: Google::Apis::TagmanagerV2::VariableFormatValue::Representation
      
          property :name, as: 'name'
          property :notes, as: 'notes'
          collection :parameter, as: 'parameter', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :parent_folder_id, as: 'parentFolderId'
          property :path, as: 'path'
          property :schedule_end_ms, :numeric_string => true, as: 'scheduleEndMs'
          property :schedule_start_ms, :numeric_string => true, as: 'scheduleStartMs'
          property :tag_manager_url, as: 'tagManagerUrl'
          property :type, as: 'type'
          property :variable_id, as: 'variableId'
          property :workspace_id, as: 'workspaceId'
        end
      end
      
      class VariableFormatValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :case_conversion_type, as: 'caseConversionType'
          property :convert_false_to_value, as: 'convertFalseToValue', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :convert_null_to_value, as: 'convertNullToValue', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :convert_true_to_value, as: 'convertTrueToValue', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
          property :convert_undefined_to_value, as: 'convertUndefinedToValue', class: Google::Apis::TagmanagerV2::Parameter, decorator: Google::Apis::TagmanagerV2::Parameter::Representation
      
        end
      end
      
      class Workspace
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :container_id, as: 'containerId'
          property :description, as: 'description'
          property :fingerprint, as: 'fingerprint'
          property :name, as: 'name'
          property :path, as: 'path'
          property :tag_manager_url, as: 'tagManagerUrl'
          property :workspace_id, as: 'workspaceId'
        end
      end
      
      class Zone
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :boundary, as: 'boundary', class: Google::Apis::TagmanagerV2::ZoneBoundary, decorator: Google::Apis::TagmanagerV2::ZoneBoundary::Representation
      
          collection :child_container, as: 'childContainer', class: Google::Apis::TagmanagerV2::ZoneChildContainer, decorator: Google::Apis::TagmanagerV2::ZoneChildContainer::Representation
      
          property :container_id, as: 'containerId'
          property :fingerprint, as: 'fingerprint'
          property :name, as: 'name'
          property :notes, as: 'notes'
          property :path, as: 'path'
          property :tag_manager_url, as: 'tagManagerUrl'
          property :type_restriction, as: 'typeRestriction', class: Google::Apis::TagmanagerV2::ZoneTypeRestriction, decorator: Google::Apis::TagmanagerV2::ZoneTypeRestriction::Representation
      
          property :workspace_id, as: 'workspaceId'
          property :zone_id, as: 'zoneId'
        end
      end
      
      class ZoneBoundary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :condition, as: 'condition', class: Google::Apis::TagmanagerV2::Condition, decorator: Google::Apis::TagmanagerV2::Condition::Representation
      
          collection :custom_evaluation_trigger_id, as: 'customEvaluationTriggerId'
        end
      end
      
      class ZoneChildContainer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :nickname, as: 'nickname'
          property :public_id, as: 'publicId'
        end
      end
      
      class ZoneTypeRestriction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable, as: 'enable'
          collection :whitelisted_type_id, as: 'whitelistedTypeId'
        end
      end
    end
  end
end
