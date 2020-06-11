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
    module AdminDatatransferV1
      
      # The JSON template for an Application resource.
      class Application
        include Google::Apis::Core::Hashable
      
        # Etag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The application's ID.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies the resource as a DataTransfer Application Resource.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The application's name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The list of all possible transfer parameters for this application. These
        # parameters can be used to select the data of the user in this application to
        # be transferred.
        # Corresponds to the JSON property `transferParams`
        # @return [Array<Google::Apis::AdminDatatransferV1::ApplicationTransferParam>]
        attr_accessor :transfer_params
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @transfer_params = args[:transfer_params] if args.key?(:transfer_params)
        end
      end
      
      # Template to map fields of ApplicationDataTransfer resource.
      class ApplicationDataTransfer
        include Google::Apis::Core::Hashable
      
        # The application's ID.
        # Corresponds to the JSON property `applicationId`
        # @return [Fixnum]
        attr_accessor :application_id
      
        # The transfer parameters for the application. These parameters are used to
        # select the data which will get transferred in context of this application.
        # Corresponds to the JSON property `applicationTransferParams`
        # @return [Array<Google::Apis::AdminDatatransferV1::ApplicationTransferParam>]
        attr_accessor :application_transfer_params
      
        # Current status of transfer for this application. (Read-only)
        # Corresponds to the JSON property `applicationTransferStatus`
        # @return [String]
        attr_accessor :application_transfer_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @application_id = args[:application_id] if args.key?(:application_id)
          @application_transfer_params = args[:application_transfer_params] if args.key?(:application_transfer_params)
          @application_transfer_status = args[:application_transfer_status] if args.key?(:application_transfer_status)
        end
      end
      
      # Template for application transfer parameters.
      class ApplicationTransferParam
        include Google::Apis::Core::Hashable
      
        # The type of the transfer parameter. eg: 'PRIVACY_LEVEL'
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # The value of the corresponding transfer parameter. eg: 'PRIVATE' or 'SHARED'
        # Corresponds to the JSON property `value`
        # @return [Array<String>]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Template for a collection of Applications.
      class ApplicationsListResponse
        include Google::Apis::Core::Hashable
      
        # List of applications that support data transfer and are also installed for the
        # customer.
        # Corresponds to the JSON property `applications`
        # @return [Array<Google::Apis::AdminDatatransferV1::Application>]
        attr_accessor :applications
      
        # ETag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Identifies the resource as a collection of Applications.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Continuation token which will be used to specify next page in list API.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @applications = args[:applications] if args.key?(:applications)
          @etag = args[:etag] if args.key?(:etag)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The JSON template for a DataTransfer resource.
      class DataTransfer
        include Google::Apis::Core::Hashable
      
        # List of per application data transfer resources. It contains data transfer
        # details of the applications associated with this transfer resource. Note that
        # this list is also used to specify the applications for which data transfer has
        # to be done at the time of the transfer resource creation.
        # Corresponds to the JSON property `applicationDataTransfers`
        # @return [Array<Google::Apis::AdminDatatransferV1::ApplicationDataTransfer>]
        attr_accessor :application_data_transfers
      
        # ETag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The transfer's ID (Read-only).
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies the resource as a DataTransfer request.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # ID of the user to whom the data is being transferred.
        # Corresponds to the JSON property `newOwnerUserId`
        # @return [String]
        attr_accessor :new_owner_user_id
      
        # ID of the user whose data is being transferred.
        # Corresponds to the JSON property `oldOwnerUserId`
        # @return [String]
        attr_accessor :old_owner_user_id
      
        # Overall transfer status (Read-only).
        # Corresponds to the JSON property `overallTransferStatusCode`
        # @return [String]
        attr_accessor :overall_transfer_status_code
      
        # The time at which the data transfer was requested (Read-only).
        # Corresponds to the JSON property `requestTime`
        # @return [DateTime]
        attr_accessor :request_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @application_data_transfers = args[:application_data_transfers] if args.key?(:application_data_transfers)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @new_owner_user_id = args[:new_owner_user_id] if args.key?(:new_owner_user_id)
          @old_owner_user_id = args[:old_owner_user_id] if args.key?(:old_owner_user_id)
          @overall_transfer_status_code = args[:overall_transfer_status_code] if args.key?(:overall_transfer_status_code)
          @request_time = args[:request_time] if args.key?(:request_time)
        end
      end
      
      # Template for a collection of DataTransfer resources.
      class DataTransfersListResponse
        include Google::Apis::Core::Hashable
      
        # List of data transfer requests.
        # Corresponds to the JSON property `dataTransfers`
        # @return [Array<Google::Apis::AdminDatatransferV1::DataTransfer>]
        attr_accessor :data_transfers
      
        # ETag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Identifies the resource as a collection of data transfer requests.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Continuation token which will be used to specify next page in list API.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_transfers = args[:data_transfers] if args.key?(:data_transfers)
          @etag = args[:etag] if args.key?(:etag)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
    end
  end
end
