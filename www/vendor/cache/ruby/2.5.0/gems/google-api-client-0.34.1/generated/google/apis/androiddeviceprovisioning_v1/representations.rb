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
    module AndroiddeviceprovisioningV1
      
      class ClaimDeviceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClaimDeviceResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClaimDevicesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Company
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Configuration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateCustomerRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomerApplyConfigurationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomerListConfigurationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomerListCustomersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomerListDevicesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomerListDpcsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomerRemoveConfigurationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomerUnclaimDeviceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Device
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceClaim
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceIdentifier
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DevicesLongRunningOperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DevicesLongRunningOperationResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Dpc
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FindDevicesByDeviceIdentifierRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FindDevicesByDeviceIdentifierResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FindDevicesByOwnerRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FindDevicesByOwnerResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListCustomersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListVendorCustomersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListVendorsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationPerDevice
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PartnerClaim
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PartnerUnclaim
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PerDeviceStatusInBatch
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnclaimDeviceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnclaimDevicesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateDeviceMetadataInBatchRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateDeviceMetadataRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdateMetadataArguments
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClaimDeviceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :customer_id, :numeric_string => true, as: 'customerId'
          property :device_identifier, as: 'deviceIdentifier', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier::Representation
      
          property :device_metadata, as: 'deviceMetadata', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata::Representation
      
          property :section_type, as: 'sectionType'
        end
      end
      
      class ClaimDeviceResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_id, :numeric_string => true, as: 'deviceId'
          property :device_name, as: 'deviceName'
        end
      end
      
      class ClaimDevicesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :claims, as: 'claims', class: Google::Apis::AndroiddeviceprovisioningV1::PartnerClaim, decorator: Google::Apis::AndroiddeviceprovisioningV1::PartnerClaim::Representation
      
        end
      end
      
      class Company
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :admin_emails, as: 'adminEmails'
          property :company_id, :numeric_string => true, as: 'companyId'
          property :company_name, as: 'companyName'
          property :name, as: 'name'
          collection :owner_emails, as: 'ownerEmails'
          property :terms_status, as: 'termsStatus'
        end
      end
      
      class Configuration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :company_name, as: 'companyName'
          property :configuration_id, :numeric_string => true, as: 'configurationId'
          property :configuration_name, as: 'configurationName'
          property :contact_email, as: 'contactEmail'
          property :contact_phone, as: 'contactPhone'
          property :custom_message, as: 'customMessage'
          property :dpc_extras, as: 'dpcExtras'
          property :dpc_resource_path, as: 'dpcResourcePath'
          property :is_default, as: 'isDefault'
          property :name, as: 'name'
        end
      end
      
      class CreateCustomerRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :customer, as: 'customer', class: Google::Apis::AndroiddeviceprovisioningV1::Company, decorator: Google::Apis::AndroiddeviceprovisioningV1::Company::Representation
      
        end
      end
      
      class CustomerApplyConfigurationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :configuration, as: 'configuration'
          property :device, as: 'device', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceReference, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceReference::Representation
      
        end
      end
      
      class CustomerListConfigurationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :configurations, as: 'configurations', class: Google::Apis::AndroiddeviceprovisioningV1::Configuration, decorator: Google::Apis::AndroiddeviceprovisioningV1::Configuration::Representation
      
        end
      end
      
      class CustomerListCustomersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :customers, as: 'customers', class: Google::Apis::AndroiddeviceprovisioningV1::Company, decorator: Google::Apis::AndroiddeviceprovisioningV1::Company::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class CustomerListDevicesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :devices, as: 'devices', class: Google::Apis::AndroiddeviceprovisioningV1::Device, decorator: Google::Apis::AndroiddeviceprovisioningV1::Device::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class CustomerListDpcsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :dpcs, as: 'dpcs', class: Google::Apis::AndroiddeviceprovisioningV1::Dpc, decorator: Google::Apis::AndroiddeviceprovisioningV1::Dpc::Representation
      
        end
      end
      
      class CustomerRemoveConfigurationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device, as: 'device', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceReference, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceReference::Representation
      
        end
      end
      
      class CustomerUnclaimDeviceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device, as: 'device', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceReference, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceReference::Representation
      
        end
      end
      
      class Device
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :claims, as: 'claims', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceClaim, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceClaim::Representation
      
          property :configuration, as: 'configuration'
          property :device_id, :numeric_string => true, as: 'deviceId'
          property :device_identifier, as: 'deviceIdentifier', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier::Representation
      
          property :device_metadata, as: 'deviceMetadata', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata::Representation
      
          property :name, as: 'name'
        end
      end
      
      class DeviceClaim
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :owner_company_id, :numeric_string => true, as: 'ownerCompanyId'
          property :reseller_id, :numeric_string => true, as: 'resellerId'
          property :section_type, as: 'sectionType'
          property :vacation_mode_expire_time, as: 'vacationModeExpireTime'
          property :vacation_mode_start_time, as: 'vacationModeStartTime'
        end
      end
      
      class DeviceIdentifier
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :imei, as: 'imei'
          property :manufacturer, as: 'manufacturer'
          property :meid, as: 'meid'
          property :model, as: 'model'
          property :serial_number, as: 'serialNumber'
        end
      end
      
      class DeviceMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :entries, as: 'entries'
        end
      end
      
      class DeviceReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_id, :numeric_string => true, as: 'deviceId'
          property :device_identifier, as: 'deviceIdentifier', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier::Representation
      
        end
      end
      
      class DevicesLongRunningOperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :devices_count, as: 'devicesCount'
          property :processing_status, as: 'processingStatus'
          property :progress, as: 'progress'
        end
      end
      
      class DevicesLongRunningOperationResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :per_device_status, as: 'perDeviceStatus', class: Google::Apis::AndroiddeviceprovisioningV1::OperationPerDevice, decorator: Google::Apis::AndroiddeviceprovisioningV1::OperationPerDevice::Representation
      
          property :success_count, as: 'successCount'
        end
      end
      
      class Dpc
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dpc_name, as: 'dpcName'
          property :name, as: 'name'
          property :package_name, as: 'packageName'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class FindDevicesByDeviceIdentifierRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_identifier, as: 'deviceIdentifier', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier::Representation
      
          property :limit, :numeric_string => true, as: 'limit'
          property :page_token, as: 'pageToken'
        end
      end
      
      class FindDevicesByDeviceIdentifierResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :devices, as: 'devices', class: Google::Apis::AndroiddeviceprovisioningV1::Device, decorator: Google::Apis::AndroiddeviceprovisioningV1::Device::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :total_size, as: 'totalSize'
        end
      end
      
      class FindDevicesByOwnerRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :customer_id, as: 'customerId'
          property :limit, :numeric_string => true, as: 'limit'
          property :page_token, as: 'pageToken'
          property :section_type, as: 'sectionType'
        end
      end
      
      class FindDevicesByOwnerResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :devices, as: 'devices', class: Google::Apis::AndroiddeviceprovisioningV1::Device, decorator: Google::Apis::AndroiddeviceprovisioningV1::Device::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :total_size, as: 'totalSize'
        end
      end
      
      class ListCustomersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :customers, as: 'customers', class: Google::Apis::AndroiddeviceprovisioningV1::Company, decorator: Google::Apis::AndroiddeviceprovisioningV1::Company::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :total_size, as: 'totalSize'
        end
      end
      
      class ListVendorCustomersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :customers, as: 'customers', class: Google::Apis::AndroiddeviceprovisioningV1::Company, decorator: Google::Apis::AndroiddeviceprovisioningV1::Company::Representation
      
          property :next_page_token, as: 'nextPageToken'
          property :total_size, as: 'totalSize'
        end
      end
      
      class ListVendorsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          property :total_size, as: 'totalSize'
          collection :vendors, as: 'vendors', class: Google::Apis::AndroiddeviceprovisioningV1::Company, decorator: Google::Apis::AndroiddeviceprovisioningV1::Company::Representation
      
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::AndroiddeviceprovisioningV1::Status, decorator: Google::Apis::AndroiddeviceprovisioningV1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class OperationPerDevice
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :claim, as: 'claim', class: Google::Apis::AndroiddeviceprovisioningV1::PartnerClaim, decorator: Google::Apis::AndroiddeviceprovisioningV1::PartnerClaim::Representation
      
          property :result, as: 'result', class: Google::Apis::AndroiddeviceprovisioningV1::PerDeviceStatusInBatch, decorator: Google::Apis::AndroiddeviceprovisioningV1::PerDeviceStatusInBatch::Representation
      
          property :unclaim, as: 'unclaim', class: Google::Apis::AndroiddeviceprovisioningV1::PartnerUnclaim, decorator: Google::Apis::AndroiddeviceprovisioningV1::PartnerUnclaim::Representation
      
          property :update_metadata, as: 'updateMetadata', class: Google::Apis::AndroiddeviceprovisioningV1::UpdateMetadataArguments, decorator: Google::Apis::AndroiddeviceprovisioningV1::UpdateMetadataArguments::Representation
      
        end
      end
      
      class PartnerClaim
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :customer_id, :numeric_string => true, as: 'customerId'
          property :device_identifier, as: 'deviceIdentifier', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier::Representation
      
          property :device_metadata, as: 'deviceMetadata', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata::Representation
      
          property :section_type, as: 'sectionType'
        end
      end
      
      class PartnerUnclaim
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_id, :numeric_string => true, as: 'deviceId'
          property :device_identifier, as: 'deviceIdentifier', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier::Representation
      
          property :section_type, as: 'sectionType'
          property :vacation_mode_days, as: 'vacationModeDays'
          property :vacation_mode_expire_time, as: 'vacationModeExpireTime'
        end
      end
      
      class PerDeviceStatusInBatch
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_id, :numeric_string => true, as: 'deviceId'
          property :error_identifier, as: 'errorIdentifier'
          property :error_message, as: 'errorMessage'
          property :status, as: 'status'
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
      
      class UnclaimDeviceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_id, :numeric_string => true, as: 'deviceId'
          property :device_identifier, as: 'deviceIdentifier', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier::Representation
      
          property :section_type, as: 'sectionType'
          property :vacation_mode_days, as: 'vacationModeDays'
          property :vacation_mode_expire_time, as: 'vacationModeExpireTime'
        end
      end
      
      class UnclaimDevicesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :unclaims, as: 'unclaims', class: Google::Apis::AndroiddeviceprovisioningV1::PartnerUnclaim, decorator: Google::Apis::AndroiddeviceprovisioningV1::PartnerUnclaim::Representation
      
        end
      end
      
      class UpdateDeviceMetadataInBatchRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :updates, as: 'updates', class: Google::Apis::AndroiddeviceprovisioningV1::UpdateMetadataArguments, decorator: Google::Apis::AndroiddeviceprovisioningV1::UpdateMetadataArguments::Representation
      
        end
      end
      
      class UpdateDeviceMetadataRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_metadata, as: 'deviceMetadata', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata::Representation
      
        end
      end
      
      class UpdateMetadataArguments
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_id, :numeric_string => true, as: 'deviceId'
          property :device_identifier, as: 'deviceIdentifier', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier::Representation
      
          property :device_metadata, as: 'deviceMetadata', class: Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata, decorator: Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata::Representation
      
        end
      end
    end
  end
end
