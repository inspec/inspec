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
      
      # Request message to claim a device on behalf of a customer.
      class ClaimDeviceRequest
        include Google::Apis::Core::Hashable
      
        # Required. The ID of the customer for whom the device is being claimed.
        # Corresponds to the JSON property `customerId`
        # @return [Fixnum]
        attr_accessor :customer_id
      
        # Encapsulates hardware and product IDs to identify a manufactured device.
        # To understand requirements on identifier sets, read
        # [Identifiers](/zero-touch/guides/identifiers).
        # Corresponds to the JSON property `deviceIdentifier`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier]
        attr_accessor :device_identifier
      
        # Metadata entries that can be attached to a `Device`. To learn more, read
        # [Device metadata](/zero-touch/guides/metadata).
        # Corresponds to the JSON property `deviceMetadata`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata]
        attr_accessor :device_metadata
      
        # Required. The section type of the device's provisioning record.
        # Corresponds to the JSON property `sectionType`
        # @return [String]
        attr_accessor :section_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
          @device_identifier = args[:device_identifier] if args.key?(:device_identifier)
          @device_metadata = args[:device_metadata] if args.key?(:device_metadata)
          @section_type = args[:section_type] if args.key?(:section_type)
        end
      end
      
      # Response message containing device id of the claim.
      class ClaimDeviceResponse
        include Google::Apis::Core::Hashable
      
        # The device ID of the claimed device.
        # Corresponds to the JSON property `deviceId`
        # @return [Fixnum]
        attr_accessor :device_id
      
        # The resource name of the device in the format
        # `partners/[PARTNER_ID]/devices/[DEVICE_ID]`.
        # Corresponds to the JSON property `deviceName`
        # @return [String]
        attr_accessor :device_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_id = args[:device_id] if args.key?(:device_id)
          @device_name = args[:device_name] if args.key?(:device_name)
        end
      end
      
      # Request to claim devices asynchronously in batch. Claiming a device adds the
      # device to zero-touch enrollment and shows the device in the customer's view
      # of the portal.
      class ClaimDevicesRequest
        include Google::Apis::Core::Hashable
      
        # Required. A list of device claims.
        # Corresponds to the JSON property `claims`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::PartnerClaim>]
        attr_accessor :claims
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @claims = args[:claims] if args.key?(:claims)
        end
      end
      
      # A reseller, vendor, or customer in the zero-touch reseller and customer APIs.
      class Company
        include Google::Apis::Core::Hashable
      
        # Optional. Input only. Email address of customer's users in the admin role.
        # Each email address must be associated with a Google Account.
        # Corresponds to the JSON property `adminEmails`
        # @return [Array<String>]
        attr_accessor :admin_emails
      
        # Output only. The ID of the company. Assigned by the server.
        # Corresponds to the JSON property `companyId`
        # @return [Fixnum]
        attr_accessor :company_id
      
        # Required. The name of the company. For example _XYZ Corp_. Displayed to the
        # company's employees in the zero-touch enrollment portal.
        # Corresponds to the JSON property `companyName`
        # @return [String]
        attr_accessor :company_name
      
        # Output only. The API resource name of the company. The resource name is one
        # of the following formats:
        # * `partners/[PARTNER_ID]/customers/[CUSTOMER_ID]`
        # * `partners/[PARTNER_ID]/vendors/[VENDOR_ID]`
        # * `partners/[PARTNER_ID]/vendors/[VENDOR_ID]/customers/[CUSTOMER_ID]`
        # Assigned by the server.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Input only. Email address of customer's users in the owner role. At least
        # one `owner_email` is required. Each email address must be associated with a
        # Google Account. Owners share the same access as admins but can also add,
        # delete, and edit your organization's portal users.
        # Corresponds to the JSON property `ownerEmails`
        # @return [Array<String>]
        attr_accessor :owner_emails
      
        # Output only. Whether any user from the company has accepted the latest
        # Terms of Service (ToS). See
        # TermsStatus.
        # Corresponds to the JSON property `termsStatus`
        # @return [String]
        attr_accessor :terms_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @admin_emails = args[:admin_emails] if args.key?(:admin_emails)
          @company_id = args[:company_id] if args.key?(:company_id)
          @company_name = args[:company_name] if args.key?(:company_name)
          @name = args[:name] if args.key?(:name)
          @owner_emails = args[:owner_emails] if args.key?(:owner_emails)
          @terms_status = args[:terms_status] if args.key?(:terms_status)
        end
      end
      
      # A configuration collects the provisioning options for Android devices. Each
      # configuration combines the following:
      # * The EMM device policy controller (DPC) installed on the devices.
      # * EMM policies enforced on the devices.
      # * Metadata displayed on the device to help users during setup.
      # Customers can add as many configurations as they need. However, zero-touch
      # enrollment works best when a customer sets a default configuration that's
      # applied to any new devices the organization purchases.
      class Configuration
        include Google::Apis::Core::Hashable
      
        # Required. The name of the organization. Zero-touch enrollment shows this
        # organization name to device users during device provisioning.
        # Corresponds to the JSON property `companyName`
        # @return [String]
        attr_accessor :company_name
      
        # Output only. The ID of the configuration. Assigned by the server.
        # Corresponds to the JSON property `configurationId`
        # @return [Fixnum]
        attr_accessor :configuration_id
      
        # Required. A short name that describes the configuration's purpose. For
        # example, _Sales team_ or _Temporary employees_. The zero-touch enrollment
        # portal displays this name to IT admins.
        # Corresponds to the JSON property `configurationName`
        # @return [String]
        attr_accessor :configuration_name
      
        # Required. The email address that device users can contact to get help.
        # Zero-touch enrollment shows this email address to device users before
        # device provisioning. The value is validated on input.
        # Corresponds to the JSON property `contactEmail`
        # @return [String]
        attr_accessor :contact_email
      
        # Required. The telephone number that device users can call, using another
        # device, to get help. Zero-touch enrollment shows this number to device
        # users before device provisioning. Accepts numerals, spaces, the plus sign,
        # hyphens, and parentheses.
        # Corresponds to the JSON property `contactPhone`
        # @return [String]
        attr_accessor :contact_phone
      
        # A message, containing one or two sentences, to help device users get help
        # or give them more details about what’s happening to their device.
        # Zero-touch enrollment shows this message before the device is provisioned.
        # Corresponds to the JSON property `customMessage`
        # @return [String]
        attr_accessor :custom_message
      
        # The JSON-formatted EMM provisioning extras that are passed to the DPC.
        # Corresponds to the JSON property `dpcExtras`
        # @return [String]
        attr_accessor :dpc_extras
      
        # Required. The resource name of the selected DPC (device policy controller)
        # in the format `customers/[CUSTOMER_ID]/dpcs/*`. To list the supported DPCs,
        # call
        # `customers.dpcs.list`.
        # Corresponds to the JSON property `dpcResourcePath`
        # @return [String]
        attr_accessor :dpc_resource_path
      
        # Required. Whether this is the default configuration that zero-touch
        # enrollment applies to any new devices the organization purchases in the
        # future. Only one customer configuration can be the default. Setting this
        # value to `true`, changes the previous default configuration's `isDefault`
        # value to `false`.
        # Corresponds to the JSON property `isDefault`
        # @return [Boolean]
        attr_accessor :is_default
        alias_method :is_default?, :is_default
      
        # Output only. The API resource name in the format
        # `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`. Assigned by
        # the server.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @company_name = args[:company_name] if args.key?(:company_name)
          @configuration_id = args[:configuration_id] if args.key?(:configuration_id)
          @configuration_name = args[:configuration_name] if args.key?(:configuration_name)
          @contact_email = args[:contact_email] if args.key?(:contact_email)
          @contact_phone = args[:contact_phone] if args.key?(:contact_phone)
          @custom_message = args[:custom_message] if args.key?(:custom_message)
          @dpc_extras = args[:dpc_extras] if args.key?(:dpc_extras)
          @dpc_resource_path = args[:dpc_resource_path] if args.key?(:dpc_resource_path)
          @is_default = args[:is_default] if args.key?(:is_default)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Request message to create a customer.
      class CreateCustomerRequest
        include Google::Apis::Core::Hashable
      
        # A reseller, vendor, or customer in the zero-touch reseller and customer APIs.
        # Corresponds to the JSON property `customer`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Company]
        attr_accessor :customer
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @customer = args[:customer] if args.key?(:customer)
        end
      end
      
      # Request message for customer to assign a configuration to device.
      class CustomerApplyConfigurationRequest
        include Google::Apis::Core::Hashable
      
        # Required. The configuration applied to the device in the format
        # `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`.
        # Corresponds to the JSON property `configuration`
        # @return [String]
        attr_accessor :configuration
      
        # A `DeviceReference` is an API abstraction that lets you supply a _device_
        # argument to a method using one of the following identifier types:
        # * A numeric API resource ID.
        # * Real-world hardware IDs, such as IMEI number, belonging to the manufactured
        # device.
        # Methods that operate on devices take a `DeviceReference` as a parameter type
        # because it's more flexible for the caller. To learn more about device
        # identifiers, read [Identifiers](/zero-touch/guides/identifiers).
        # Corresponds to the JSON property `device`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceReference]
        attr_accessor :device
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @configuration = args[:configuration] if args.key?(:configuration)
          @device = args[:device] if args.key?(:device)
        end
      end
      
      # Response message of customer's listing configuration.
      class CustomerListConfigurationsResponse
        include Google::Apis::Core::Hashable
      
        # The configurations.
        # Corresponds to the JSON property `configurations`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::Configuration>]
        attr_accessor :configurations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @configurations = args[:configurations] if args.key?(:configurations)
        end
      end
      
      # Response message for listing my customers.
      class CustomerListCustomersResponse
        include Google::Apis::Core::Hashable
      
        # The customer accounts the calling user is a member of.
        # Corresponds to the JSON property `customers`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::Company>]
        attr_accessor :customers
      
        # A token used to access the next page of results. Omitted if no further
        # results are available.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @customers = args[:customers] if args.key?(:customers)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message of customer's liting devices.
      class CustomerListDevicesResponse
        include Google::Apis::Core::Hashable
      
        # The customer's devices.
        # Corresponds to the JSON property `devices`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::Device>]
        attr_accessor :devices
      
        # A token used to access the next page of results. Omitted if no further
        # results are available.
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
      
      # Response message of customer's listing DPCs.
      class CustomerListDpcsResponse
        include Google::Apis::Core::Hashable
      
        # The list of DPCs available to the customer that support zero-touch
        # enrollment.
        # Corresponds to the JSON property `dpcs`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::Dpc>]
        attr_accessor :dpcs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dpcs = args[:dpcs] if args.key?(:dpcs)
        end
      end
      
      # Request message for customer to remove the configuration from device.
      class CustomerRemoveConfigurationRequest
        include Google::Apis::Core::Hashable
      
        # A `DeviceReference` is an API abstraction that lets you supply a _device_
        # argument to a method using one of the following identifier types:
        # * A numeric API resource ID.
        # * Real-world hardware IDs, such as IMEI number, belonging to the manufactured
        # device.
        # Methods that operate on devices take a `DeviceReference` as a parameter type
        # because it's more flexible for the caller. To learn more about device
        # identifiers, read [Identifiers](/zero-touch/guides/identifiers).
        # Corresponds to the JSON property `device`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceReference]
        attr_accessor :device
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device = args[:device] if args.key?(:device)
        end
      end
      
      # Request message for customer to unclaim a device.
      class CustomerUnclaimDeviceRequest
        include Google::Apis::Core::Hashable
      
        # A `DeviceReference` is an API abstraction that lets you supply a _device_
        # argument to a method using one of the following identifier types:
        # * A numeric API resource ID.
        # * Real-world hardware IDs, such as IMEI number, belonging to the manufactured
        # device.
        # Methods that operate on devices take a `DeviceReference` as a parameter type
        # because it's more flexible for the caller. To learn more about device
        # identifiers, read [Identifiers](/zero-touch/guides/identifiers).
        # Corresponds to the JSON property `device`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceReference]
        attr_accessor :device
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device = args[:device] if args.key?(:device)
        end
      end
      
      # An Android device registered for zero-touch enrollment.
      class Device
        include Google::Apis::Core::Hashable
      
        # Output only. The provisioning claims for a device. Devices claimed for
        # zero-touch enrollment have a claim with the type `SECTION_TYPE_ZERO_TOUCH`.
        # Call
        # `partners.devices.unclaim`
        # or
        # `partners.devices.unclaimAsync`
        # to remove the device from zero-touch enrollment.
        # Corresponds to the JSON property `claims`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::DeviceClaim>]
        attr_accessor :claims
      
        # Not available to resellers.
        # Corresponds to the JSON property `configuration`
        # @return [String]
        attr_accessor :configuration
      
        # Output only. The ID of the device. Assigned by the server.
        # Corresponds to the JSON property `deviceId`
        # @return [Fixnum]
        attr_accessor :device_id
      
        # Encapsulates hardware and product IDs to identify a manufactured device.
        # To understand requirements on identifier sets, read
        # [Identifiers](/zero-touch/guides/identifiers).
        # Corresponds to the JSON property `deviceIdentifier`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier]
        attr_accessor :device_identifier
      
        # Metadata entries that can be attached to a `Device`. To learn more, read
        # [Device metadata](/zero-touch/guides/metadata).
        # Corresponds to the JSON property `deviceMetadata`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata]
        attr_accessor :device_metadata
      
        # Output only. The API resource name in the format
        # `partners/[PARTNER_ID]/devices/[DEVICE_ID]`. Assigned by the server.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @claims = args[:claims] if args.key?(:claims)
          @configuration = args[:configuration] if args.key?(:configuration)
          @device_id = args[:device_id] if args.key?(:device_id)
          @device_identifier = args[:device_identifier] if args.key?(:device_identifier)
          @device_metadata = args[:device_metadata] if args.key?(:device_metadata)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A record of a device claimed by a reseller for a customer. Devices claimed
      # for zero-touch enrollment have a claim with the type
      # `SECTION_TYPE_ZERO_TOUCH`. To learn more, read
      # [Claim devices for customers](/zero-touch/guides/how-it-works#claim).
      class DeviceClaim
        include Google::Apis::Core::Hashable
      
        # The ID of the Customer that purchased the device.
        # Corresponds to the JSON property `ownerCompanyId`
        # @return [Fixnum]
        attr_accessor :owner_company_id
      
        # The ID of the reseller that claimed the device.
        # Corresponds to the JSON property `resellerId`
        # @return [Fixnum]
        attr_accessor :reseller_id
      
        # Output only. The type of claim made on the device.
        # Corresponds to the JSON property `sectionType`
        # @return [String]
        attr_accessor :section_type
      
        # The timestamp when the device will exit ‘vacation mode’. This value is
        # present iff the device is in 'vacation mode'.
        # Corresponds to the JSON property `vacationModeExpireTime`
        # @return [String]
        attr_accessor :vacation_mode_expire_time
      
        # The timestamp when the device was put into ‘vacation mode’. This value is
        # present iff the device is in 'vacation mode'.
        # Corresponds to the JSON property `vacationModeStartTime`
        # @return [String]
        attr_accessor :vacation_mode_start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @owner_company_id = args[:owner_company_id] if args.key?(:owner_company_id)
          @reseller_id = args[:reseller_id] if args.key?(:reseller_id)
          @section_type = args[:section_type] if args.key?(:section_type)
          @vacation_mode_expire_time = args[:vacation_mode_expire_time] if args.key?(:vacation_mode_expire_time)
          @vacation_mode_start_time = args[:vacation_mode_start_time] if args.key?(:vacation_mode_start_time)
        end
      end
      
      # Encapsulates hardware and product IDs to identify a manufactured device.
      # To understand requirements on identifier sets, read
      # [Identifiers](/zero-touch/guides/identifiers).
      class DeviceIdentifier
        include Google::Apis::Core::Hashable
      
        # The device’s IMEI number. Validated on input.
        # Corresponds to the JSON property `imei`
        # @return [String]
        attr_accessor :imei
      
        # The device manufacturer’s name. Matches the device's built-in
        # value returned from `android.os.Build.MANUFACTURER`. Allowed values are
        # listed in
        # [manufacturers](/zero-touch/resources/manufacturer-names#manufacturers-names).
        # Corresponds to the JSON property `manufacturer`
        # @return [String]
        attr_accessor :manufacturer
      
        # The device’s MEID number.
        # Corresponds to the JSON property `meid`
        # @return [String]
        attr_accessor :meid
      
        # The device model's name. Matches the device's built-in value returned from
        # `android.os.Build.MODEL`. Allowed values are listed in
        # [models](/zero-touch/resources/manufacturer-names#model-names).
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        # The manufacturer's serial number for the device. This value might not be
        # unique across different device models.
        # Corresponds to the JSON property `serialNumber`
        # @return [String]
        attr_accessor :serial_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @imei = args[:imei] if args.key?(:imei)
          @manufacturer = args[:manufacturer] if args.key?(:manufacturer)
          @meid = args[:meid] if args.key?(:meid)
          @model = args[:model] if args.key?(:model)
          @serial_number = args[:serial_number] if args.key?(:serial_number)
        end
      end
      
      # Metadata entries that can be attached to a `Device`. To learn more, read
      # [Device metadata](/zero-touch/guides/metadata).
      class DeviceMetadata
        include Google::Apis::Core::Hashable
      
        # Metadata entries recorded as key-value pairs.
        # Corresponds to the JSON property `entries`
        # @return [Hash<String,String>]
        attr_accessor :entries
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entries = args[:entries] if args.key?(:entries)
        end
      end
      
      # A `DeviceReference` is an API abstraction that lets you supply a _device_
      # argument to a method using one of the following identifier types:
      # * A numeric API resource ID.
      # * Real-world hardware IDs, such as IMEI number, belonging to the manufactured
      # device.
      # Methods that operate on devices take a `DeviceReference` as a parameter type
      # because it's more flexible for the caller. To learn more about device
      # identifiers, read [Identifiers](/zero-touch/guides/identifiers).
      class DeviceReference
        include Google::Apis::Core::Hashable
      
        # The ID of the device.
        # Corresponds to the JSON property `deviceId`
        # @return [Fixnum]
        attr_accessor :device_id
      
        # Encapsulates hardware and product IDs to identify a manufactured device.
        # To understand requirements on identifier sets, read
        # [Identifiers](/zero-touch/guides/identifiers).
        # Corresponds to the JSON property `deviceIdentifier`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier]
        attr_accessor :device_identifier
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_id = args[:device_id] if args.key?(:device_id)
          @device_identifier = args[:device_identifier] if args.key?(:device_identifier)
        end
      end
      
      # Tracks the status of a long-running operation to asynchronously update a
      # batch of reseller metadata attached to devices. To learn more, read
      # [Long‑running batch operations](/zero-touch/guides/how-it-works#operations).
      class DevicesLongRunningOperationMetadata
        include Google::Apis::Core::Hashable
      
        # The number of metadata updates in the operation. This might be different
        # from the number of updates in the request if the API can't parse some of
        # the updates.
        # Corresponds to the JSON property `devicesCount`
        # @return [Fixnum]
        attr_accessor :devices_count
      
        # The processing status of the operation.
        # Corresponds to the JSON property `processingStatus`
        # @return [String]
        attr_accessor :processing_status
      
        # The processing progress of the operation. Measured as a number from 0 to
        # 100. A value of 10O doesnt always mean the operation completed—check for
        # the inclusion of a `done` field.
        # Corresponds to the JSON property `progress`
        # @return [Fixnum]
        attr_accessor :progress
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @devices_count = args[:devices_count] if args.key?(:devices_count)
          @processing_status = args[:processing_status] if args.key?(:processing_status)
          @progress = args[:progress] if args.key?(:progress)
        end
      end
      
      # Tracks the status of a long-running operation to claim, unclaim, or attach
      # metadata to devices. To learn more, read
      # [Long‑running batch operations](/zero-touch/guides/how-it-works#operations).
      class DevicesLongRunningOperationResponse
        include Google::Apis::Core::Hashable
      
        # The processing status for each device in the operation.
        # One `PerDeviceStatus` per device. The list order matches the items in the
        # original request.
        # Corresponds to the JSON property `perDeviceStatus`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::OperationPerDevice>]
        attr_accessor :per_device_status
      
        # A summary of how many items in the operation the server processed
        # successfully. Updated as the operation progresses.
        # Corresponds to the JSON property `successCount`
        # @return [Fixnum]
        attr_accessor :success_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @per_device_status = args[:per_device_status] if args.key?(:per_device_status)
          @success_count = args[:success_count] if args.key?(:success_count)
        end
      end
      
      # An EMM's DPC ([device policy
      # controller](http://developer.android.com/work/dpc/build-dpc.html)).
      # Zero-touch enrollment installs a DPC (listed in the `Configuration`) on a
      # device to maintain the customer's mobile policies. All the DPCs listed by the
      # API support zero-touch enrollment and are available in Google Play.
      class Dpc
        include Google::Apis::Core::Hashable
      
        # Output only. The title of the DPC app in Google Play. For example, _Google
        # Apps Device Policy_. Useful in an application's user interface.
        # Corresponds to the JSON property `dpcName`
        # @return [String]
        attr_accessor :dpc_name
      
        # Output only. The API resource name in the format
        # `customers/[CUSTOMER_ID]/dpcs/[DPC_ID]`. Assigned by
        # the server. To maintain a reference to a DPC across customer accounts,
        # persist and match the last path component (`DPC_ID`).
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The DPC's Android application ID that looks like a Java
        # package name. Zero-touch enrollment installs the DPC app onto a device
        # using this identifier.
        # Corresponds to the JSON property `packageName`
        # @return [String]
        attr_accessor :package_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dpc_name = args[:dpc_name] if args.key?(:dpc_name)
          @name = args[:name] if args.key?(:name)
          @package_name = args[:package_name] if args.key?(:package_name)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request to find devices.
      class FindDevicesByDeviceIdentifierRequest
        include Google::Apis::Core::Hashable
      
        # Encapsulates hardware and product IDs to identify a manufactured device.
        # To understand requirements on identifier sets, read
        # [Identifiers](/zero-touch/guides/identifiers).
        # Corresponds to the JSON property `deviceIdentifier`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier]
        attr_accessor :device_identifier
      
        # Required. The maximum number of devices to show in a page of results. Must
        # be between 1 and 100 inclusive.
        # Corresponds to the JSON property `limit`
        # @return [Fixnum]
        attr_accessor :limit
      
        # A token specifying which result page to return.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_identifier = args[:device_identifier] if args.key?(:device_identifier)
          @limit = args[:limit] if args.key?(:limit)
          @page_token = args[:page_token] if args.key?(:page_token)
        end
      end
      
      # Response containing found devices.
      class FindDevicesByDeviceIdentifierResponse
        include Google::Apis::Core::Hashable
      
        # Found devices.
        # Corresponds to the JSON property `devices`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::Device>]
        attr_accessor :devices
      
        # A token used to access the next page of results. Omitted if no further
        # results are available.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The total count of items in the list irrespective of pagination.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @devices = args[:devices] if args.key?(:devices)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_size = args[:total_size] if args.key?(:total_size)
        end
      end
      
      # Request to find devices by customers.
      class FindDevicesByOwnerRequest
        include Google::Apis::Core::Hashable
      
        # Required. The list of customer IDs to search for.
        # Corresponds to the JSON property `customerId`
        # @return [Array<Fixnum>]
        attr_accessor :customer_id
      
        # Required. The maximum number of devices to show in a page of results. Must
        # be between 1 and 100 inclusive.
        # Corresponds to the JSON property `limit`
        # @return [Fixnum]
        attr_accessor :limit
      
        # A token specifying which result page to return.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # Required. The section type of the device's provisioning record.
        # Corresponds to the JSON property `sectionType`
        # @return [String]
        attr_accessor :section_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
          @limit = args[:limit] if args.key?(:limit)
          @page_token = args[:page_token] if args.key?(:page_token)
          @section_type = args[:section_type] if args.key?(:section_type)
        end
      end
      
      # Response containing found devices.
      class FindDevicesByOwnerResponse
        include Google::Apis::Core::Hashable
      
        # The customer's devices.
        # Corresponds to the JSON property `devices`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::Device>]
        attr_accessor :devices
      
        # A token used to access the next page of results.
        # Omitted if no further results are available.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The total count of items in the list irrespective of pagination.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @devices = args[:devices] if args.key?(:devices)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_size = args[:total_size] if args.key?(:total_size)
        end
      end
      
      # Response message of all customers related to this partner.
      class ListCustomersResponse
        include Google::Apis::Core::Hashable
      
        # List of customers related to this reseller partner.
        # Corresponds to the JSON property `customers`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::Company>]
        attr_accessor :customers
      
        # A token to retrieve the next page of results. Omitted if no further results
        # are available.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The total count of items in the list irrespective of pagination.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @customers = args[:customers] if args.key?(:customers)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_size = args[:total_size] if args.key?(:total_size)
        end
      end
      
      # Response message to list customers of the vendor.
      class ListVendorCustomersResponse
        include Google::Apis::Core::Hashable
      
        # List of customers of the vendor.
        # Corresponds to the JSON property `customers`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::Company>]
        attr_accessor :customers
      
        # A token to retrieve the next page of results. Omitted if no further results
        # are available.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The total count of items in the list irrespective of pagination.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @customers = args[:customers] if args.key?(:customers)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_size = args[:total_size] if args.key?(:total_size)
        end
      end
      
      # Response message to list vendors of the partner.
      class ListVendorsResponse
        include Google::Apis::Core::Hashable
      
        # A token to retrieve the next page of results. Omitted if no further results
        # are available.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The total count of items in the list irrespective of pagination.
        # Corresponds to the JSON property `totalSize`
        # @return [Fixnum]
        attr_accessor :total_size
      
        # List of vendors of the reseller partner. Fields `name`, `companyId` and
        # `companyName` are populated to the Company object.
        # Corresponds to the JSON property `vendors`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::Company>]
        attr_accessor :vendors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_size = args[:total_size] if args.key?(:total_size)
          @vendors = args[:vendors] if args.key?(:vendors)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If `true`, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::Status]
        attr_accessor :error
      
        # This field will contain a `DevicesLongRunningOperationMetadata` object if the
        # operation is created by `claimAsync`, `unclaimAsync`, or `updateMetadataAsync`.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # This field will contain a `DevicesLongRunningOperationResponse` object if the
        # operation is created by `claimAsync`, `unclaimAsync`, or `updateMetadataAsync`.
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
      
      # A task for each device in the operation. Corresponds to each device
      # change in the request.
      class OperationPerDevice
        include Google::Apis::Core::Hashable
      
        # Identifies one claim request.
        # Corresponds to the JSON property `claim`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::PartnerClaim]
        attr_accessor :claim
      
        # Captures the processing status for each device in the operation.
        # Corresponds to the JSON property `result`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::PerDeviceStatusInBatch]
        attr_accessor :result
      
        # Identifies one unclaim request.
        # Corresponds to the JSON property `unclaim`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::PartnerUnclaim]
        attr_accessor :unclaim
      
        # Identifies metdata updates to one device.
        # Corresponds to the JSON property `updateMetadata`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::UpdateMetadataArguments]
        attr_accessor :update_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @claim = args[:claim] if args.key?(:claim)
          @result = args[:result] if args.key?(:result)
          @unclaim = args[:unclaim] if args.key?(:unclaim)
          @update_metadata = args[:update_metadata] if args.key?(:update_metadata)
        end
      end
      
      # Identifies one claim request.
      class PartnerClaim
        include Google::Apis::Core::Hashable
      
        # Required. The ID of the customer for whom the device is being claimed.
        # Corresponds to the JSON property `customerId`
        # @return [Fixnum]
        attr_accessor :customer_id
      
        # Encapsulates hardware and product IDs to identify a manufactured device.
        # To understand requirements on identifier sets, read
        # [Identifiers](/zero-touch/guides/identifiers).
        # Corresponds to the JSON property `deviceIdentifier`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier]
        attr_accessor :device_identifier
      
        # Metadata entries that can be attached to a `Device`. To learn more, read
        # [Device metadata](/zero-touch/guides/metadata).
        # Corresponds to the JSON property `deviceMetadata`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata]
        attr_accessor :device_metadata
      
        # Required. The section type of the device's provisioning record.
        # Corresponds to the JSON property `sectionType`
        # @return [String]
        attr_accessor :section_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
          @device_identifier = args[:device_identifier] if args.key?(:device_identifier)
          @device_metadata = args[:device_metadata] if args.key?(:device_metadata)
          @section_type = args[:section_type] if args.key?(:section_type)
        end
      end
      
      # Identifies one unclaim request.
      class PartnerUnclaim
        include Google::Apis::Core::Hashable
      
        # Device ID of the device.
        # Corresponds to the JSON property `deviceId`
        # @return [Fixnum]
        attr_accessor :device_id
      
        # Encapsulates hardware and product IDs to identify a manufactured device.
        # To understand requirements on identifier sets, read
        # [Identifiers](/zero-touch/guides/identifiers).
        # Corresponds to the JSON property `deviceIdentifier`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier]
        attr_accessor :device_identifier
      
        # Required. The section type of the device's provisioning record.
        # Corresponds to the JSON property `sectionType`
        # @return [String]
        attr_accessor :section_type
      
        # The duration of the vacation unlock starting from when the request is
        # processed. (1 day is treated as 24 hours)
        # Corresponds to the JSON property `vacationModeDays`
        # @return [Fixnum]
        attr_accessor :vacation_mode_days
      
        # The expiration time of the vacation unlock.
        # Corresponds to the JSON property `vacationModeExpireTime`
        # @return [String]
        attr_accessor :vacation_mode_expire_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_id = args[:device_id] if args.key?(:device_id)
          @device_identifier = args[:device_identifier] if args.key?(:device_identifier)
          @section_type = args[:section_type] if args.key?(:section_type)
          @vacation_mode_days = args[:vacation_mode_days] if args.key?(:vacation_mode_days)
          @vacation_mode_expire_time = args[:vacation_mode_expire_time] if args.key?(:vacation_mode_expire_time)
        end
      end
      
      # Captures the processing status for each device in the operation.
      class PerDeviceStatusInBatch
        include Google::Apis::Core::Hashable
      
        # If processing succeeds, the device ID of the device.
        # Corresponds to the JSON property `deviceId`
        # @return [Fixnum]
        attr_accessor :device_id
      
        # If processing fails, the error type.
        # Corresponds to the JSON property `errorIdentifier`
        # @return [String]
        attr_accessor :error_identifier
      
        # If processing fails, a developer message explaining what went wrong.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # The result status of the device after processing.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_id = args[:device_id] if args.key?(:device_id)
          @error_identifier = args[:error_identifier] if args.key?(:error_identifier)
          @error_message = args[:error_message] if args.key?(:error_message)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details.  There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
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
      
      # Request message to unclaim a device.
      class UnclaimDeviceRequest
        include Google::Apis::Core::Hashable
      
        # The device ID returned by `ClaimDevice`.
        # Corresponds to the JSON property `deviceId`
        # @return [Fixnum]
        attr_accessor :device_id
      
        # Encapsulates hardware and product IDs to identify a manufactured device.
        # To understand requirements on identifier sets, read
        # [Identifiers](/zero-touch/guides/identifiers).
        # Corresponds to the JSON property `deviceIdentifier`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier]
        attr_accessor :device_identifier
      
        # Required. The section type of the device's provisioning record.
        # Corresponds to the JSON property `sectionType`
        # @return [String]
        attr_accessor :section_type
      
        # The duration of the vacation unlock starting from when the request is
        # processed. (1 day is treated as 24 hours)
        # Corresponds to the JSON property `vacationModeDays`
        # @return [Fixnum]
        attr_accessor :vacation_mode_days
      
        # The expiration time of the vacation unlock.
        # Corresponds to the JSON property `vacationModeExpireTime`
        # @return [String]
        attr_accessor :vacation_mode_expire_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_id = args[:device_id] if args.key?(:device_id)
          @device_identifier = args[:device_identifier] if args.key?(:device_identifier)
          @section_type = args[:section_type] if args.key?(:section_type)
          @vacation_mode_days = args[:vacation_mode_days] if args.key?(:vacation_mode_days)
          @vacation_mode_expire_time = args[:vacation_mode_expire_time] if args.key?(:vacation_mode_expire_time)
        end
      end
      
      # Request to unclaim devices asynchronously in batch.
      class UnclaimDevicesRequest
        include Google::Apis::Core::Hashable
      
        # Required. The list of devices to unclaim.
        # Corresponds to the JSON property `unclaims`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::PartnerUnclaim>]
        attr_accessor :unclaims
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @unclaims = args[:unclaims] if args.key?(:unclaims)
        end
      end
      
      # Request to update device metadata in batch.
      class UpdateDeviceMetadataInBatchRequest
        include Google::Apis::Core::Hashable
      
        # Required. The list of metadata updates.
        # Corresponds to the JSON property `updates`
        # @return [Array<Google::Apis::AndroiddeviceprovisioningV1::UpdateMetadataArguments>]
        attr_accessor :updates
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @updates = args[:updates] if args.key?(:updates)
        end
      end
      
      # Request to set metadata for a device.
      class UpdateDeviceMetadataRequest
        include Google::Apis::Core::Hashable
      
        # Metadata entries that can be attached to a `Device`. To learn more, read
        # [Device metadata](/zero-touch/guides/metadata).
        # Corresponds to the JSON property `deviceMetadata`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata]
        attr_accessor :device_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_metadata = args[:device_metadata] if args.key?(:device_metadata)
        end
      end
      
      # Identifies metdata updates to one device.
      class UpdateMetadataArguments
        include Google::Apis::Core::Hashable
      
        # Device ID of the device.
        # Corresponds to the JSON property `deviceId`
        # @return [Fixnum]
        attr_accessor :device_id
      
        # Encapsulates hardware and product IDs to identify a manufactured device.
        # To understand requirements on identifier sets, read
        # [Identifiers](/zero-touch/guides/identifiers).
        # Corresponds to the JSON property `deviceIdentifier`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceIdentifier]
        attr_accessor :device_identifier
      
        # Metadata entries that can be attached to a `Device`. To learn more, read
        # [Device metadata](/zero-touch/guides/metadata).
        # Corresponds to the JSON property `deviceMetadata`
        # @return [Google::Apis::AndroiddeviceprovisioningV1::DeviceMetadata]
        attr_accessor :device_metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_id = args[:device_id] if args.key?(:device_id)
          @device_identifier = args[:device_identifier] if args.key?(:device_identifier)
          @device_metadata = args[:device_metadata] if args.key?(:device_metadata)
        end
      end
    end
  end
end
