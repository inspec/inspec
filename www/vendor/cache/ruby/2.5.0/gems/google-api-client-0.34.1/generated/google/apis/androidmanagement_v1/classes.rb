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
    module AndroidmanagementV1
      
      # Configuration for an always-on VPN connection.
      class AlwaysOnVpnPackage
        include Google::Apis::Core::Hashable
      
        # Disallows networking when the VPN is not connected.
        # Corresponds to the JSON property `lockdownEnabled`
        # @return [Boolean]
        attr_accessor :lockdown_enabled
        alias_method :lockdown_enabled?, :lockdown_enabled
      
        # The package name of the VPN app.
        # Corresponds to the JSON property `packageName`
        # @return [String]
        attr_accessor :package_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @lockdown_enabled = args[:lockdown_enabled] if args.key?(:lockdown_enabled)
          @package_name = args[:package_name] if args.key?(:package_name)
        end
      end
      
      # A compliance rule condition which is satisfied if the Android Framework API
      # level on the device doesn't meet a minimum requirement. There can only be one
      # rule with this type of condition per policy.
      class ApiLevelCondition
        include Google::Apis::Core::Hashable
      
        # The minimum desired Android Framework API level. If the device doesn't meet
        # the minimum requirement, this condition is satisfied. Must be greater than
        # zero.
        # Corresponds to the JSON property `minApiLevel`
        # @return [Fixnum]
        attr_accessor :min_api_level
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @min_api_level = args[:min_api_level] if args.key?(:min_api_level)
        end
      end
      
      # Id to name association of a app track.
      class AppTrackInfo
        include Google::Apis::Core::Hashable
      
        # The track name associated with the trackId, set in the Play Console. The name
        # is modifiable from Play Console.
        # Corresponds to the JSON property `trackAlias`
        # @return [String]
        attr_accessor :track_alias
      
        # The unmodifiable unique track identifier, taken from the releaseTrackId in the
        # URL of the Play Console page that displays the app’s track information.
        # Corresponds to the JSON property `trackId`
        # @return [String]
        attr_accessor :track_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @track_alias = args[:track_alias] if args.key?(:track_alias)
          @track_id = args[:track_id] if args.key?(:track_id)
        end
      end
      
      # Information about an app.
      class Application
        include Google::Apis::Core::Hashable
      
        # Application tracks visible to the enterprise.
        # Corresponds to the JSON property `appTracks`
        # @return [Array<Google::Apis::AndroidmanagementV1::AppTrackInfo>]
        attr_accessor :app_tracks
      
        # The set of managed properties available to be pre-configured for the app.
        # Corresponds to the JSON property `managedProperties`
        # @return [Array<Google::Apis::AndroidmanagementV1::ManagedProperty>]
        attr_accessor :managed_properties
      
        # The name of the app in the form enterprises/`enterpriseId`/applications/`
        # package_name`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The permissions required by the app.
        # Corresponds to the JSON property `permissions`
        # @return [Array<Google::Apis::AndroidmanagementV1::ApplicationPermission>]
        attr_accessor :permissions
      
        # The title of the app. Localized.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_tracks = args[:app_tracks] if args.key?(:app_tracks)
          @managed_properties = args[:managed_properties] if args.key?(:managed_properties)
          @name = args[:name] if args.key?(:name)
          @permissions = args[:permissions] if args.key?(:permissions)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # An app-related event.
      class ApplicationEvent
        include Google::Apis::Core::Hashable
      
        # The creation time of the event.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # App event type.
        # Corresponds to the JSON property `eventType`
        # @return [String]
        attr_accessor :event_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @event_type = args[:event_type] if args.key?(:event_type)
        end
      end
      
      # A permission required by the app.
      class ApplicationPermission
        include Google::Apis::Core::Hashable
      
        # A longer description of the permission, providing more detail on what it
        # affects. Localized.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The name of the permission. Localized.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # An opaque string uniquely identifying the permission. Not localized.
        # Corresponds to the JSON property `permissionId`
        # @return [String]
        attr_accessor :permission_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @name = args[:name] if args.key?(:name)
          @permission_id = args[:permission_id] if args.key?(:permission_id)
        end
      end
      
      # Policy for an individual app.
      class ApplicationPolicy
        include Google::Apis::Core::Hashable
      
        # List of the app’s track IDs that a device belonging to the enterprise can
        # access. If the list contains multiple track IDs, devices receive the latest
        # version among all accessible tracks. If the list contains no track IDs,
        # devices only have access to the app’s production track. More details about
        # each track are available in AppTrackInfo.
        # Corresponds to the JSON property `accessibleTrackIds`
        # @return [Array<String>]
        attr_accessor :accessible_track_ids
      
        # The default policy for all permissions requested by the app. If specified,
        # this overrides the policy-level default_permission_policy which applies to all
        # apps. It does not override the permission_grants which applies to all apps.
        # Corresponds to the JSON property `defaultPermissionPolicy`
        # @return [String]
        attr_accessor :default_permission_policy
      
        # The scopes delegated to the app from Android Device Policy.
        # Corresponds to the JSON property `delegatedScopes`
        # @return [Array<String>]
        attr_accessor :delegated_scopes
      
        # Whether the app is disabled. When disabled, the app data is still preserved.
        # Corresponds to the JSON property `disabled`
        # @return [Boolean]
        attr_accessor :disabled
        alias_method :disabled?, :disabled
      
        # The type of installation to perform.
        # Corresponds to the JSON property `installType`
        # @return [String]
        attr_accessor :install_type
      
        # Whether the app is allowed to lock itself in full-screen mode. DEPRECATED. Use
        # InstallType KIOSK or kioskCustomLauncherEnabled to to configure a dedicated
        # device.
        # Corresponds to the JSON property `lockTaskAllowed`
        # @return [Boolean]
        attr_accessor :lock_task_allowed
        alias_method :lock_task_allowed?, :lock_task_allowed
      
        # Managed configuration applied to the app. The format for the configuration is
        # dictated by the ManagedProperty values supported by the app. Each field name
        # in the managed configuration must match the key field of the ManagedProperty.
        # The field value must be compatible with the type of the ManagedProperty: <
        # table> <tr><td><i>type</i></td><td><i>JSON value</i></td></tr> <tr><td>BOOL</
        # td><td>true or false</td></tr> <tr><td>STRING</td><td>string</td></tr> <tr><td>
        # INTEGER</td><td>number</td></tr> <tr><td>CHOICE</td><td>string</td></tr> <tr><
        # td>MULTISELECT</td><td>array of strings</td></tr> <tr><td>HIDDEN</td><td>
        # string</td></tr> <tr><td>BUNDLE_ARRAY</td><td>array of objects</td></tr> </
        # table>
        # Corresponds to the JSON property `managedConfiguration`
        # @return [Hash<String,Object>]
        attr_accessor :managed_configuration
      
        # The managed configurations template for the app, saved from the managed
        # configurations iframe.
        # Corresponds to the JSON property `managedConfigurationTemplate`
        # @return [Google::Apis::AndroidmanagementV1::ManagedConfigurationTemplate]
        attr_accessor :managed_configuration_template
      
        # The minimum version of the app that runs on the device. If set, the device
        # attempts to update the app to at least this version code. If the app is not up-
        # to-date, the device will contain a NonComplianceDetail with
        # non_compliance_reason set to APP_NOT_UPDATED. The app must already be
        # published to Google Play with a version code greater than or equal to this
        # value. At most 20 apps may specify a minimum version code per policy.
        # Corresponds to the JSON property `minimumVersionCode`
        # @return [Fixnum]
        attr_accessor :minimum_version_code
      
        # The package name of the app. For example, com.google.android.youtube for the
        # YouTube app.
        # Corresponds to the JSON property `packageName`
        # @return [String]
        attr_accessor :package_name
      
        # Explicit permission grants or denials for the app. These values override the
        # default_permission_policy and permission_grants which apply to all apps.
        # Corresponds to the JSON property `permissionGrants`
        # @return [Array<Google::Apis::AndroidmanagementV1::PermissionGrant>]
        attr_accessor :permission_grants
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accessible_track_ids = args[:accessible_track_ids] if args.key?(:accessible_track_ids)
          @default_permission_policy = args[:default_permission_policy] if args.key?(:default_permission_policy)
          @delegated_scopes = args[:delegated_scopes] if args.key?(:delegated_scopes)
          @disabled = args[:disabled] if args.key?(:disabled)
          @install_type = args[:install_type] if args.key?(:install_type)
          @lock_task_allowed = args[:lock_task_allowed] if args.key?(:lock_task_allowed)
          @managed_configuration = args[:managed_configuration] if args.key?(:managed_configuration)
          @managed_configuration_template = args[:managed_configuration_template] if args.key?(:managed_configuration_template)
          @minimum_version_code = args[:minimum_version_code] if args.key?(:minimum_version_code)
          @package_name = args[:package_name] if args.key?(:package_name)
          @permission_grants = args[:permission_grants] if args.key?(:permission_grants)
        end
      end
      
      # Information reported about an installed app.
      class ApplicationReport
        include Google::Apis::Core::Hashable
      
        # The source of the package.
        # Corresponds to the JSON property `applicationSource`
        # @return [String]
        attr_accessor :application_source
      
        # The display name of the app.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # List of app events. The most recent 20 events are stored in the list.
        # Corresponds to the JSON property `events`
        # @return [Array<Google::Apis::AndroidmanagementV1::ApplicationEvent>]
        attr_accessor :events
      
        # The package name of the app that installed this app.
        # Corresponds to the JSON property `installerPackageName`
        # @return [String]
        attr_accessor :installer_package_name
      
        # List of keyed app states reported by the app.
        # Corresponds to the JSON property `keyedAppStates`
        # @return [Array<Google::Apis::AndroidmanagementV1::KeyedAppState>]
        attr_accessor :keyed_app_states
      
        # Package name of the app.
        # Corresponds to the JSON property `packageName`
        # @return [String]
        attr_accessor :package_name
      
        # The SHA-256 hash of the app's APK file, which can be used to verify the app
        # hasn't been modified. Each byte of the hash value is represented as a two-
        # digit hexadecimal number.
        # Corresponds to the JSON property `packageSha256Hash`
        # @return [String]
        attr_accessor :package_sha256_hash
      
        # The SHA-1 hash of each android.content.pm.Signature (https://developer.android.
        # com/reference/android/content/pm/Signature.html) associated with the app
        # package. Each byte of each hash value is represented as a two-digit
        # hexadecimal number.
        # Corresponds to the JSON property `signingKeyCertFingerprints`
        # @return [Array<String>]
        attr_accessor :signing_key_cert_fingerprints
      
        # Application state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The app version code, which can be used to determine whether one version is
        # more recent than another.
        # Corresponds to the JSON property `versionCode`
        # @return [Fixnum]
        attr_accessor :version_code
      
        # The app version as displayed to the user.
        # Corresponds to the JSON property `versionName`
        # @return [String]
        attr_accessor :version_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @application_source = args[:application_source] if args.key?(:application_source)
          @display_name = args[:display_name] if args.key?(:display_name)
          @events = args[:events] if args.key?(:events)
          @installer_package_name = args[:installer_package_name] if args.key?(:installer_package_name)
          @keyed_app_states = args[:keyed_app_states] if args.key?(:keyed_app_states)
          @package_name = args[:package_name] if args.key?(:package_name)
          @package_sha256_hash = args[:package_sha256_hash] if args.key?(:package_sha256_hash)
          @signing_key_cert_fingerprints = args[:signing_key_cert_fingerprints] if args.key?(:signing_key_cert_fingerprints)
          @state = args[:state] if args.key?(:state)
          @version_code = args[:version_code] if args.key?(:version_code)
          @version_name = args[:version_name] if args.key?(:version_name)
        end
      end
      
      # Settings controlling the behavior of application reports.
      class ApplicationReportingSettings
        include Google::Apis::Core::Hashable
      
        # Whether removed apps are included in application reports.
        # Corresponds to the JSON property `includeRemovedApps`
        # @return [Boolean]
        attr_accessor :include_removed_apps
        alias_method :include_removed_apps?, :include_removed_apps
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @include_removed_apps = args[:include_removed_apps] if args.key?(:include_removed_apps)
        end
      end
      
      # An action to block access to apps and data on a fully managed device or in a
      # work profile. This action also triggers a device or work profile to displays a
      # user-facing notification with information (where possible) on how to correct
      # the compliance issue. Note: wipeAction must also be specified.
      class BlockAction
        include Google::Apis::Core::Hashable
      
        # Number of days the policy is non-compliant before the device or work profile
        # is blocked. To block access immediately, set to 0. blockAfterDays must be less
        # than wipeAfterDays.
        # Corresponds to the JSON property `blockAfterDays`
        # @return [Fixnum]
        attr_accessor :block_after_days
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @block_after_days = args[:block_after_days] if args.key?(:block_after_days)
        end
      end
      
      # A rule for automatically choosing a private key and certificate to
      # authenticate the device to a server.
      class ChoosePrivateKeyRule
        include Google::Apis::Core::Hashable
      
        # The package names for which outgoing requests are subject to this rule. If no
        # package names are specified, then the rule applies to all packages. For each
        # package name listed, the rule applies to that package and all other packages
        # that shared the same Android UID. The SHA256 hash of the signing key
        # signatures of each package_name will be verified against those provided by
        # Play
        # Corresponds to the JSON property `packageNames`
        # @return [Array<String>]
        attr_accessor :package_names
      
        # The alias of the private key to be used.
        # Corresponds to the JSON property `privateKeyAlias`
        # @return [String]
        attr_accessor :private_key_alias
      
        # The URL pattern to match against the URL of the outgoing request. The pattern
        # may contain asterisk (*) wildcards. Any URL is matched if unspecified.
        # Corresponds to the JSON property `urlPattern`
        # @return [String]
        attr_accessor :url_pattern
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @package_names = args[:package_names] if args.key?(:package_names)
          @private_key_alias = args[:private_key_alias] if args.key?(:private_key_alias)
          @url_pattern = args[:url_pattern] if args.key?(:url_pattern)
        end
      end
      
      # A command.
      class Command
        include Google::Apis::Core::Hashable
      
        # The timestamp at which the command was created. The timestamp is automatically
        # generated by the server.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The duration for which the command is valid. The command will expire if not
        # executed by the device during this time. The default duration if unspecified
        # is ten minutes. There is no maximum duration.
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # If the command failed, an error code explaining the failure. This is not set
        # when the command is cancelled by the caller.
        # Corresponds to the JSON property `errorCode`
        # @return [String]
        attr_accessor :error_code
      
        # For commands of type RESET_PASSWORD, optionally specifies the new password.
        # Corresponds to the JSON property `newPassword`
        # @return [String]
        attr_accessor :new_password
      
        # For commands of type RESET_PASSWORD, optionally specifies flags.
        # Corresponds to the JSON property `resetPasswordFlags`
        # @return [Array<String>]
        attr_accessor :reset_password_flags
      
        # The type of the command.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The resource name of the user that owns the device in the form enterprises/`
        # enterpriseId`/users/`userId`. This is automatically generated by the server
        # based on the device the command is sent to.
        # Corresponds to the JSON property `userName`
        # @return [String]
        attr_accessor :user_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @duration = args[:duration] if args.key?(:duration)
          @error_code = args[:error_code] if args.key?(:error_code)
          @new_password = args[:new_password] if args.key?(:new_password)
          @reset_password_flags = args[:reset_password_flags] if args.key?(:reset_password_flags)
          @type = args[:type] if args.key?(:type)
          @user_name = args[:user_name] if args.key?(:user_name)
        end
      end
      
      # A rule declaring which mitigating actions to take when a device is not
      # compliant with its policy. For every rule, there is always an implicit
      # mitigating action to set policy_compliant to false for the Device resource,
      # and display a message on the device indicating that the device is not
      # compliant with its policy. Other mitigating actions may optionally be taken as
      # well, depending on the field values in the rule.
      class ComplianceRule
        include Google::Apis::Core::Hashable
      
        # A compliance rule condition which is satisfied if the Android Framework API
        # level on the device doesn't meet a minimum requirement. There can only be one
        # rule with this type of condition per policy.
        # Corresponds to the JSON property `apiLevelCondition`
        # @return [Google::Apis::AndroidmanagementV1::ApiLevelCondition]
        attr_accessor :api_level_condition
      
        # If set to true, the rule includes a mitigating action to disable apps so that
        # the device is effectively disabled, but app data is preserved. If the device
        # is running an app in locked task mode, the app will be closed and a UI showing
        # the reason for non-compliance will be displayed.
        # Corresponds to the JSON property `disableApps`
        # @return [Boolean]
        attr_accessor :disable_apps
        alias_method :disable_apps?, :disable_apps
      
        # A compliance rule condition which is satisfied if there exists any matching
        # NonComplianceDetail for the device. A NonComplianceDetail matches a
        # NonComplianceDetailCondition if all the fields which are set within the
        # NonComplianceDetailCondition match the corresponding NonComplianceDetail
        # fields.
        # Corresponds to the JSON property `nonComplianceDetailCondition`
        # @return [Google::Apis::AndroidmanagementV1::NonComplianceDetailCondition]
        attr_accessor :non_compliance_detail_condition
      
        # If set, the rule includes a mitigating action to disable apps specified in the
        # list, but app data is preserved.
        # Corresponds to the JSON property `packageNamesToDisable`
        # @return [Array<String>]
        attr_accessor :package_names_to_disable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_level_condition = args[:api_level_condition] if args.key?(:api_level_condition)
          @disable_apps = args[:disable_apps] if args.key?(:disable_apps)
          @non_compliance_detail_condition = args[:non_compliance_detail_condition] if args.key?(:non_compliance_detail_condition)
          @package_names_to_disable = args[:package_names_to_disable] if args.key?(:package_names_to_disable)
        end
      end
      
      # A device owned by an enterprise. Unless otherwise noted, all fields are read-
      # only and can't be modified by enterprises.devices.patch.
      class Device
        include Google::Apis::Core::Hashable
      
        # The API level of the Android platform version running on the device.
        # Corresponds to the JSON property `apiLevel`
        # @return [Fixnum]
        attr_accessor :api_level
      
        # Reports for apps installed on the device. This information is only available
        # when application_reports_enabled is true in the device's policy.
        # Corresponds to the JSON property `applicationReports`
        # @return [Array<Google::Apis::AndroidmanagementV1::ApplicationReport>]
        attr_accessor :application_reports
      
        # The name of the policy currently applied to the device.
        # Corresponds to the JSON property `appliedPolicyName`
        # @return [String]
        attr_accessor :applied_policy_name
      
        # The version of the policy currently applied to the device.
        # Corresponds to the JSON property `appliedPolicyVersion`
        # @return [Fixnum]
        attr_accessor :applied_policy_version
      
        # The state currently applied to the device.
        # Corresponds to the JSON property `appliedState`
        # @return [String]
        attr_accessor :applied_state
      
        # Information about security related device settings on device.
        # Corresponds to the JSON property `deviceSettings`
        # @return [Google::Apis::AndroidmanagementV1::DeviceSettings]
        attr_accessor :device_settings
      
        # Provides a user-facing message with locale info. The maximum message length is
        # 4096 characters.
        # Corresponds to the JSON property `disabledReason`
        # @return [Google::Apis::AndroidmanagementV1::UserFacingMessage]
        attr_accessor :disabled_reason
      
        # Detailed information about displays on the device. This information is only
        # available if displayInfoEnabled is true in the device's policy.
        # Corresponds to the JSON property `displays`
        # @return [Array<Google::Apis::AndroidmanagementV1::DisplayProp>]
        attr_accessor :displays
      
        # The time of device enrollment.
        # Corresponds to the JSON property `enrollmentTime`
        # @return [String]
        attr_accessor :enrollment_time
      
        # If the device was enrolled with an enrollment token with additional data
        # provided, this field contains that data.
        # Corresponds to the JSON property `enrollmentTokenData`
        # @return [String]
        attr_accessor :enrollment_token_data
      
        # If the device was enrolled with an enrollment token, this field contains the
        # name of the token.
        # Corresponds to the JSON property `enrollmentTokenName`
        # @return [String]
        attr_accessor :enrollment_token_name
      
        # Information about device hardware. The fields related to temperature
        # thresholds are only available if hardwareStatusEnabled is true in the device's
        # policy.
        # Corresponds to the JSON property `hardwareInfo`
        # @return [Google::Apis::AndroidmanagementV1::HardwareInfo]
        attr_accessor :hardware_info
      
        # Hardware status samples in chronological order. This information is only
        # available if hardwareStatusEnabled is true in the device's policy.
        # Corresponds to the JSON property `hardwareStatusSamples`
        # @return [Array<Google::Apis::AndroidmanagementV1::HardwareStatus>]
        attr_accessor :hardware_status_samples
      
        # Deprecated.
        # Corresponds to the JSON property `lastPolicyComplianceReportTime`
        # @return [String]
        attr_accessor :last_policy_compliance_report_time
      
        # The last time the device fetched its policy.
        # Corresponds to the JSON property `lastPolicySyncTime`
        # @return [String]
        attr_accessor :last_policy_sync_time
      
        # The last time the device sent a status report.
        # Corresponds to the JSON property `lastStatusReportTime`
        # @return [String]
        attr_accessor :last_status_report_time
      
        # The type of management mode Android Device Policy takes on the device. This
        # influences which policy settings are supported.
        # Corresponds to the JSON property `managementMode`
        # @return [String]
        attr_accessor :management_mode
      
        # Events related to memory and storage measurements in chronological order. This
        # information is only available if memoryInfoEnabled is true in the device's
        # policy.
        # Corresponds to the JSON property `memoryEvents`
        # @return [Array<Google::Apis::AndroidmanagementV1::MemoryEvent>]
        attr_accessor :memory_events
      
        # Information about device memory and storage.
        # Corresponds to the JSON property `memoryInfo`
        # @return [Google::Apis::AndroidmanagementV1::MemoryInfo]
        attr_accessor :memory_info
      
        # The name of the device in the form enterprises/`enterpriseId`/devices/`
        # deviceId`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Device network info.
        # Corresponds to the JSON property `networkInfo`
        # @return [Google::Apis::AndroidmanagementV1::NetworkInfo]
        attr_accessor :network_info
      
        # Details about policy settings that the device is not compliant with.
        # Corresponds to the JSON property `nonComplianceDetails`
        # @return [Array<Google::Apis::AndroidmanagementV1::NonComplianceDetail>]
        attr_accessor :non_compliance_details
      
        # Whether the device is compliant with its policy.
        # Corresponds to the JSON property `policyCompliant`
        # @return [Boolean]
        attr_accessor :policy_compliant
        alias_method :policy_compliant?, :policy_compliant
      
        # The name of the policy applied to the device, in the form enterprises/`
        # enterpriseId`/policies/`policyId`. If not specified, the policy_name for the
        # device's user is applied. This field can be modified by a patch request. You
        # can specify only the policyId when calling enterprises.devices.patch, as long
        # as the policyId doesn’t contain any slashes. The rest of the policy name is
        # inferred.
        # Corresponds to the JSON property `policyName`
        # @return [String]
        attr_accessor :policy_name
      
        # Power management events on the device in chronological order. This information
        # is only available if powerManagementEventsEnabled is true in the device's
        # policy.
        # Corresponds to the JSON property `powerManagementEvents`
        # @return [Array<Google::Apis::AndroidmanagementV1::PowerManagementEvent>]
        attr_accessor :power_management_events
      
        # If the same physical device has been enrolled multiple times, this field
        # contains its previous device names. The serial number is used as the unique
        # identifier to determine if the same physical device has enrolled previously.
        # The names are in chronological order.
        # Corresponds to the JSON property `previousDeviceNames`
        # @return [Array<String>]
        attr_accessor :previous_device_names
      
        # The security posture of the device, as determined by the current device state
        # and the policies applied.
        # Corresponds to the JSON property `securityPosture`
        # @return [Google::Apis::AndroidmanagementV1::SecurityPosture]
        attr_accessor :security_posture
      
        # Information about device software.
        # Corresponds to the JSON property `softwareInfo`
        # @return [Google::Apis::AndroidmanagementV1::SoftwareInfo]
        attr_accessor :software_info
      
        # The state to be applied to the device. This field can be modified by a patch
        # request. Note that when calling enterprises.devices.patch, ACTIVE and DISABLED
        # are the only allowable values. To enter the device into a DELETED state, call
        # enterprises.devices.delete.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Map of selected system properties name and value related to the device. This
        # information is only available if systemPropertiesEnabled is true in the device'
        # s policy.
        # Corresponds to the JSON property `systemProperties`
        # @return [Hash<String,String>]
        attr_accessor :system_properties
      
        # A user belonging to an enterprise.
        # Corresponds to the JSON property `user`
        # @return [Google::Apis::AndroidmanagementV1::User]
        attr_accessor :user
      
        # The resource name of the user that owns this device in the form enterprises/`
        # enterpriseId`/users/`userId`.
        # Corresponds to the JSON property `userName`
        # @return [String]
        attr_accessor :user_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_level = args[:api_level] if args.key?(:api_level)
          @application_reports = args[:application_reports] if args.key?(:application_reports)
          @applied_policy_name = args[:applied_policy_name] if args.key?(:applied_policy_name)
          @applied_policy_version = args[:applied_policy_version] if args.key?(:applied_policy_version)
          @applied_state = args[:applied_state] if args.key?(:applied_state)
          @device_settings = args[:device_settings] if args.key?(:device_settings)
          @disabled_reason = args[:disabled_reason] if args.key?(:disabled_reason)
          @displays = args[:displays] if args.key?(:displays)
          @enrollment_time = args[:enrollment_time] if args.key?(:enrollment_time)
          @enrollment_token_data = args[:enrollment_token_data] if args.key?(:enrollment_token_data)
          @enrollment_token_name = args[:enrollment_token_name] if args.key?(:enrollment_token_name)
          @hardware_info = args[:hardware_info] if args.key?(:hardware_info)
          @hardware_status_samples = args[:hardware_status_samples] if args.key?(:hardware_status_samples)
          @last_policy_compliance_report_time = args[:last_policy_compliance_report_time] if args.key?(:last_policy_compliance_report_time)
          @last_policy_sync_time = args[:last_policy_sync_time] if args.key?(:last_policy_sync_time)
          @last_status_report_time = args[:last_status_report_time] if args.key?(:last_status_report_time)
          @management_mode = args[:management_mode] if args.key?(:management_mode)
          @memory_events = args[:memory_events] if args.key?(:memory_events)
          @memory_info = args[:memory_info] if args.key?(:memory_info)
          @name = args[:name] if args.key?(:name)
          @network_info = args[:network_info] if args.key?(:network_info)
          @non_compliance_details = args[:non_compliance_details] if args.key?(:non_compliance_details)
          @policy_compliant = args[:policy_compliant] if args.key?(:policy_compliant)
          @policy_name = args[:policy_name] if args.key?(:policy_name)
          @power_management_events = args[:power_management_events] if args.key?(:power_management_events)
          @previous_device_names = args[:previous_device_names] if args.key?(:previous_device_names)
          @security_posture = args[:security_posture] if args.key?(:security_posture)
          @software_info = args[:software_info] if args.key?(:software_info)
          @state = args[:state] if args.key?(:state)
          @system_properties = args[:system_properties] if args.key?(:system_properties)
          @user = args[:user] if args.key?(:user)
          @user_name = args[:user_name] if args.key?(:user_name)
        end
      end
      
      # Information about security related device settings on device.
      class DeviceSettings
        include Google::Apis::Core::Hashable
      
        # Whether ADB (https://developer.android.com/studio/command-line/adb.html) is
        # enabled on the device.
        # Corresponds to the JSON property `adbEnabled`
        # @return [Boolean]
        attr_accessor :adb_enabled
        alias_method :adb_enabled?, :adb_enabled
      
        # Whether developer mode is enabled on the device.
        # Corresponds to the JSON property `developmentSettingsEnabled`
        # @return [Boolean]
        attr_accessor :development_settings_enabled
        alias_method :development_settings_enabled?, :development_settings_enabled
      
        # Encryption status from DevicePolicyManager.
        # Corresponds to the JSON property `encryptionStatus`
        # @return [String]
        attr_accessor :encryption_status
      
        # Whether the device is secured with PIN/password.
        # Corresponds to the JSON property `isDeviceSecure`
        # @return [Boolean]
        attr_accessor :is_device_secure
        alias_method :is_device_secure?, :is_device_secure
      
        # Whether the storage encryption is enabled.
        # Corresponds to the JSON property `isEncrypted`
        # @return [Boolean]
        attr_accessor :is_encrypted
        alias_method :is_encrypted?, :is_encrypted
      
        # Whether installing apps from unknown sources is enabled.
        # Corresponds to the JSON property `unknownSourcesEnabled`
        # @return [Boolean]
        attr_accessor :unknown_sources_enabled
        alias_method :unknown_sources_enabled?, :unknown_sources_enabled
      
        # Whether Verify Apps (Google Play Protect (https://support.google.com/
        # googleplay/answer/2812853)) is enabled on the device.
        # Corresponds to the JSON property `verifyAppsEnabled`
        # @return [Boolean]
        attr_accessor :verify_apps_enabled
        alias_method :verify_apps_enabled?, :verify_apps_enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @adb_enabled = args[:adb_enabled] if args.key?(:adb_enabled)
          @development_settings_enabled = args[:development_settings_enabled] if args.key?(:development_settings_enabled)
          @encryption_status = args[:encryption_status] if args.key?(:encryption_status)
          @is_device_secure = args[:is_device_secure] if args.key?(:is_device_secure)
          @is_encrypted = args[:is_encrypted] if args.key?(:is_encrypted)
          @unknown_sources_enabled = args[:unknown_sources_enabled] if args.key?(:unknown_sources_enabled)
          @verify_apps_enabled = args[:verify_apps_enabled] if args.key?(:verify_apps_enabled)
        end
      end
      
      # Device display information.
      class DisplayProp
        include Google::Apis::Core::Hashable
      
        # Display density expressed as dots-per-inch.
        # Corresponds to the JSON property `density`
        # @return [Fixnum]
        attr_accessor :density
      
        # Unique display id.
        # Corresponds to the JSON property `displayId`
        # @return [Fixnum]
        attr_accessor :display_id
      
        # Display height in pixels.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # Name of the display.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Refresh rate of the display in frames per second.
        # Corresponds to the JSON property `refreshRate`
        # @return [Fixnum]
        attr_accessor :refresh_rate
      
        # State of the display.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Display width in pixels.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @density = args[:density] if args.key?(:density)
          @display_id = args[:display_id] if args.key?(:display_id)
          @height = args[:height] if args.key?(:height)
          @name = args[:name] if args.key?(:name)
          @refresh_rate = args[:refresh_rate] if args.key?(:refresh_rate)
          @state = args[:state] if args.key?(:state)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated empty
      # messages in your APIs. A typical example is to use it as the request or the
      # response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for Empty is empty JSON object ``.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # An enrollment token.
      class EnrollmentToken
        include Google::Apis::Core::Hashable
      
        # Optional, arbitrary data associated with the enrollment token. This could
        # contain, for example, the ID of an org unit the device is assigned to after
        # enrollment. After a device enrolls with the token, this data will be exposed
        # in the enrollment_token_data field of the Device resource. The data must be
        # 1024 characters or less; otherwise, the creation request will fail.
        # Corresponds to the JSON property `additionalData`
        # @return [String]
        attr_accessor :additional_data
      
        # The length of time the enrollment token is valid, ranging from 1 minute to 30
        # days. If not specified, the default duration is 1 hour.
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # The expiration time of the token. This is a read-only field generated by the
        # server.
        # Corresponds to the JSON property `expirationTimestamp`
        # @return [String]
        attr_accessor :expiration_timestamp
      
        # The name of the enrollment token, which is generated by the server during
        # creation, in the form enterprises/`enterpriseId`/enrollmentTokens/`
        # enrollmentTokenId`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Whether the enrollment token is for one time use only. If the flag is set to
        # true, only one device can use it for registration.
        # Corresponds to the JSON property `oneTimeOnly`
        # @return [Boolean]
        attr_accessor :one_time_only
        alias_method :one_time_only?, :one_time_only
      
        # The name of the policy initially applied to the enrolled device, in the form
        # enterprises/`enterpriseId`/policies/`policyId`. If not specified, the
        # policy_name for the device’s user is applied. If user_name is also not
        # specified, enterprises/`enterpriseId`/policies/default is applied by default.
        # When updating this field, you can specify only the policyId as long as the
        # policyId doesn’t contain any slashes. The rest of the policy name will be
        # inferred.
        # Corresponds to the JSON property `policyName`
        # @return [String]
        attr_accessor :policy_name
      
        # A JSON string whose UTF-8 representation can be used to generate a QR code to
        # enroll a device with this enrollment token. To enroll a device using NFC, the
        # NFC record must contain a serialized java.util.Properties representation of
        # the properties in the JSON.
        # Corresponds to the JSON property `qrCode`
        # @return [String]
        attr_accessor :qr_code
      
        # A user belonging to an enterprise.
        # Corresponds to the JSON property `user`
        # @return [Google::Apis::AndroidmanagementV1::User]
        attr_accessor :user
      
        # The token value that's passed to the device and authorizes the device to
        # enroll. This is a read-only field generated by the server.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @additional_data = args[:additional_data] if args.key?(:additional_data)
          @duration = args[:duration] if args.key?(:duration)
          @expiration_timestamp = args[:expiration_timestamp] if args.key?(:expiration_timestamp)
          @name = args[:name] if args.key?(:name)
          @one_time_only = args[:one_time_only] if args.key?(:one_time_only)
          @policy_name = args[:policy_name] if args.key?(:policy_name)
          @qr_code = args[:qr_code] if args.key?(:qr_code)
          @user = args[:user] if args.key?(:user)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # The configuration applied to an enterprise.
      class Enterprise
        include Google::Apis::Core::Hashable
      
        # Deprecated and unused.
        # Corresponds to the JSON property `appAutoApprovalEnabled`
        # @return [Boolean]
        attr_accessor :app_auto_approval_enabled
        alias_method :app_auto_approval_enabled?, :app_auto_approval_enabled
      
        # The types of Google Pub/Sub notifications enabled for the enterprise.
        # Corresponds to the JSON property `enabledNotificationTypes`
        # @return [Array<String>]
        attr_accessor :enabled_notification_types
      
        # The name of the enterprise displayed to users.
        # Corresponds to the JSON property `enterpriseDisplayName`
        # @return [String]
        attr_accessor :enterprise_display_name
      
        # Data hosted at an external location. The data is to be downloaded by Android
        # Device Policy and verified against the hash.
        # Corresponds to the JSON property `logo`
        # @return [Google::Apis::AndroidmanagementV1::ExternalData]
        attr_accessor :logo
      
        # The name of the enterprise which is generated by the server during creation,
        # in the form enterprises/`enterpriseId`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A color in RGB format that indicates the predominant color to display in the
        # device management app UI. The color components are stored as follows: (red <<
        # 16) | (green << 8) | blue, where the value of each component is between 0 and
        # 255, inclusive.
        # Corresponds to the JSON property `primaryColor`
        # @return [Fixnum]
        attr_accessor :primary_color
      
        # The topic that Cloud Pub/Sub notifications are published to, in the form
        # projects/`project`/topics/`topic`. This field is only required if Pub/Sub
        # notifications are enabled.
        # Corresponds to the JSON property `pubsubTopic`
        # @return [String]
        attr_accessor :pubsub_topic
      
        # Sign-in details of the enterprise. Maximum of 1 SigninDetail is supported.
        # Corresponds to the JSON property `signinDetails`
        # @return [Array<Google::Apis::AndroidmanagementV1::SigninDetail>]
        attr_accessor :signin_details
      
        # Terms and conditions that must be accepted when provisioning a device for this
        # enterprise. A page of terms is generated for each value in this list.
        # Corresponds to the JSON property `termsAndConditions`
        # @return [Array<Google::Apis::AndroidmanagementV1::TermsAndConditions>]
        attr_accessor :terms_and_conditions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_auto_approval_enabled = args[:app_auto_approval_enabled] if args.key?(:app_auto_approval_enabled)
          @enabled_notification_types = args[:enabled_notification_types] if args.key?(:enabled_notification_types)
          @enterprise_display_name = args[:enterprise_display_name] if args.key?(:enterprise_display_name)
          @logo = args[:logo] if args.key?(:logo)
          @name = args[:name] if args.key?(:name)
          @primary_color = args[:primary_color] if args.key?(:primary_color)
          @pubsub_topic = args[:pubsub_topic] if args.key?(:pubsub_topic)
          @signin_details = args[:signin_details] if args.key?(:signin_details)
          @terms_and_conditions = args[:terms_and_conditions] if args.key?(:terms_and_conditions)
        end
      end
      
      # Data hosted at an external location. The data is to be downloaded by Android
      # Device Policy and verified against the hash.
      class ExternalData
        include Google::Apis::Core::Hashable
      
        # The base-64 encoded SHA-256 hash of the content hosted at url. If the content
        # doesn't match this hash, Android Device Policy won't use the data.
        # Corresponds to the JSON property `sha256Hash`
        # @return [String]
        attr_accessor :sha256_hash
      
        # The absolute URL to the data, which must use either the http or https scheme.
        # Android Device Policy doesn't provide any credentials in the GET request, so
        # the URL must be publicly accessible. Including a long, random component in the
        # URL may be used to prevent attackers from discovering the URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @sha256_hash = args[:sha256_hash] if args.key?(:sha256_hash)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Information about device hardware. The fields related to temperature
      # thresholds are only available if hardwareStatusEnabled is true in the device's
      # policy.
      class HardwareInfo
        include Google::Apis::Core::Hashable
      
        # Battery shutdown temperature thresholds in Celsius for each battery on the
        # device.
        # Corresponds to the JSON property `batteryShutdownTemperatures`
        # @return [Array<Float>]
        attr_accessor :battery_shutdown_temperatures
      
        # Battery throttling temperature thresholds in Celsius for each battery on the
        # device.
        # Corresponds to the JSON property `batteryThrottlingTemperatures`
        # @return [Array<Float>]
        attr_accessor :battery_throttling_temperatures
      
        # Brand of the device. For example, Google.
        # Corresponds to the JSON property `brand`
        # @return [String]
        attr_accessor :brand
      
        # CPU shutdown temperature thresholds in Celsius for each CPU on the device.
        # Corresponds to the JSON property `cpuShutdownTemperatures`
        # @return [Array<Float>]
        attr_accessor :cpu_shutdown_temperatures
      
        # CPU throttling temperature thresholds in Celsius for each CPU on the device.
        # Corresponds to the JSON property `cpuThrottlingTemperatures`
        # @return [Array<Float>]
        attr_accessor :cpu_throttling_temperatures
      
        # Baseband version. For example, MDM9625_104662.22.05.34p.
        # Corresponds to the JSON property `deviceBasebandVersion`
        # @return [String]
        attr_accessor :device_baseband_version
      
        # GPU shutdown temperature thresholds in Celsius for each GPU on the device.
        # Corresponds to the JSON property `gpuShutdownTemperatures`
        # @return [Array<Float>]
        attr_accessor :gpu_shutdown_temperatures
      
        # GPU throttling temperature thresholds in Celsius for each GPU on the device.
        # Corresponds to the JSON property `gpuThrottlingTemperatures`
        # @return [Array<Float>]
        attr_accessor :gpu_throttling_temperatures
      
        # Name of the hardware. For example, Angler.
        # Corresponds to the JSON property `hardware`
        # @return [String]
        attr_accessor :hardware
      
        # Manufacturer. For example, Motorola.
        # Corresponds to the JSON property `manufacturer`
        # @return [String]
        attr_accessor :manufacturer
      
        # The model of the device. For example, Asus Nexus 7.
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        # The device serial number.
        # Corresponds to the JSON property `serialNumber`
        # @return [String]
        attr_accessor :serial_number
      
        # Device skin shutdown temperature thresholds in Celsius.
        # Corresponds to the JSON property `skinShutdownTemperatures`
        # @return [Array<Float>]
        attr_accessor :skin_shutdown_temperatures
      
        # Device skin throttling temperature thresholds in Celsius.
        # Corresponds to the JSON property `skinThrottlingTemperatures`
        # @return [Array<Float>]
        attr_accessor :skin_throttling_temperatures
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @battery_shutdown_temperatures = args[:battery_shutdown_temperatures] if args.key?(:battery_shutdown_temperatures)
          @battery_throttling_temperatures = args[:battery_throttling_temperatures] if args.key?(:battery_throttling_temperatures)
          @brand = args[:brand] if args.key?(:brand)
          @cpu_shutdown_temperatures = args[:cpu_shutdown_temperatures] if args.key?(:cpu_shutdown_temperatures)
          @cpu_throttling_temperatures = args[:cpu_throttling_temperatures] if args.key?(:cpu_throttling_temperatures)
          @device_baseband_version = args[:device_baseband_version] if args.key?(:device_baseband_version)
          @gpu_shutdown_temperatures = args[:gpu_shutdown_temperatures] if args.key?(:gpu_shutdown_temperatures)
          @gpu_throttling_temperatures = args[:gpu_throttling_temperatures] if args.key?(:gpu_throttling_temperatures)
          @hardware = args[:hardware] if args.key?(:hardware)
          @manufacturer = args[:manufacturer] if args.key?(:manufacturer)
          @model = args[:model] if args.key?(:model)
          @serial_number = args[:serial_number] if args.key?(:serial_number)
          @skin_shutdown_temperatures = args[:skin_shutdown_temperatures] if args.key?(:skin_shutdown_temperatures)
          @skin_throttling_temperatures = args[:skin_throttling_temperatures] if args.key?(:skin_throttling_temperatures)
        end
      end
      
      # Hardware status. Temperatures may be compared to the temperature thresholds
      # available in hardwareInfo to determine hardware health.
      class HardwareStatus
        include Google::Apis::Core::Hashable
      
        # Current battery temperatures in Celsius for each battery on the device.
        # Corresponds to the JSON property `batteryTemperatures`
        # @return [Array<Float>]
        attr_accessor :battery_temperatures
      
        # Current CPU temperatures in Celsius for each CPU on the device.
        # Corresponds to the JSON property `cpuTemperatures`
        # @return [Array<Float>]
        attr_accessor :cpu_temperatures
      
        # CPU usages in percentage for each core available on the device. Usage is 0 for
        # each unplugged core. Empty array implies that CPU usage is not supported in
        # the system.
        # Corresponds to the JSON property `cpuUsages`
        # @return [Array<Float>]
        attr_accessor :cpu_usages
      
        # The time the measurements were taken.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Fan speeds in RPM for each fan on the device. Empty array means that there are
        # no fans or fan speed is not supported on the system.
        # Corresponds to the JSON property `fanSpeeds`
        # @return [Array<Float>]
        attr_accessor :fan_speeds
      
        # Current GPU temperatures in Celsius for each GPU on the device.
        # Corresponds to the JSON property `gpuTemperatures`
        # @return [Array<Float>]
        attr_accessor :gpu_temperatures
      
        # Current device skin temperatures in Celsius.
        # Corresponds to the JSON property `skinTemperatures`
        # @return [Array<Float>]
        attr_accessor :skin_temperatures
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @battery_temperatures = args[:battery_temperatures] if args.key?(:battery_temperatures)
          @cpu_temperatures = args[:cpu_temperatures] if args.key?(:cpu_temperatures)
          @cpu_usages = args[:cpu_usages] if args.key?(:cpu_usages)
          @create_time = args[:create_time] if args.key?(:create_time)
          @fan_speeds = args[:fan_speeds] if args.key?(:fan_speeds)
          @gpu_temperatures = args[:gpu_temperatures] if args.key?(:gpu_temperatures)
          @skin_temperatures = args[:skin_temperatures] if args.key?(:skin_temperatures)
        end
      end
      
      # Keyed app state reported by the app.
      class KeyedAppState
        include Google::Apis::Core::Hashable
      
        # The creation time of the app state on the device.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Optionally, a machine-readable value to be read by the EMM. For example,
        # setting values that the admin can choose to query against in the EMM console (
        # e.g. “notify me if the battery_warning data < 10”).
        # Corresponds to the JSON property `data`
        # @return [String]
        attr_accessor :data
      
        # The key for the app state. Acts as a point of reference for what the app is
        # providing state for. For example, when providing managed configuration
        # feedback, this key could be the managed configuration key.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The time the app state was most recently updated.
        # Corresponds to the JSON property `lastUpdateTime`
        # @return [String]
        attr_accessor :last_update_time
      
        # Optionally, a free-form message string to explain the app state. If the state
        # was triggered by a particular value (e.g. a managed configuration value), it
        # should be included in the message.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # The severity of the app state.
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @data = args[:data] if args.key?(:data)
          @key = args[:key] if args.key?(:key)
          @last_update_time = args[:last_update_time] if args.key?(:last_update_time)
          @message = args[:message] if args.key?(:message)
          @severity = args[:severity] if args.key?(:severity)
        end
      end
      
      # An action to launch an app.
      class LaunchAppAction
        include Google::Apis::Core::Hashable
      
        # Package name of app to be launched
        # Corresponds to the JSON property `packageName`
        # @return [String]
        attr_accessor :package_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @package_name = args[:package_name] if args.key?(:package_name)
        end
      end
      
      # Response to a request to list devices for a given enterprise.
      class ListDevicesResponse
        include Google::Apis::Core::Hashable
      
        # The list of devices.
        # Corresponds to the JSON property `devices`
        # @return [Array<Google::Apis::AndroidmanagementV1::Device>]
        attr_accessor :devices
      
        # If there are more results, a token to retrieve next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @devices = args[:devices] if args.key?(:devices)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for Operations.ListOperations.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::AndroidmanagementV1::Operation>]
        attr_accessor :operations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @operations = args[:operations] if args.key?(:operations)
        end
      end
      
      # Response to a request to list policies for a given enterprise.
      class ListPoliciesResponse
        include Google::Apis::Core::Hashable
      
        # If there are more results, a token to retrieve next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of policies.
        # Corresponds to the JSON property `policies`
        # @return [Array<Google::Apis::AndroidmanagementV1::Policy>]
        attr_accessor :policies
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @policies = args[:policies] if args.key?(:policies)
        end
      end
      
      # Response to a request to list web apps for a given enterprise.
      class ListWebAppsResponse
        include Google::Apis::Core::Hashable
      
        # If there are more results, a token to retrieve next page of results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of web apps.
        # Corresponds to the JSON property `webApps`
        # @return [Array<Google::Apis::AndroidmanagementV1::WebApp>]
        attr_accessor :web_apps
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @web_apps = args[:web_apps] if args.key?(:web_apps)
        end
      end
      
      # The managed configurations template for the app, saved from the managed
      # configurations iframe.
      class ManagedConfigurationTemplate
        include Google::Apis::Core::Hashable
      
        # Optional, a map containing <key, value> configuration variables defined for
        # the configuration.
        # Corresponds to the JSON property `configurationVariables`
        # @return [Hash<String,String>]
        attr_accessor :configuration_variables
      
        # The ID of the managed configurations template.
        # Corresponds to the JSON property `templateId`
        # @return [String]
        attr_accessor :template_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @configuration_variables = args[:configuration_variables] if args.key?(:configuration_variables)
          @template_id = args[:template_id] if args.key?(:template_id)
        end
      end
      
      # Managed property.
      class ManagedProperty
        include Google::Apis::Core::Hashable
      
        # The default value of the property. BUNDLE_ARRAY properties don't have a
        # default value.
        # Corresponds to the JSON property `defaultValue`
        # @return [Object]
        attr_accessor :default_value
      
        # A longer description of the property, providing more detail of what it affects.
        # Localized.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # For CHOICE or MULTISELECT properties, the list of possible entries.
        # Corresponds to the JSON property `entries`
        # @return [Array<Google::Apis::AndroidmanagementV1::ManagedPropertyEntry>]
        attr_accessor :entries
      
        # The unique key that the app uses to identify the property, e.g. "com.google.
        # android.gm.fieldname".
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # For BUNDLE_ARRAY properties, the list of nested properties. A BUNDLE_ARRAY
        # property is at most two levels deep.
        # Corresponds to the JSON property `nestedProperties`
        # @return [Array<Google::Apis::AndroidmanagementV1::ManagedProperty>]
        attr_accessor :nested_properties
      
        # The name of the property. Localized.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The type of the property.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_value = args[:default_value] if args.key?(:default_value)
          @description = args[:description] if args.key?(:description)
          @entries = args[:entries] if args.key?(:entries)
          @key = args[:key] if args.key?(:key)
          @nested_properties = args[:nested_properties] if args.key?(:nested_properties)
          @title = args[:title] if args.key?(:title)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # An entry of a managed property.
      class ManagedPropertyEntry
        include Google::Apis::Core::Hashable
      
        # The human-readable name of the value. Localized.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The machine-readable value of the entry, which should be used in the
        # configuration. Not localized.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # An event related to memory and storage measurements.
      class MemoryEvent
        include Google::Apis::Core::Hashable
      
        # The number of free bytes in the medium, or for EXTERNAL_STORAGE_DETECTED, the
        # total capacity in bytes of the storage medium.
        # Corresponds to the JSON property `byteCount`
        # @return [Fixnum]
        attr_accessor :byte_count
      
        # The creation time of the event.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Event type.
        # Corresponds to the JSON property `eventType`
        # @return [String]
        attr_accessor :event_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @byte_count = args[:byte_count] if args.key?(:byte_count)
          @create_time = args[:create_time] if args.key?(:create_time)
          @event_type = args[:event_type] if args.key?(:event_type)
        end
      end
      
      # Information about device memory and storage.
      class MemoryInfo
        include Google::Apis::Core::Hashable
      
        # Total internal storage on device in bytes.
        # Corresponds to the JSON property `totalInternalStorage`
        # @return [Fixnum]
        attr_accessor :total_internal_storage
      
        # Total RAM on device in bytes.
        # Corresponds to the JSON property `totalRam`
        # @return [Fixnum]
        attr_accessor :total_ram
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @total_internal_storage = args[:total_internal_storage] if args.key?(:total_internal_storage)
          @total_ram = args[:total_ram] if args.key?(:total_ram)
        end
      end
      
      # Device network info.
      class NetworkInfo
        include Google::Apis::Core::Hashable
      
        # IMEI number of the GSM device. For example, A1000031212.
        # Corresponds to the JSON property `imei`
        # @return [String]
        attr_accessor :imei
      
        # MEID number of the CDMA device. For example, A00000292788E1.
        # Corresponds to the JSON property `meid`
        # @return [String]
        attr_accessor :meid
      
        # Alphabetic name of current registered operator. For example, Vodafone.
        # Corresponds to the JSON property `networkOperatorName`
        # @return [String]
        attr_accessor :network_operator_name
      
        # Wi-Fi MAC address of the device. For example, 7c:11:11:11:11:11.
        # Corresponds to the JSON property `wifiMacAddress`
        # @return [String]
        attr_accessor :wifi_mac_address
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @imei = args[:imei] if args.key?(:imei)
          @meid = args[:meid] if args.key?(:meid)
          @network_operator_name = args[:network_operator_name] if args.key?(:network_operator_name)
          @wifi_mac_address = args[:wifi_mac_address] if args.key?(:wifi_mac_address)
        end
      end
      
      # Provides detail about non-compliance with a policy setting.
      class NonComplianceDetail
        include Google::Apis::Core::Hashable
      
        # If the policy setting could not be applied, the current value of the setting
        # on the device.
        # Corresponds to the JSON property `currentValue`
        # @return [Object]
        attr_accessor :current_value
      
        # For settings with nested fields, if a particular nested field is out of
        # compliance, this specifies the full path to the offending field. The path is
        # formatted in the same way the policy JSON field would be referenced in
        # JavaScript, that is: 1) For object-typed fields, the field name is followed by
        # a dot then by a  subfield name. 2) For array-typed fields, the field name is
        # followed by the array index  enclosed in brackets. For example, to indicate a
        # problem with the url field in the externalData field in the 3rd application,
        # the path would be applications[2].externalData.url
        # Corresponds to the JSON property `fieldPath`
        # @return [String]
        attr_accessor :field_path
      
        # If package_name is set and the non-compliance reason is APP_NOT_INSTALLED or
        # APP_NOT_UPDATED, the detailed reason the app can't be installed or updated.
        # Corresponds to the JSON property `installationFailureReason`
        # @return [String]
        attr_accessor :installation_failure_reason
      
        # The reason the device is not in compliance with the setting.
        # Corresponds to the JSON property `nonComplianceReason`
        # @return [String]
        attr_accessor :non_compliance_reason
      
        # The package name indicating which app is out of compliance, if applicable.
        # Corresponds to the JSON property `packageName`
        # @return [String]
        attr_accessor :package_name
      
        # The name of the policy setting. This is the JSON field name of a top-level
        # Policy  field.
        # Corresponds to the JSON property `settingName`
        # @return [String]
        attr_accessor :setting_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @current_value = args[:current_value] if args.key?(:current_value)
          @field_path = args[:field_path] if args.key?(:field_path)
          @installation_failure_reason = args[:installation_failure_reason] if args.key?(:installation_failure_reason)
          @non_compliance_reason = args[:non_compliance_reason] if args.key?(:non_compliance_reason)
          @package_name = args[:package_name] if args.key?(:package_name)
          @setting_name = args[:setting_name] if args.key?(:setting_name)
        end
      end
      
      # A compliance rule condition which is satisfied if there exists any matching
      # NonComplianceDetail for the device. A NonComplianceDetail matches a
      # NonComplianceDetailCondition if all the fields which are set within the
      # NonComplianceDetailCondition match the corresponding NonComplianceDetail
      # fields.
      class NonComplianceDetailCondition
        include Google::Apis::Core::Hashable
      
        # The reason the device is not in compliance with the setting. If not set, then
        # this condition matches any reason.
        # Corresponds to the JSON property `nonComplianceReason`
        # @return [String]
        attr_accessor :non_compliance_reason
      
        # The package name of the app that's out of compliance. If not set, then this
        # condition matches any package name.
        # Corresponds to the JSON property `packageName`
        # @return [String]
        attr_accessor :package_name
      
        # The name of the policy setting. This is the JSON field name of a top-level
        # Policy field. If not set, then this condition matches any setting name.
        # Corresponds to the JSON property `settingName`
        # @return [String]
        attr_accessor :setting_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @non_compliance_reason = args[:non_compliance_reason] if args.key?(:non_compliance_reason)
          @package_name = args[:package_name] if args.key?(:package_name)
          @setting_name = args[:setting_name] if args.key?(:setting_name)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is false, it means the operation is still in progress. If true,
        # the operation is completed, and either error or response is available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The Status type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by gRPC
        # (https://github.com/grpc). Each Status message contains three pieces of data:
        # error code, error message, and error details.You can find out more about this
        # error model and how to work with it in the API Design Guide (https://cloud.
        # google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::AndroidmanagementV1::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation. It typically contains
        # progress information and common metadata such as create time. Some services
        # might not provide such metadata. Any method that returns a long-running
        # operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the name should be
        # a resource name ending with operations/`unique_id`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success. If the original
        # method returns no data on success, such as Delete, the response is google.
        # protobuf.Empty. If the original method is standard Get/Create/Update, the
        # response should be the resource. For other methods, the response should have
        # the type XxxResponse, where Xxx is the original method name. For example, if
        # the original method name is TakeSnapshot(), the inferred response type is
        # TakeSnapshotResponse.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # A list of package names.
      class PackageNameList
        include Google::Apis::Core::Hashable
      
        # A list of package names.
        # Corresponds to the JSON property `packageNames`
        # @return [Array<String>]
        attr_accessor :package_names
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @package_names = args[:package_names] if args.key?(:package_names)
        end
      end
      
      # Requirements for the password used to unlock a device.
      class PasswordRequirements
        include Google::Apis::Core::Hashable
      
        # Number of incorrect device-unlock passwords that can be entered before a
        # device is wiped. A value of 0 means there is no restriction.
        # Corresponds to the JSON property `maximumFailedPasswordsForWipe`
        # @return [Fixnum]
        attr_accessor :maximum_failed_passwords_for_wipe
      
        # Password expiration timeout.
        # Corresponds to the JSON property `passwordExpirationTimeout`
        # @return [String]
        attr_accessor :password_expiration_timeout
      
        # The length of the password history. After setting this field, the user won't
        # be able to enter a new password that is the same as any password in the
        # history. A value of 0 means there is no restriction.
        # Corresponds to the JSON property `passwordHistoryLength`
        # @return [Fixnum]
        attr_accessor :password_history_length
      
        # The minimum allowed password length. A value of 0 means there is no
        # restriction. Only enforced when password_quality is NUMERIC, NUMERIC_COMPLEX,
        # ALPHABETIC, ALPHANUMERIC, or COMPLEX.
        # Corresponds to the JSON property `passwordMinimumLength`
        # @return [Fixnum]
        attr_accessor :password_minimum_length
      
        # Minimum number of letters required in the password. Only enforced when
        # password_quality is COMPLEX.
        # Corresponds to the JSON property `passwordMinimumLetters`
        # @return [Fixnum]
        attr_accessor :password_minimum_letters
      
        # Minimum number of lower case letters required in the password. Only enforced
        # when password_quality is COMPLEX.
        # Corresponds to the JSON property `passwordMinimumLowerCase`
        # @return [Fixnum]
        attr_accessor :password_minimum_lower_case
      
        # Minimum number of non-letter characters (numerical digits or symbols) required
        # in the password. Only enforced when password_quality is COMPLEX.
        # Corresponds to the JSON property `passwordMinimumNonLetter`
        # @return [Fixnum]
        attr_accessor :password_minimum_non_letter
      
        # Minimum number of numerical digits required in the password. Only enforced
        # when password_quality is COMPLEX.
        # Corresponds to the JSON property `passwordMinimumNumeric`
        # @return [Fixnum]
        attr_accessor :password_minimum_numeric
      
        # Minimum number of symbols required in the password. Only enforced when
        # password_quality is COMPLEX.
        # Corresponds to the JSON property `passwordMinimumSymbols`
        # @return [Fixnum]
        attr_accessor :password_minimum_symbols
      
        # Minimum number of upper case letters required in the password. Only enforced
        # when password_quality is COMPLEX.
        # Corresponds to the JSON property `passwordMinimumUpperCase`
        # @return [Fixnum]
        attr_accessor :password_minimum_upper_case
      
        # The required password quality.
        # Corresponds to the JSON property `passwordQuality`
        # @return [String]
        attr_accessor :password_quality
      
        # The scope that the password requirement applies to.
        # Corresponds to the JSON property `passwordScope`
        # @return [String]
        attr_accessor :password_scope
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @maximum_failed_passwords_for_wipe = args[:maximum_failed_passwords_for_wipe] if args.key?(:maximum_failed_passwords_for_wipe)
          @password_expiration_timeout = args[:password_expiration_timeout] if args.key?(:password_expiration_timeout)
          @password_history_length = args[:password_history_length] if args.key?(:password_history_length)
          @password_minimum_length = args[:password_minimum_length] if args.key?(:password_minimum_length)
          @password_minimum_letters = args[:password_minimum_letters] if args.key?(:password_minimum_letters)
          @password_minimum_lower_case = args[:password_minimum_lower_case] if args.key?(:password_minimum_lower_case)
          @password_minimum_non_letter = args[:password_minimum_non_letter] if args.key?(:password_minimum_non_letter)
          @password_minimum_numeric = args[:password_minimum_numeric] if args.key?(:password_minimum_numeric)
          @password_minimum_symbols = args[:password_minimum_symbols] if args.key?(:password_minimum_symbols)
          @password_minimum_upper_case = args[:password_minimum_upper_case] if args.key?(:password_minimum_upper_case)
          @password_quality = args[:password_quality] if args.key?(:password_quality)
          @password_scope = args[:password_scope] if args.key?(:password_scope)
        end
      end
      
      # Configuration for an Android permission and its grant state.
      class PermissionGrant
        include Google::Apis::Core::Hashable
      
        # The Android permission or group, e.g. android.permission.READ_CALENDAR or
        # android.permission_group.CALENDAR.
        # Corresponds to the JSON property `permission`
        # @return [String]
        attr_accessor :permission
      
        # The policy for granting the permission.
        # Corresponds to the JSON property `policy`
        # @return [String]
        attr_accessor :policy
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permission = args[:permission] if args.key?(:permission)
          @policy = args[:policy] if args.key?(:policy)
        end
      end
      
      # A default activity for handling intents that match a particular intent filter.
      # Note: To set up a kiosk, use InstallType to KIOSK rather than use persistent
      # preferred activities.
      class PersistentPreferredActivity
        include Google::Apis::Core::Hashable
      
        # The intent actions to match in the filter. If any actions are included in the
        # filter, then an intent's action must be one of those values for it to match.
        # If no actions are included, the intent action is ignored.
        # Corresponds to the JSON property `actions`
        # @return [Array<String>]
        attr_accessor :actions
      
        # The intent categories to match in the filter. An intent includes the
        # categories that it requires, all of which must be included in the filter in
        # order to match. In other words, adding a category to the filter has no impact
        # on matching unless that category is specified in the intent.
        # Corresponds to the JSON property `categories`
        # @return [Array<String>]
        attr_accessor :categories
      
        # The activity that should be the default intent handler. This should be an
        # Android component name, e.g. com.android.enterprise.app/.MainActivity.
        # Alternatively, the value may be the package name of an app, which causes
        # Android Device Policy to choose an appropriate activity from the app to handle
        # the intent.
        # Corresponds to the JSON property `receiverActivity`
        # @return [String]
        attr_accessor :receiver_activity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @actions = args[:actions] if args.key?(:actions)
          @categories = args[:categories] if args.key?(:categories)
          @receiver_activity = args[:receiver_activity] if args.key?(:receiver_activity)
        end
      end
      
      # A policy resource represents a group of settings that govern the behavior of a
      # managed device and the apps installed on it.
      class Policy
        include Google::Apis::Core::Hashable
      
        # Account types that can't be managed by the user.
        # Corresponds to the JSON property `accountTypesWithManagementDisabled`
        # @return [Array<String>]
        attr_accessor :account_types_with_management_disabled
      
        # Whether adding new users and profiles is disabled.
        # Corresponds to the JSON property `addUserDisabled`
        # @return [Boolean]
        attr_accessor :add_user_disabled
        alias_method :add_user_disabled?, :add_user_disabled
      
        # Whether adjusting the master volume is disabled.
        # Corresponds to the JSON property `adjustVolumeDisabled`
        # @return [Boolean]
        attr_accessor :adjust_volume_disabled
        alias_method :adjust_volume_disabled?, :adjust_volume_disabled
      
        # Configuration for an always-on VPN connection.
        # Corresponds to the JSON property `alwaysOnVpnPackage`
        # @return [Google::Apis::AndroidmanagementV1::AlwaysOnVpnPackage]
        attr_accessor :always_on_vpn_package
      
        # The app tracks for Android Device Policy the device can access. The device
        # receives the latest version among all accessible tracks. If no tracks are
        # specified, then the device only uses the production track.
        # Corresponds to the JSON property `androidDevicePolicyTracks`
        # @return [Array<String>]
        attr_accessor :android_device_policy_tracks
      
        # The app auto update policy, which controls when automatic app updates can be
        # applied.
        # Corresponds to the JSON property `appAutoUpdatePolicy`
        # @return [String]
        attr_accessor :app_auto_update_policy
      
        # Policy applied to apps.
        # Corresponds to the JSON property `applications`
        # @return [Array<Google::Apis::AndroidmanagementV1::ApplicationPolicy>]
        attr_accessor :applications
      
        # Whether auto time is required, which prevents the user from manually setting
        # the date and time.
        # Corresponds to the JSON property `autoTimeRequired`
        # @return [Boolean]
        attr_accessor :auto_time_required
        alias_method :auto_time_required?, :auto_time_required
      
        # Whether applications other than the ones configured in applications are
        # blocked from being installed. When set, applications that were installed under
        # a previous policy but no longer appear in the policy are automatically
        # uninstalled.
        # Corresponds to the JSON property `blockApplicationsEnabled`
        # @return [Boolean]
        attr_accessor :block_applications_enabled
        alias_method :block_applications_enabled?, :block_applications_enabled
      
        # Whether configuring bluetooth is disabled.
        # Corresponds to the JSON property `bluetoothConfigDisabled`
        # @return [Boolean]
        attr_accessor :bluetooth_config_disabled
        alias_method :bluetooth_config_disabled?, :bluetooth_config_disabled
      
        # Whether bluetooth contact sharing is disabled.
        # Corresponds to the JSON property `bluetoothContactSharingDisabled`
        # @return [Boolean]
        attr_accessor :bluetooth_contact_sharing_disabled
        alias_method :bluetooth_contact_sharing_disabled?, :bluetooth_contact_sharing_disabled
      
        # Whether bluetooth is disabled. Prefer this setting over
        # bluetooth_config_disabled because bluetooth_config_disabled can be bypassed by
        # the user.
        # Corresponds to the JSON property `bluetoothDisabled`
        # @return [Boolean]
        attr_accessor :bluetooth_disabled
        alias_method :bluetooth_disabled?, :bluetooth_disabled
      
        # Whether all cameras on the device are disabled.
        # Corresponds to the JSON property `cameraDisabled`
        # @return [Boolean]
        attr_accessor :camera_disabled
        alias_method :camera_disabled?, :camera_disabled
      
        # Whether configuring cell broadcast is disabled.
        # Corresponds to the JSON property `cellBroadcastsConfigDisabled`
        # @return [Boolean]
        attr_accessor :cell_broadcasts_config_disabled
        alias_method :cell_broadcasts_config_disabled?, :cell_broadcasts_config_disabled
      
        # Rules for automatically choosing a private key and certificate to authenticate
        # the device to a server. The rules are ordered by increasing precedence, so if
        # an outgoing request matches more than one rule, the last rule defines which
        # private key to use.
        # Corresponds to the JSON property `choosePrivateKeyRules`
        # @return [Array<Google::Apis::AndroidmanagementV1::ChoosePrivateKeyRule>]
        attr_accessor :choose_private_key_rules
      
        # Rules declaring which mitigating actions to take when a device is not
        # compliant with its policy. When the conditions for multiple rules are
        # satisfied, all of the mitigating actions for the rules are taken. There is a
        # maximum limit of 100 rules. Use policy enforcement rules instead.
        # Corresponds to the JSON property `complianceRules`
        # @return [Array<Google::Apis::AndroidmanagementV1::ComplianceRule>]
        attr_accessor :compliance_rules
      
        # Whether creating windows besides app windows is disabled.
        # Corresponds to the JSON property `createWindowsDisabled`
        # @return [Boolean]
        attr_accessor :create_windows_disabled
        alias_method :create_windows_disabled?, :create_windows_disabled
      
        # Whether configuring user credentials is disabled.
        # Corresponds to the JSON property `credentialsConfigDisabled`
        # @return [Boolean]
        attr_accessor :credentials_config_disabled
        alias_method :credentials_config_disabled?, :credentials_config_disabled
      
        # Whether roaming data services are disabled.
        # Corresponds to the JSON property `dataRoamingDisabled`
        # @return [Boolean]
        attr_accessor :data_roaming_disabled
        alias_method :data_roaming_disabled?, :data_roaming_disabled
      
        # Whether the user is allowed to enable debugging features.
        # Corresponds to the JSON property `debuggingFeaturesAllowed`
        # @return [Boolean]
        attr_accessor :debugging_features_allowed
        alias_method :debugging_features_allowed?, :debugging_features_allowed
      
        # The default permission policy for runtime permission requests.
        # Corresponds to the JSON property `defaultPermissionPolicy`
        # @return [String]
        attr_accessor :default_permission_policy
      
        # Provides a user-facing message with locale info. The maximum message length is
        # 4096 characters.
        # Corresponds to the JSON property `deviceOwnerLockScreenInfo`
        # @return [Google::Apis::AndroidmanagementV1::UserFacingMessage]
        attr_accessor :device_owner_lock_screen_info
      
        # Whether encryption is enabled
        # Corresponds to the JSON property `encryptionPolicy`
        # @return [String]
        attr_accessor :encryption_policy
      
        # Whether app verification is force-enabled.
        # Corresponds to the JSON property `ensureVerifyAppsEnabled`
        # @return [Boolean]
        attr_accessor :ensure_verify_apps_enabled
        alias_method :ensure_verify_apps_enabled?, :ensure_verify_apps_enabled
      
        # Whether factory resetting from settings is disabled.
        # Corresponds to the JSON property `factoryResetDisabled`
        # @return [Boolean]
        attr_accessor :factory_reset_disabled
        alias_method :factory_reset_disabled?, :factory_reset_disabled
      
        # Email addresses of device administrators for factory reset protection. When
        # the device is factory reset, it will require one of these admins to log in
        # with the Google account email and password to unlock the device. If no admins
        # are specified, the device won't provide factory reset protection.
        # Corresponds to the JSON property `frpAdminEmails`
        # @return [Array<String>]
        attr_accessor :frp_admin_emails
      
        # Whether the user is allowed to have fun. Controls whether the Easter egg game
        # in Settings is disabled.
        # Corresponds to the JSON property `funDisabled`
        # @return [Boolean]
        attr_accessor :fun_disabled
        alias_method :fun_disabled?, :fun_disabled
      
        # Whether user installation of apps is disabled.
        # Corresponds to the JSON property `installAppsDisabled`
        # @return [Boolean]
        attr_accessor :install_apps_disabled
        alias_method :install_apps_disabled?, :install_apps_disabled
      
        # Whether the user is allowed to enable the "Unknown Sources" setting, which
        # allows installation of apps from unknown sources.
        # Corresponds to the JSON property `installUnknownSourcesAllowed`
        # @return [Boolean]
        attr_accessor :install_unknown_sources_allowed
        alias_method :install_unknown_sources_allowed?, :install_unknown_sources_allowed
      
        # Whether the keyguard is disabled.
        # Corresponds to the JSON property `keyguardDisabled`
        # @return [Boolean]
        attr_accessor :keyguard_disabled
        alias_method :keyguard_disabled?, :keyguard_disabled
      
        # Disabled keyguard customizations, such as widgets.
        # Corresponds to the JSON property `keyguardDisabledFeatures`
        # @return [Array<String>]
        attr_accessor :keyguard_disabled_features
      
        # Whether the kiosk custom launcher is enabled. This replaces the home screen
        # with a launcher that locks down the device to the apps installed via the
        # applications setting. Apps appear on a single page in alphabetical order. The
        # status bar is disabled when this is set.
        # Corresponds to the JSON property `kioskCustomLauncherEnabled`
        # @return [Boolean]
        attr_accessor :kiosk_custom_launcher_enabled
        alias_method :kiosk_custom_launcher_enabled?, :kiosk_custom_launcher_enabled
      
        # The degree of location detection enabled. The user may change the value unless
        # the user is otherwise blocked from accessing device settings.
        # Corresponds to the JSON property `locationMode`
        # @return [String]
        attr_accessor :location_mode
      
        # Provides a user-facing message with locale info. The maximum message length is
        # 4096 characters.
        # Corresponds to the JSON property `longSupportMessage`
        # @return [Google::Apis::AndroidmanagementV1::UserFacingMessage]
        attr_accessor :long_support_message
      
        # Maximum time in milliseconds for user activity until the device locks. A value
        # of 0 means there is no restriction.
        # Corresponds to the JSON property `maximumTimeToLock`
        # @return [Fixnum]
        attr_accessor :maximum_time_to_lock
      
        # The minimum allowed Android API level.
        # Corresponds to the JSON property `minimumApiLevel`
        # @return [Fixnum]
        attr_accessor :minimum_api_level
      
        # Whether configuring mobile networks is disabled.
        # Corresponds to the JSON property `mobileNetworksConfigDisabled`
        # @return [Boolean]
        attr_accessor :mobile_networks_config_disabled
        alias_method :mobile_networks_config_disabled?, :mobile_networks_config_disabled
      
        # Whether adding or removing accounts is disabled.
        # Corresponds to the JSON property `modifyAccountsDisabled`
        # @return [Boolean]
        attr_accessor :modify_accounts_disabled
        alias_method :modify_accounts_disabled?, :modify_accounts_disabled
      
        # Whether the user mounting physical external media is disabled.
        # Corresponds to the JSON property `mountPhysicalMediaDisabled`
        # @return [Boolean]
        attr_accessor :mount_physical_media_disabled
        alias_method :mount_physical_media_disabled?, :mount_physical_media_disabled
      
        # The name of the policy in the form enterprises/`enterpriseId`/policies/`
        # policyId`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Whether the network escape hatch is enabled. If a network connection can't be
        # made at boot time, the escape hatch prompts the user to temporarily connect to
        # a network in order to refresh the device policy. After applying policy, the
        # temporary network will be forgotten and the device will continue booting. This
        # prevents being unable to connect to a network if there is no suitable network
        # in the last policy and the device boots into an app in lock task mode, or the
        # user is otherwise unable to reach device settings.
        # Corresponds to the JSON property `networkEscapeHatchEnabled`
        # @return [Boolean]
        attr_accessor :network_escape_hatch_enabled
        alias_method :network_escape_hatch_enabled?, :network_escape_hatch_enabled
      
        # Whether resetting network settings is disabled.
        # Corresponds to the JSON property `networkResetDisabled`
        # @return [Boolean]
        attr_accessor :network_reset_disabled
        alias_method :network_reset_disabled?, :network_reset_disabled
      
        # Network configuration for the device. See configure networks for more
        # information.
        # Corresponds to the JSON property `openNetworkConfiguration`
        # @return [Hash<String,Object>]
        attr_accessor :open_network_configuration
      
        # Whether using NFC to beam data from apps is disabled.
        # Corresponds to the JSON property `outgoingBeamDisabled`
        # @return [Boolean]
        attr_accessor :outgoing_beam_disabled
        alias_method :outgoing_beam_disabled?, :outgoing_beam_disabled
      
        # Whether outgoing calls are disabled.
        # Corresponds to the JSON property `outgoingCallsDisabled`
        # @return [Boolean]
        attr_accessor :outgoing_calls_disabled
        alias_method :outgoing_calls_disabled?, :outgoing_calls_disabled
      
        # Password requirement policies. Different policies can be set for work profile
        # or fully managed devices by setting the password_scope field in the policy.
        # Corresponds to the JSON property `passwordPolicies`
        # @return [Array<Google::Apis::AndroidmanagementV1::PasswordRequirements>]
        attr_accessor :password_policies
      
        # Requirements for the password used to unlock a device.
        # Corresponds to the JSON property `passwordRequirements`
        # @return [Google::Apis::AndroidmanagementV1::PasswordRequirements]
        attr_accessor :password_requirements
      
        # Explicit permission or group grants or denials for all apps. These values
        # override the default_permission_policy.
        # Corresponds to the JSON property `permissionGrants`
        # @return [Array<Google::Apis::AndroidmanagementV1::PermissionGrant>]
        attr_accessor :permission_grants
      
        # A list of package names.
        # Corresponds to the JSON property `permittedAccessibilityServices`
        # @return [Google::Apis::AndroidmanagementV1::PackageNameList]
        attr_accessor :permitted_accessibility_services
      
        # A list of package names.
        # Corresponds to the JSON property `permittedInputMethods`
        # @return [Google::Apis::AndroidmanagementV1::PackageNameList]
        attr_accessor :permitted_input_methods
      
        # Default intent handler activities.
        # Corresponds to the JSON property `persistentPreferredActivities`
        # @return [Array<Google::Apis::AndroidmanagementV1::PersistentPreferredActivity>]
        attr_accessor :persistent_preferred_activities
      
        # This mode controls which apps are available to the user in the Play Store and
        # the behavior on the device when apps are removed from the policy.
        # Corresponds to the JSON property `playStoreMode`
        # @return [String]
        attr_accessor :play_store_mode
      
        # Rules that define the behavior when a particular policy can not be applied on
        # device
        # Corresponds to the JSON property `policyEnforcementRules`
        # @return [Array<Google::Apis::AndroidmanagementV1::PolicyEnforcementRule>]
        attr_accessor :policy_enforcement_rules
      
        # Allows showing UI on a device for a user to choose a private key alias if
        # there are no matching rules in ChoosePrivateKeyRules. For devices below
        # Android P, setting this may leave enterprise keys vulnerable.
        # Corresponds to the JSON property `privateKeySelectionEnabled`
        # @return [Boolean]
        attr_accessor :private_key_selection_enabled
        alias_method :private_key_selection_enabled?, :private_key_selection_enabled
      
        # Configuration info for an HTTP proxy. For a direct proxy, set the host, port,
        # and excluded_hosts fields. For a PAC script proxy, set the pac_uri field.
        # Corresponds to the JSON property `recommendedGlobalProxy`
        # @return [Google::Apis::AndroidmanagementV1::ProxyInfo]
        attr_accessor :recommended_global_proxy
      
        # Whether removing other users is disabled.
        # Corresponds to the JSON property `removeUserDisabled`
        # @return [Boolean]
        attr_accessor :remove_user_disabled
        alias_method :remove_user_disabled?, :remove_user_disabled
      
        # Whether rebooting the device into safe boot is disabled.
        # Corresponds to the JSON property `safeBootDisabled`
        # @return [Boolean]
        attr_accessor :safe_boot_disabled
        alias_method :safe_boot_disabled?, :safe_boot_disabled
      
        # Whether screen capture is disabled.
        # Corresponds to the JSON property `screenCaptureDisabled`
        # @return [Boolean]
        attr_accessor :screen_capture_disabled
        alias_method :screen_capture_disabled?, :screen_capture_disabled
      
        # Whether changing the user icon is disabled.
        # Corresponds to the JSON property `setUserIconDisabled`
        # @return [Boolean]
        attr_accessor :set_user_icon_disabled
        alias_method :set_user_icon_disabled?, :set_user_icon_disabled
      
        # Whether changing the wallpaper is disabled.
        # Corresponds to the JSON property `setWallpaperDisabled`
        # @return [Boolean]
        attr_accessor :set_wallpaper_disabled
        alias_method :set_wallpaper_disabled?, :set_wallpaper_disabled
      
        # Actions to take during the setup process.
        # Corresponds to the JSON property `setupActions`
        # @return [Array<Google::Apis::AndroidmanagementV1::SetupAction>]
        attr_accessor :setup_actions
      
        # Whether location sharing is disabled.
        # Corresponds to the JSON property `shareLocationDisabled`
        # @return [Boolean]
        attr_accessor :share_location_disabled
        alias_method :share_location_disabled?, :share_location_disabled
      
        # Provides a user-facing message with locale info. The maximum message length is
        # 4096 characters.
        # Corresponds to the JSON property `shortSupportMessage`
        # @return [Google::Apis::AndroidmanagementV1::UserFacingMessage]
        attr_accessor :short_support_message
      
        # Flag to skip hints on the first use. Enterprise admin can enable the system
        # recommendation for apps to skip their user tutorial and other introductory
        # hints on first start-up.
        # Corresponds to the JSON property `skipFirstUseHintsEnabled`
        # @return [Boolean]
        attr_accessor :skip_first_use_hints_enabled
        alias_method :skip_first_use_hints_enabled?, :skip_first_use_hints_enabled
      
        # Whether sending and receiving SMS messages is disabled.
        # Corresponds to the JSON property `smsDisabled`
        # @return [Boolean]
        attr_accessor :sms_disabled
        alias_method :sms_disabled?, :sms_disabled
      
        # Whether the status bar is disabled. This disables notifications, quick
        # settings, and other screen overlays that allow escape from full-screen mode.
        # DEPRECATED. To disable the status bar on a kiosk device, use InstallType KIOSK
        # or kioskCustomLauncherEnabled.
        # Corresponds to the JSON property `statusBarDisabled`
        # @return [Boolean]
        attr_accessor :status_bar_disabled
        alias_method :status_bar_disabled?, :status_bar_disabled
      
        # Settings controlling the behavior of status reports.
        # Corresponds to the JSON property `statusReportingSettings`
        # @return [Google::Apis::AndroidmanagementV1::StatusReportingSettings]
        attr_accessor :status_reporting_settings
      
        # The battery plugged in modes for which the device stays on. When using this
        # setting, it is recommended to clear maximum_time_to_lock so that the device
        # doesn't lock itself while it stays on.
        # Corresponds to the JSON property `stayOnPluggedModes`
        # @return [Array<String>]
        attr_accessor :stay_on_plugged_modes
      
        # Configuration for managing system updates
        # Corresponds to the JSON property `systemUpdate`
        # @return [Google::Apis::AndroidmanagementV1::SystemUpdate]
        attr_accessor :system_update
      
        # Whether configuring tethering and portable hotspots is disabled.
        # Corresponds to the JSON property `tetheringConfigDisabled`
        # @return [Boolean]
        attr_accessor :tethering_config_disabled
        alias_method :tethering_config_disabled?, :tethering_config_disabled
      
        # Whether user uninstallation of applications is disabled.
        # Corresponds to the JSON property `uninstallAppsDisabled`
        # @return [Boolean]
        attr_accessor :uninstall_apps_disabled
        alias_method :uninstall_apps_disabled?, :uninstall_apps_disabled
      
        # Whether the microphone is muted and adjusting microphone volume is disabled.
        # Corresponds to the JSON property `unmuteMicrophoneDisabled`
        # @return [Boolean]
        attr_accessor :unmute_microphone_disabled
        alias_method :unmute_microphone_disabled?, :unmute_microphone_disabled
      
        # Whether transferring files over USB is disabled.
        # Corresponds to the JSON property `usbFileTransferDisabled`
        # @return [Boolean]
        attr_accessor :usb_file_transfer_disabled
        alias_method :usb_file_transfer_disabled?, :usb_file_transfer_disabled
      
        # Whether USB storage is enabled. Deprecated.
        # Corresponds to the JSON property `usbMassStorageEnabled`
        # @return [Boolean]
        attr_accessor :usb_mass_storage_enabled
        alias_method :usb_mass_storage_enabled?, :usb_mass_storage_enabled
      
        # The version of the policy. This is a read-only field. The version is
        # incremented each time the policy is updated.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        # Whether configuring VPN is disabled.
        # Corresponds to the JSON property `vpnConfigDisabled`
        # @return [Boolean]
        attr_accessor :vpn_config_disabled
        alias_method :vpn_config_disabled?, :vpn_config_disabled
      
        # Whether configuring Wi-Fi access points is disabled.
        # Corresponds to the JSON property `wifiConfigDisabled`
        # @return [Boolean]
        attr_accessor :wifi_config_disabled
        alias_method :wifi_config_disabled?, :wifi_config_disabled
      
        # DEPRECATED - Use wifi_config_disabled.
        # Corresponds to the JSON property `wifiConfigsLockdownEnabled`
        # @return [Boolean]
        attr_accessor :wifi_configs_lockdown_enabled
        alias_method :wifi_configs_lockdown_enabled?, :wifi_configs_lockdown_enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_types_with_management_disabled = args[:account_types_with_management_disabled] if args.key?(:account_types_with_management_disabled)
          @add_user_disabled = args[:add_user_disabled] if args.key?(:add_user_disabled)
          @adjust_volume_disabled = args[:adjust_volume_disabled] if args.key?(:adjust_volume_disabled)
          @always_on_vpn_package = args[:always_on_vpn_package] if args.key?(:always_on_vpn_package)
          @android_device_policy_tracks = args[:android_device_policy_tracks] if args.key?(:android_device_policy_tracks)
          @app_auto_update_policy = args[:app_auto_update_policy] if args.key?(:app_auto_update_policy)
          @applications = args[:applications] if args.key?(:applications)
          @auto_time_required = args[:auto_time_required] if args.key?(:auto_time_required)
          @block_applications_enabled = args[:block_applications_enabled] if args.key?(:block_applications_enabled)
          @bluetooth_config_disabled = args[:bluetooth_config_disabled] if args.key?(:bluetooth_config_disabled)
          @bluetooth_contact_sharing_disabled = args[:bluetooth_contact_sharing_disabled] if args.key?(:bluetooth_contact_sharing_disabled)
          @bluetooth_disabled = args[:bluetooth_disabled] if args.key?(:bluetooth_disabled)
          @camera_disabled = args[:camera_disabled] if args.key?(:camera_disabled)
          @cell_broadcasts_config_disabled = args[:cell_broadcasts_config_disabled] if args.key?(:cell_broadcasts_config_disabled)
          @choose_private_key_rules = args[:choose_private_key_rules] if args.key?(:choose_private_key_rules)
          @compliance_rules = args[:compliance_rules] if args.key?(:compliance_rules)
          @create_windows_disabled = args[:create_windows_disabled] if args.key?(:create_windows_disabled)
          @credentials_config_disabled = args[:credentials_config_disabled] if args.key?(:credentials_config_disabled)
          @data_roaming_disabled = args[:data_roaming_disabled] if args.key?(:data_roaming_disabled)
          @debugging_features_allowed = args[:debugging_features_allowed] if args.key?(:debugging_features_allowed)
          @default_permission_policy = args[:default_permission_policy] if args.key?(:default_permission_policy)
          @device_owner_lock_screen_info = args[:device_owner_lock_screen_info] if args.key?(:device_owner_lock_screen_info)
          @encryption_policy = args[:encryption_policy] if args.key?(:encryption_policy)
          @ensure_verify_apps_enabled = args[:ensure_verify_apps_enabled] if args.key?(:ensure_verify_apps_enabled)
          @factory_reset_disabled = args[:factory_reset_disabled] if args.key?(:factory_reset_disabled)
          @frp_admin_emails = args[:frp_admin_emails] if args.key?(:frp_admin_emails)
          @fun_disabled = args[:fun_disabled] if args.key?(:fun_disabled)
          @install_apps_disabled = args[:install_apps_disabled] if args.key?(:install_apps_disabled)
          @install_unknown_sources_allowed = args[:install_unknown_sources_allowed] if args.key?(:install_unknown_sources_allowed)
          @keyguard_disabled = args[:keyguard_disabled] if args.key?(:keyguard_disabled)
          @keyguard_disabled_features = args[:keyguard_disabled_features] if args.key?(:keyguard_disabled_features)
          @kiosk_custom_launcher_enabled = args[:kiosk_custom_launcher_enabled] if args.key?(:kiosk_custom_launcher_enabled)
          @location_mode = args[:location_mode] if args.key?(:location_mode)
          @long_support_message = args[:long_support_message] if args.key?(:long_support_message)
          @maximum_time_to_lock = args[:maximum_time_to_lock] if args.key?(:maximum_time_to_lock)
          @minimum_api_level = args[:minimum_api_level] if args.key?(:minimum_api_level)
          @mobile_networks_config_disabled = args[:mobile_networks_config_disabled] if args.key?(:mobile_networks_config_disabled)
          @modify_accounts_disabled = args[:modify_accounts_disabled] if args.key?(:modify_accounts_disabled)
          @mount_physical_media_disabled = args[:mount_physical_media_disabled] if args.key?(:mount_physical_media_disabled)
          @name = args[:name] if args.key?(:name)
          @network_escape_hatch_enabled = args[:network_escape_hatch_enabled] if args.key?(:network_escape_hatch_enabled)
          @network_reset_disabled = args[:network_reset_disabled] if args.key?(:network_reset_disabled)
          @open_network_configuration = args[:open_network_configuration] if args.key?(:open_network_configuration)
          @outgoing_beam_disabled = args[:outgoing_beam_disabled] if args.key?(:outgoing_beam_disabled)
          @outgoing_calls_disabled = args[:outgoing_calls_disabled] if args.key?(:outgoing_calls_disabled)
          @password_policies = args[:password_policies] if args.key?(:password_policies)
          @password_requirements = args[:password_requirements] if args.key?(:password_requirements)
          @permission_grants = args[:permission_grants] if args.key?(:permission_grants)
          @permitted_accessibility_services = args[:permitted_accessibility_services] if args.key?(:permitted_accessibility_services)
          @permitted_input_methods = args[:permitted_input_methods] if args.key?(:permitted_input_methods)
          @persistent_preferred_activities = args[:persistent_preferred_activities] if args.key?(:persistent_preferred_activities)
          @play_store_mode = args[:play_store_mode] if args.key?(:play_store_mode)
          @policy_enforcement_rules = args[:policy_enforcement_rules] if args.key?(:policy_enforcement_rules)
          @private_key_selection_enabled = args[:private_key_selection_enabled] if args.key?(:private_key_selection_enabled)
          @recommended_global_proxy = args[:recommended_global_proxy] if args.key?(:recommended_global_proxy)
          @remove_user_disabled = args[:remove_user_disabled] if args.key?(:remove_user_disabled)
          @safe_boot_disabled = args[:safe_boot_disabled] if args.key?(:safe_boot_disabled)
          @screen_capture_disabled = args[:screen_capture_disabled] if args.key?(:screen_capture_disabled)
          @set_user_icon_disabled = args[:set_user_icon_disabled] if args.key?(:set_user_icon_disabled)
          @set_wallpaper_disabled = args[:set_wallpaper_disabled] if args.key?(:set_wallpaper_disabled)
          @setup_actions = args[:setup_actions] if args.key?(:setup_actions)
          @share_location_disabled = args[:share_location_disabled] if args.key?(:share_location_disabled)
          @short_support_message = args[:short_support_message] if args.key?(:short_support_message)
          @skip_first_use_hints_enabled = args[:skip_first_use_hints_enabled] if args.key?(:skip_first_use_hints_enabled)
          @sms_disabled = args[:sms_disabled] if args.key?(:sms_disabled)
          @status_bar_disabled = args[:status_bar_disabled] if args.key?(:status_bar_disabled)
          @status_reporting_settings = args[:status_reporting_settings] if args.key?(:status_reporting_settings)
          @stay_on_plugged_modes = args[:stay_on_plugged_modes] if args.key?(:stay_on_plugged_modes)
          @system_update = args[:system_update] if args.key?(:system_update)
          @tethering_config_disabled = args[:tethering_config_disabled] if args.key?(:tethering_config_disabled)
          @uninstall_apps_disabled = args[:uninstall_apps_disabled] if args.key?(:uninstall_apps_disabled)
          @unmute_microphone_disabled = args[:unmute_microphone_disabled] if args.key?(:unmute_microphone_disabled)
          @usb_file_transfer_disabled = args[:usb_file_transfer_disabled] if args.key?(:usb_file_transfer_disabled)
          @usb_mass_storage_enabled = args[:usb_mass_storage_enabled] if args.key?(:usb_mass_storage_enabled)
          @version = args[:version] if args.key?(:version)
          @vpn_config_disabled = args[:vpn_config_disabled] if args.key?(:vpn_config_disabled)
          @wifi_config_disabled = args[:wifi_config_disabled] if args.key?(:wifi_config_disabled)
          @wifi_configs_lockdown_enabled = args[:wifi_configs_lockdown_enabled] if args.key?(:wifi_configs_lockdown_enabled)
        end
      end
      
      # A rule that defines the actions to take if a device or work profile is not
      # compliant with the policy specified in settingName.
      class PolicyEnforcementRule
        include Google::Apis::Core::Hashable
      
        # An action to block access to apps and data on a fully managed device or in a
        # work profile. This action also triggers a device or work profile to displays a
        # user-facing notification with information (where possible) on how to correct
        # the compliance issue. Note: wipeAction must also be specified.
        # Corresponds to the JSON property `blockAction`
        # @return [Google::Apis::AndroidmanagementV1::BlockAction]
        attr_accessor :block_action
      
        # The top-level policy to enforce. For example, applications or passwordPolicies.
        # Corresponds to the JSON property `settingName`
        # @return [String]
        attr_accessor :setting_name
      
        # An action to reset a fully managed device or delete a work profile. Note:
        # blockAction must also be specified.
        # Corresponds to the JSON property `wipeAction`
        # @return [Google::Apis::AndroidmanagementV1::WipeAction]
        attr_accessor :wipe_action
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @block_action = args[:block_action] if args.key?(:block_action)
          @setting_name = args[:setting_name] if args.key?(:setting_name)
          @wipe_action = args[:wipe_action] if args.key?(:wipe_action)
        end
      end
      
      # Additional details regarding the security posture of the device.
      class PostureDetail
        include Google::Apis::Core::Hashable
      
        # Corresponding admin-facing advice to mitigate this security risk and improve
        # the security posture of the device.
        # Corresponds to the JSON property `advice`
        # @return [Array<Google::Apis::AndroidmanagementV1::UserFacingMessage>]
        attr_accessor :advice
      
        # A specific security risk that negatively affects the security posture of the
        # device.
        # Corresponds to the JSON property `securityRisk`
        # @return [String]
        attr_accessor :security_risk
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @advice = args[:advice] if args.key?(:advice)
          @security_risk = args[:security_risk] if args.key?(:security_risk)
        end
      end
      
      # A power management event.
      class PowerManagementEvent
        include Google::Apis::Core::Hashable
      
        # For BATTERY_LEVEL_COLLECTED events, the battery level as a percentage.
        # Corresponds to the JSON property `batteryLevel`
        # @return [Float]
        attr_accessor :battery_level
      
        # The creation time of the event.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Event type.
        # Corresponds to the JSON property `eventType`
        # @return [String]
        attr_accessor :event_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @battery_level = args[:battery_level] if args.key?(:battery_level)
          @create_time = args[:create_time] if args.key?(:create_time)
          @event_type = args[:event_type] if args.key?(:event_type)
        end
      end
      
      # Configuration info for an HTTP proxy. For a direct proxy, set the host, port,
      # and excluded_hosts fields. For a PAC script proxy, set the pac_uri field.
      class ProxyInfo
        include Google::Apis::Core::Hashable
      
        # For a direct proxy, the hosts for which the proxy is bypassed. The host names
        # may contain wildcards such as *.example.com.
        # Corresponds to the JSON property `excludedHosts`
        # @return [Array<String>]
        attr_accessor :excluded_hosts
      
        # The host of the direct proxy.
        # Corresponds to the JSON property `host`
        # @return [String]
        attr_accessor :host
      
        # The URI of the PAC script used to configure the proxy.
        # Corresponds to the JSON property `pacUri`
        # @return [String]
        attr_accessor :pac_uri
      
        # The port of the direct proxy.
        # Corresponds to the JSON property `port`
        # @return [Fixnum]
        attr_accessor :port
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @excluded_hosts = args[:excluded_hosts] if args.key?(:excluded_hosts)
          @host = args[:host] if args.key?(:host)
          @pac_uri = args[:pac_uri] if args.key?(:pac_uri)
          @port = args[:port] if args.key?(:port)
        end
      end
      
      # The security posture of the device, as determined by the current device state
      # and the policies applied.
      class SecurityPosture
        include Google::Apis::Core::Hashable
      
        # Device's security posture value.
        # Corresponds to the JSON property `devicePosture`
        # @return [String]
        attr_accessor :device_posture
      
        # Additional details regarding the security posture of the device.
        # Corresponds to the JSON property `postureDetails`
        # @return [Array<Google::Apis::AndroidmanagementV1::PostureDetail>]
        attr_accessor :posture_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_posture = args[:device_posture] if args.key?(:device_posture)
          @posture_details = args[:posture_details] if args.key?(:posture_details)
        end
      end
      
      # An action executed during setup.
      class SetupAction
        include Google::Apis::Core::Hashable
      
        # Provides a user-facing message with locale info. The maximum message length is
        # 4096 characters.
        # Corresponds to the JSON property `description`
        # @return [Google::Apis::AndroidmanagementV1::UserFacingMessage]
        attr_accessor :description
      
        # An action to launch an app.
        # Corresponds to the JSON property `launchApp`
        # @return [Google::Apis::AndroidmanagementV1::LaunchAppAction]
        attr_accessor :launch_app
      
        # Provides a user-facing message with locale info. The maximum message length is
        # 4096 characters.
        # Corresponds to the JSON property `title`
        # @return [Google::Apis::AndroidmanagementV1::UserFacingMessage]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @launch_app = args[:launch_app] if args.key?(:launch_app)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # A resource containing sign in details for an enterprise.
      class SigninDetail
        include Google::Apis::Core::Hashable
      
        # A JSON string whose UTF-8 representation can be used to generate a QR code to
        # enroll a device with this enrollment token. To enroll a device using NFC, the
        # NFC record must contain a serialized java.util.Properties representation of
        # the properties in the JSON. This is a read-only field generated by the server.
        # Corresponds to the JSON property `qrCode`
        # @return [String]
        attr_accessor :qr_code
      
        # An enterprise wide enrollment token used to trigger custom sign-in flow. This
        # is a read-only field generated by the server.
        # Corresponds to the JSON property `signinEnrollmentToken`
        # @return [String]
        attr_accessor :signin_enrollment_token
      
        # Sign-in URL for authentication when device is provisioned with a sign-in
        # enrollment token. The sign-in endpoint should finish authentication flow with
        # a URL in the form of https://enterprise.google.com/android/enroll?et=<token>
        # for a successful login, or https://enterprise.google.com/android/enroll/
        # invalid for a failed login.
        # Corresponds to the JSON property `signinUrl`
        # @return [String]
        attr_accessor :signin_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @qr_code = args[:qr_code] if args.key?(:qr_code)
          @signin_enrollment_token = args[:signin_enrollment_token] if args.key?(:signin_enrollment_token)
          @signin_url = args[:signin_url] if args.key?(:signin_url)
        end
      end
      
      # An enterprise signup URL.
      class SignupUrl
        include Google::Apis::Core::Hashable
      
        # The name of the resource. Use this value in the signupUrl field when calling
        # enterprises.create to complete the enterprise signup flow.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A URL where an enterprise admin can register their enterprise. The page can't
        # be rendered in an iframe.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Information about device software.
      class SoftwareInfo
        include Google::Apis::Core::Hashable
      
        # Android build ID string meant for displaying to the user. For example, shamu-
        # userdebug 6.0.1 MOB30I 2756745 dev-keys.
        # Corresponds to the JSON property `androidBuildNumber`
        # @return [String]
        attr_accessor :android_build_number
      
        # Build time.
        # Corresponds to the JSON property `androidBuildTime`
        # @return [String]
        attr_accessor :android_build_time
      
        # The Android Device Policy app version code.
        # Corresponds to the JSON property `androidDevicePolicyVersionCode`
        # @return [Fixnum]
        attr_accessor :android_device_policy_version_code
      
        # The Android Device Policy app version as displayed to the user.
        # Corresponds to the JSON property `androidDevicePolicyVersionName`
        # @return [String]
        attr_accessor :android_device_policy_version_name
      
        # The user-visible Android version string. For example, 6.0.1.
        # Corresponds to the JSON property `androidVersion`
        # @return [String]
        attr_accessor :android_version
      
        # The system bootloader version number, e.g. 0.6.7.
        # Corresponds to the JSON property `bootloaderVersion`
        # @return [String]
        attr_accessor :bootloader_version
      
        # SHA-256 hash of android.content.pm.Signature (https://developer.android.com/
        # reference/android/content/pm/Signature.html) associated with the system
        # package, which can be used to verify that the system build hasn't been
        # modified.
        # Corresponds to the JSON property `deviceBuildSignature`
        # @return [String]
        attr_accessor :device_build_signature
      
        # Kernel version, for example, 2.6.32.9-g103d848.
        # Corresponds to the JSON property `deviceKernelVersion`
        # @return [String]
        attr_accessor :device_kernel_version
      
        # An IETF BCP 47 language code for the primary locale on the device.
        # Corresponds to the JSON property `primaryLanguageCode`
        # @return [String]
        attr_accessor :primary_language_code
      
        # Security patch level, e.g. 2016-05-01.
        # Corresponds to the JSON property `securityPatchLevel`
        # @return [String]
        attr_accessor :security_patch_level
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_build_number = args[:android_build_number] if args.key?(:android_build_number)
          @android_build_time = args[:android_build_time] if args.key?(:android_build_time)
          @android_device_policy_version_code = args[:android_device_policy_version_code] if args.key?(:android_device_policy_version_code)
          @android_device_policy_version_name = args[:android_device_policy_version_name] if args.key?(:android_device_policy_version_name)
          @android_version = args[:android_version] if args.key?(:android_version)
          @bootloader_version = args[:bootloader_version] if args.key?(:bootloader_version)
          @device_build_signature = args[:device_build_signature] if args.key?(:device_build_signature)
          @device_kernel_version = args[:device_kernel_version] if args.key?(:device_kernel_version)
          @primary_language_code = args[:primary_language_code] if args.key?(:primary_language_code)
          @security_patch_level = args[:security_patch_level] if args.key?(:security_patch_level)
        end
      end
      
      # The Status type defines a logical error model that is suitable for different
      # programming environments, including REST APIs and RPC APIs. It is used by gRPC
      # (https://github.com/grpc). Each Status message contains three pieces of data:
      # error code, error message, and error details.You can find out more about this
      # error model and how to work with it in the API Design Guide (https://cloud.
      # google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details. There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any user-facing
        # error message should be localized and sent in the google.rpc.Status.details
        # field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Settings controlling the behavior of status reports.
      class StatusReportingSettings
        include Google::Apis::Core::Hashable
      
        # Settings controlling the behavior of application reports.
        # Corresponds to the JSON property `applicationReportingSettings`
        # @return [Google::Apis::AndroidmanagementV1::ApplicationReportingSettings]
        attr_accessor :application_reporting_settings
      
        # Whether app reports are enabled.
        # Corresponds to the JSON property `applicationReportsEnabled`
        # @return [Boolean]
        attr_accessor :application_reports_enabled
        alias_method :application_reports_enabled?, :application_reports_enabled
      
        # Whether device settings reporting is enabled.
        # Corresponds to the JSON property `deviceSettingsEnabled`
        # @return [Boolean]
        attr_accessor :device_settings_enabled
        alias_method :device_settings_enabled?, :device_settings_enabled
      
        # Whether displays reporting is enabled.
        # Corresponds to the JSON property `displayInfoEnabled`
        # @return [Boolean]
        attr_accessor :display_info_enabled
        alias_method :display_info_enabled?, :display_info_enabled
      
        # Whether hardware status reporting is enabled.
        # Corresponds to the JSON property `hardwareStatusEnabled`
        # @return [Boolean]
        attr_accessor :hardware_status_enabled
        alias_method :hardware_status_enabled?, :hardware_status_enabled
      
        # Whether memory reporting is enabled.
        # Corresponds to the JSON property `memoryInfoEnabled`
        # @return [Boolean]
        attr_accessor :memory_info_enabled
        alias_method :memory_info_enabled?, :memory_info_enabled
      
        # Whether network info reporting is enabled.
        # Corresponds to the JSON property `networkInfoEnabled`
        # @return [Boolean]
        attr_accessor :network_info_enabled
        alias_method :network_info_enabled?, :network_info_enabled
      
        # Whether power management event reporting is enabled.
        # Corresponds to the JSON property `powerManagementEventsEnabled`
        # @return [Boolean]
        attr_accessor :power_management_events_enabled
        alias_method :power_management_events_enabled?, :power_management_events_enabled
      
        # Whether software info reporting is enabled.
        # Corresponds to the JSON property `softwareInfoEnabled`
        # @return [Boolean]
        attr_accessor :software_info_enabled
        alias_method :software_info_enabled?, :software_info_enabled
      
        # Whether system properties reporting is enabled.
        # Corresponds to the JSON property `systemPropertiesEnabled`
        # @return [Boolean]
        attr_accessor :system_properties_enabled
        alias_method :system_properties_enabled?, :system_properties_enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @application_reporting_settings = args[:application_reporting_settings] if args.key?(:application_reporting_settings)
          @application_reports_enabled = args[:application_reports_enabled] if args.key?(:application_reports_enabled)
          @device_settings_enabled = args[:device_settings_enabled] if args.key?(:device_settings_enabled)
          @display_info_enabled = args[:display_info_enabled] if args.key?(:display_info_enabled)
          @hardware_status_enabled = args[:hardware_status_enabled] if args.key?(:hardware_status_enabled)
          @memory_info_enabled = args[:memory_info_enabled] if args.key?(:memory_info_enabled)
          @network_info_enabled = args[:network_info_enabled] if args.key?(:network_info_enabled)
          @power_management_events_enabled = args[:power_management_events_enabled] if args.key?(:power_management_events_enabled)
          @software_info_enabled = args[:software_info_enabled] if args.key?(:software_info_enabled)
          @system_properties_enabled = args[:system_properties_enabled] if args.key?(:system_properties_enabled)
        end
      end
      
      # Configuration for managing system updates
      class SystemUpdate
        include Google::Apis::Core::Hashable
      
        # If the type is WINDOWED, the end of the maintenance window, measured as the
        # number of minutes after midnight in device's local time. This value must be
        # between 0 and 1439, inclusive. If this value is less than start_minutes, then
        # the maintenance window spans midnight. If the maintenance window specified is
        # smaller than 30 minutes, the actual window is extended to 30 minutes beyond
        # the start time.
        # Corresponds to the JSON property `endMinutes`
        # @return [Fixnum]
        attr_accessor :end_minutes
      
        # If the type is WINDOWED, the start of the maintenance window, measured as the
        # number of minutes after midnight in the device's local time. This value must
        # be between 0 and 1439, inclusive.
        # Corresponds to the JSON property `startMinutes`
        # @return [Fixnum]
        attr_accessor :start_minutes
      
        # The type of system update to configure.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_minutes = args[:end_minutes] if args.key?(:end_minutes)
          @start_minutes = args[:start_minutes] if args.key?(:start_minutes)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A terms and conditions page to be accepted during provisioning.
      class TermsAndConditions
        include Google::Apis::Core::Hashable
      
        # Provides a user-facing message with locale info. The maximum message length is
        # 4096 characters.
        # Corresponds to the JSON property `content`
        # @return [Google::Apis::AndroidmanagementV1::UserFacingMessage]
        attr_accessor :content
      
        # Provides a user-facing message with locale info. The maximum message length is
        # 4096 characters.
        # Corresponds to the JSON property `header`
        # @return [Google::Apis::AndroidmanagementV1::UserFacingMessage]
        attr_accessor :header
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @header = args[:header] if args.key?(:header)
        end
      end
      
      # A user belonging to an enterprise.
      class User
        include Google::Apis::Core::Hashable
      
        # A unique identifier you create for this user, such as user342 or asset#44418.
        # This field must be set when the user is created and can't be updated. This
        # field must not contain personally identifiable information (PII). This
        # identifier must be 1024 characters or less; otherwise, the update policy
        # request will fail.
        # Corresponds to the JSON property `accountIdentifier`
        # @return [String]
        attr_accessor :account_identifier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_identifier = args[:account_identifier] if args.key?(:account_identifier)
        end
      end
      
      # Provides a user-facing message with locale info. The maximum message length is
      # 4096 characters.
      class UserFacingMessage
        include Google::Apis::Core::Hashable
      
        # The default message displayed if no localized message is specified or the user'
        # s locale doesn't match with any of the localized messages. A default message
        # must be provided if any localized messages are provided.
        # Corresponds to the JSON property `defaultMessage`
        # @return [String]
        attr_accessor :default_message
      
        # A map containing <locale, message> pairs, where locale is a well-formed BCP 47
        # language (https://www.w3.org/International/articles/language-tags/) code, such
        # as en-US, es-ES, or fr.
        # Corresponds to the JSON property `localizedMessages`
        # @return [Hash<String,String>]
        attr_accessor :localized_messages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_message = args[:default_message] if args.key?(:default_message)
          @localized_messages = args[:localized_messages] if args.key?(:localized_messages)
        end
      end
      
      # A web app.
      class WebApp
        include Google::Apis::Core::Hashable
      
        # The display mode of the web app.
        # Corresponds to the JSON property `displayMode`
        # @return [String]
        attr_accessor :display_mode
      
        # A list of icons for the web app. Must have at least one element.
        # Corresponds to the JSON property `icons`
        # @return [Array<Google::Apis::AndroidmanagementV1::WebAppIcon>]
        attr_accessor :icons
      
        # The name of the web app, which is generated by the server during creation in
        # the form enterprises/`enterpriseId`/webApps/`packageName`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The start URL, i.e. the URL that should load when the user opens the
        # application.
        # Corresponds to the JSON property `startUrl`
        # @return [String]
        attr_accessor :start_url
      
        # The title of the web app as displayed to the user (e.g., amongst a list of
        # other applications, or as a label for an icon).
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The current version of the app.Note that the version can automatically
        # increase during the lifetime of the web app, while Google does internal
        # housekeeping to keep the web app up-to-date.
        # Corresponds to the JSON property `versionCode`
        # @return [Fixnum]
        attr_accessor :version_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_mode = args[:display_mode] if args.key?(:display_mode)
          @icons = args[:icons] if args.key?(:icons)
          @name = args[:name] if args.key?(:name)
          @start_url = args[:start_url] if args.key?(:start_url)
          @title = args[:title] if args.key?(:title)
          @version_code = args[:version_code] if args.key?(:version_code)
        end
      end
      
      # An icon for a web app. Supported formats are: png, jpg and webp.
      class WebAppIcon
        include Google::Apis::Core::Hashable
      
        # The actual bytes of the image in a base64url encoded string (c.f. RFC4648,
        # section 5 "Base 64 Encoding with URL and Filename Safe Alphabet"). <ul> <li>
        # The image type can be png or jpg. <li>The image should ideally be square. <li>
        # The image should ideally have a size of 512x512. </ul>
        # Corresponds to the JSON property `imageData`
        # @return [String]
        attr_accessor :image_data
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_data = args[:image_data] if args.key?(:image_data)
        end
      end
      
      # A web token used to access the managed Google Play iframe.
      class WebToken
        include Google::Apis::Core::Hashable
      
        # The features to enable. Use this if you want to control exactly which feature(
        # s) will be activated; leave empty to allow all features.Restrictions / things
        # to note: <ul> <li> If no features are listed here, all features are enabled —
        # this is the  default behavior where you give access to all features to your
        # admins. <li> This must not contain any FEATURE_UNSPECIFIED values. <li>
        # Repeated values are ignored </ul>
        # Corresponds to the JSON property `enabledFeatures`
        # @return [Array<String>]
        attr_accessor :enabled_features
      
        # The name of the web token, which is generated by the server during creation in
        # the form enterprises/`enterpriseId`/webTokens/`webTokenId`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The URL of the parent frame hosting the iframe with the embedded UI. To
        # prevent XSS, the iframe may not be hosted at other URLs. The URL must use the
        # https scheme.
        # Corresponds to the JSON property `parentFrameUrl`
        # @return [String]
        attr_accessor :parent_frame_url
      
        # Permissions available to an admin in the embedded UI. An admin must have all
        # of these permissions in order to view the UI. This field is deprecated.
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        # The token value which is used in the hosting page to generate the iframe with
        # the embedded UI. This is a read-only field generated by the server.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled_features = args[:enabled_features] if args.key?(:enabled_features)
          @name = args[:name] if args.key?(:name)
          @parent_frame_url = args[:parent_frame_url] if args.key?(:parent_frame_url)
          @permissions = args[:permissions] if args.key?(:permissions)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # An action to reset a fully managed device or delete a work profile. Note:
      # blockAction must also be specified.
      class WipeAction
        include Google::Apis::Core::Hashable
      
        # Whether the factory-reset protection data is preserved on the device. This
        # setting doesn’t apply to work profiles.
        # Corresponds to the JSON property `preserveFrp`
        # @return [Boolean]
        attr_accessor :preserve_frp
        alias_method :preserve_frp?, :preserve_frp
      
        # Number of days the policy is non-compliant before the device or work profile
        # is wiped. wipeAfterDays must be greater than blockAfterDays.
        # Corresponds to the JSON property `wipeAfterDays`
        # @return [Fixnum]
        attr_accessor :wipe_after_days
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @preserve_frp = args[:preserve_frp] if args.key?(:preserve_frp)
          @wipe_after_days = args[:wipe_after_days] if args.key?(:wipe_after_days)
        end
      end
    end
  end
end
