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
    module AdminDirectoryV1
      
      class Alias
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Aliases
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AppAccessCollections
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Asp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Asps
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Building
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildingAddress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BuildingCoordinates
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Buildings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CalendarResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CalendarResources
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Channel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChromeOsDevice
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ActiveTimeRange
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class CpuStatusReport
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class CpuTemperatureInfo
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class DeviceFile
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class DiskVolumeReport
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class VolumeInfo
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class RecentUser
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class SystemRamFreeReport
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class TpmVersionInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChromeOsDeviceAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChromeOsDevices
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChromeOsMoveDevicesToOu
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Customer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomerPostalAddress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DomainAlias
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DomainAliases
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Domains
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Domains2
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Feature
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FeatureInstance
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FeatureRename
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Features
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Group
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Groups
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Member
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Members
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MembersHasMember
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MobileDevice
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Application
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MobileDeviceAction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MobileDevices
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Notification
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Notifications
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrgUnit
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrgUnits
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Privilege
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Privileges
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Role
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class RolePrivilege
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoleAssignment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RoleAssignments
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Roles
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Schema
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SchemaFieldSpec
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class NumericIndexingSpec
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Schemas
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Token
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Tokens
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TrustedAppId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TrustedApps
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class User
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserAbout
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserAddress
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserEmail
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserExternalId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserGender
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserIm
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserKeyword
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserLanguage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserMakeAdmin
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserName
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserOrganization
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserPhone
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserPhoto
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserPosixAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserRelation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserSshPublicKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserUndelete
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserWebsite
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Users
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VerificationCode
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VerificationCodes
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Alias
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alias, as: 'alias'
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :primary_email, as: 'primaryEmail'
        end
      end
      
      class Aliases
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :aliases, as: 'aliases'
          property :etag, as: 'etag'
          property :kind, as: 'kind'
        end
      end
      
      class AppAccessCollections
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :blocked_api_access_buckets, as: 'blockedApiAccessBuckets'
          property :enforce_settings_for_android_drive, as: 'enforceSettingsForAndroidDrive'
          property :error_message, as: 'errorMessage'
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :resource_id, :numeric_string => true, as: 'resourceId'
          property :resource_name, as: 'resourceName'
          property :trust_domain_owned_apps, as: 'trustDomainOwnedApps'
        end
      end
      
      class Asp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code_id, as: 'codeId'
          property :creation_time, :numeric_string => true, as: 'creationTime'
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :last_time_used, :numeric_string => true, as: 'lastTimeUsed'
          property :name, as: 'name'
          property :user_key, as: 'userKey'
        end
      end
      
      class Asps
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AdminDirectoryV1::Asp, decorator: Google::Apis::AdminDirectoryV1::Asp::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Building
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address', class: Google::Apis::AdminDirectoryV1::BuildingAddress, decorator: Google::Apis::AdminDirectoryV1::BuildingAddress::Representation
      
          property :building_id, as: 'buildingId'
          property :building_name, as: 'buildingName'
          property :coordinates, as: 'coordinates', class: Google::Apis::AdminDirectoryV1::BuildingCoordinates, decorator: Google::Apis::AdminDirectoryV1::BuildingCoordinates::Representation
      
          property :description, as: 'description'
          property :etags, as: 'etags'
          collection :floor_names, as: 'floorNames'
          property :kind, as: 'kind'
        end
      end
      
      class BuildingAddress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :address_lines, as: 'addressLines'
          property :administrative_area, as: 'administrativeArea'
          property :language_code, as: 'languageCode'
          property :locality, as: 'locality'
          property :postal_code, as: 'postalCode'
          property :region_code, as: 'regionCode'
          property :sublocality, as: 'sublocality'
        end
      end
      
      class BuildingCoordinates
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :latitude, as: 'latitude'
          property :longitude, as: 'longitude'
        end
      end
      
      class Buildings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :buildings, as: 'buildings', class: Google::Apis::AdminDirectoryV1::Building, decorator: Google::Apis::AdminDirectoryV1::Building::Representation
      
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class CalendarResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :building_id, as: 'buildingId'
          property :capacity, as: 'capacity'
          property :etags, as: 'etags'
          property :feature_instances, as: 'featureInstances'
          property :floor_name, as: 'floorName'
          property :floor_section, as: 'floorSection'
          property :generated_resource_name, as: 'generatedResourceName'
          property :kind, as: 'kind'
          property :resource_category, as: 'resourceCategory'
          property :resource_description, as: 'resourceDescription'
          property :resource_email, as: 'resourceEmail'
          property :resource_id, as: 'resourceId'
          property :resource_name, as: 'resourceName'
          property :resource_type, as: 'resourceType'
          property :user_visible_description, as: 'userVisibleDescription'
        end
      end
      
      class CalendarResources
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AdminDirectoryV1::CalendarResource, decorator: Google::Apis::AdminDirectoryV1::CalendarResource::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Channel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address'
          property :expiration, :numeric_string => true, as: 'expiration'
          property :id, as: 'id'
          property :kind, as: 'kind'
          hash :params, as: 'params'
          property :payload, as: 'payload'
          property :resource_id, as: 'resourceId'
          property :resource_uri, as: 'resourceUri'
          property :token, as: 'token'
          property :type, as: 'type'
        end
      end
      
      class ChromeOsDevice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :active_time_ranges, as: 'activeTimeRanges', class: Google::Apis::AdminDirectoryV1::ChromeOsDevice::ActiveTimeRange, decorator: Google::Apis::AdminDirectoryV1::ChromeOsDevice::ActiveTimeRange::Representation
      
          property :annotated_asset_id, as: 'annotatedAssetId'
          property :annotated_location, as: 'annotatedLocation'
          property :annotated_user, as: 'annotatedUser'
          property :auto_update_expiration, :numeric_string => true, as: 'autoUpdateExpiration'
          property :boot_mode, as: 'bootMode'
          collection :cpu_status_reports, as: 'cpuStatusReports', class: Google::Apis::AdminDirectoryV1::ChromeOsDevice::CpuStatusReport, decorator: Google::Apis::AdminDirectoryV1::ChromeOsDevice::CpuStatusReport::Representation
      
          collection :device_files, as: 'deviceFiles', class: Google::Apis::AdminDirectoryV1::ChromeOsDevice::DeviceFile, decorator: Google::Apis::AdminDirectoryV1::ChromeOsDevice::DeviceFile::Representation
      
          property :device_id, as: 'deviceId'
          collection :disk_volume_reports, as: 'diskVolumeReports', class: Google::Apis::AdminDirectoryV1::ChromeOsDevice::DiskVolumeReport, decorator: Google::Apis::AdminDirectoryV1::ChromeOsDevice::DiskVolumeReport::Representation
      
          property :dock_mac_address, as: 'dockMacAddress'
          property :etag, as: 'etag'
          property :ethernet_mac_address, as: 'ethernetMacAddress'
          property :ethernet_mac_address0, as: 'ethernetMacAddress0'
          property :firmware_version, as: 'firmwareVersion'
          property :kind, as: 'kind'
          property :last_enrollment_time, as: 'lastEnrollmentTime', type: DateTime
      
          property :last_sync, as: 'lastSync', type: DateTime
      
          property :mac_address, as: 'macAddress'
          property :manufacture_date, as: 'manufactureDate'
          property :meid, as: 'meid'
          property :model, as: 'model'
          property :notes, as: 'notes'
          property :order_number, as: 'orderNumber'
          property :org_unit_path, as: 'orgUnitPath'
          property :os_version, as: 'osVersion'
          property :platform_version, as: 'platformVersion'
          collection :recent_users, as: 'recentUsers', class: Google::Apis::AdminDirectoryV1::ChromeOsDevice::RecentUser, decorator: Google::Apis::AdminDirectoryV1::ChromeOsDevice::RecentUser::Representation
      
          property :serial_number, as: 'serialNumber'
          property :status, as: 'status'
          property :support_end_date, as: 'supportEndDate', type: DateTime
      
          collection :system_ram_free_reports, as: 'systemRamFreeReports', class: Google::Apis::AdminDirectoryV1::ChromeOsDevice::SystemRamFreeReport, decorator: Google::Apis::AdminDirectoryV1::ChromeOsDevice::SystemRamFreeReport::Representation
      
          property :system_ram_total, :numeric_string => true, as: 'systemRamTotal'
          property :tpm_version_info, as: 'tpmVersionInfo', class: Google::Apis::AdminDirectoryV1::ChromeOsDevice::TpmVersionInfo, decorator: Google::Apis::AdminDirectoryV1::ChromeOsDevice::TpmVersionInfo::Representation
      
          property :will_auto_renew, as: 'willAutoRenew'
        end
        
        class ActiveTimeRange
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :active_time, as: 'activeTime'
            property :date, as: 'date', type: Date
        
          end
        end
        
        class CpuStatusReport
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :cpu_temperature_info, as: 'cpuTemperatureInfo', class: Google::Apis::AdminDirectoryV1::ChromeOsDevice::CpuStatusReport::CpuTemperatureInfo, decorator: Google::Apis::AdminDirectoryV1::ChromeOsDevice::CpuStatusReport::CpuTemperatureInfo::Representation
        
            collection :cpu_utilization_percentage_info, as: 'cpuUtilizationPercentageInfo'
            property :report_time, as: 'reportTime', type: DateTime
        
          end
          
          class CpuTemperatureInfo
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :label, as: 'label'
              property :temperature, as: 'temperature'
            end
          end
        end
        
        class DeviceFile
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :create_time, as: 'createTime', type: DateTime
        
            property :download_url, as: 'downloadUrl'
            property :name, as: 'name'
            property :type, as: 'type'
          end
        end
        
        class DiskVolumeReport
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :volume_info, as: 'volumeInfo', class: Google::Apis::AdminDirectoryV1::ChromeOsDevice::DiskVolumeReport::VolumeInfo, decorator: Google::Apis::AdminDirectoryV1::ChromeOsDevice::DiskVolumeReport::VolumeInfo::Representation
        
          end
          
          class VolumeInfo
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :storage_free, :numeric_string => true, as: 'storageFree'
              property :storage_total, :numeric_string => true, as: 'storageTotal'
              property :volume_id, as: 'volumeId'
            end
          end
        end
        
        class RecentUser
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :email, as: 'email'
            property :type, as: 'type'
          end
        end
        
        class SystemRamFreeReport
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :report_time, as: 'reportTime', type: DateTime
        
            collection :system_ram_free_info, as: 'systemRamFreeInfo'
          end
        end
        
        class TpmVersionInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :family, as: 'family'
            property :firmware_version, as: 'firmwareVersion'
            property :manufacturer, as: 'manufacturer'
            property :spec_level, as: 'specLevel'
            property :tpm_model, as: 'tpmModel'
            property :vendor_specific, as: 'vendorSpecific'
          end
        end
      end
      
      class ChromeOsDeviceAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          property :deprovision_reason, as: 'deprovisionReason'
        end
      end
      
      class ChromeOsDevices
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :chromeosdevices, as: 'chromeosdevices', class: Google::Apis::AdminDirectoryV1::ChromeOsDevice, decorator: Google::Apis::AdminDirectoryV1::ChromeOsDevice::Representation
      
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ChromeOsMoveDevicesToOu
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :device_ids, as: 'deviceIds'
        end
      end
      
      class Customer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alternate_email, as: 'alternateEmail'
          property :customer_creation_time, as: 'customerCreationTime', type: DateTime
      
          property :customer_domain, as: 'customerDomain'
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :language, as: 'language'
          property :phone_number, as: 'phoneNumber'
          property :postal_address, as: 'postalAddress', class: Google::Apis::AdminDirectoryV1::CustomerPostalAddress, decorator: Google::Apis::AdminDirectoryV1::CustomerPostalAddress::Representation
      
        end
      end
      
      class CustomerPostalAddress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address_line1, as: 'addressLine1'
          property :address_line2, as: 'addressLine2'
          property :address_line3, as: 'addressLine3'
          property :contact_name, as: 'contactName'
          property :country_code, as: 'countryCode'
          property :locality, as: 'locality'
          property :organization_name, as: 'organizationName'
          property :postal_code, as: 'postalCode'
          property :region, as: 'region'
        end
      end
      
      class DomainAlias
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_time, :numeric_string => true, as: 'creationTime'
          property :domain_alias_name, as: 'domainAliasName'
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :parent_domain_name, as: 'parentDomainName'
          property :verified, as: 'verified'
        end
      end
      
      class DomainAliases
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :domain_aliases, as: 'domainAliases', class: Google::Apis::AdminDirectoryV1::DomainAlias, decorator: Google::Apis::AdminDirectoryV1::DomainAlias::Representation
      
          property :etag, as: 'etag'
          property :kind, as: 'kind'
        end
      end
      
      class Domains
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_time, :numeric_string => true, as: 'creationTime'
          collection :domain_aliases, as: 'domainAliases', class: Google::Apis::AdminDirectoryV1::DomainAlias, decorator: Google::Apis::AdminDirectoryV1::DomainAlias::Representation
      
          property :domain_name, as: 'domainName'
          property :etag, as: 'etag'
          property :is_primary, as: 'isPrimary'
          property :kind, as: 'kind'
          property :verified, as: 'verified'
        end
      end
      
      class Domains2
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :domains, as: 'domains', class: Google::Apis::AdminDirectoryV1::Domains, decorator: Google::Apis::AdminDirectoryV1::Domains::Representation
      
          property :etag, as: 'etag'
          property :kind, as: 'kind'
        end
      end
      
      class Feature
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etags, as: 'etags'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class FeatureInstance
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :feature, as: 'feature', class: Google::Apis::AdminDirectoryV1::Feature, decorator: Google::Apis::AdminDirectoryV1::Feature::Representation
      
        end
      end
      
      class FeatureRename
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :new_name, as: 'newName'
        end
      end
      
      class Features
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :features, as: 'features', class: Google::Apis::AdminDirectoryV1::Feature, decorator: Google::Apis::AdminDirectoryV1::Feature::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Group
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :admin_created, as: 'adminCreated'
          collection :aliases, as: 'aliases'
          property :description, as: 'description'
          property :direct_members_count, :numeric_string => true, as: 'directMembersCount'
          property :email, as: 'email'
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :non_editable_aliases, as: 'nonEditableAliases'
        end
      end
      
      class Groups
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :groups, as: 'groups', class: Google::Apis::AdminDirectoryV1::Group, decorator: Google::Apis::AdminDirectoryV1::Group::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Member
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :delivery_settings, as: 'delivery_settings'
          property :email, as: 'email'
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :role, as: 'role'
          property :status, as: 'status'
          property :type, as: 'type'
        end
      end
      
      class Members
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          collection :members, as: 'members', class: Google::Apis::AdminDirectoryV1::Member, decorator: Google::Apis::AdminDirectoryV1::Member::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class MembersHasMember
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_member, as: 'isMember'
        end
      end
      
      class MobileDevice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :adb_status, as: 'adbStatus'
          collection :applications, as: 'applications', class: Google::Apis::AdminDirectoryV1::MobileDevice::Application, decorator: Google::Apis::AdminDirectoryV1::MobileDevice::Application::Representation
      
          property :baseband_version, as: 'basebandVersion'
          property :bootloader_version, as: 'bootloaderVersion'
          property :brand, as: 'brand'
          property :build_number, as: 'buildNumber'
          property :default_language, as: 'defaultLanguage'
          property :developer_options_status, as: 'developerOptionsStatus'
          property :device_compromised_status, as: 'deviceCompromisedStatus'
          property :device_id, as: 'deviceId'
          property :device_password_status, as: 'devicePasswordStatus'
          collection :email, as: 'email'
          property :encryption_status, as: 'encryptionStatus'
          property :etag, as: 'etag'
          property :first_sync, as: 'firstSync', type: DateTime
      
          property :hardware, as: 'hardware'
          property :hardware_id, as: 'hardwareId'
          property :imei, as: 'imei'
          property :kernel_version, as: 'kernelVersion'
          property :kind, as: 'kind'
          property :last_sync, as: 'lastSync', type: DateTime
      
          property :managed_account_is_on_owner_profile, as: 'managedAccountIsOnOwnerProfile'
          property :manufacturer, as: 'manufacturer'
          property :meid, as: 'meid'
          property :model, as: 'model'
          collection :name, as: 'name'
          property :network_operator, as: 'networkOperator'
          property :os, as: 'os'
          collection :other_accounts_info, as: 'otherAccountsInfo'
          property :privilege, as: 'privilege'
          property :release_version, as: 'releaseVersion'
          property :resource_id, as: 'resourceId'
          property :security_patch_level, :numeric_string => true, as: 'securityPatchLevel'
          property :serial_number, as: 'serialNumber'
          property :status, as: 'status'
          property :supports_work_profile, as: 'supportsWorkProfile'
          property :type, as: 'type'
          property :unknown_sources_status, as: 'unknownSourcesStatus'
          property :user_agent, as: 'userAgent'
          property :wifi_mac_address, as: 'wifiMacAddress'
        end
        
        class Application
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :display_name, as: 'displayName'
            property :package_name, as: 'packageName'
            collection :permission, as: 'permission'
            property :version_code, as: 'versionCode'
            property :version_name, as: 'versionName'
          end
        end
      end
      
      class MobileDeviceAction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
        end
      end
      
      class MobileDevices
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          collection :mobiledevices, as: 'mobiledevices', class: Google::Apis::AdminDirectoryV1::MobileDevice, decorator: Google::Apis::AdminDirectoryV1::MobileDevice::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Notification
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :body, as: 'body'
          property :etag, as: 'etag'
          property :from_address, as: 'fromAddress'
          property :is_unread, as: 'isUnread'
          property :kind, as: 'kind'
          property :notification_id, as: 'notificationId'
          property :send_time, as: 'sendTime', type: DateTime
      
          property :subject, as: 'subject'
        end
      end
      
      class Notifications
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AdminDirectoryV1::Notification, decorator: Google::Apis::AdminDirectoryV1::Notification::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :unread_notifications_count, as: 'unreadNotificationsCount'
        end
      end
      
      class OrgUnit
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :block_inheritance, as: 'blockInheritance'
          property :description, as: 'description'
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :org_unit_id, as: 'orgUnitId'
          property :org_unit_path, as: 'orgUnitPath'
          property :parent_org_unit_id, as: 'parentOrgUnitId'
          property :parent_org_unit_path, as: 'parentOrgUnitPath'
        end
      end
      
      class OrgUnits
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          collection :organization_units, as: 'organizationUnits', class: Google::Apis::AdminDirectoryV1::OrgUnit, decorator: Google::Apis::AdminDirectoryV1::OrgUnit::Representation
      
        end
      end
      
      class Privilege
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :child_privileges, as: 'childPrivileges', class: Google::Apis::AdminDirectoryV1::Privilege, decorator: Google::Apis::AdminDirectoryV1::Privilege::Representation
      
          property :etag, as: 'etag'
          property :is_ou_scopable, as: 'isOuScopable'
          property :kind, as: 'kind'
          property :privilege_name, as: 'privilegeName'
          property :service_id, as: 'serviceId'
          property :service_name, as: 'serviceName'
        end
      end
      
      class Privileges
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AdminDirectoryV1::Privilege, decorator: Google::Apis::AdminDirectoryV1::Privilege::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Role
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :is_super_admin_role, as: 'isSuperAdminRole'
          property :is_system_role, as: 'isSystemRole'
          property :kind, as: 'kind'
          property :role_description, as: 'roleDescription'
          property :role_id, :numeric_string => true, as: 'roleId'
          property :role_name, as: 'roleName'
          collection :role_privileges, as: 'rolePrivileges', class: Google::Apis::AdminDirectoryV1::Role::RolePrivilege, decorator: Google::Apis::AdminDirectoryV1::Role::RolePrivilege::Representation
      
        end
        
        class RolePrivilege
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :privilege_name, as: 'privilegeName'
            property :service_id, as: 'serviceId'
          end
        end
      end
      
      class RoleAssignment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :assigned_to, as: 'assignedTo'
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :org_unit_id, as: 'orgUnitId'
          property :role_assignment_id, :numeric_string => true, as: 'roleAssignmentId'
          property :role_id, :numeric_string => true, as: 'roleId'
          property :scope_type, as: 'scopeType'
        end
      end
      
      class RoleAssignments
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AdminDirectoryV1::RoleAssignment, decorator: Google::Apis::AdminDirectoryV1::RoleAssignment::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Roles
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AdminDirectoryV1::Role, decorator: Google::Apis::AdminDirectoryV1::Role::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Schema
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :etag, as: 'etag'
          collection :fields, as: 'fields', class: Google::Apis::AdminDirectoryV1::SchemaFieldSpec, decorator: Google::Apis::AdminDirectoryV1::SchemaFieldSpec::Representation
      
          property :kind, as: 'kind'
          property :schema_id, as: 'schemaId'
          property :schema_name, as: 'schemaName'
        end
      end
      
      class SchemaFieldSpec
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :etag, as: 'etag'
          property :field_id, as: 'fieldId'
          property :field_name, as: 'fieldName'
          property :field_type, as: 'fieldType'
          property :indexed, as: 'indexed'
          property :kind, as: 'kind'
          property :multi_valued, as: 'multiValued'
          property :numeric_indexing_spec, as: 'numericIndexingSpec', class: Google::Apis::AdminDirectoryV1::SchemaFieldSpec::NumericIndexingSpec, decorator: Google::Apis::AdminDirectoryV1::SchemaFieldSpec::NumericIndexingSpec::Representation
      
          property :read_access_type, as: 'readAccessType'
        end
        
        class NumericIndexingSpec
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :max_value, as: 'maxValue'
            property :min_value, as: 'minValue'
          end
        end
      end
      
      class Schemas
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          collection :schemas, as: 'schemas', class: Google::Apis::AdminDirectoryV1::Schema, decorator: Google::Apis::AdminDirectoryV1::Schema::Representation
      
        end
      end
      
      class Token
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :anonymous, as: 'anonymous'
          property :client_id, as: 'clientId'
          property :display_text, as: 'displayText'
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :native_app, as: 'nativeApp'
          collection :scopes, as: 'scopes'
          property :user_key, as: 'userKey'
        end
      end
      
      class Tokens
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AdminDirectoryV1::Token, decorator: Google::Apis::AdminDirectoryV1::Token::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class TrustedAppId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :android_package_name, as: 'androidPackageName'
          property :certificate_hash_sha1, as: 'certificateHashSHA1'
          property :certificate_hash_sha256, as: 'certificateHashSHA256'
          property :etag, as: 'etag'
          property :kind, as: 'kind'
        end
      end
      
      class TrustedApps
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :trusted_apps, as: 'trustedApps', class: Google::Apis::AdminDirectoryV1::TrustedAppId, decorator: Google::Apis::AdminDirectoryV1::TrustedAppId::Representation
      
        end
      end
      
      class User
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :addresses, as: 'addresses'
          property :agreed_to_terms, as: 'agreedToTerms'
          collection :aliases, as: 'aliases'
          property :archived, as: 'archived'
          property :change_password_at_next_login, as: 'changePasswordAtNextLogin'
          property :creation_time, as: 'creationTime', type: DateTime
      
          hash :custom_schemas, as: 'customSchemas'
          property :customer_id, as: 'customerId'
          property :deletion_time, as: 'deletionTime', type: DateTime
      
          property :emails, as: 'emails'
          property :etag, as: 'etag'
          property :external_ids, as: 'externalIds'
          property :gender, as: 'gender'
          property :hash_function, as: 'hashFunction'
          property :id, as: 'id'
          property :ims, as: 'ims'
          property :include_in_global_address_list, as: 'includeInGlobalAddressList'
          property :ip_whitelisted, as: 'ipWhitelisted'
          property :is_admin, as: 'isAdmin'
          property :is_delegated_admin, as: 'isDelegatedAdmin'
          property :is_enforced_in2_sv, as: 'isEnforcedIn2Sv'
          property :is_enrolled_in2_sv, as: 'isEnrolledIn2Sv'
          property :is_mailbox_setup, as: 'isMailboxSetup'
          property :keywords, as: 'keywords'
          property :kind, as: 'kind'
          property :languages, as: 'languages'
          property :last_login_time, as: 'lastLoginTime', type: DateTime
      
          property :locations, as: 'locations'
          property :name, as: 'name', class: Google::Apis::AdminDirectoryV1::UserName, decorator: Google::Apis::AdminDirectoryV1::UserName::Representation
      
          collection :non_editable_aliases, as: 'nonEditableAliases'
          property :notes, as: 'notes'
          property :org_unit_path, as: 'orgUnitPath'
          property :organizations, as: 'organizations'
          property :password, as: 'password'
          property :phones, as: 'phones'
          property :posix_accounts, as: 'posixAccounts'
          property :primary_email, as: 'primaryEmail'
          property :recovery_email, as: 'recoveryEmail'
          property :recovery_phone, as: 'recoveryPhone'
          property :relations, as: 'relations'
          property :ssh_public_keys, as: 'sshPublicKeys'
          property :suspended, as: 'suspended'
          property :suspension_reason, as: 'suspensionReason'
          property :thumbnail_photo_etag, as: 'thumbnailPhotoEtag'
          property :thumbnail_photo_url, as: 'thumbnailPhotoUrl'
          property :websites, as: 'websites'
        end
      end
      
      class UserAbout
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :content_type, as: 'contentType'
          property :value, as: 'value'
        end
      end
      
      class UserAddress
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country, as: 'country'
          property :country_code, as: 'countryCode'
          property :custom_type, as: 'customType'
          property :extended_address, as: 'extendedAddress'
          property :formatted, as: 'formatted'
          property :locality, as: 'locality'
          property :po_box, as: 'poBox'
          property :postal_code, as: 'postalCode'
          property :primary, as: 'primary'
          property :region, as: 'region'
          property :source_is_structured, as: 'sourceIsStructured'
          property :street_address, as: 'streetAddress'
          property :type, as: 'type'
        end
      end
      
      class UserEmail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address'
          property :custom_type, as: 'customType'
          property :primary, as: 'primary'
          property :type, as: 'type'
        end
      end
      
      class UserExternalId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_type, as: 'customType'
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class UserGender
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address_me_as, as: 'addressMeAs'
          property :custom_gender, as: 'customGender'
          property :type, as: 'type'
        end
      end
      
      class UserIm
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_protocol, as: 'customProtocol'
          property :custom_type, as: 'customType'
          property :im, as: 'im'
          property :primary, as: 'primary'
          property :protocol, as: 'protocol'
          property :type, as: 'type'
        end
      end
      
      class UserKeyword
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_type, as: 'customType'
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class UserLanguage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_language, as: 'customLanguage'
          property :language_code, as: 'languageCode'
        end
      end
      
      class UserLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :area, as: 'area'
          property :building_id, as: 'buildingId'
          property :custom_type, as: 'customType'
          property :desk_code, as: 'deskCode'
          property :floor_name, as: 'floorName'
          property :floor_section, as: 'floorSection'
          property :type, as: 'type'
        end
      end
      
      class UserMakeAdmin
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :status, as: 'status'
        end
      end
      
      class UserName
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :family_name, as: 'familyName'
          property :full_name, as: 'fullName'
          property :given_name, as: 'givenName'
        end
      end
      
      class UserOrganization
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cost_center, as: 'costCenter'
          property :custom_type, as: 'customType'
          property :department, as: 'department'
          property :description, as: 'description'
          property :domain, as: 'domain'
          property :full_time_equivalent, as: 'fullTimeEquivalent'
          property :location, as: 'location'
          property :name, as: 'name'
          property :primary, as: 'primary'
          property :symbol, as: 'symbol'
          property :title, as: 'title'
          property :type, as: 'type'
        end
      end
      
      class UserPhone
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_type, as: 'customType'
          property :primary, as: 'primary'
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class UserPhoto
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :height, as: 'height'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :mime_type, as: 'mimeType'
          property :photo_data, :base64 => true, as: 'photoData'
          property :primary_email, as: 'primaryEmail'
          property :width, as: 'width'
        end
      end
      
      class UserPosixAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :gecos, as: 'gecos'
          property :gid, :numeric_string => true, as: 'gid'
          property :home_directory, as: 'homeDirectory'
          property :operating_system_type, as: 'operatingSystemType'
          property :primary, as: 'primary'
          property :shell, as: 'shell'
          property :system_id, as: 'systemId'
          property :uid, :numeric_string => true, as: 'uid'
          property :username, as: 'username'
        end
      end
      
      class UserRelation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_type, as: 'customType'
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class UserSshPublicKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expiration_time_usec, :numeric_string => true, as: 'expirationTimeUsec'
          property :fingerprint, as: 'fingerprint'
          property :key, as: 'key'
        end
      end
      
      class UserUndelete
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :org_unit_path, as: 'orgUnitPath'
        end
      end
      
      class UserWebsite
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_type, as: 'customType'
          property :primary, as: 'primary'
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class Users
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :trigger_event, as: 'trigger_event'
          collection :users, as: 'users', class: Google::Apis::AdminDirectoryV1::User, decorator: Google::Apis::AdminDirectoryV1::User::Representation
      
        end
      end
      
      class VerificationCode
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :user_id, as: 'userId'
          property :verification_code, as: 'verificationCode'
        end
      end
      
      class VerificationCodes
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AdminDirectoryV1::VerificationCode, decorator: Google::Apis::AdminDirectoryV1::VerificationCode::Representation
      
          property :kind, as: 'kind'
        end
      end
    end
  end
end
