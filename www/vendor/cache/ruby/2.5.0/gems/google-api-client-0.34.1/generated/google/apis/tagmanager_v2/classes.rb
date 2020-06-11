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
      
      # Represents a Google Tag Manager Account.
      class Account
        include Google::Apis::Core::Hashable
      
        # The Account ID uniquely identifies the GTM Account.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # The fingerprint of the GTM Account as computed at storage time.
        # This value is recomputed whenever the account is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # Account display name.
        # @mutable tagmanager.accounts.create
        # @mutable tagmanager.accounts.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # GTM Account's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Whether the account shares data anonymously with Google and others.
        # This flag enables benchmarking by sharing your data in an anonymous form.
        # Google will remove all identifiable information about your website, combine
        # the data with hundreds of other anonymous sites and report aggregate trends
        # in the benchmarking service.
        # @mutable tagmanager.accounts.create
        # @mutable tagmanager.accounts.update
        # Corresponds to the JSON property `shareData`
        # @return [Boolean]
        attr_accessor :share_data
        alias_method :share_data?, :share_data
      
        # Auto generated link to the tag manager UI
        # Corresponds to the JSON property `tagManagerUrl`
        # @return [String]
        attr_accessor :tag_manager_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @name = args[:name] if args.key?(:name)
          @path = args[:path] if args.key?(:path)
          @share_data = args[:share_data] if args.key?(:share_data)
          @tag_manager_url = args[:tag_manager_url] if args.key?(:tag_manager_url)
        end
      end
      
      # Defines the Google Tag Manager Account access permissions.
      class AccountAccess
        include Google::Apis::Core::Hashable
      
        # Whether the user has no access, user access, or admin access to an account.
        # @mutable tagmanager.accounts.permissions.create
        # @mutable tagmanager.accounts.permissions.update
        # Corresponds to the JSON property `permission`
        # @return [String]
        attr_accessor :permission
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permission = args[:permission] if args.key?(:permission)
        end
      end
      
      # Built-in variables are a special category of variables that are pre-created
      # and non-customizable. They provide common functionality like accessing
      # propeties of the gtm data layer, monitoring clicks, or accessing elements
      # of a page URL.
      class BuiltInVariable
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # Name of the built-in variable to be used to refer to the built-in variable.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # GTM BuiltInVariable's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Type of built-in variable.
        # @required.tagmanager.accounts.containers.workspaces.built_in_variable.update
        # @mutable tagmanager.accounts.containers.workspaces.built_in_variable.update
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # GTM Workspace ID.
        # Corresponds to the JSON property `workspaceId`
        # @return [String]
        attr_accessor :workspace_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @container_id = args[:container_id] if args.key?(:container_id)
          @name = args[:name] if args.key?(:name)
          @path = args[:path] if args.key?(:path)
          @type = args[:type] if args.key?(:type)
          @workspace_id = args[:workspace_id] if args.key?(:workspace_id)
        end
      end
      
      # Represents a predicate.
      class Condition
        include Google::Apis::Core::Hashable
      
        # A list of named parameters (key/value), depending on the condition's type.
        # Notes:<ul>
        # <li>For binary operators, include parameters named <code>arg0</code> and
        # <code>arg1</code> for specifying the left and right operands,
        # respectively.</li>
        # <li>At this time, the left operand (<code>arg0</code>) must be a reference
        # to a variable.</li>
        # <li>For case-insensitive Regex matching, include a boolean parameter named
        # <code>ignore_case</code> that is set to <code>true</code>.
        # If not specified or set to any other value, the matching will be case
        # sensitive.</li>
        # <li>To negate an operator, include a boolean parameter named
        # <code>negate</code> boolean parameter that is set to <code>true</code>.
        # </li>
        # </ul>
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # Corresponds to the JSON property `parameter`
        # @return [Array<Google::Apis::TagmanagerV2::Parameter>]
        attr_accessor :parameter
      
        # The type of operator for this condition.
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @parameter = args[:parameter] if args.key?(:parameter)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Represents a Google Tag Manager Container, which specifies the platform tags
      # will run on, manages workspaces, and retains container versions.
      class Container
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # The Container ID uniquely identifies the GTM Container.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # List of domain names associated with the Container.
        # @mutable tagmanager.accounts.containers.create
        # @mutable tagmanager.accounts.containers.update
        # Corresponds to the JSON property `domainName`
        # @return [Array<String>]
        attr_accessor :domain_name
      
        # The fingerprint of the GTM Container as computed at storage time.  This
        # value is recomputed whenever the account is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # Container display name.
        # @mutable tagmanager.accounts.containers.create
        # @mutable tagmanager.accounts.containers.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Container Notes.
        # @mutable tagmanager.accounts.containers.create
        # @mutable tagmanager.accounts.containers.update
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # GTM Container's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Container Public ID.
        # Corresponds to the JSON property `publicId`
        # @return [String]
        attr_accessor :public_id
      
        # Auto generated link to the tag manager UI
        # Corresponds to the JSON property `tagManagerUrl`
        # @return [String]
        attr_accessor :tag_manager_url
      
        # List of Usage Contexts for the Container. Valid values include: <code>web,
        # android, or ios</code>.
        # @mutable tagmanager.accounts.containers.create
        # @mutable tagmanager.accounts.containers.update
        # Corresponds to the JSON property `usageContext`
        # @return [Array<String>]
        attr_accessor :usage_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @container_id = args[:container_id] if args.key?(:container_id)
          @domain_name = args[:domain_name] if args.key?(:domain_name)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @path = args[:path] if args.key?(:path)
          @public_id = args[:public_id] if args.key?(:public_id)
          @tag_manager_url = args[:tag_manager_url] if args.key?(:tag_manager_url)
          @usage_context = args[:usage_context] if args.key?(:usage_context)
        end
      end
      
      # Defines the Google Tag Manager Container access permissions.
      class ContainerAccess
        include Google::Apis::Core::Hashable
      
        # GTM Container ID.
        # @mutable tagmanager.accounts.permissions.create
        # @mutable tagmanager.accounts.permissions.update
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # List of Container permissions.
        # @mutable tagmanager.accounts.permissions.create
        # @mutable tagmanager.accounts.permissions.update
        # Corresponds to the JSON property `permission`
        # @return [String]
        attr_accessor :permission
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @container_id = args[:container_id] if args.key?(:container_id)
          @permission = args[:permission] if args.key?(:permission)
        end
      end
      
      # Represents a Google Tag Manager Container Version.
      class ContainerVersion
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # The built-in variables in the container that this version was taken from.
        # Corresponds to the JSON property `builtInVariable`
        # @return [Array<Google::Apis::TagmanagerV2::BuiltInVariable>]
        attr_accessor :built_in_variable
      
        # Represents a Google Tag Manager Container, which specifies the platform tags
        # will run on, manages workspaces, and retains container versions.
        # Corresponds to the JSON property `container`
        # @return [Google::Apis::TagmanagerV2::Container]
        attr_accessor :container
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # The Container Version ID uniquely identifies the GTM Container Version.
        # Corresponds to the JSON property `containerVersionId`
        # @return [String]
        attr_accessor :container_version_id
      
        # The custom templates in the container that this version was taken from.
        # Corresponds to the JSON property `customTemplate`
        # @return [Array<Google::Apis::TagmanagerV2::CustomTemplate>]
        attr_accessor :custom_template
      
        # A value of true indicates this container version has been deleted.
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # Container version description.
        # @mutable tagmanager.accounts.containers.versions.update
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The fingerprint of the GTM Container Version as computed at
        # storage time. This value is recomputed whenever the container version is
        # modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # The folders in the container that this version was taken from.
        # Corresponds to the JSON property `folder`
        # @return [Array<Google::Apis::TagmanagerV2::Folder>]
        attr_accessor :folder
      
        # Container version display name.
        # @mutable tagmanager.accounts.containers.versions.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # GTM ContainerVersions's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # The tags in the container that this version was taken from.
        # Corresponds to the JSON property `tag`
        # @return [Array<Google::Apis::TagmanagerV2::Tag>]
        attr_accessor :tag
      
        # Auto generated link to the tag manager UI
        # Corresponds to the JSON property `tagManagerUrl`
        # @return [String]
        attr_accessor :tag_manager_url
      
        # The triggers in the container that this version was taken from.
        # Corresponds to the JSON property `trigger`
        # @return [Array<Google::Apis::TagmanagerV2::Trigger>]
        attr_accessor :trigger
      
        # The variables in the container that this version was taken from.
        # Corresponds to the JSON property `variable`
        # @return [Array<Google::Apis::TagmanagerV2::Variable>]
        attr_accessor :variable
      
        # The zones in the container that this version was taken from.
        # Corresponds to the JSON property `zone`
        # @return [Array<Google::Apis::TagmanagerV2::Zone>]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @built_in_variable = args[:built_in_variable] if args.key?(:built_in_variable)
          @container = args[:container] if args.key?(:container)
          @container_id = args[:container_id] if args.key?(:container_id)
          @container_version_id = args[:container_version_id] if args.key?(:container_version_id)
          @custom_template = args[:custom_template] if args.key?(:custom_template)
          @deleted = args[:deleted] if args.key?(:deleted)
          @description = args[:description] if args.key?(:description)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @folder = args[:folder] if args.key?(:folder)
          @name = args[:name] if args.key?(:name)
          @path = args[:path] if args.key?(:path)
          @tag = args[:tag] if args.key?(:tag)
          @tag_manager_url = args[:tag_manager_url] if args.key?(:tag_manager_url)
          @trigger = args[:trigger] if args.key?(:trigger)
          @variable = args[:variable] if args.key?(:variable)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # Represents a Google Tag Manager Container Version Header.
      class ContainerVersionHeader
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # The Container Version ID uniquely identifies the GTM Container Version.
        # Corresponds to the JSON property `containerVersionId`
        # @return [String]
        attr_accessor :container_version_id
      
        # A value of true indicates this container version has been deleted.
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # Container version display name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Number of custom templates in the container version.
        # Corresponds to the JSON property `numCustomTemplates`
        # @return [String]
        attr_accessor :num_custom_templates
      
        # Number of macros in the container version.
        # Corresponds to the JSON property `numMacros`
        # @return [String]
        attr_accessor :num_macros
      
        # Number of rules in the container version.
        # Corresponds to the JSON property `numRules`
        # @return [String]
        attr_accessor :num_rules
      
        # Number of tags in the container version.
        # Corresponds to the JSON property `numTags`
        # @return [String]
        attr_accessor :num_tags
      
        # Number of triggers in the container version.
        # Corresponds to the JSON property `numTriggers`
        # @return [String]
        attr_accessor :num_triggers
      
        # Number of variables in the container version.
        # Corresponds to the JSON property `numVariables`
        # @return [String]
        attr_accessor :num_variables
      
        # Number of zones in the container version.
        # Corresponds to the JSON property `numZones`
        # @return [String]
        attr_accessor :num_zones
      
        # GTM Container Versions's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @container_id = args[:container_id] if args.key?(:container_id)
          @container_version_id = args[:container_version_id] if args.key?(:container_version_id)
          @deleted = args[:deleted] if args.key?(:deleted)
          @name = args[:name] if args.key?(:name)
          @num_custom_templates = args[:num_custom_templates] if args.key?(:num_custom_templates)
          @num_macros = args[:num_macros] if args.key?(:num_macros)
          @num_rules = args[:num_rules] if args.key?(:num_rules)
          @num_tags = args[:num_tags] if args.key?(:num_tags)
          @num_triggers = args[:num_triggers] if args.key?(:num_triggers)
          @num_variables = args[:num_variables] if args.key?(:num_variables)
          @num_zones = args[:num_zones] if args.key?(:num_zones)
          @path = args[:path] if args.key?(:path)
        end
      end
      
      # 
      class CreateBuiltInVariableResponse
        include Google::Apis::Core::Hashable
      
        # List of created built-in variables.
        # Corresponds to the JSON property `builtInVariable`
        # @return [Array<Google::Apis::TagmanagerV2::BuiltInVariable>]
        attr_accessor :built_in_variable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @built_in_variable = args[:built_in_variable] if args.key?(:built_in_variable)
        end
      end
      
      # Options for new container versions.
      class CreateContainerVersionRequestVersionOptions
        include Google::Apis::Core::Hashable
      
        # The name of the container version to be created.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The notes of the container version to be created.
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
        end
      end
      
      # Create container versions response.
      class CreateContainerVersionResponse
        include Google::Apis::Core::Hashable
      
        # Compiler errors or not.
        # Corresponds to the JSON property `compilerError`
        # @return [Boolean]
        attr_accessor :compiler_error
        alias_method :compiler_error?, :compiler_error
      
        # Represents a Google Tag Manager Container Version.
        # Corresponds to the JSON property `containerVersion`
        # @return [Google::Apis::TagmanagerV2::ContainerVersion]
        attr_accessor :container_version
      
        # Auto generated workspace path created as a result of version creation. This
        # field should only be populated if the created version was not a quick
        # preview.
        # Corresponds to the JSON property `newWorkspacePath`
        # @return [String]
        attr_accessor :new_workspace_path
      
        # The status of a workspace after synchronization.
        # Corresponds to the JSON property `syncStatus`
        # @return [Google::Apis::TagmanagerV2::SyncStatus]
        attr_accessor :sync_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @compiler_error = args[:compiler_error] if args.key?(:compiler_error)
          @container_version = args[:container_version] if args.key?(:container_version)
          @new_workspace_path = args[:new_workspace_path] if args.key?(:new_workspace_path)
          @sync_status = args[:sync_status] if args.key?(:sync_status)
        end
      end
      
      # Represents a Google Tag Manager Custom Template's contents.
      class CustomTemplate
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # The fingerprint of the GTM Custom Template as computed at storage time.
        # This value is recomputed whenever the template is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # Custom Template display name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # GTM Custom Template's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Auto generated link to the tag manager UI
        # Corresponds to the JSON property `tagManagerUrl`
        # @return [String]
        attr_accessor :tag_manager_url
      
        # The custom template in text format.
        # Corresponds to the JSON property `templateData`
        # @return [String]
        attr_accessor :template_data
      
        # The Custom Template ID uniquely identifies the GTM custom template.
        # Corresponds to the JSON property `templateId`
        # @return [String]
        attr_accessor :template_id
      
        # GTM Workspace ID.
        # Corresponds to the JSON property `workspaceId`
        # @return [String]
        attr_accessor :workspace_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @container_id = args[:container_id] if args.key?(:container_id)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @name = args[:name] if args.key?(:name)
          @path = args[:path] if args.key?(:path)
          @tag_manager_url = args[:tag_manager_url] if args.key?(:tag_manager_url)
          @template_data = args[:template_data] if args.key?(:template_data)
          @template_id = args[:template_id] if args.key?(:template_id)
          @workspace_id = args[:workspace_id] if args.key?(:workspace_id)
        end
      end
      
      # A workspace entity that may represent a tag, trigger, variable, or folder in
      # addition to its status in the workspace.
      class Entity
        include Google::Apis::Core::Hashable
      
        # Represents how the entity has been changed in the workspace.
        # Corresponds to the JSON property `changeStatus`
        # @return [String]
        attr_accessor :change_status
      
        # Represents a Google Tag Manager Folder.
        # Corresponds to the JSON property `folder`
        # @return [Google::Apis::TagmanagerV2::Folder]
        attr_accessor :folder
      
        # Represents a Google Tag Manager Tag.
        # Corresponds to the JSON property `tag`
        # @return [Google::Apis::TagmanagerV2::Tag]
        attr_accessor :tag
      
        # Represents a Google Tag Manager Trigger
        # Corresponds to the JSON property `trigger`
        # @return [Google::Apis::TagmanagerV2::Trigger]
        attr_accessor :trigger
      
        # Represents a Google Tag Manager Variable.
        # Corresponds to the JSON property `variable`
        # @return [Google::Apis::TagmanagerV2::Variable]
        attr_accessor :variable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @change_status = args[:change_status] if args.key?(:change_status)
          @folder = args[:folder] if args.key?(:folder)
          @tag = args[:tag] if args.key?(:tag)
          @trigger = args[:trigger] if args.key?(:trigger)
          @variable = args[:variable] if args.key?(:variable)
        end
      end
      
      # Represents a Google Tag Manager Environment. Note that a user can create,
      # delete and update environments of type USER, but can only update the
      # enable_debug and url fields of environments of other types.
      class Environment
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # The environment authorization code.
        # Corresponds to the JSON property `authorizationCode`
        # @return [String]
        attr_accessor :authorization_code
      
        # The last update time-stamp for the authorization code.
        # Corresponds to the JSON property `authorizationTimestamp`
        # @return [String]
        attr_accessor :authorization_timestamp
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # Represents a link to a container version.
        # Corresponds to the JSON property `containerVersionId`
        # @return [String]
        attr_accessor :container_version_id
      
        # The environment description. Can be set or changed only on USER type
        # environments.
        # @mutable tagmanager.accounts.containers.environments.create
        # @mutable tagmanager.accounts.containers.environments.update
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Whether or not to enable debug by default for the environment.
        # @mutable tagmanager.accounts.containers.environments.create
        # @mutable tagmanager.accounts.containers.environments.update
        # Corresponds to the JSON property `enableDebug`
        # @return [Boolean]
        attr_accessor :enable_debug
        alias_method :enable_debug?, :enable_debug
      
        # GTM Environment ID uniquely identifies the GTM Environment.
        # Corresponds to the JSON property `environmentId`
        # @return [String]
        attr_accessor :environment_id
      
        # The fingerprint of the GTM environment as computed at storage time.
        # This value is recomputed whenever the environment is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # The environment display name. Can be set or changed only on USER type
        # environments.
        # @mutable tagmanager.accounts.containers.environments.create
        # @mutable tagmanager.accounts.containers.environments.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # GTM Environment's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Auto generated link to the tag manager UI
        # Corresponds to the JSON property `tagManagerUrl`
        # @return [String]
        attr_accessor :tag_manager_url
      
        # The type of this environment.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Default preview page url for the environment.
        # @mutable tagmanager.accounts.containers.environments.create
        # @mutable tagmanager.accounts.containers.environments.update
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        # Represents a link to a quick preview of a workspace.
        # Corresponds to the JSON property `workspaceId`
        # @return [String]
        attr_accessor :workspace_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @authorization_code = args[:authorization_code] if args.key?(:authorization_code)
          @authorization_timestamp = args[:authorization_timestamp] if args.key?(:authorization_timestamp)
          @container_id = args[:container_id] if args.key?(:container_id)
          @container_version_id = args[:container_version_id] if args.key?(:container_version_id)
          @description = args[:description] if args.key?(:description)
          @enable_debug = args[:enable_debug] if args.key?(:enable_debug)
          @environment_id = args[:environment_id] if args.key?(:environment_id)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @name = args[:name] if args.key?(:name)
          @path = args[:path] if args.key?(:path)
          @tag_manager_url = args[:tag_manager_url] if args.key?(:tag_manager_url)
          @type = args[:type] if args.key?(:type)
          @url = args[:url] if args.key?(:url)
          @workspace_id = args[:workspace_id] if args.key?(:workspace_id)
        end
      end
      
      # Represents a Google Tag Manager Folder.
      class Folder
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # The fingerprint of the GTM Folder as computed at storage time.
        # This value is recomputed whenever the folder is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # The Folder ID uniquely identifies the GTM Folder.
        # Corresponds to the JSON property `folderId`
        # @return [String]
        attr_accessor :folder_id
      
        # Folder display name.
        # @mutable tagmanager.accounts.containers.workspaces.folders.create
        # @mutable tagmanager.accounts.containers.workspaces.folders.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User notes on how to apply this folder in the container.
        # @mutable tagmanager.accounts.containers.workspaces.folders.create
        # @mutable tagmanager.accounts.containers.workspaces.folders.update
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # GTM Folder's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Auto generated link to the tag manager UI
        # Corresponds to the JSON property `tagManagerUrl`
        # @return [String]
        attr_accessor :tag_manager_url
      
        # GTM Workspace ID.
        # Corresponds to the JSON property `workspaceId`
        # @return [String]
        attr_accessor :workspace_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @container_id = args[:container_id] if args.key?(:container_id)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @folder_id = args[:folder_id] if args.key?(:folder_id)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @path = args[:path] if args.key?(:path)
          @tag_manager_url = args[:tag_manager_url] if args.key?(:tag_manager_url)
          @workspace_id = args[:workspace_id] if args.key?(:workspace_id)
        end
      end
      
      # Represents a Google Tag Manager Folder's contents.
      class FolderEntities
        include Google::Apis::Core::Hashable
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of tags inside the folder.
        # Corresponds to the JSON property `tag`
        # @return [Array<Google::Apis::TagmanagerV2::Tag>]
        attr_accessor :tag
      
        # The list of triggers inside the folder.
        # Corresponds to the JSON property `trigger`
        # @return [Array<Google::Apis::TagmanagerV2::Trigger>]
        attr_accessor :trigger
      
        # The list of variables inside the folder.
        # Corresponds to the JSON property `variable`
        # @return [Array<Google::Apis::TagmanagerV2::Variable>]
        attr_accessor :variable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @tag = args[:tag] if args.key?(:tag)
          @trigger = args[:trigger] if args.key?(:trigger)
          @variable = args[:variable] if args.key?(:variable)
        end
      end
      
      # The changes that have occurred in the workspace since the base container
      # version.
      class GetWorkspaceStatusResponse
        include Google::Apis::Core::Hashable
      
        # The merge conflict after sync.
        # Corresponds to the JSON property `mergeConflict`
        # @return [Array<Google::Apis::TagmanagerV2::MergeConflict>]
        attr_accessor :merge_conflict
      
        # Entities that have been changed in the workspace.
        # Corresponds to the JSON property `workspaceChange`
        # @return [Array<Google::Apis::TagmanagerV2::Entity>]
        attr_accessor :workspace_change
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @merge_conflict = args[:merge_conflict] if args.key?(:merge_conflict)
          @workspace_change = args[:workspace_change] if args.key?(:workspace_change)
        end
      end
      
      # List Accounts Response.
      class ListAccountsResponse
        include Google::Apis::Core::Hashable
      
        # List of GTM Accounts that a user has access to.
        # Corresponds to the JSON property `account`
        # @return [Array<Google::Apis::TagmanagerV2::Account>]
        attr_accessor :account
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account = args[:account] if args.key?(:account)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # List container versions response.
      class ListContainerVersionsResponse
        include Google::Apis::Core::Hashable
      
        # All container version headers of a GTM Container.
        # Corresponds to the JSON property `containerVersionHeader`
        # @return [Array<Google::Apis::TagmanagerV2::ContainerVersionHeader>]
        attr_accessor :container_version_header
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @container_version_header = args[:container_version_header] if args.key?(:container_version_header)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # List Containers Response.
      class ListContainersResponse
        include Google::Apis::Core::Hashable
      
        # All Containers of a GTM Account.
        # Corresponds to the JSON property `container`
        # @return [Array<Google::Apis::TagmanagerV2::Container>]
        attr_accessor :container
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @container = args[:container] if args.key?(:container)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # A list of enabled built-in variables.
      class ListEnabledBuiltInVariablesResponse
        include Google::Apis::Core::Hashable
      
        # All GTM BuiltInVariables of a GTM container.
        # Corresponds to the JSON property `builtInVariable`
        # @return [Array<Google::Apis::TagmanagerV2::BuiltInVariable>]
        attr_accessor :built_in_variable
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @built_in_variable = args[:built_in_variable] if args.key?(:built_in_variable)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # List Environments Response.
      class ListEnvironmentsResponse
        include Google::Apis::Core::Hashable
      
        # All Environments of a GTM Container.
        # Corresponds to the JSON property `environment`
        # @return [Array<Google::Apis::TagmanagerV2::Environment>]
        attr_accessor :environment
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @environment = args[:environment] if args.key?(:environment)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # List Folders Response.
      class ListFoldersResponse
        include Google::Apis::Core::Hashable
      
        # All GTM Folders of a GTM Container.
        # Corresponds to the JSON property `folder`
        # @return [Array<Google::Apis::TagmanagerV2::Folder>]
        attr_accessor :folder
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @folder = args[:folder] if args.key?(:folder)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # List Tags Response.
      class ListTagsResponse
        include Google::Apis::Core::Hashable
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # All GTM Tags of a GTM Container.
        # Corresponds to the JSON property `tag`
        # @return [Array<Google::Apis::TagmanagerV2::Tag>]
        attr_accessor :tag
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @tag = args[:tag] if args.key?(:tag)
        end
      end
      
      # 
      class ListTemplatesResponse
        include Google::Apis::Core::Hashable
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # All GTM Custom Templates of a GTM Container.
        # Corresponds to the JSON property `template`
        # @return [Array<Google::Apis::TagmanagerV2::CustomTemplate>]
        attr_accessor :template
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @template = args[:template] if args.key?(:template)
        end
      end
      
      # List triggers response.
      class ListTriggersResponse
        include Google::Apis::Core::Hashable
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # All GTM Triggers of a GTM Container.
        # Corresponds to the JSON property `trigger`
        # @return [Array<Google::Apis::TagmanagerV2::Trigger>]
        attr_accessor :trigger
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @trigger = args[:trigger] if args.key?(:trigger)
        end
      end
      
      # List user permissions response.
      class ListUserPermissionsResponse
        include Google::Apis::Core::Hashable
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # All GTM UserPermissions of a GTM Account.
        # Corresponds to the JSON property `userPermission`
        # @return [Array<Google::Apis::TagmanagerV2::UserPermission>]
        attr_accessor :user_permission
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @user_permission = args[:user_permission] if args.key?(:user_permission)
        end
      end
      
      # List Variables Response.
      class ListVariablesResponse
        include Google::Apis::Core::Hashable
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # All GTM Variables of a GTM Container.
        # Corresponds to the JSON property `variable`
        # @return [Array<Google::Apis::TagmanagerV2::Variable>]
        attr_accessor :variable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @variable = args[:variable] if args.key?(:variable)
        end
      end
      
      # A list of workspaces in a container.
      class ListWorkspacesResponse
        include Google::Apis::Core::Hashable
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # All Workspaces of a GTM Container.
        # Corresponds to the JSON property `workspace`
        # @return [Array<Google::Apis::TagmanagerV2::Workspace>]
        attr_accessor :workspace
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @workspace = args[:workspace] if args.key?(:workspace)
        end
      end
      
      # 
      class ListZonesResponse
        include Google::Apis::Core::Hashable
      
        # Continuation token for fetching the next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # All GTM Zones of a GTM Container.
        # Corresponds to the JSON property `zone`
        # @return [Array<Google::Apis::TagmanagerV2::Zone>]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # Represents a merge conflict.
      class MergeConflict
        include Google::Apis::Core::Hashable
      
        # A workspace entity that may represent a tag, trigger, variable, or folder in
        # addition to its status in the workspace.
        # Corresponds to the JSON property `entityInBaseVersion`
        # @return [Google::Apis::TagmanagerV2::Entity]
        attr_accessor :entity_in_base_version
      
        # A workspace entity that may represent a tag, trigger, variable, or folder in
        # addition to its status in the workspace.
        # Corresponds to the JSON property `entityInWorkspace`
        # @return [Google::Apis::TagmanagerV2::Entity]
        attr_accessor :entity_in_workspace
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_in_base_version = args[:entity_in_base_version] if args.key?(:entity_in_base_version)
          @entity_in_workspace = args[:entity_in_workspace] if args.key?(:entity_in_workspace)
        end
      end
      
      # Represents a Google Tag Manager Parameter.
      class Parameter
        include Google::Apis::Core::Hashable
      
        # The named key that uniquely identifies a parameter.  Required for top-level
        # parameters, as well as map values.  Ignored for list values.
        # @mutable tagmanager.accounts.containers.workspaces.variables.create
        # @mutable tagmanager.accounts.containers.workspaces.variables.update
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # This list parameter's parameters (keys will be ignored).
        # @mutable tagmanager.accounts.containers.workspaces.variables.create
        # @mutable tagmanager.accounts.containers.workspaces.variables.update
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `list`
        # @return [Array<Google::Apis::TagmanagerV2::Parameter>]
        attr_accessor :list
      
        # This map parameter's parameters (must have keys; keys must be unique).
        # @mutable tagmanager.accounts.containers.workspaces.variables.create
        # @mutable tagmanager.accounts.containers.workspaces.variables.update
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `map`
        # @return [Array<Google::Apis::TagmanagerV2::Parameter>]
        attr_accessor :map
      
        # The parameter type.  Valid values are:<ul>
        # <li><code>boolean</code>: The value represents a boolean, represented as
        # 'true' or 'false'</li>
        # <li><code>integer</code>: The value represents a 64-bit signed integer
        # value, in base 10</li>
        # <li><code>list</code>: A list of parameters should be specified</li>
        # <li><code>map</code>: A map of parameters should be specified</li>
        # <li><code>template</code>: The value represents any text; this can include
        # variable references (even variable references that might return
        # non-string types)</li>
        # <li><code>trigger_reference</code>: The value represents a trigger,
        # represented as the trigger id</li>
        # </ul>
        # @mutable tagmanager.accounts.containers.workspaces.variables.create
        # @mutable tagmanager.accounts.containers.workspaces.variables.update
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # A parameter's value (may contain variable references such as
        # "``myVariable``")
        # as appropriate to the specified type.
        # @mutable tagmanager.accounts.containers.workspaces.variables.create
        # @mutable tagmanager.accounts.containers.workspaces.variables.update
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @list = args[:list] if args.key?(:list)
          @map = args[:map] if args.key?(:map)
          @type = args[:type] if args.key?(:type)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Publish container version response.
      class PublishContainerVersionResponse
        include Google::Apis::Core::Hashable
      
        # Compiler errors or not.
        # Corresponds to the JSON property `compilerError`
        # @return [Boolean]
        attr_accessor :compiler_error
        alias_method :compiler_error?, :compiler_error
      
        # Represents a Google Tag Manager Container Version.
        # Corresponds to the JSON property `containerVersion`
        # @return [Google::Apis::TagmanagerV2::ContainerVersion]
        attr_accessor :container_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @compiler_error = args[:compiler_error] if args.key?(:compiler_error)
          @container_version = args[:container_version] if args.key?(:container_version)
        end
      end
      
      # Response to quick previewing a workspace.
      class QuickPreviewResponse
        include Google::Apis::Core::Hashable
      
        # Were there compiler errors or not.
        # Corresponds to the JSON property `compilerError`
        # @return [Boolean]
        attr_accessor :compiler_error
        alias_method :compiler_error?, :compiler_error
      
        # Represents a Google Tag Manager Container Version.
        # Corresponds to the JSON property `containerVersion`
        # @return [Google::Apis::TagmanagerV2::ContainerVersion]
        attr_accessor :container_version
      
        # The status of a workspace after synchronization.
        # Corresponds to the JSON property `syncStatus`
        # @return [Google::Apis::TagmanagerV2::SyncStatus]
        attr_accessor :sync_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @compiler_error = args[:compiler_error] if args.key?(:compiler_error)
          @container_version = args[:container_version] if args.key?(:container_version)
          @sync_status = args[:sync_status] if args.key?(:sync_status)
        end
      end
      
      # The result of reverting a built-in variable in a workspace.
      class RevertBuiltInVariableResponse
        include Google::Apis::Core::Hashable
      
        # Whether the built-in variable is enabled after reversion.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled = args[:enabled] if args.key?(:enabled)
        end
      end
      
      # The result of reverting folder changes in a workspace.
      class RevertFolderResponse
        include Google::Apis::Core::Hashable
      
        # Represents a Google Tag Manager Folder.
        # Corresponds to the JSON property `folder`
        # @return [Google::Apis::TagmanagerV2::Folder]
        attr_accessor :folder
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @folder = args[:folder] if args.key?(:folder)
        end
      end
      
      # The result of reverting a tag in a workspace.
      class RevertTagResponse
        include Google::Apis::Core::Hashable
      
        # Represents a Google Tag Manager Tag.
        # Corresponds to the JSON property `tag`
        # @return [Google::Apis::TagmanagerV2::Tag]
        attr_accessor :tag
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @tag = args[:tag] if args.key?(:tag)
        end
      end
      
      # The result of reverting a template in a workspace.
      class RevertTemplateResponse
        include Google::Apis::Core::Hashable
      
        # Represents a Google Tag Manager Custom Template's contents.
        # Corresponds to the JSON property `template`
        # @return [Google::Apis::TagmanagerV2::CustomTemplate]
        attr_accessor :template
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @template = args[:template] if args.key?(:template)
        end
      end
      
      # The result of reverting a trigger in a workspace.
      class RevertTriggerResponse
        include Google::Apis::Core::Hashable
      
        # Represents a Google Tag Manager Trigger
        # Corresponds to the JSON property `trigger`
        # @return [Google::Apis::TagmanagerV2::Trigger]
        attr_accessor :trigger
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @trigger = args[:trigger] if args.key?(:trigger)
        end
      end
      
      # The result of reverting a variable in a workspace.
      class RevertVariableResponse
        include Google::Apis::Core::Hashable
      
        # Represents a Google Tag Manager Variable.
        # Corresponds to the JSON property `variable`
        # @return [Google::Apis::TagmanagerV2::Variable]
        attr_accessor :variable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @variable = args[:variable] if args.key?(:variable)
        end
      end
      
      # The result of reverting a zone in a workspace.
      class RevertZoneResponse
        include Google::Apis::Core::Hashable
      
        # Represents a Google Tag Manager Zone's contents.
        # Corresponds to the JSON property `zone`
        # @return [Google::Apis::TagmanagerV2::Zone]
        attr_accessor :zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @zone = args[:zone] if args.key?(:zone)
        end
      end
      
      # Represents a reference to atag that fires before another tag in order to
      # set up dependencies.
      class SetupTag
        include Google::Apis::Core::Hashable
      
        # If true, fire the main tag if and only if the setup tag fires
        # successfully.
        # If false, fire the main tag regardless of setup tag firing status.
        # Corresponds to the JSON property `stopOnSetupFailure`
        # @return [Boolean]
        attr_accessor :stop_on_setup_failure
        alias_method :stop_on_setup_failure?, :stop_on_setup_failure
      
        # The name of the setup tag.
        # Corresponds to the JSON property `tagName`
        # @return [String]
        attr_accessor :tag_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stop_on_setup_failure = args[:stop_on_setup_failure] if args.key?(:stop_on_setup_failure)
          @tag_name = args[:tag_name] if args.key?(:tag_name)
        end
      end
      
      # The status of a workspace after synchronization.
      class SyncStatus
        include Google::Apis::Core::Hashable
      
        # Synchornization operation detected a merge conflict.
        # Corresponds to the JSON property `mergeConflict`
        # @return [Boolean]
        attr_accessor :merge_conflict
        alias_method :merge_conflict?, :merge_conflict
      
        # An error occurred during the synchronization operation.
        # Corresponds to the JSON property `syncError`
        # @return [Boolean]
        attr_accessor :sync_error
        alias_method :sync_error?, :sync_error
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @merge_conflict = args[:merge_conflict] if args.key?(:merge_conflict)
          @sync_error = args[:sync_error] if args.key?(:sync_error)
        end
      end
      
      # A response after synchronizing the workspace to the latest container version.
      class SyncWorkspaceResponse
        include Google::Apis::Core::Hashable
      
        # The merge conflict after sync.
        # If this field is not empty, the sync is still treated as successful.
        # But a version cannot be created until all conflicts are resolved.
        # Corresponds to the JSON property `mergeConflict`
        # @return [Array<Google::Apis::TagmanagerV2::MergeConflict>]
        attr_accessor :merge_conflict
      
        # The status of a workspace after synchronization.
        # Corresponds to the JSON property `syncStatus`
        # @return [Google::Apis::TagmanagerV2::SyncStatus]
        attr_accessor :sync_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @merge_conflict = args[:merge_conflict] if args.key?(:merge_conflict)
          @sync_status = args[:sync_status] if args.key?(:sync_status)
        end
      end
      
      # Represents a Google Tag Manager Tag.
      class Tag
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Blocking rule IDs. If any of the listed rules evaluate to true, the tag
        # will not fire.
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `blockingRuleId`
        # @return [Array<String>]
        attr_accessor :blocking_rule_id
      
        # Blocking trigger IDs. If any of the listed triggers evaluate to true, the
        # tag will not fire.
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `blockingTriggerId`
        # @return [Array<String>]
        attr_accessor :blocking_trigger_id
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # The fingerprint of the GTM Tag as computed at storage time.
        # This value is recomputed whenever the tag is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # Firing rule IDs. A tag will fire when any of the listed rules are true and
        # all of its <code>blockingRuleIds</code> (if any specified) are false.
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `firingRuleId`
        # @return [Array<String>]
        attr_accessor :firing_rule_id
      
        # Firing trigger IDs. A tag will fire when any of the listed triggers are
        # true and all of its <code>blockingTriggerIds</code> (if any specified) are
        # false.
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `firingTriggerId`
        # @return [Array<String>]
        attr_accessor :firing_trigger_id
      
        # If set to true, this tag will only fire in the live environment (e.g. not
        # in preview or debug mode).
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `liveOnly`
        # @return [Boolean]
        attr_accessor :live_only
        alias_method :live_only?, :live_only
      
        # Tag display name.
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User notes on how to apply this tag in the container.
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # The tag's parameters.
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `parameter`
        # @return [Array<Google::Apis::TagmanagerV2::Parameter>]
        attr_accessor :parameter
      
        # Parent folder id.
        # Corresponds to the JSON property `parentFolderId`
        # @return [String]
        attr_accessor :parent_folder_id
      
        # GTM Tag's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Indicates whether the tag is paused, which prevents the tag from firing.
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `paused`
        # @return [Boolean]
        attr_accessor :paused
        alias_method :paused?, :paused
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `priority`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :priority
      
        # The end timestamp in milliseconds to schedule a tag.
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `scheduleEndMs`
        # @return [Fixnum]
        attr_accessor :schedule_end_ms
      
        # The start timestamp in milliseconds to schedule a tag.
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `scheduleStartMs`
        # @return [Fixnum]
        attr_accessor :schedule_start_ms
      
        # The list of setup tags. Currently we only allow one.
        # Corresponds to the JSON property `setupTag`
        # @return [Array<Google::Apis::TagmanagerV2::SetupTag>]
        attr_accessor :setup_tag
      
        # Option to fire this tag.
        # Corresponds to the JSON property `tagFiringOption`
        # @return [String]
        attr_accessor :tag_firing_option
      
        # The Tag ID uniquely identifies the GTM Tag.
        # Corresponds to the JSON property `tagId`
        # @return [String]
        attr_accessor :tag_id
      
        # Auto generated link to the tag manager UI
        # Corresponds to the JSON property `tagManagerUrl`
        # @return [String]
        attr_accessor :tag_manager_url
      
        # The list of teardown tags. Currently we only allow one.
        # Corresponds to the JSON property `teardownTag`
        # @return [Array<Google::Apis::TagmanagerV2::TeardownTag>]
        attr_accessor :teardown_tag
      
        # GTM Tag Type.
        # @mutable tagmanager.accounts.containers.workspaces.tags.create
        # @mutable tagmanager.accounts.containers.workspaces.tags.update
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # GTM Workspace ID.
        # Corresponds to the JSON property `workspaceId`
        # @return [String]
        attr_accessor :workspace_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @blocking_rule_id = args[:blocking_rule_id] if args.key?(:blocking_rule_id)
          @blocking_trigger_id = args[:blocking_trigger_id] if args.key?(:blocking_trigger_id)
          @container_id = args[:container_id] if args.key?(:container_id)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @firing_rule_id = args[:firing_rule_id] if args.key?(:firing_rule_id)
          @firing_trigger_id = args[:firing_trigger_id] if args.key?(:firing_trigger_id)
          @live_only = args[:live_only] if args.key?(:live_only)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @parameter = args[:parameter] if args.key?(:parameter)
          @parent_folder_id = args[:parent_folder_id] if args.key?(:parent_folder_id)
          @path = args[:path] if args.key?(:path)
          @paused = args[:paused] if args.key?(:paused)
          @priority = args[:priority] if args.key?(:priority)
          @schedule_end_ms = args[:schedule_end_ms] if args.key?(:schedule_end_ms)
          @schedule_start_ms = args[:schedule_start_ms] if args.key?(:schedule_start_ms)
          @setup_tag = args[:setup_tag] if args.key?(:setup_tag)
          @tag_firing_option = args[:tag_firing_option] if args.key?(:tag_firing_option)
          @tag_id = args[:tag_id] if args.key?(:tag_id)
          @tag_manager_url = args[:tag_manager_url] if args.key?(:tag_manager_url)
          @teardown_tag = args[:teardown_tag] if args.key?(:teardown_tag)
          @type = args[:type] if args.key?(:type)
          @workspace_id = args[:workspace_id] if args.key?(:workspace_id)
        end
      end
      
      # Represents a tag that fires after another tag in order to tear down
      # dependencies.
      class TeardownTag
        include Google::Apis::Core::Hashable
      
        # If true, fire the teardown tag if and only if the main tag fires
        # successfully.
        # If false, fire the teardown tag regardless of main tag firing status.
        # Corresponds to the JSON property `stopTeardownOnFailure`
        # @return [Boolean]
        attr_accessor :stop_teardown_on_failure
        alias_method :stop_teardown_on_failure?, :stop_teardown_on_failure
      
        # The name of the teardown tag.
        # Corresponds to the JSON property `tagName`
        # @return [String]
        attr_accessor :tag_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stop_teardown_on_failure = args[:stop_teardown_on_failure] if args.key?(:stop_teardown_on_failure)
          @tag_name = args[:tag_name] if args.key?(:tag_name)
        end
      end
      
      # Represents a Google Tag Manager Trigger
      class Trigger
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Used in the case of auto event tracking.
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # Corresponds to the JSON property `autoEventFilter`
        # @return [Array<Google::Apis::TagmanagerV2::Condition>]
        attr_accessor :auto_event_filter
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `checkValidation`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :check_validation
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `continuousTimeMinMilliseconds`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :continuous_time_min_milliseconds
      
        # Used in the case of custom event, which is fired iff all Conditions are
        # true.
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # Corresponds to the JSON property `customEventFilter`
        # @return [Array<Google::Apis::TagmanagerV2::Condition>]
        attr_accessor :custom_event_filter
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `eventName`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :event_name
      
        # The trigger will only fire iff all Conditions are true.
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # Corresponds to the JSON property `filter`
        # @return [Array<Google::Apis::TagmanagerV2::Condition>]
        attr_accessor :filter
      
        # The fingerprint of the GTM Trigger as computed at storage time.
        # This value is recomputed whenever the trigger is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `horizontalScrollPercentageList`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :horizontal_scroll_percentage_list
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `interval`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :interval
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `intervalSeconds`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :interval_seconds
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `limit`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :limit
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `maxTimerLengthSeconds`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :max_timer_length_seconds
      
        # Trigger display name.
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User notes on how to apply this trigger in the container.
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # Additional parameters.
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # Corresponds to the JSON property `parameter`
        # @return [Array<Google::Apis::TagmanagerV2::Parameter>]
        attr_accessor :parameter
      
        # Parent folder id.
        # Corresponds to the JSON property `parentFolderId`
        # @return [String]
        attr_accessor :parent_folder_id
      
        # GTM Trigger's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `selector`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :selector
      
        # Auto generated link to the tag manager UI
        # Corresponds to the JSON property `tagManagerUrl`
        # @return [String]
        attr_accessor :tag_manager_url
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `totalTimeMinMilliseconds`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :total_time_min_milliseconds
      
        # The Trigger ID uniquely identifies the GTM Trigger.
        # Corresponds to the JSON property `triggerId`
        # @return [String]
        attr_accessor :trigger_id
      
        # Defines the data layer event that causes this trigger.
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `uniqueTriggerId`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :unique_trigger_id
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `verticalScrollPercentageList`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :vertical_scroll_percentage_list
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `visibilitySelector`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :visibility_selector
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `visiblePercentageMax`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :visible_percentage_max
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `visiblePercentageMin`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :visible_percentage_min
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `waitForTags`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :wait_for_tags
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `waitForTagsTimeout`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :wait_for_tags_timeout
      
        # GTM Workspace ID.
        # Corresponds to the JSON property `workspaceId`
        # @return [String]
        attr_accessor :workspace_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @auto_event_filter = args[:auto_event_filter] if args.key?(:auto_event_filter)
          @check_validation = args[:check_validation] if args.key?(:check_validation)
          @container_id = args[:container_id] if args.key?(:container_id)
          @continuous_time_min_milliseconds = args[:continuous_time_min_milliseconds] if args.key?(:continuous_time_min_milliseconds)
          @custom_event_filter = args[:custom_event_filter] if args.key?(:custom_event_filter)
          @event_name = args[:event_name] if args.key?(:event_name)
          @filter = args[:filter] if args.key?(:filter)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @horizontal_scroll_percentage_list = args[:horizontal_scroll_percentage_list] if args.key?(:horizontal_scroll_percentage_list)
          @interval = args[:interval] if args.key?(:interval)
          @interval_seconds = args[:interval_seconds] if args.key?(:interval_seconds)
          @limit = args[:limit] if args.key?(:limit)
          @max_timer_length_seconds = args[:max_timer_length_seconds] if args.key?(:max_timer_length_seconds)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @parameter = args[:parameter] if args.key?(:parameter)
          @parent_folder_id = args[:parent_folder_id] if args.key?(:parent_folder_id)
          @path = args[:path] if args.key?(:path)
          @selector = args[:selector] if args.key?(:selector)
          @tag_manager_url = args[:tag_manager_url] if args.key?(:tag_manager_url)
          @total_time_min_milliseconds = args[:total_time_min_milliseconds] if args.key?(:total_time_min_milliseconds)
          @trigger_id = args[:trigger_id] if args.key?(:trigger_id)
          @type = args[:type] if args.key?(:type)
          @unique_trigger_id = args[:unique_trigger_id] if args.key?(:unique_trigger_id)
          @vertical_scroll_percentage_list = args[:vertical_scroll_percentage_list] if args.key?(:vertical_scroll_percentage_list)
          @visibility_selector = args[:visibility_selector] if args.key?(:visibility_selector)
          @visible_percentage_max = args[:visible_percentage_max] if args.key?(:visible_percentage_max)
          @visible_percentage_min = args[:visible_percentage_min] if args.key?(:visible_percentage_min)
          @wait_for_tags = args[:wait_for_tags] if args.key?(:wait_for_tags)
          @wait_for_tags_timeout = args[:wait_for_tags_timeout] if args.key?(:wait_for_tags_timeout)
          @workspace_id = args[:workspace_id] if args.key?(:workspace_id)
        end
      end
      
      # Represents a user's permissions to an account and its container.
      class UserPermission
        include Google::Apis::Core::Hashable
      
        # Defines the Google Tag Manager Account access permissions.
        # Corresponds to the JSON property `accountAccess`
        # @return [Google::Apis::TagmanagerV2::AccountAccess]
        attr_accessor :account_access
      
        # The Account ID uniquely identifies the GTM Account.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # GTM Container access permissions.
        # @mutable tagmanager.accounts.permissions.create
        # @mutable tagmanager.accounts.permissions.update
        # Corresponds to the JSON property `containerAccess`
        # @return [Array<Google::Apis::TagmanagerV2::ContainerAccess>]
        attr_accessor :container_access
      
        # User's email address.
        # @mutable tagmanager.accounts.permissions.create
        # Corresponds to the JSON property `emailAddress`
        # @return [String]
        attr_accessor :email_address
      
        # GTM UserPermission's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_access = args[:account_access] if args.key?(:account_access)
          @account_id = args[:account_id] if args.key?(:account_id)
          @container_access = args[:container_access] if args.key?(:container_access)
          @email_address = args[:email_address] if args.key?(:email_address)
          @path = args[:path] if args.key?(:path)
        end
      end
      
      # Represents a Google Tag Manager Variable.
      class Variable
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # For mobile containers only: A list of trigger IDs for disabling conditional
        # variables; the variable is enabled if one of the enabling trigger is true
        # while all the disabling trigger are false. Treated as an unordered set.
        # @mutable tagmanager.accounts.containers.workspaces.variables.create
        # @mutable tagmanager.accounts.containers.workspaces.variables.update
        # Corresponds to the JSON property `disablingTriggerId`
        # @return [Array<String>]
        attr_accessor :disabling_trigger_id
      
        # For mobile containers only: A list of trigger IDs for enabling conditional
        # variables; the variable is enabled if one of the enabling triggers is true
        # while all the disabling triggers are false. Treated as an unordered set.
        # @mutable tagmanager.accounts.containers.workspaces.variables.create
        # @mutable tagmanager.accounts.containers.workspaces.variables.update
        # Corresponds to the JSON property `enablingTriggerId`
        # @return [Array<String>]
        attr_accessor :enabling_trigger_id
      
        # The fingerprint of the GTM Variable as computed at storage time.
        # This value is recomputed whenever the variable is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # Option to convert a variable value to other value.
        # Corresponds to the JSON property `formatValue`
        # @return [Google::Apis::TagmanagerV2::VariableFormatValue]
        attr_accessor :format_value
      
        # Variable display name.
        # @mutable tagmanager.accounts.containers.workspaces.variables.create
        # @mutable tagmanager.accounts.containers.workspaces.variables.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User notes on how to apply this variable in the container.
        # @mutable tagmanager.accounts.containers.workspaces.variables.create
        # @mutable tagmanager.accounts.containers.workspaces.variables.update
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # The variable's parameters.
        # @mutable tagmanager.accounts.containers.workspaces.variables.create
        # @mutable tagmanager.accounts.containers.workspaces.variables.update
        # Corresponds to the JSON property `parameter`
        # @return [Array<Google::Apis::TagmanagerV2::Parameter>]
        attr_accessor :parameter
      
        # Parent folder id.
        # Corresponds to the JSON property `parentFolderId`
        # @return [String]
        attr_accessor :parent_folder_id
      
        # GTM Variable's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # The end timestamp in milliseconds to schedule a variable.
        # @mutable tagmanager.accounts.containers.workspaces.variables.create
        # @mutable tagmanager.accounts.containers.workspaces.variables.update
        # Corresponds to the JSON property `scheduleEndMs`
        # @return [Fixnum]
        attr_accessor :schedule_end_ms
      
        # The start timestamp in milliseconds to schedule a variable.
        # @mutable tagmanager.accounts.containers.workspaces.variables.create
        # @mutable tagmanager.accounts.containers.workspaces.variables.update
        # Corresponds to the JSON property `scheduleStartMs`
        # @return [Fixnum]
        attr_accessor :schedule_start_ms
      
        # Auto generated link to the tag manager UI
        # Corresponds to the JSON property `tagManagerUrl`
        # @return [String]
        attr_accessor :tag_manager_url
      
        # GTM Variable Type.
        # @mutable tagmanager.accounts.containers.workspaces.variables.create
        # @mutable tagmanager.accounts.containers.workspaces.variables.update
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The Variable ID uniquely identifies the GTM Variable.
        # Corresponds to the JSON property `variableId`
        # @return [String]
        attr_accessor :variable_id
      
        # GTM Workspace ID.
        # Corresponds to the JSON property `workspaceId`
        # @return [String]
        attr_accessor :workspace_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @container_id = args[:container_id] if args.key?(:container_id)
          @disabling_trigger_id = args[:disabling_trigger_id] if args.key?(:disabling_trigger_id)
          @enabling_trigger_id = args[:enabling_trigger_id] if args.key?(:enabling_trigger_id)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @format_value = args[:format_value] if args.key?(:format_value)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @parameter = args[:parameter] if args.key?(:parameter)
          @parent_folder_id = args[:parent_folder_id] if args.key?(:parent_folder_id)
          @path = args[:path] if args.key?(:path)
          @schedule_end_ms = args[:schedule_end_ms] if args.key?(:schedule_end_ms)
          @schedule_start_ms = args[:schedule_start_ms] if args.key?(:schedule_start_ms)
          @tag_manager_url = args[:tag_manager_url] if args.key?(:tag_manager_url)
          @type = args[:type] if args.key?(:type)
          @variable_id = args[:variable_id] if args.key?(:variable_id)
          @workspace_id = args[:workspace_id] if args.key?(:workspace_id)
        end
      end
      
      # 
      class VariableFormatValue
        include Google::Apis::Core::Hashable
      
        # The option to convert a string-type variable value to either lowercase or
        # uppercase.
        # Corresponds to the JSON property `caseConversionType`
        # @return [String]
        attr_accessor :case_conversion_type
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `convertFalseToValue`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :convert_false_to_value
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `convertNullToValue`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :convert_null_to_value
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `convertTrueToValue`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :convert_true_to_value
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `convertUndefinedToValue`
        # @return [Google::Apis::TagmanagerV2::Parameter]
        attr_accessor :convert_undefined_to_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @case_conversion_type = args[:case_conversion_type] if args.key?(:case_conversion_type)
          @convert_false_to_value = args[:convert_false_to_value] if args.key?(:convert_false_to_value)
          @convert_null_to_value = args[:convert_null_to_value] if args.key?(:convert_null_to_value)
          @convert_true_to_value = args[:convert_true_to_value] if args.key?(:convert_true_to_value)
          @convert_undefined_to_value = args[:convert_undefined_to_value] if args.key?(:convert_undefined_to_value)
        end
      end
      
      # Represents a Google Tag Manager Container Workspace.
      class Workspace
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # Workspace description.
        # @mutable tagmanager.accounts.containers.workspaces.create
        # @mutable tagmanager.accounts.containers.workspaces.update
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The fingerprint of the GTM Workspace as computed at storage time. This
        # value is recomputed whenever the workspace is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # Workspace display name.
        # @mutable tagmanager.accounts.containers.workspaces.create
        # @mutable tagmanager.accounts.containers.workspaces.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # GTM Workspace's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Auto generated link to the tag manager UI
        # Corresponds to the JSON property `tagManagerUrl`
        # @return [String]
        attr_accessor :tag_manager_url
      
        # The Workspace ID uniquely identifies the GTM Workspace.
        # Corresponds to the JSON property `workspaceId`
        # @return [String]
        attr_accessor :workspace_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @container_id = args[:container_id] if args.key?(:container_id)
          @description = args[:description] if args.key?(:description)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @name = args[:name] if args.key?(:name)
          @path = args[:path] if args.key?(:path)
          @tag_manager_url = args[:tag_manager_url] if args.key?(:tag_manager_url)
          @workspace_id = args[:workspace_id] if args.key?(:workspace_id)
        end
      end
      
      # Represents a Google Tag Manager Zone's contents.
      class Zone
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Represents a Zone's boundaries.
        # Corresponds to the JSON property `boundary`
        # @return [Google::Apis::TagmanagerV2::ZoneBoundary]
        attr_accessor :boundary
      
        # Containers that are children of this Zone.
        # Corresponds to the JSON property `childContainer`
        # @return [Array<Google::Apis::TagmanagerV2::ZoneChildContainer>]
        attr_accessor :child_container
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # The fingerprint of the GTM Zone as computed at storage time.
        # This value is recomputed whenever the zone is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # Zone display name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User notes on how to apply this zone in the container.
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # GTM Zone's API relative path.
        # Corresponds to the JSON property `path`
        # @return [String]
        attr_accessor :path
      
        # Auto generated link to the tag manager UI
        # Corresponds to the JSON property `tagManagerUrl`
        # @return [String]
        attr_accessor :tag_manager_url
      
        # Represents a Zone's type restrictions.
        # Corresponds to the JSON property `typeRestriction`
        # @return [Google::Apis::TagmanagerV2::ZoneTypeRestriction]
        attr_accessor :type_restriction
      
        # GTM Workspace ID.
        # Corresponds to the JSON property `workspaceId`
        # @return [String]
        attr_accessor :workspace_id
      
        # The Zone ID uniquely identifies the GTM Zone.
        # Corresponds to the JSON property `zoneId`
        # @return [String]
        attr_accessor :zone_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @boundary = args[:boundary] if args.key?(:boundary)
          @child_container = args[:child_container] if args.key?(:child_container)
          @container_id = args[:container_id] if args.key?(:container_id)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @path = args[:path] if args.key?(:path)
          @tag_manager_url = args[:tag_manager_url] if args.key?(:tag_manager_url)
          @type_restriction = args[:type_restriction] if args.key?(:type_restriction)
          @workspace_id = args[:workspace_id] if args.key?(:workspace_id)
          @zone_id = args[:zone_id] if args.key?(:zone_id)
        end
      end
      
      # Represents a Zone's boundaries.
      class ZoneBoundary
        include Google::Apis::Core::Hashable
      
        # The conditions that, when conjoined, make up the boundary.
        # Corresponds to the JSON property `condition`
        # @return [Array<Google::Apis::TagmanagerV2::Condition>]
        attr_accessor :condition
      
        # Custom evaluation trigger IDs. A zone will evaluate its boundary
        # conditions when any of the listed triggers are true.
        # Corresponds to the JSON property `customEvaluationTriggerId`
        # @return [Array<String>]
        attr_accessor :custom_evaluation_trigger_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
          @custom_evaluation_trigger_id = args[:custom_evaluation_trigger_id] if args.key?(:custom_evaluation_trigger_id)
        end
      end
      
      # Represents a child container of a Zone.
      class ZoneChildContainer
        include Google::Apis::Core::Hashable
      
        # The zone's nickname for the child container.
        # Corresponds to the JSON property `nickname`
        # @return [String]
        attr_accessor :nickname
      
        # The child container's public id.
        # Corresponds to the JSON property `publicId`
        # @return [String]
        attr_accessor :public_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @nickname = args[:nickname] if args.key?(:nickname)
          @public_id = args[:public_id] if args.key?(:public_id)
        end
      end
      
      # Represents a Zone's type restrictions.
      class ZoneTypeRestriction
        include Google::Apis::Core::Hashable
      
        # True if type restrictions have been enabled for this Zone.
        # Corresponds to the JSON property `enable`
        # @return [Boolean]
        attr_accessor :enable
        alias_method :enable?, :enable
      
        # List of type public ids that have been whitelisted for use in this Zone.
        # Corresponds to the JSON property `whitelistedTypeId`
        # @return [Array<String>]
        attr_accessor :whitelisted_type_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable = args[:enable] if args.key?(:enable)
          @whitelisted_type_id = args[:whitelisted_type_id] if args.key?(:whitelisted_type_id)
        end
      end
    end
  end
end
