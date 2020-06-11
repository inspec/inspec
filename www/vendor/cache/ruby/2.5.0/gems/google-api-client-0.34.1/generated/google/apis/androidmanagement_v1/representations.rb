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
      
      class AlwaysOnVpnPackage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApiLevelCondition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AppTrackInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Application
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApplicationEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApplicationPermission
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApplicationPolicy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApplicationReport
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApplicationReportingSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BlockAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChoosePrivateKeyRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Command
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ComplianceRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Device
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DisplayProp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EnrollmentToken
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Enterprise
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExternalData
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HardwareInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HardwareStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KeyedAppState
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LaunchAppAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListDevicesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListOperationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPoliciesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListWebAppsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedConfigurationTemplate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedProperty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedPropertyEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MemoryEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MemoryInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NetworkInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NonComplianceDetail
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NonComplianceDetailCondition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PackageNameList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PasswordRequirements
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PermissionGrant
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PersistentPreferredActivity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Policy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolicyEnforcementRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PostureDetail
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PowerManagementEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProxyInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SecurityPosture
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetupAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SigninDetail
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SignupUrl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SoftwareInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StatusReportingSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SystemUpdate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TermsAndConditions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class User
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserFacingMessage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebApp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebAppIcon
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebToken
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WipeAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AlwaysOnVpnPackage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :lockdown_enabled, as: 'lockdownEnabled'
          property :package_name, as: 'packageName'
        end
      end
      
      class ApiLevelCondition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :min_api_level, as: 'minApiLevel'
        end
      end
      
      class AppTrackInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :track_alias, as: 'trackAlias'
          property :track_id, as: 'trackId'
        end
      end
      
      class Application
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :app_tracks, as: 'appTracks', class: Google::Apis::AndroidmanagementV1::AppTrackInfo, decorator: Google::Apis::AndroidmanagementV1::AppTrackInfo::Representation
      
          collection :managed_properties, as: 'managedProperties', class: Google::Apis::AndroidmanagementV1::ManagedProperty, decorator: Google::Apis::AndroidmanagementV1::ManagedProperty::Representation
      
          property :name, as: 'name'
          collection :permissions, as: 'permissions', class: Google::Apis::AndroidmanagementV1::ApplicationPermission, decorator: Google::Apis::AndroidmanagementV1::ApplicationPermission::Representation
      
          property :title, as: 'title'
        end
      end
      
      class ApplicationEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :event_type, as: 'eventType'
        end
      end
      
      class ApplicationPermission
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :name, as: 'name'
          property :permission_id, as: 'permissionId'
        end
      end
      
      class ApplicationPolicy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :accessible_track_ids, as: 'accessibleTrackIds'
          property :default_permission_policy, as: 'defaultPermissionPolicy'
          collection :delegated_scopes, as: 'delegatedScopes'
          property :disabled, as: 'disabled'
          property :install_type, as: 'installType'
          property :lock_task_allowed, as: 'lockTaskAllowed'
          hash :managed_configuration, as: 'managedConfiguration'
          property :managed_configuration_template, as: 'managedConfigurationTemplate', class: Google::Apis::AndroidmanagementV1::ManagedConfigurationTemplate, decorator: Google::Apis::AndroidmanagementV1::ManagedConfigurationTemplate::Representation
      
          property :minimum_version_code, as: 'minimumVersionCode'
          property :package_name, as: 'packageName'
          collection :permission_grants, as: 'permissionGrants', class: Google::Apis::AndroidmanagementV1::PermissionGrant, decorator: Google::Apis::AndroidmanagementV1::PermissionGrant::Representation
      
        end
      end
      
      class ApplicationReport
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :application_source, as: 'applicationSource'
          property :display_name, as: 'displayName'
          collection :events, as: 'events', class: Google::Apis::AndroidmanagementV1::ApplicationEvent, decorator: Google::Apis::AndroidmanagementV1::ApplicationEvent::Representation
      
          property :installer_package_name, as: 'installerPackageName'
          collection :keyed_app_states, as: 'keyedAppStates', class: Google::Apis::AndroidmanagementV1::KeyedAppState, decorator: Google::Apis::AndroidmanagementV1::KeyedAppState::Representation
      
          property :package_name, as: 'packageName'
          property :package_sha256_hash, as: 'packageSha256Hash'
          collection :signing_key_cert_fingerprints, as: 'signingKeyCertFingerprints'
          property :state, as: 'state'
          property :version_code, as: 'versionCode'
          property :version_name, as: 'versionName'
        end
      end
      
      class ApplicationReportingSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :include_removed_apps, as: 'includeRemovedApps'
        end
      end
      
      class BlockAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :block_after_days, as: 'blockAfterDays'
        end
      end
      
      class ChoosePrivateKeyRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :package_names, as: 'packageNames'
          property :private_key_alias, as: 'privateKeyAlias'
          property :url_pattern, as: 'urlPattern'
        end
      end
      
      class Command
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :duration, as: 'duration'
          property :error_code, as: 'errorCode'
          property :new_password, as: 'newPassword'
          collection :reset_password_flags, as: 'resetPasswordFlags'
          property :type, as: 'type'
          property :user_name, as: 'userName'
        end
      end
      
      class ComplianceRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_level_condition, as: 'apiLevelCondition', class: Google::Apis::AndroidmanagementV1::ApiLevelCondition, decorator: Google::Apis::AndroidmanagementV1::ApiLevelCondition::Representation
      
          property :disable_apps, as: 'disableApps'
          property :non_compliance_detail_condition, as: 'nonComplianceDetailCondition', class: Google::Apis::AndroidmanagementV1::NonComplianceDetailCondition, decorator: Google::Apis::AndroidmanagementV1::NonComplianceDetailCondition::Representation
      
          collection :package_names_to_disable, as: 'packageNamesToDisable'
        end
      end
      
      class Device
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_level, as: 'apiLevel'
          collection :application_reports, as: 'applicationReports', class: Google::Apis::AndroidmanagementV1::ApplicationReport, decorator: Google::Apis::AndroidmanagementV1::ApplicationReport::Representation
      
          property :applied_policy_name, as: 'appliedPolicyName'
          property :applied_policy_version, :numeric_string => true, as: 'appliedPolicyVersion'
          property :applied_state, as: 'appliedState'
          property :device_settings, as: 'deviceSettings', class: Google::Apis::AndroidmanagementV1::DeviceSettings, decorator: Google::Apis::AndroidmanagementV1::DeviceSettings::Representation
      
          property :disabled_reason, as: 'disabledReason', class: Google::Apis::AndroidmanagementV1::UserFacingMessage, decorator: Google::Apis::AndroidmanagementV1::UserFacingMessage::Representation
      
          collection :displays, as: 'displays', class: Google::Apis::AndroidmanagementV1::DisplayProp, decorator: Google::Apis::AndroidmanagementV1::DisplayProp::Representation
      
          property :enrollment_time, as: 'enrollmentTime'
          property :enrollment_token_data, as: 'enrollmentTokenData'
          property :enrollment_token_name, as: 'enrollmentTokenName'
          property :hardware_info, as: 'hardwareInfo', class: Google::Apis::AndroidmanagementV1::HardwareInfo, decorator: Google::Apis::AndroidmanagementV1::HardwareInfo::Representation
      
          collection :hardware_status_samples, as: 'hardwareStatusSamples', class: Google::Apis::AndroidmanagementV1::HardwareStatus, decorator: Google::Apis::AndroidmanagementV1::HardwareStatus::Representation
      
          property :last_policy_compliance_report_time, as: 'lastPolicyComplianceReportTime'
          property :last_policy_sync_time, as: 'lastPolicySyncTime'
          property :last_status_report_time, as: 'lastStatusReportTime'
          property :management_mode, as: 'managementMode'
          collection :memory_events, as: 'memoryEvents', class: Google::Apis::AndroidmanagementV1::MemoryEvent, decorator: Google::Apis::AndroidmanagementV1::MemoryEvent::Representation
      
          property :memory_info, as: 'memoryInfo', class: Google::Apis::AndroidmanagementV1::MemoryInfo, decorator: Google::Apis::AndroidmanagementV1::MemoryInfo::Representation
      
          property :name, as: 'name'
          property :network_info, as: 'networkInfo', class: Google::Apis::AndroidmanagementV1::NetworkInfo, decorator: Google::Apis::AndroidmanagementV1::NetworkInfo::Representation
      
          collection :non_compliance_details, as: 'nonComplianceDetails', class: Google::Apis::AndroidmanagementV1::NonComplianceDetail, decorator: Google::Apis::AndroidmanagementV1::NonComplianceDetail::Representation
      
          property :policy_compliant, as: 'policyCompliant'
          property :policy_name, as: 'policyName'
          collection :power_management_events, as: 'powerManagementEvents', class: Google::Apis::AndroidmanagementV1::PowerManagementEvent, decorator: Google::Apis::AndroidmanagementV1::PowerManagementEvent::Representation
      
          collection :previous_device_names, as: 'previousDeviceNames'
          property :security_posture, as: 'securityPosture', class: Google::Apis::AndroidmanagementV1::SecurityPosture, decorator: Google::Apis::AndroidmanagementV1::SecurityPosture::Representation
      
          property :software_info, as: 'softwareInfo', class: Google::Apis::AndroidmanagementV1::SoftwareInfo, decorator: Google::Apis::AndroidmanagementV1::SoftwareInfo::Representation
      
          property :state, as: 'state'
          hash :system_properties, as: 'systemProperties'
          property :user, as: 'user', class: Google::Apis::AndroidmanagementV1::User, decorator: Google::Apis::AndroidmanagementV1::User::Representation
      
          property :user_name, as: 'userName'
        end
      end
      
      class DeviceSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :adb_enabled, as: 'adbEnabled'
          property :development_settings_enabled, as: 'developmentSettingsEnabled'
          property :encryption_status, as: 'encryptionStatus'
          property :is_device_secure, as: 'isDeviceSecure'
          property :is_encrypted, as: 'isEncrypted'
          property :unknown_sources_enabled, as: 'unknownSourcesEnabled'
          property :verify_apps_enabled, as: 'verifyAppsEnabled'
        end
      end
      
      class DisplayProp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :density, as: 'density'
          property :display_id, as: 'displayId'
          property :height, as: 'height'
          property :name, as: 'name'
          property :refresh_rate, as: 'refreshRate'
          property :state, as: 'state'
          property :width, as: 'width'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class EnrollmentToken
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :additional_data, as: 'additionalData'
          property :duration, as: 'duration'
          property :expiration_timestamp, as: 'expirationTimestamp'
          property :name, as: 'name'
          property :one_time_only, as: 'oneTimeOnly'
          property :policy_name, as: 'policyName'
          property :qr_code, as: 'qrCode'
          property :user, as: 'user', class: Google::Apis::AndroidmanagementV1::User, decorator: Google::Apis::AndroidmanagementV1::User::Representation
      
          property :value, as: 'value'
        end
      end
      
      class Enterprise
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_auto_approval_enabled, as: 'appAutoApprovalEnabled'
          collection :enabled_notification_types, as: 'enabledNotificationTypes'
          property :enterprise_display_name, as: 'enterpriseDisplayName'
          property :logo, as: 'logo', class: Google::Apis::AndroidmanagementV1::ExternalData, decorator: Google::Apis::AndroidmanagementV1::ExternalData::Representation
      
          property :name, as: 'name'
          property :primary_color, as: 'primaryColor'
          property :pubsub_topic, as: 'pubsubTopic'
          collection :signin_details, as: 'signinDetails', class: Google::Apis::AndroidmanagementV1::SigninDetail, decorator: Google::Apis::AndroidmanagementV1::SigninDetail::Representation
      
          collection :terms_and_conditions, as: 'termsAndConditions', class: Google::Apis::AndroidmanagementV1::TermsAndConditions, decorator: Google::Apis::AndroidmanagementV1::TermsAndConditions::Representation
      
        end
      end
      
      class ExternalData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :sha256_hash, as: 'sha256Hash'
          property :url, as: 'url'
        end
      end
      
      class HardwareInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :battery_shutdown_temperatures, as: 'batteryShutdownTemperatures'
          collection :battery_throttling_temperatures, as: 'batteryThrottlingTemperatures'
          property :brand, as: 'brand'
          collection :cpu_shutdown_temperatures, as: 'cpuShutdownTemperatures'
          collection :cpu_throttling_temperatures, as: 'cpuThrottlingTemperatures'
          property :device_baseband_version, as: 'deviceBasebandVersion'
          collection :gpu_shutdown_temperatures, as: 'gpuShutdownTemperatures'
          collection :gpu_throttling_temperatures, as: 'gpuThrottlingTemperatures'
          property :hardware, as: 'hardware'
          property :manufacturer, as: 'manufacturer'
          property :model, as: 'model'
          property :serial_number, as: 'serialNumber'
          collection :skin_shutdown_temperatures, as: 'skinShutdownTemperatures'
          collection :skin_throttling_temperatures, as: 'skinThrottlingTemperatures'
        end
      end
      
      class HardwareStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :battery_temperatures, as: 'batteryTemperatures'
          collection :cpu_temperatures, as: 'cpuTemperatures'
          collection :cpu_usages, as: 'cpuUsages'
          property :create_time, as: 'createTime'
          collection :fan_speeds, as: 'fanSpeeds'
          collection :gpu_temperatures, as: 'gpuTemperatures'
          collection :skin_temperatures, as: 'skinTemperatures'
        end
      end
      
      class KeyedAppState
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :data, as: 'data'
          property :key, as: 'key'
          property :last_update_time, as: 'lastUpdateTime'
          property :message, as: 'message'
          property :severity, as: 'severity'
        end
      end
      
      class LaunchAppAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :package_name, as: 'packageName'
        end
      end
      
      class ListDevicesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :devices, as: 'devices', class: Google::Apis::AndroidmanagementV1::Device, decorator: Google::Apis::AndroidmanagementV1::Device::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListOperationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :operations, as: 'operations', class: Google::Apis::AndroidmanagementV1::Operation, decorator: Google::Apis::AndroidmanagementV1::Operation::Representation
      
        end
      end
      
      class ListPoliciesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :policies, as: 'policies', class: Google::Apis::AndroidmanagementV1::Policy, decorator: Google::Apis::AndroidmanagementV1::Policy::Representation
      
        end
      end
      
      class ListWebAppsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :web_apps, as: 'webApps', class: Google::Apis::AndroidmanagementV1::WebApp, decorator: Google::Apis::AndroidmanagementV1::WebApp::Representation
      
        end
      end
      
      class ManagedConfigurationTemplate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :configuration_variables, as: 'configurationVariables'
          property :template_id, as: 'templateId'
        end
      end
      
      class ManagedProperty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_value, as: 'defaultValue'
          property :description, as: 'description'
          collection :entries, as: 'entries', class: Google::Apis::AndroidmanagementV1::ManagedPropertyEntry, decorator: Google::Apis::AndroidmanagementV1::ManagedPropertyEntry::Representation
      
          property :key, as: 'key'
          collection :nested_properties, as: 'nestedProperties', class: Google::Apis::AndroidmanagementV1::ManagedProperty, decorator: Google::Apis::AndroidmanagementV1::ManagedProperty::Representation
      
          property :title, as: 'title'
          property :type, as: 'type'
        end
      end
      
      class ManagedPropertyEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class MemoryEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :byte_count, :numeric_string => true, as: 'byteCount'
          property :create_time, as: 'createTime'
          property :event_type, as: 'eventType'
        end
      end
      
      class MemoryInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :total_internal_storage, :numeric_string => true, as: 'totalInternalStorage'
          property :total_ram, :numeric_string => true, as: 'totalRam'
        end
      end
      
      class NetworkInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :imei, as: 'imei'
          property :meid, as: 'meid'
          property :network_operator_name, as: 'networkOperatorName'
          property :wifi_mac_address, as: 'wifiMacAddress'
        end
      end
      
      class NonComplianceDetail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :current_value, as: 'currentValue'
          property :field_path, as: 'fieldPath'
          property :installation_failure_reason, as: 'installationFailureReason'
          property :non_compliance_reason, as: 'nonComplianceReason'
          property :package_name, as: 'packageName'
          property :setting_name, as: 'settingName'
        end
      end
      
      class NonComplianceDetailCondition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :non_compliance_reason, as: 'nonComplianceReason'
          property :package_name, as: 'packageName'
          property :setting_name, as: 'settingName'
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::AndroidmanagementV1::Status, decorator: Google::Apis::AndroidmanagementV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class PackageNameList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :package_names, as: 'packageNames'
        end
      end
      
      class PasswordRequirements
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :maximum_failed_passwords_for_wipe, as: 'maximumFailedPasswordsForWipe'
          property :password_expiration_timeout, as: 'passwordExpirationTimeout'
          property :password_history_length, as: 'passwordHistoryLength'
          property :password_minimum_length, as: 'passwordMinimumLength'
          property :password_minimum_letters, as: 'passwordMinimumLetters'
          property :password_minimum_lower_case, as: 'passwordMinimumLowerCase'
          property :password_minimum_non_letter, as: 'passwordMinimumNonLetter'
          property :password_minimum_numeric, as: 'passwordMinimumNumeric'
          property :password_minimum_symbols, as: 'passwordMinimumSymbols'
          property :password_minimum_upper_case, as: 'passwordMinimumUpperCase'
          property :password_quality, as: 'passwordQuality'
          property :password_scope, as: 'passwordScope'
        end
      end
      
      class PermissionGrant
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :permission, as: 'permission'
          property :policy, as: 'policy'
        end
      end
      
      class PersistentPreferredActivity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :actions, as: 'actions'
          collection :categories, as: 'categories'
          property :receiver_activity, as: 'receiverActivity'
        end
      end
      
      class Policy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :account_types_with_management_disabled, as: 'accountTypesWithManagementDisabled'
          property :add_user_disabled, as: 'addUserDisabled'
          property :adjust_volume_disabled, as: 'adjustVolumeDisabled'
          property :always_on_vpn_package, as: 'alwaysOnVpnPackage', class: Google::Apis::AndroidmanagementV1::AlwaysOnVpnPackage, decorator: Google::Apis::AndroidmanagementV1::AlwaysOnVpnPackage::Representation
      
          collection :android_device_policy_tracks, as: 'androidDevicePolicyTracks'
          property :app_auto_update_policy, as: 'appAutoUpdatePolicy'
          collection :applications, as: 'applications', class: Google::Apis::AndroidmanagementV1::ApplicationPolicy, decorator: Google::Apis::AndroidmanagementV1::ApplicationPolicy::Representation
      
          property :auto_time_required, as: 'autoTimeRequired'
          property :block_applications_enabled, as: 'blockApplicationsEnabled'
          property :bluetooth_config_disabled, as: 'bluetoothConfigDisabled'
          property :bluetooth_contact_sharing_disabled, as: 'bluetoothContactSharingDisabled'
          property :bluetooth_disabled, as: 'bluetoothDisabled'
          property :camera_disabled, as: 'cameraDisabled'
          property :cell_broadcasts_config_disabled, as: 'cellBroadcastsConfigDisabled'
          collection :choose_private_key_rules, as: 'choosePrivateKeyRules', class: Google::Apis::AndroidmanagementV1::ChoosePrivateKeyRule, decorator: Google::Apis::AndroidmanagementV1::ChoosePrivateKeyRule::Representation
      
          collection :compliance_rules, as: 'complianceRules', class: Google::Apis::AndroidmanagementV1::ComplianceRule, decorator: Google::Apis::AndroidmanagementV1::ComplianceRule::Representation
      
          property :create_windows_disabled, as: 'createWindowsDisabled'
          property :credentials_config_disabled, as: 'credentialsConfigDisabled'
          property :data_roaming_disabled, as: 'dataRoamingDisabled'
          property :debugging_features_allowed, as: 'debuggingFeaturesAllowed'
          property :default_permission_policy, as: 'defaultPermissionPolicy'
          property :device_owner_lock_screen_info, as: 'deviceOwnerLockScreenInfo', class: Google::Apis::AndroidmanagementV1::UserFacingMessage, decorator: Google::Apis::AndroidmanagementV1::UserFacingMessage::Representation
      
          property :encryption_policy, as: 'encryptionPolicy'
          property :ensure_verify_apps_enabled, as: 'ensureVerifyAppsEnabled'
          property :factory_reset_disabled, as: 'factoryResetDisabled'
          collection :frp_admin_emails, as: 'frpAdminEmails'
          property :fun_disabled, as: 'funDisabled'
          property :install_apps_disabled, as: 'installAppsDisabled'
          property :install_unknown_sources_allowed, as: 'installUnknownSourcesAllowed'
          property :keyguard_disabled, as: 'keyguardDisabled'
          collection :keyguard_disabled_features, as: 'keyguardDisabledFeatures'
          property :kiosk_custom_launcher_enabled, as: 'kioskCustomLauncherEnabled'
          property :location_mode, as: 'locationMode'
          property :long_support_message, as: 'longSupportMessage', class: Google::Apis::AndroidmanagementV1::UserFacingMessage, decorator: Google::Apis::AndroidmanagementV1::UserFacingMessage::Representation
      
          property :maximum_time_to_lock, :numeric_string => true, as: 'maximumTimeToLock'
          property :minimum_api_level, as: 'minimumApiLevel'
          property :mobile_networks_config_disabled, as: 'mobileNetworksConfigDisabled'
          property :modify_accounts_disabled, as: 'modifyAccountsDisabled'
          property :mount_physical_media_disabled, as: 'mountPhysicalMediaDisabled'
          property :name, as: 'name'
          property :network_escape_hatch_enabled, as: 'networkEscapeHatchEnabled'
          property :network_reset_disabled, as: 'networkResetDisabled'
          hash :open_network_configuration, as: 'openNetworkConfiguration'
          property :outgoing_beam_disabled, as: 'outgoingBeamDisabled'
          property :outgoing_calls_disabled, as: 'outgoingCallsDisabled'
          collection :password_policies, as: 'passwordPolicies', class: Google::Apis::AndroidmanagementV1::PasswordRequirements, decorator: Google::Apis::AndroidmanagementV1::PasswordRequirements::Representation
      
          property :password_requirements, as: 'passwordRequirements', class: Google::Apis::AndroidmanagementV1::PasswordRequirements, decorator: Google::Apis::AndroidmanagementV1::PasswordRequirements::Representation
      
          collection :permission_grants, as: 'permissionGrants', class: Google::Apis::AndroidmanagementV1::PermissionGrant, decorator: Google::Apis::AndroidmanagementV1::PermissionGrant::Representation
      
          property :permitted_accessibility_services, as: 'permittedAccessibilityServices', class: Google::Apis::AndroidmanagementV1::PackageNameList, decorator: Google::Apis::AndroidmanagementV1::PackageNameList::Representation
      
          property :permitted_input_methods, as: 'permittedInputMethods', class: Google::Apis::AndroidmanagementV1::PackageNameList, decorator: Google::Apis::AndroidmanagementV1::PackageNameList::Representation
      
          collection :persistent_preferred_activities, as: 'persistentPreferredActivities', class: Google::Apis::AndroidmanagementV1::PersistentPreferredActivity, decorator: Google::Apis::AndroidmanagementV1::PersistentPreferredActivity::Representation
      
          property :play_store_mode, as: 'playStoreMode'
          collection :policy_enforcement_rules, as: 'policyEnforcementRules', class: Google::Apis::AndroidmanagementV1::PolicyEnforcementRule, decorator: Google::Apis::AndroidmanagementV1::PolicyEnforcementRule::Representation
      
          property :private_key_selection_enabled, as: 'privateKeySelectionEnabled'
          property :recommended_global_proxy, as: 'recommendedGlobalProxy', class: Google::Apis::AndroidmanagementV1::ProxyInfo, decorator: Google::Apis::AndroidmanagementV1::ProxyInfo::Representation
      
          property :remove_user_disabled, as: 'removeUserDisabled'
          property :safe_boot_disabled, as: 'safeBootDisabled'
          property :screen_capture_disabled, as: 'screenCaptureDisabled'
          property :set_user_icon_disabled, as: 'setUserIconDisabled'
          property :set_wallpaper_disabled, as: 'setWallpaperDisabled'
          collection :setup_actions, as: 'setupActions', class: Google::Apis::AndroidmanagementV1::SetupAction, decorator: Google::Apis::AndroidmanagementV1::SetupAction::Representation
      
          property :share_location_disabled, as: 'shareLocationDisabled'
          property :short_support_message, as: 'shortSupportMessage', class: Google::Apis::AndroidmanagementV1::UserFacingMessage, decorator: Google::Apis::AndroidmanagementV1::UserFacingMessage::Representation
      
          property :skip_first_use_hints_enabled, as: 'skipFirstUseHintsEnabled'
          property :sms_disabled, as: 'smsDisabled'
          property :status_bar_disabled, as: 'statusBarDisabled'
          property :status_reporting_settings, as: 'statusReportingSettings', class: Google::Apis::AndroidmanagementV1::StatusReportingSettings, decorator: Google::Apis::AndroidmanagementV1::StatusReportingSettings::Representation
      
          collection :stay_on_plugged_modes, as: 'stayOnPluggedModes'
          property :system_update, as: 'systemUpdate', class: Google::Apis::AndroidmanagementV1::SystemUpdate, decorator: Google::Apis::AndroidmanagementV1::SystemUpdate::Representation
      
          property :tethering_config_disabled, as: 'tetheringConfigDisabled'
          property :uninstall_apps_disabled, as: 'uninstallAppsDisabled'
          property :unmute_microphone_disabled, as: 'unmuteMicrophoneDisabled'
          property :usb_file_transfer_disabled, as: 'usbFileTransferDisabled'
          property :usb_mass_storage_enabled, as: 'usbMassStorageEnabled'
          property :version, :numeric_string => true, as: 'version'
          property :vpn_config_disabled, as: 'vpnConfigDisabled'
          property :wifi_config_disabled, as: 'wifiConfigDisabled'
          property :wifi_configs_lockdown_enabled, as: 'wifiConfigsLockdownEnabled'
        end
      end
      
      class PolicyEnforcementRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :block_action, as: 'blockAction', class: Google::Apis::AndroidmanagementV1::BlockAction, decorator: Google::Apis::AndroidmanagementV1::BlockAction::Representation
      
          property :setting_name, as: 'settingName'
          property :wipe_action, as: 'wipeAction', class: Google::Apis::AndroidmanagementV1::WipeAction, decorator: Google::Apis::AndroidmanagementV1::WipeAction::Representation
      
        end
      end
      
      class PostureDetail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :advice, as: 'advice', class: Google::Apis::AndroidmanagementV1::UserFacingMessage, decorator: Google::Apis::AndroidmanagementV1::UserFacingMessage::Representation
      
          property :security_risk, as: 'securityRisk'
        end
      end
      
      class PowerManagementEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :battery_level, as: 'batteryLevel'
          property :create_time, as: 'createTime'
          property :event_type, as: 'eventType'
        end
      end
      
      class ProxyInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :excluded_hosts, as: 'excludedHosts'
          property :host, as: 'host'
          property :pac_uri, as: 'pacUri'
          property :port, as: 'port'
        end
      end
      
      class SecurityPosture
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_posture, as: 'devicePosture'
          collection :posture_details, as: 'postureDetails', class: Google::Apis::AndroidmanagementV1::PostureDetail, decorator: Google::Apis::AndroidmanagementV1::PostureDetail::Representation
      
        end
      end
      
      class SetupAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description', class: Google::Apis::AndroidmanagementV1::UserFacingMessage, decorator: Google::Apis::AndroidmanagementV1::UserFacingMessage::Representation
      
          property :launch_app, as: 'launchApp', class: Google::Apis::AndroidmanagementV1::LaunchAppAction, decorator: Google::Apis::AndroidmanagementV1::LaunchAppAction::Representation
      
          property :title, as: 'title', class: Google::Apis::AndroidmanagementV1::UserFacingMessage, decorator: Google::Apis::AndroidmanagementV1::UserFacingMessage::Representation
      
        end
      end
      
      class SigninDetail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :qr_code, as: 'qrCode'
          property :signin_enrollment_token, as: 'signinEnrollmentToken'
          property :signin_url, as: 'signinUrl'
        end
      end
      
      class SignupUrl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :url, as: 'url'
        end
      end
      
      class SoftwareInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :android_build_number, as: 'androidBuildNumber'
          property :android_build_time, as: 'androidBuildTime'
          property :android_device_policy_version_code, as: 'androidDevicePolicyVersionCode'
          property :android_device_policy_version_name, as: 'androidDevicePolicyVersionName'
          property :android_version, as: 'androidVersion'
          property :bootloader_version, as: 'bootloaderVersion'
          property :device_build_signature, as: 'deviceBuildSignature'
          property :device_kernel_version, as: 'deviceKernelVersion'
          property :primary_language_code, as: 'primaryLanguageCode'
          property :security_patch_level, as: 'securityPatchLevel'
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
      
      class StatusReportingSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :application_reporting_settings, as: 'applicationReportingSettings', class: Google::Apis::AndroidmanagementV1::ApplicationReportingSettings, decorator: Google::Apis::AndroidmanagementV1::ApplicationReportingSettings::Representation
      
          property :application_reports_enabled, as: 'applicationReportsEnabled'
          property :device_settings_enabled, as: 'deviceSettingsEnabled'
          property :display_info_enabled, as: 'displayInfoEnabled'
          property :hardware_status_enabled, as: 'hardwareStatusEnabled'
          property :memory_info_enabled, as: 'memoryInfoEnabled'
          property :network_info_enabled, as: 'networkInfoEnabled'
          property :power_management_events_enabled, as: 'powerManagementEventsEnabled'
          property :software_info_enabled, as: 'softwareInfoEnabled'
          property :system_properties_enabled, as: 'systemPropertiesEnabled'
        end
      end
      
      class SystemUpdate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_minutes, as: 'endMinutes'
          property :start_minutes, as: 'startMinutes'
          property :type, as: 'type'
        end
      end
      
      class TermsAndConditions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content, as: 'content', class: Google::Apis::AndroidmanagementV1::UserFacingMessage, decorator: Google::Apis::AndroidmanagementV1::UserFacingMessage::Representation
      
          property :header, as: 'header', class: Google::Apis::AndroidmanagementV1::UserFacingMessage, decorator: Google::Apis::AndroidmanagementV1::UserFacingMessage::Representation
      
        end
      end
      
      class User
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_identifier, as: 'accountIdentifier'
        end
      end
      
      class UserFacingMessage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_message, as: 'defaultMessage'
          hash :localized_messages, as: 'localizedMessages'
        end
      end
      
      class WebApp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_mode, as: 'displayMode'
          collection :icons, as: 'icons', class: Google::Apis::AndroidmanagementV1::WebAppIcon, decorator: Google::Apis::AndroidmanagementV1::WebAppIcon::Representation
      
          property :name, as: 'name'
          property :start_url, as: 'startUrl'
          property :title, as: 'title'
          property :version_code, :numeric_string => true, as: 'versionCode'
        end
      end
      
      class WebAppIcon
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_data, as: 'imageData'
        end
      end
      
      class WebToken
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :enabled_features, as: 'enabledFeatures'
          property :name, as: 'name'
          property :parent_frame_url, as: 'parentFrameUrl'
          collection :permissions, as: 'permissions'
          property :value, as: 'value'
        end
      end
      
      class WipeAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :preserve_frp, as: 'preserveFrp'
          property :wipe_after_days, as: 'wipeAfterDays'
        end
      end
    end
  end
end
