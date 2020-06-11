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
      
        # Whether the account shares data anonymously with Google and others.
        # @mutable tagmanager.accounts.create
        # @mutable tagmanager.accounts.update
        # Corresponds to the JSON property `shareData`
        # @return [Boolean]
        attr_accessor :share_data
        alias_method :share_data?, :share_data
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @name = args[:name] if args.key?(:name)
          @share_data = args[:share_data] if args.key?(:share_data)
        end
      end
      
      # Defines the Google Tag Manager Account access permissions.
      class AccountAccess
        include Google::Apis::Core::Hashable
      
        # List of Account permissions.
        # Valid account permissions are <code>read</code> and <code>manage</code>.
        # @mutable tagmanager.accounts.permissions.create
        # @mutable tagmanager.accounts.permissions.update
        # Corresponds to the JSON property `permission`
        # @return [Array<String>]
        attr_accessor :permission
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permission = args[:permission] if args.key?(:permission)
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
        # @mutable tagmanager.accounts.containers.triggers.create
        # @mutable tagmanager.accounts.containers.triggers.update
        # Corresponds to the JSON property `parameter`
        # @return [Array<Google::Apis::TagmanagerV1::Parameter>]
        attr_accessor :parameter
      
        # The type of operator for this condition.
        # @mutable tagmanager.accounts.containers.triggers.create
        # @mutable tagmanager.accounts.containers.triggers.update
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
      
      # Represents a Google Tag Manager Container.
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
      
        # Optional list of domain names associated with the Container.
        # @mutable tagmanager.accounts.containers.create
        # @mutable tagmanager.accounts.containers.update
        # Corresponds to the JSON property `domainName`
        # @return [Array<String>]
        attr_accessor :domain_name
      
        # List of enabled built-in variables. Valid values include: <code>pageUrl,
        # pageHostname, pagePath, referrer, event, clickElement, clickClasses,
        # clickId, clickTarget, clickUrl, clickText, formElement, formClasses,
        # formId, formTarget, formUrl, formText, errorMessage, errorUrl, errorLine,
        # newHistoryFragment, oldHistoryFragment, newHistoryState, oldHistoryState,
        # historySource, containerVersion, debugMode, randomNumber,
        # containerId</code>.
        # @mutable tagmanager.accounts.containers.create
        # @mutable tagmanager.accounts.containers.update
        # Corresponds to the JSON property `enabledBuiltInVariable`
        # @return [Array<String>]
        attr_accessor :enabled_built_in_variable
      
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
      
        # Container Public ID.
        # Corresponds to the JSON property `publicId`
        # @return [String]
        attr_accessor :public_id
      
        # Container Country ID.
        # @mutable tagmanager.accounts.containers.create
        # @mutable tagmanager.accounts.containers.update
        # Corresponds to the JSON property `timeZoneCountryId`
        # @return [String]
        attr_accessor :time_zone_country_id
      
        # Container Time Zone ID.
        # @mutable tagmanager.accounts.containers.create
        # @mutable tagmanager.accounts.containers.update
        # Corresponds to the JSON property `timeZoneId`
        # @return [String]
        attr_accessor :time_zone_id
      
        # List of Usage Contexts for the Container. Valid values include: <code>web,
        # android, ios</code>.
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
          @enabled_built_in_variable = args[:enabled_built_in_variable] if args.key?(:enabled_built_in_variable)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @public_id = args[:public_id] if args.key?(:public_id)
          @time_zone_country_id = args[:time_zone_country_id] if args.key?(:time_zone_country_id)
          @time_zone_id = args[:time_zone_id] if args.key?(:time_zone_id)
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
        # Valid container permissions are: <code>read, edit, delete, publish</code>.
        # @mutable tagmanager.accounts.permissions.create
        # @mutable tagmanager.accounts.permissions.update
        # Corresponds to the JSON property `permission`
        # @return [Array<String>]
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
      
        # Represents a Google Tag Manager Container.
        # Corresponds to the JSON property `container`
        # @return [Google::Apis::TagmanagerV1::Container]
        attr_accessor :container
      
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
      
        # The fingerprint of the GTM Container Version as computed at
        # storage time. This value is recomputed whenever the container version is
        # modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # The folders in the container that this version was taken from.
        # Corresponds to the JSON property `folder`
        # @return [Array<Google::Apis::TagmanagerV1::Folder>]
        attr_accessor :folder
      
        # The macros in the container that this version was taken from.
        # Corresponds to the JSON property `macro`
        # @return [Array<Google::Apis::TagmanagerV1::Macro>]
        attr_accessor :macro
      
        # Container version display name.
        # @mutable tagmanager.accounts.containers.versions.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User notes on how to apply this container version in the
        # container.
        # @mutable tagmanager.accounts.containers.versions.update
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # The rules in the container that this version was taken from.
        # Corresponds to the JSON property `rule`
        # @return [Array<Google::Apis::TagmanagerV1::Rule>]
        attr_accessor :rule
      
        # The tags in the container that this version was taken from.
        # Corresponds to the JSON property `tag`
        # @return [Array<Google::Apis::TagmanagerV1::Tag>]
        attr_accessor :tag
      
        # The triggers in the container that this version was taken from.
        # Corresponds to the JSON property `trigger`
        # @return [Array<Google::Apis::TagmanagerV1::Trigger>]
        attr_accessor :trigger
      
        # The variables in the container that this version was taken from.
        # Corresponds to the JSON property `variable`
        # @return [Array<Google::Apis::TagmanagerV1::Variable>]
        attr_accessor :variable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @container = args[:container] if args.key?(:container)
          @container_id = args[:container_id] if args.key?(:container_id)
          @container_version_id = args[:container_version_id] if args.key?(:container_version_id)
          @deleted = args[:deleted] if args.key?(:deleted)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @folder = args[:folder] if args.key?(:folder)
          @macro = args[:macro] if args.key?(:macro)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @rule = args[:rule] if args.key?(:rule)
          @tag = args[:tag] if args.key?(:tag)
          @trigger = args[:trigger] if args.key?(:trigger)
          @variable = args[:variable] if args.key?(:variable)
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
          @num_macros = args[:num_macros] if args.key?(:num_macros)
          @num_rules = args[:num_rules] if args.key?(:num_rules)
          @num_tags = args[:num_tags] if args.key?(:num_tags)
          @num_triggers = args[:num_triggers] if args.key?(:num_triggers)
          @num_variables = args[:num_variables] if args.key?(:num_variables)
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
      
        # The creation of this version may be for quick preview and
        # shouldn't be saved.
        # Corresponds to the JSON property `quickPreview`
        # @return [Boolean]
        attr_accessor :quick_preview
        alias_method :quick_preview?, :quick_preview
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @quick_preview = args[:quick_preview] if args.key?(:quick_preview)
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
        # @return [Google::Apis::TagmanagerV1::ContainerVersion]
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
        # Corresponds to the JSON property `authorizationTimestampMs`
        # @return [Fixnum]
        attr_accessor :authorization_timestamp_ms
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # 
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
      
        # Whether or not to enable debug by default on for the environment.
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
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @authorization_code = args[:authorization_code] if args.key?(:authorization_code)
          @authorization_timestamp_ms = args[:authorization_timestamp_ms] if args.key?(:authorization_timestamp_ms)
          @container_id = args[:container_id] if args.key?(:container_id)
          @container_version_id = args[:container_version_id] if args.key?(:container_version_id)
          @description = args[:description] if args.key?(:description)
          @enable_debug = args[:enable_debug] if args.key?(:enable_debug)
          @environment_id = args[:environment_id] if args.key?(:environment_id)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
          @url = args[:url] if args.key?(:url)
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
        # @mutable tagmanager.accounts.containers.folders.create
        # @mutable tagmanager.accounts.containers.folders.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
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
        end
      end
      
      # Represents a Google Tag Manager Folder's contents.
      class FolderEntities
        include Google::Apis::Core::Hashable
      
        # The list of tags inside the folder.
        # Corresponds to the JSON property `tag`
        # @return [Array<Google::Apis::TagmanagerV1::Tag>]
        attr_accessor :tag
      
        # The list of triggers inside the folder.
        # Corresponds to the JSON property `trigger`
        # @return [Array<Google::Apis::TagmanagerV1::Trigger>]
        attr_accessor :trigger
      
        # The list of variables inside the folder.
        # Corresponds to the JSON property `variable`
        # @return [Array<Google::Apis::TagmanagerV1::Variable>]
        attr_accessor :variable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @tag = args[:tag] if args.key?(:tag)
          @trigger = args[:trigger] if args.key?(:trigger)
          @variable = args[:variable] if args.key?(:variable)
        end
      end
      
      # List AccountUsers Response.
      class ListAccountUsersResponse
        include Google::Apis::Core::Hashable
      
        # All GTM AccountUsers of a GTM Account.
        # Corresponds to the JSON property `userAccess`
        # @return [Array<Google::Apis::TagmanagerV1::UserAccess>]
        attr_accessor :user_access
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @user_access = args[:user_access] if args.key?(:user_access)
        end
      end
      
      # List Accounts Response.
      class ListAccountsResponse
        include Google::Apis::Core::Hashable
      
        # List of GTM Accounts that a user has access to.
        # Corresponds to the JSON property `accounts`
        # @return [Array<Google::Apis::TagmanagerV1::Account>]
        attr_accessor :accounts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accounts = args[:accounts] if args.key?(:accounts)
        end
      end
      
      # List container versions response.
      class ListContainerVersionsResponse
        include Google::Apis::Core::Hashable
      
        # All versions of a GTM Container.
        # Corresponds to the JSON property `containerVersion`
        # @return [Array<Google::Apis::TagmanagerV1::ContainerVersion>]
        attr_accessor :container_version
      
        # All container version headers of a GTM Container.
        # Corresponds to the JSON property `containerVersionHeader`
        # @return [Array<Google::Apis::TagmanagerV1::ContainerVersionHeader>]
        attr_accessor :container_version_header
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @container_version = args[:container_version] if args.key?(:container_version)
          @container_version_header = args[:container_version_header] if args.key?(:container_version_header)
        end
      end
      
      # List Containers Response.
      class ListContainersResponse
        include Google::Apis::Core::Hashable
      
        # All Containers of a GTM Account.
        # Corresponds to the JSON property `containers`
        # @return [Array<Google::Apis::TagmanagerV1::Container>]
        attr_accessor :containers
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @containers = args[:containers] if args.key?(:containers)
        end
      end
      
      # List Environments Response.
      class ListEnvironmentsResponse
        include Google::Apis::Core::Hashable
      
        # All Environments of a GTM Container.
        # Corresponds to the JSON property `environments`
        # @return [Array<Google::Apis::TagmanagerV1::Environment>]
        attr_accessor :environments
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @environments = args[:environments] if args.key?(:environments)
        end
      end
      
      # List Folders Response.
      class ListFoldersResponse
        include Google::Apis::Core::Hashable
      
        # All GTM Folders of a GTM Container.
        # Corresponds to the JSON property `folders`
        # @return [Array<Google::Apis::TagmanagerV1::Folder>]
        attr_accessor :folders
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @folders = args[:folders] if args.key?(:folders)
        end
      end
      
      # List Tags Response.
      class ListTagsResponse
        include Google::Apis::Core::Hashable
      
        # All GTM Tags of a GTM Container.
        # Corresponds to the JSON property `tags`
        # @return [Array<Google::Apis::TagmanagerV1::Tag>]
        attr_accessor :tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @tags = args[:tags] if args.key?(:tags)
        end
      end
      
      # List triggers response.
      class ListTriggersResponse
        include Google::Apis::Core::Hashable
      
        # All GTM Triggers of a GTM Container.
        # Corresponds to the JSON property `triggers`
        # @return [Array<Google::Apis::TagmanagerV1::Trigger>]
        attr_accessor :triggers
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @triggers = args[:triggers] if args.key?(:triggers)
        end
      end
      
      # List Variables Response.
      class ListVariablesResponse
        include Google::Apis::Core::Hashable
      
        # All GTM Variables of a GTM Container.
        # Corresponds to the JSON property `variables`
        # @return [Array<Google::Apis::TagmanagerV1::Variable>]
        attr_accessor :variables
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @variables = args[:variables] if args.key?(:variables)
        end
      end
      
      # Represents a Google Tag Manager Macro.
      class Macro
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # For mobile containers only: A list of rule IDs for disabling conditional
        # macros; the macro is enabled if one of the enabling rules is true while all
        # the disabling rules are false. Treated as an unordered set.
        # @mutable tagmanager.accounts.containers.macros.create
        # @mutable tagmanager.accounts.containers.macros.update
        # Corresponds to the JSON property `disablingRuleId`
        # @return [Array<String>]
        attr_accessor :disabling_rule_id
      
        # For mobile containers only: A list of rule IDs for enabling conditional
        # macros; the macro is enabled if one of the enabling rules is true while all
        # the disabling rules are false. Treated as an unordered set.
        # @mutable tagmanager.accounts.containers.macros.create
        # @mutable tagmanager.accounts.containers.macros.update
        # Corresponds to the JSON property `enablingRuleId`
        # @return [Array<String>]
        attr_accessor :enabling_rule_id
      
        # The fingerprint of the GTM Macro as computed at storage time.
        # This value is recomputed whenever the macro is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # The Macro ID uniquely identifies the GTM Macro.
        # Corresponds to the JSON property `macroId`
        # @return [String]
        attr_accessor :macro_id
      
        # Macro display name.
        # @mutable tagmanager.accounts.containers.macros.create
        # @mutable tagmanager.accounts.containers.macros.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User notes on how to apply this macro in the container.
        # @mutable tagmanager.accounts.containers.macros.create
        # @mutable tagmanager.accounts.containers.macros.update
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # The macro's parameters.
        # @mutable tagmanager.accounts.containers.macros.create
        # @mutable tagmanager.accounts.containers.macros.update
        # Corresponds to the JSON property `parameter`
        # @return [Array<Google::Apis::TagmanagerV1::Parameter>]
        attr_accessor :parameter
      
        # Parent folder id.
        # Corresponds to the JSON property `parentFolderId`
        # @return [String]
        attr_accessor :parent_folder_id
      
        # The end timestamp in milliseconds to schedule a macro.
        # @mutable tagmanager.accounts.containers.macros.create
        # @mutable tagmanager.accounts.containers.macros.update
        # Corresponds to the JSON property `scheduleEndMs`
        # @return [Fixnum]
        attr_accessor :schedule_end_ms
      
        # The start timestamp in milliseconds to schedule a macro.
        # @mutable tagmanager.accounts.containers.macros.create
        # @mutable tagmanager.accounts.containers.macros.update
        # Corresponds to the JSON property `scheduleStartMs`
        # @return [Fixnum]
        attr_accessor :schedule_start_ms
      
        # GTM Macro Type.
        # @mutable tagmanager.accounts.containers.macros.create
        # @mutable tagmanager.accounts.containers.macros.update
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @container_id = args[:container_id] if args.key?(:container_id)
          @disabling_rule_id = args[:disabling_rule_id] if args.key?(:disabling_rule_id)
          @enabling_rule_id = args[:enabling_rule_id] if args.key?(:enabling_rule_id)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @macro_id = args[:macro_id] if args.key?(:macro_id)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @parameter = args[:parameter] if args.key?(:parameter)
          @parent_folder_id = args[:parent_folder_id] if args.key?(:parent_folder_id)
          @schedule_end_ms = args[:schedule_end_ms] if args.key?(:schedule_end_ms)
          @schedule_start_ms = args[:schedule_start_ms] if args.key?(:schedule_start_ms)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Represents a Google Tag Manager Parameter.
      class Parameter
        include Google::Apis::Core::Hashable
      
        # The named key that uniquely identifies a parameter.  Required for top-level
        # parameters, as well as map values.  Ignored for list values.
        # @mutable tagmanager.accounts.containers.variables.create
        # @mutable tagmanager.accounts.containers.variables.update
        # @mutable tagmanager.accounts.containers.triggers.create
        # @mutable tagmanager.accounts.containers.triggers.update
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # This list parameter's parameters (keys will be ignored).
        # @mutable tagmanager.accounts.containers.variables.create
        # @mutable tagmanager.accounts.containers.variables.update
        # @mutable tagmanager.accounts.containers.triggers.create
        # @mutable tagmanager.accounts.containers.triggers.update
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `list`
        # @return [Array<Google::Apis::TagmanagerV1::Parameter>]
        attr_accessor :list
      
        # This map parameter's parameters (must have keys; keys must be unique).
        # @mutable tagmanager.accounts.containers.variables.create
        # @mutable tagmanager.accounts.containers.variables.update
        # @mutable tagmanager.accounts.containers.triggers.create
        # @mutable tagmanager.accounts.containers.triggers.update
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `map`
        # @return [Array<Google::Apis::TagmanagerV1::Parameter>]
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
        # @mutable tagmanager.accounts.containers.variables.create
        # @mutable tagmanager.accounts.containers.variables.update
        # @mutable tagmanager.accounts.containers.triggers.create
        # @mutable tagmanager.accounts.containers.triggers.update
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # A parameter's value (may contain variable references such as
        # "``myVariable``")
        # as appropriate to the specified type.
        # @mutable tagmanager.accounts.containers.variables.create
        # @mutable tagmanager.accounts.containers.variables.update
        # @mutable tagmanager.accounts.containers.triggers.create
        # @mutable tagmanager.accounts.containers.triggers.update
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
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
        # @return [Google::Apis::TagmanagerV1::ContainerVersion]
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
      
      # Represents a Google Tag Manager Rule.
      class Rule
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # The list of conditions that make up this rule (implicit AND between them).
        # @mutable tagmanager.accounts.containers.rules.create
        # @mutable tagmanager.accounts.containers.rules.update
        # Corresponds to the JSON property `condition`
        # @return [Array<Google::Apis::TagmanagerV1::Condition>]
        attr_accessor :condition
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # The fingerprint of the GTM Rule as computed at storage time.
        # This value is recomputed whenever the rule is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # Rule display name.
        # @mutable tagmanager.accounts.containers.rules.create
        # @mutable tagmanager.accounts.containers.rules.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User notes on how to apply this rule in the container.
        # @mutable tagmanager.accounts.containers.rules.create
        # @mutable tagmanager.accounts.containers.rules.update
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # The Rule ID uniquely identifies the GTM Rule.
        # Corresponds to the JSON property `ruleId`
        # @return [String]
        attr_accessor :rule_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @condition = args[:condition] if args.key?(:condition)
          @container_id = args[:container_id] if args.key?(:container_id)
          @fingerprint = args[:fingerprint] if args.key?(:fingerprint)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @rule_id = args[:rule_id] if args.key?(:rule_id)
        end
      end
      
      # 
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
      
      # Represents a Google Tag Manager Tag.
      class Tag
        include Google::Apis::Core::Hashable
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Blocking rule IDs. If any of the listed rules evaluate to true, the tag
        # will not fire.
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `blockingRuleId`
        # @return [Array<String>]
        attr_accessor :blocking_rule_id
      
        # Blocking trigger IDs. If any of the listed triggers evaluate to true, the
        # tag
        # will not fire.
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
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
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `firingRuleId`
        # @return [Array<String>]
        attr_accessor :firing_rule_id
      
        # Firing trigger IDs. A tag will fire when any of the listed triggers are
        # true and all of its <code>blockingTriggerIds</code> (if any specified) are
        # false.
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `firingTriggerId`
        # @return [Array<String>]
        attr_accessor :firing_trigger_id
      
        # If set to true, this tag will only fire in the live environment (e.g. not
        # in preview or debug mode).
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `liveOnly`
        # @return [Boolean]
        attr_accessor :live_only
        alias_method :live_only?, :live_only
      
        # Tag display name.
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User notes on how to apply this tag in the container.
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # The tag's parameters.
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `parameter`
        # @return [Array<Google::Apis::TagmanagerV1::Parameter>]
        attr_accessor :parameter
      
        # Parent folder id.
        # Corresponds to the JSON property `parentFolderId`
        # @return [String]
        attr_accessor :parent_folder_id
      
        # True if the tag is paused.
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `paused`
        # @return [Boolean]
        attr_accessor :paused
        alias_method :paused?, :paused
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `priority`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :priority
      
        # The end timestamp in milliseconds to schedule a tag.
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `scheduleEndMs`
        # @return [Fixnum]
        attr_accessor :schedule_end_ms
      
        # The start timestamp in milliseconds to schedule a tag.
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `scheduleStartMs`
        # @return [Fixnum]
        attr_accessor :schedule_start_ms
      
        # The list of setup tags. Currently we only allow one.
        # Corresponds to the JSON property `setupTag`
        # @return [Array<Google::Apis::TagmanagerV1::SetupTag>]
        attr_accessor :setup_tag
      
        # Option to fire this tag.
        # Corresponds to the JSON property `tagFiringOption`
        # @return [String]
        attr_accessor :tag_firing_option
      
        # The Tag ID uniquely identifies the GTM Tag.
        # Corresponds to the JSON property `tagId`
        # @return [String]
        attr_accessor :tag_id
      
        # The list of teardown tags. Currently we only allow one.
        # Corresponds to the JSON property `teardownTag`
        # @return [Array<Google::Apis::TagmanagerV1::TeardownTag>]
        attr_accessor :teardown_tag
      
        # GTM Tag Type.
        # @mutable tagmanager.accounts.containers.tags.create
        # @mutable tagmanager.accounts.containers.tags.update
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
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
          @paused = args[:paused] if args.key?(:paused)
          @priority = args[:priority] if args.key?(:priority)
          @schedule_end_ms = args[:schedule_end_ms] if args.key?(:schedule_end_ms)
          @schedule_start_ms = args[:schedule_start_ms] if args.key?(:schedule_start_ms)
          @setup_tag = args[:setup_tag] if args.key?(:setup_tag)
          @tag_firing_option = args[:tag_firing_option] if args.key?(:tag_firing_option)
          @tag_id = args[:tag_id] if args.key?(:tag_id)
          @teardown_tag = args[:teardown_tag] if args.key?(:teardown_tag)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
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
        # @mutable tagmanager.accounts.containers.triggers.create
        # @mutable tagmanager.accounts.containers.triggers.update
        # Corresponds to the JSON property `autoEventFilter`
        # @return [Array<Google::Apis::TagmanagerV1::Condition>]
        attr_accessor :auto_event_filter
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `checkValidation`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :check_validation
      
        # GTM Container ID.
        # Corresponds to the JSON property `containerId`
        # @return [String]
        attr_accessor :container_id
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `continuousTimeMinMilliseconds`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :continuous_time_min_milliseconds
      
        # Used in the case of custom event, which is fired iff all Conditions are
        # true.
        # @mutable tagmanager.accounts.containers.triggers.create
        # @mutable tagmanager.accounts.containers.triggers.update
        # Corresponds to the JSON property `customEventFilter`
        # @return [Array<Google::Apis::TagmanagerV1::Condition>]
        attr_accessor :custom_event_filter
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `eventName`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :event_name
      
        # The trigger will only fire iff all Conditions are true.
        # @mutable tagmanager.accounts.containers.triggers.create
        # @mutable tagmanager.accounts.containers.triggers.update
        # Corresponds to the JSON property `filter`
        # @return [Array<Google::Apis::TagmanagerV1::Condition>]
        attr_accessor :filter
      
        # The fingerprint of the GTM Trigger as computed at storage time.
        # This value is recomputed whenever the trigger is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `horizontalScrollPercentageList`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :horizontal_scroll_percentage_list
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `interval`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :interval
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `intervalSeconds`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :interval_seconds
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `limit`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :limit
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `maxTimerLengthSeconds`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :max_timer_length_seconds
      
        # Trigger display name.
        # @mutable tagmanager.accounts.containers.triggers.create
        # @mutable tagmanager.accounts.containers.triggers.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Additional parameters.
        # @mutable tagmanager.accounts.containers.workspaces.triggers.create
        # @mutable tagmanager.accounts.containers.workspaces.triggers.update
        # Corresponds to the JSON property `parameter`
        # @return [Array<Google::Apis::TagmanagerV1::Parameter>]
        attr_accessor :parameter
      
        # Parent folder id.
        # Corresponds to the JSON property `parentFolderId`
        # @return [String]
        attr_accessor :parent_folder_id
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `selector`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :selector
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `totalTimeMinMilliseconds`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :total_time_min_milliseconds
      
        # The Trigger ID uniquely identifies the GTM Trigger.
        # Corresponds to the JSON property `triggerId`
        # @return [String]
        attr_accessor :trigger_id
      
        # Defines the data layer event that causes this trigger.
        # @mutable tagmanager.accounts.containers.triggers.create
        # @mutable tagmanager.accounts.containers.triggers.update
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `uniqueTriggerId`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :unique_trigger_id
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `verticalScrollPercentageList`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :vertical_scroll_percentage_list
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `visibilitySelector`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :visibility_selector
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `visiblePercentageMax`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :visible_percentage_max
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `visiblePercentageMin`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :visible_percentage_min
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `waitForTags`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :wait_for_tags
      
        # Represents a Google Tag Manager Parameter.
        # Corresponds to the JSON property `waitForTagsTimeout`
        # @return [Google::Apis::TagmanagerV1::Parameter]
        attr_accessor :wait_for_tags_timeout
      
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
          @parameter = args[:parameter] if args.key?(:parameter)
          @parent_folder_id = args[:parent_folder_id] if args.key?(:parent_folder_id)
          @selector = args[:selector] if args.key?(:selector)
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
        end
      end
      
      # Represents a user's permissions to an account and its container.
      class UserAccess
        include Google::Apis::Core::Hashable
      
        # Defines the Google Tag Manager Account access permissions.
        # Corresponds to the JSON property `accountAccess`
        # @return [Google::Apis::TagmanagerV1::AccountAccess]
        attr_accessor :account_access
      
        # GTM Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # GTM Container access permissions.
        # @mutable tagmanager.accounts.permissions.create
        # @mutable tagmanager.accounts.permissions.update
        # Corresponds to the JSON property `containerAccess`
        # @return [Array<Google::Apis::TagmanagerV1::ContainerAccess>]
        attr_accessor :container_access
      
        # User's email address.
        # @mutable tagmanager.accounts.permissions.create
        # Corresponds to the JSON property `emailAddress`
        # @return [String]
        attr_accessor :email_address
      
        # Account Permission ID.
        # Corresponds to the JSON property `permissionId`
        # @return [String]
        attr_accessor :permission_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_access = args[:account_access] if args.key?(:account_access)
          @account_id = args[:account_id] if args.key?(:account_id)
          @container_access = args[:container_access] if args.key?(:container_access)
          @email_address = args[:email_address] if args.key?(:email_address)
          @permission_id = args[:permission_id] if args.key?(:permission_id)
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
        # @mutable tagmanager.accounts.containers.variables.create
        # @mutable tagmanager.accounts.containers.variables.update
        # Corresponds to the JSON property `disablingTriggerId`
        # @return [Array<String>]
        attr_accessor :disabling_trigger_id
      
        # For mobile containers only: A list of trigger IDs for enabling conditional
        # variables; the variable is enabled if one of the enabling triggers is true
        # while all the disabling triggers are false. Treated as an unordered set.
        # @mutable tagmanager.accounts.containers.variables.create
        # @mutable tagmanager.accounts.containers.variables.update
        # Corresponds to the JSON property `enablingTriggerId`
        # @return [Array<String>]
        attr_accessor :enabling_trigger_id
      
        # The fingerprint of the GTM Variable as computed at storage time.
        # This value is recomputed whenever the variable is modified.
        # Corresponds to the JSON property `fingerprint`
        # @return [String]
        attr_accessor :fingerprint
      
        # Variable display name.
        # @mutable tagmanager.accounts.containers.variables.create
        # @mutable tagmanager.accounts.containers.variables.update
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # User notes on how to apply this variable in the container.
        # @mutable tagmanager.accounts.containers.variables.create
        # @mutable tagmanager.accounts.containers.variables.update
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # The variable's parameters.
        # @mutable tagmanager.accounts.containers.variables.create
        # @mutable tagmanager.accounts.containers.variables.update
        # Corresponds to the JSON property `parameter`
        # @return [Array<Google::Apis::TagmanagerV1::Parameter>]
        attr_accessor :parameter
      
        # Parent folder id.
        # Corresponds to the JSON property `parentFolderId`
        # @return [String]
        attr_accessor :parent_folder_id
      
        # The end timestamp in milliseconds to schedule a variable.
        # @mutable tagmanager.accounts.containers.variables.create
        # @mutable tagmanager.accounts.containers.variables.update
        # Corresponds to the JSON property `scheduleEndMs`
        # @return [Fixnum]
        attr_accessor :schedule_end_ms
      
        # The start timestamp in milliseconds to schedule a variable.
        # @mutable tagmanager.accounts.containers.variables.create
        # @mutable tagmanager.accounts.containers.variables.update
        # Corresponds to the JSON property `scheduleStartMs`
        # @return [Fixnum]
        attr_accessor :schedule_start_ms
      
        # GTM Variable Type.
        # @mutable tagmanager.accounts.containers.variables.create
        # @mutable tagmanager.accounts.containers.variables.update
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The Variable ID uniquely identifies the GTM Variable.
        # Corresponds to the JSON property `variableId`
        # @return [String]
        attr_accessor :variable_id
      
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
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @parameter = args[:parameter] if args.key?(:parameter)
          @parent_folder_id = args[:parent_folder_id] if args.key?(:parent_folder_id)
          @schedule_end_ms = args[:schedule_end_ms] if args.key?(:schedule_end_ms)
          @schedule_start_ms = args[:schedule_start_ms] if args.key?(:schedule_start_ms)
          @type = args[:type] if args.key?(:type)
          @variable_id = args[:variable_id] if args.key?(:variable_id)
        end
      end
    end
  end
end
