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
    module TagmanagerV1
      
      class Account
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountAccess
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
      
      class CreateContainerVersionRequestVersionOptions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateContainerVersionResponse
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
      
      class ListAccountUsersResponse
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
      
      class ListTriggersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListVariablesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Macro
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
      
      class Rule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetupTag
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
      
      class UserAccess
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Variable
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Account
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :fingerprint, as: 'fingerprint'
          property :name, as: 'name'
          property :share_data, as: 'shareData'
        end
      end
      
      class AccountAccess
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :permission, as: 'permission'
        end
      end
      
      class Condition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :parameter, as: 'parameter', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :type, as: 'type'
        end
      end
      
      class Container
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :container_id, as: 'containerId'
          collection :domain_name, as: 'domainName'
          collection :enabled_built_in_variable, as: 'enabledBuiltInVariable'
          property :fingerprint, as: 'fingerprint'
          property :name, as: 'name'
          property :notes, as: 'notes'
          property :public_id, as: 'publicId'
          property :time_zone_country_id, as: 'timeZoneCountryId'
          property :time_zone_id, as: 'timeZoneId'
          collection :usage_context, as: 'usageContext'
        end
      end
      
      class ContainerAccess
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :container_id, as: 'containerId'
          collection :permission, as: 'permission'
        end
      end
      
      class ContainerVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :container, as: 'container', class: Google::Apis::TagmanagerV1::Container, decorator: Google::Apis::TagmanagerV1::Container::Representation
      
          property :container_id, as: 'containerId'
          property :container_version_id, as: 'containerVersionId'
          property :deleted, as: 'deleted'
          property :fingerprint, as: 'fingerprint'
          collection :folder, as: 'folder', class: Google::Apis::TagmanagerV1::Folder, decorator: Google::Apis::TagmanagerV1::Folder::Representation
      
          collection :macro, as: 'macro', class: Google::Apis::TagmanagerV1::Macro, decorator: Google::Apis::TagmanagerV1::Macro::Representation
      
          property :name, as: 'name'
          property :notes, as: 'notes'
          collection :rule, as: 'rule', class: Google::Apis::TagmanagerV1::Rule, decorator: Google::Apis::TagmanagerV1::Rule::Representation
      
          collection :tag, as: 'tag', class: Google::Apis::TagmanagerV1::Tag, decorator: Google::Apis::TagmanagerV1::Tag::Representation
      
          collection :trigger, as: 'trigger', class: Google::Apis::TagmanagerV1::Trigger, decorator: Google::Apis::TagmanagerV1::Trigger::Representation
      
          collection :variable, as: 'variable', class: Google::Apis::TagmanagerV1::Variable, decorator: Google::Apis::TagmanagerV1::Variable::Representation
      
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
          property :num_macros, as: 'numMacros'
          property :num_rules, as: 'numRules'
          property :num_tags, as: 'numTags'
          property :num_triggers, as: 'numTriggers'
          property :num_variables, as: 'numVariables'
        end
      end
      
      class CreateContainerVersionRequestVersionOptions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :notes, as: 'notes'
          property :quick_preview, as: 'quickPreview'
        end
      end
      
      class CreateContainerVersionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :compiler_error, as: 'compilerError'
          property :container_version, as: 'containerVersion', class: Google::Apis::TagmanagerV1::ContainerVersion, decorator: Google::Apis::TagmanagerV1::ContainerVersion::Representation
      
        end
      end
      
      class Environment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :authorization_code, as: 'authorizationCode'
          property :authorization_timestamp_ms, :numeric_string => true, as: 'authorizationTimestampMs'
          property :container_id, as: 'containerId'
          property :container_version_id, as: 'containerVersionId'
          property :description, as: 'description'
          property :enable_debug, as: 'enableDebug'
          property :environment_id, as: 'environmentId'
          property :fingerprint, as: 'fingerprint'
          property :name, as: 'name'
          property :type, as: 'type'
          property :url, as: 'url'
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
        end
      end
      
      class FolderEntities
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :tag, as: 'tag', class: Google::Apis::TagmanagerV1::Tag, decorator: Google::Apis::TagmanagerV1::Tag::Representation
      
          collection :trigger, as: 'trigger', class: Google::Apis::TagmanagerV1::Trigger, decorator: Google::Apis::TagmanagerV1::Trigger::Representation
      
          collection :variable, as: 'variable', class: Google::Apis::TagmanagerV1::Variable, decorator: Google::Apis::TagmanagerV1::Variable::Representation
      
        end
      end
      
      class ListAccountUsersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :user_access, as: 'userAccess', class: Google::Apis::TagmanagerV1::UserAccess, decorator: Google::Apis::TagmanagerV1::UserAccess::Representation
      
        end
      end
      
      class ListAccountsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :accounts, as: 'accounts', class: Google::Apis::TagmanagerV1::Account, decorator: Google::Apis::TagmanagerV1::Account::Representation
      
        end
      end
      
      class ListContainerVersionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :container_version, as: 'containerVersion', class: Google::Apis::TagmanagerV1::ContainerVersion, decorator: Google::Apis::TagmanagerV1::ContainerVersion::Representation
      
          collection :container_version_header, as: 'containerVersionHeader', class: Google::Apis::TagmanagerV1::ContainerVersionHeader, decorator: Google::Apis::TagmanagerV1::ContainerVersionHeader::Representation
      
        end
      end
      
      class ListContainersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :containers, as: 'containers', class: Google::Apis::TagmanagerV1::Container, decorator: Google::Apis::TagmanagerV1::Container::Representation
      
        end
      end
      
      class ListEnvironmentsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :environments, as: 'environments', class: Google::Apis::TagmanagerV1::Environment, decorator: Google::Apis::TagmanagerV1::Environment::Representation
      
        end
      end
      
      class ListFoldersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :folders, as: 'folders', class: Google::Apis::TagmanagerV1::Folder, decorator: Google::Apis::TagmanagerV1::Folder::Representation
      
        end
      end
      
      class ListTagsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :tags, as: 'tags', class: Google::Apis::TagmanagerV1::Tag, decorator: Google::Apis::TagmanagerV1::Tag::Representation
      
        end
      end
      
      class ListTriggersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :triggers, as: 'triggers', class: Google::Apis::TagmanagerV1::Trigger, decorator: Google::Apis::TagmanagerV1::Trigger::Representation
      
        end
      end
      
      class ListVariablesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :variables, as: 'variables', class: Google::Apis::TagmanagerV1::Variable, decorator: Google::Apis::TagmanagerV1::Variable::Representation
      
        end
      end
      
      class Macro
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :container_id, as: 'containerId'
          collection :disabling_rule_id, as: 'disablingRuleId'
          collection :enabling_rule_id, as: 'enablingRuleId'
          property :fingerprint, as: 'fingerprint'
          property :macro_id, as: 'macroId'
          property :name, as: 'name'
          property :notes, as: 'notes'
          collection :parameter, as: 'parameter', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :parent_folder_id, as: 'parentFolderId'
          property :schedule_end_ms, :numeric_string => true, as: 'scheduleEndMs'
          property :schedule_start_ms, :numeric_string => true, as: 'scheduleStartMs'
          property :type, as: 'type'
        end
      end
      
      class Parameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          collection :list, as: 'list', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          collection :map, as: 'map', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class PublishContainerVersionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :compiler_error, as: 'compilerError'
          property :container_version, as: 'containerVersion', class: Google::Apis::TagmanagerV1::ContainerVersion, decorator: Google::Apis::TagmanagerV1::ContainerVersion::Representation
      
        end
      end
      
      class Rule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          collection :condition, as: 'condition', class: Google::Apis::TagmanagerV1::Condition, decorator: Google::Apis::TagmanagerV1::Condition::Representation
      
          property :container_id, as: 'containerId'
          property :fingerprint, as: 'fingerprint'
          property :name, as: 'name'
          property :notes, as: 'notes'
          property :rule_id, as: 'ruleId'
        end
      end
      
      class SetupTag
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :stop_on_setup_failure, as: 'stopOnSetupFailure'
          property :tag_name, as: 'tagName'
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
          collection :parameter, as: 'parameter', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :parent_folder_id, as: 'parentFolderId'
          property :paused, as: 'paused'
          property :priority, as: 'priority', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :schedule_end_ms, :numeric_string => true, as: 'scheduleEndMs'
          property :schedule_start_ms, :numeric_string => true, as: 'scheduleStartMs'
          collection :setup_tag, as: 'setupTag', class: Google::Apis::TagmanagerV1::SetupTag, decorator: Google::Apis::TagmanagerV1::SetupTag::Representation
      
          property :tag_firing_option, as: 'tagFiringOption'
          property :tag_id, as: 'tagId'
          collection :teardown_tag, as: 'teardownTag', class: Google::Apis::TagmanagerV1::TeardownTag, decorator: Google::Apis::TagmanagerV1::TeardownTag::Representation
      
          property :type, as: 'type'
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
          collection :auto_event_filter, as: 'autoEventFilter', class: Google::Apis::TagmanagerV1::Condition, decorator: Google::Apis::TagmanagerV1::Condition::Representation
      
          property :check_validation, as: 'checkValidation', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :container_id, as: 'containerId'
          property :continuous_time_min_milliseconds, as: 'continuousTimeMinMilliseconds', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          collection :custom_event_filter, as: 'customEventFilter', class: Google::Apis::TagmanagerV1::Condition, decorator: Google::Apis::TagmanagerV1::Condition::Representation
      
          property :event_name, as: 'eventName', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          collection :filter, as: 'filter', class: Google::Apis::TagmanagerV1::Condition, decorator: Google::Apis::TagmanagerV1::Condition::Representation
      
          property :fingerprint, as: 'fingerprint'
          property :horizontal_scroll_percentage_list, as: 'horizontalScrollPercentageList', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :interval, as: 'interval', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :interval_seconds, as: 'intervalSeconds', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :limit, as: 'limit', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :max_timer_length_seconds, as: 'maxTimerLengthSeconds', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :name, as: 'name'
          collection :parameter, as: 'parameter', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :parent_folder_id, as: 'parentFolderId'
          property :selector, as: 'selector', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :total_time_min_milliseconds, as: 'totalTimeMinMilliseconds', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :trigger_id, as: 'triggerId'
          property :type, as: 'type'
          property :unique_trigger_id, as: 'uniqueTriggerId', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :vertical_scroll_percentage_list, as: 'verticalScrollPercentageList', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :visibility_selector, as: 'visibilitySelector', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :visible_percentage_max, as: 'visiblePercentageMax', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :visible_percentage_min, as: 'visiblePercentageMin', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :wait_for_tags, as: 'waitForTags', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :wait_for_tags_timeout, as: 'waitForTagsTimeout', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
        end
      end
      
      class UserAccess
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_access, as: 'accountAccess', class: Google::Apis::TagmanagerV1::AccountAccess, decorator: Google::Apis::TagmanagerV1::AccountAccess::Representation
      
          property :account_id, as: 'accountId'
          collection :container_access, as: 'containerAccess', class: Google::Apis::TagmanagerV1::ContainerAccess, decorator: Google::Apis::TagmanagerV1::ContainerAccess::Representation
      
          property :email_address, as: 'emailAddress'
          property :permission_id, as: 'permissionId'
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
          property :name, as: 'name'
          property :notes, as: 'notes'
          collection :parameter, as: 'parameter', class: Google::Apis::TagmanagerV1::Parameter, decorator: Google::Apis::TagmanagerV1::Parameter::Representation
      
          property :parent_folder_id, as: 'parentFolderId'
          property :schedule_end_ms, :numeric_string => true, as: 'scheduleEndMs'
          property :schedule_start_ms, :numeric_string => true, as: 'scheduleStartMs'
          property :type, as: 'type'
          property :variable_id, as: 'variableId'
        end
      end
    end
  end
end
