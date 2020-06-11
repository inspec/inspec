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
    module AppsmarketV2
      
      # 
      class CustomerLicense
        include Google::Apis::Core::Hashable
      
        # The ID of the application corresponding to this license query.
        # Corresponds to the JSON property `applicationId`
        # @return [String]
        attr_accessor :application_id
      
        # The domain name of the customer.
        # Corresponds to the JSON property `customerId`
        # @return [String]
        attr_accessor :customer_id
      
        # (Deprecated)
        # Corresponds to the JSON property `editions`
        # @return [Array<Google::Apis::AppsmarketV2::CustomerLicense::Edition>]
        attr_accessor :editions
      
        # The ID of the customer license.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The type of API resource. This is always appsmarket#customerLicense.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The customer's license status.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @application_id = args[:application_id] if args.key?(:application_id)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
          @editions = args[:editions] if args.key?(:editions)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @state = args[:state] if args.key?(:state)
        end
        
        # 
        class Edition
          include Google::Apis::Core::Hashable
        
          # (Deprecated)
          # Corresponds to the JSON property `assignedSeats`
          # @return [Fixnum]
          attr_accessor :assigned_seats
        
          # (Deprecated)
          # Corresponds to the JSON property `editionId`
          # @return [String]
          attr_accessor :edition_id
        
          # (Deprecated)
          # Corresponds to the JSON property `seatCount`
          # @return [Fixnum]
          attr_accessor :seat_count
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @assigned_seats = args[:assigned_seats] if args.key?(:assigned_seats)
            @edition_id = args[:edition_id] if args.key?(:edition_id)
            @seat_count = args[:seat_count] if args.key?(:seat_count)
          end
        end
      end
      
      # 
      class LicenseNotification
        include Google::Apis::Core::Hashable
      
        # The ID of the application according to this notification.
        # Corresponds to the JSON property `applicationId`
        # @return [String]
        attr_accessor :application_id
      
        # The domain name of the customer corresponding to this notification.
        # Corresponds to the JSON property `customerId`
        # @return [String]
        attr_accessor :customer_id
      
        # The list of deletion notifications.
        # Corresponds to the JSON property `deletes`
        # @return [Array<Google::Apis::AppsmarketV2::LicenseNotification::Delete>]
        attr_accessor :deletes
      
        # The list of expiry notifications.
        # Corresponds to the JSON property `expiries`
        # @return [Array<Google::Apis::AppsmarketV2::LicenseNotification::Expiry>]
        attr_accessor :expiries
      
        # The ID of the license notification.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The type of API resource. This is always appsmarket#licenseNotification.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The list of provisioning notifications.
        # Corresponds to the JSON property `provisions`
        # @return [Array<Google::Apis::AppsmarketV2::LicenseNotification::Provision>]
        attr_accessor :provisions
      
        # The list of reassignment notifications.
        # Corresponds to the JSON property `reassignments`
        # @return [Array<Google::Apis::AppsmarketV2::LicenseNotification::Reassignment>]
        attr_accessor :reassignments
      
        # The time the event occurred, measuring in milliseconds since the UNIX epoch.
        # Corresponds to the JSON property `timestamp`
        # @return [Fixnum]
        attr_accessor :timestamp
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @application_id = args[:application_id] if args.key?(:application_id)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
          @deletes = args[:deletes] if args.key?(:deletes)
          @expiries = args[:expiries] if args.key?(:expiries)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @provisions = args[:provisions] if args.key?(:provisions)
          @reassignments = args[:reassignments] if args.key?(:reassignments)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
        end
        
        # 
        class Delete
          include Google::Apis::Core::Hashable
        
          # (Deprecated)
          # Corresponds to the JSON property `editionId`
          # @return [String]
          attr_accessor :edition_id
        
          # 
          # Corresponds to the JSON property `kind`
          # @return [String]
          attr_accessor :kind
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @edition_id = args[:edition_id] if args.key?(:edition_id)
            @kind = args[:kind] if args.key?(:kind)
          end
        end
        
        # 
        class Expiry
          include Google::Apis::Core::Hashable
        
          # (Deprecated)
          # Corresponds to the JSON property `editionId`
          # @return [String]
          attr_accessor :edition_id
        
          # 
          # Corresponds to the JSON property `kind`
          # @return [String]
          attr_accessor :kind
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @edition_id = args[:edition_id] if args.key?(:edition_id)
            @kind = args[:kind] if args.key?(:kind)
          end
        end
        
        # 
        class Provision
          include Google::Apis::Core::Hashable
        
          # (Deprecated)
          # Corresponds to the JSON property `editionId`
          # @return [String]
          attr_accessor :edition_id
        
          # 
          # Corresponds to the JSON property `kind`
          # @return [String]
          attr_accessor :kind
        
          # The number of seats that were provisioned.
          # Corresponds to the JSON property `seatCount`
          # @return [Fixnum]
          attr_accessor :seat_count
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @edition_id = args[:edition_id] if args.key?(:edition_id)
            @kind = args[:kind] if args.key?(:kind)
            @seat_count = args[:seat_count] if args.key?(:seat_count)
          end
        end
        
        # 
        class Reassignment
          include Google::Apis::Core::Hashable
        
          # (Deprecated)
          # Corresponds to the JSON property `editionId`
          # @return [String]
          attr_accessor :edition_id
        
          # 
          # Corresponds to the JSON property `kind`
          # @return [String]
          attr_accessor :kind
        
          # 
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          # The email address of the reassigned user.
          # Corresponds to the JSON property `userId`
          # @return [String]
          attr_accessor :user_id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @edition_id = args[:edition_id] if args.key?(:edition_id)
            @kind = args[:kind] if args.key?(:kind)
            @type = args[:type] if args.key?(:type)
            @user_id = args[:user_id] if args.key?(:user_id)
          end
        end
      end
      
      # 
      class LicenseNotificationList
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The token used to continue querying for notifications after the final
        # notification in the current result set.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of notifications. One or more of:
        # - provisions -- A new license of the application has been provisioned.
        # - expiries -- A license of the application has expired.
        # - deletions -- An application has been deleted from a domain.
        # - reassignments -- An administrator has assigned or revoked a seat license for
        # the application on the provided domain.
        # Corresponds to the JSON property `notifications`
        # @return [Array<Google::Apis::AppsmarketV2::LicenseNotification>]
        attr_accessor :notifications
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @notifications = args[:notifications] if args.key?(:notifications)
        end
      end
      
      # 
      class UserLicense
        include Google::Apis::Core::Hashable
      
        # The ID of the application corresponding to the license query.
        # Corresponds to the JSON property `applicationId`
        # @return [String]
        attr_accessor :application_id
      
        # The domain name of the user.
        # Corresponds to the JSON property `customerId`
        # @return [String]
        attr_accessor :customer_id
      
        # (Deprecated)
        # Corresponds to the JSON property `editionId`
        # @return [String]
        attr_accessor :edition_id
      
        # The domain administrator has activated the application for this domain.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # The ID of user license.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The type of API resource. This is always appsmarket#userLicense.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The user's licensing status. One of:
        # - ACTIVE -- The user has a valid license and should be permitted to use the
        # application.
        # - UNLICENSED -- The administrator of this user's domain never assigned a seat
        # for the application to this user.
        # - EXPIRED -- The administrator assigned a seat to this user, but the license
        # is expired.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The email address of the user.
        # Corresponds to the JSON property `userId`
        # @return [String]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @application_id = args[:application_id] if args.key?(:application_id)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
          @edition_id = args[:edition_id] if args.key?(:edition_id)
          @enabled = args[:enabled] if args.key?(:enabled)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @state = args[:state] if args.key?(:state)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
    end
  end
end
