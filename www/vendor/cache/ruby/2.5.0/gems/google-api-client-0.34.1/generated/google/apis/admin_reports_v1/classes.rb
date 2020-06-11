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
    module AdminReportsV1
      
      # JSON template for a collection of activites.
      class Activities
        include Google::Apis::Core::Hashable
      
        # ETag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Each activity record in the response.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AdminReportsV1::Activity>]
        attr_accessor :items
      
        # The type of API resource. For an activity report, the value is reports#
        # activities.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token for retrieving the follow-on next page of the report. The nextPageToken
        # value is used in the request's pageToken query string.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # JSON template for the activity resource.
      class Activity
        include Google::Apis::Core::Hashable
      
        # User doing the action.
        # Corresponds to the JSON property `actor`
        # @return [Google::Apis::AdminReportsV1::Activity::Actor]
        attr_accessor :actor
      
        # ETag of the entry.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Activity events in the report.
        # Corresponds to the JSON property `events`
        # @return [Array<Google::Apis::AdminReportsV1::Activity::Event>]
        attr_accessor :events
      
        # Unique identifier for each activity record.
        # Corresponds to the JSON property `id`
        # @return [Google::Apis::AdminReportsV1::Activity::Id]
        attr_accessor :id
      
        # IP address of the user doing the action. This is the Internet Protocol (IP)
        # address of the user when logging into G Suite which may or may not reflect the
        # user's physical location. For example, the IP address can be the user's proxy
        # server's address or a virtual private network (VPN) address. The API supports
        # IPv4 and IPv6.
        # Corresponds to the JSON property `ipAddress`
        # @return [String]
        attr_accessor :ip_address
      
        # The type of API resource. For an activity report, the value is audit#activity.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # This is the domain that is affected by the report's event. For example domain
        # of Admin console or the Drive application's document owner.
        # Corresponds to the JSON property `ownerDomain`
        # @return [String]
        attr_accessor :owner_domain
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @actor = args[:actor] if args.key?(:actor)
          @etag = args[:etag] if args.key?(:etag)
          @events = args[:events] if args.key?(:events)
          @id = args[:id] if args.key?(:id)
          @ip_address = args[:ip_address] if args.key?(:ip_address)
          @kind = args[:kind] if args.key?(:kind)
          @owner_domain = args[:owner_domain] if args.key?(:owner_domain)
        end
        
        # User doing the action.
        class Actor
          include Google::Apis::Core::Hashable
        
          # The type of actor.
          # Corresponds to the JSON property `callerType`
          # @return [String]
          attr_accessor :caller_type
        
          # The primary email address of the actor. May be absent if there is no email
          # address associated with the actor.
          # Corresponds to the JSON property `email`
          # @return [String]
          attr_accessor :email
        
          # Only present when callerType is KEY. Can be the consumer_key of the requestor
          # for OAuth 2LO API requests or an identifier for robot accounts.
          # Corresponds to the JSON property `key`
          # @return [String]
          attr_accessor :key
        
          # The unique G Suite profile ID of the actor. May be absent if the actor is not
          # a G Suite user.
          # Corresponds to the JSON property `profileId`
          # @return [String]
          attr_accessor :profile_id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @caller_type = args[:caller_type] if args.key?(:caller_type)
            @email = args[:email] if args.key?(:email)
            @key = args[:key] if args.key?(:key)
            @profile_id = args[:profile_id] if args.key?(:profile_id)
          end
        end
        
        # 
        class Event
          include Google::Apis::Core::Hashable
        
          # Name of the event. This is the specific name of the activity reported by the
          # API. And each eventName is related to a specific G Suite service or feature
          # which the API organizes into types of events.
          # For eventName request parameters in general:
          # - If no eventName is given, the report returns all possible instances of an
          # eventName.
          # - When you request an eventName, the API's response returns all activities
          # which contain that eventName. It is possible that the returned activities will
          # have other eventName properties in addition to the one requested.
          # For more information about eventName properties, see the list of event names
          # for various applications above in applicationName.
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          # Parameter value pairs for various applications. For more information about
          # eventName parameters, see the list of event names for various applications
          # above in applicationName.
          # Corresponds to the JSON property `parameters`
          # @return [Array<Google::Apis::AdminReportsV1::Activity::Event::Parameter>]
          attr_accessor :parameters
        
          # Type of event. The G Suite service or feature that an administrator changes is
          # identified in the type property which identifies an event using the eventName
          # property. For a full list of the API's type categories, see the list of event
          # names for various applications above in applicationName.
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @name = args[:name] if args.key?(:name)
            @parameters = args[:parameters] if args.key?(:parameters)
            @type = args[:type] if args.key?(:type)
          end
          
          # 
          class Parameter
            include Google::Apis::Core::Hashable
          
            # Boolean value of the parameter.
            # Corresponds to the JSON property `boolValue`
            # @return [Boolean]
            attr_accessor :bool_value
            alias_method :bool_value?, :bool_value
          
            # Integer value of the parameter.
            # Corresponds to the JSON property `intValue`
            # @return [Fixnum]
            attr_accessor :int_value
          
            # Nested parameter value pairs associated with this parameter. Complex value
            # type for a parameter are returned as a list of parameter values. For example,
            # the address parameter may have a value as [`parameter: [`name: city, value:
            # abc`]`]
            # Corresponds to the JSON property `messageValue`
            # @return [Google::Apis::AdminReportsV1::Activity::Event::Parameter::MessageValue]
            attr_accessor :message_value
          
            # Integer values of the parameter.
            # Corresponds to the JSON property `multiIntValue`
            # @return [Array<Fixnum>]
            attr_accessor :multi_int_value
          
            # List of messageValue objects.
            # Corresponds to the JSON property `multiMessageValue`
            # @return [Array<Google::Apis::AdminReportsV1::Activity::Event::Parameter::MultiMessageValue>]
            attr_accessor :multi_message_value
          
            # String values of the parameter.
            # Corresponds to the JSON property `multiValue`
            # @return [Array<String>]
            attr_accessor :multi_value
          
            # The name of the parameter.
            # Corresponds to the JSON property `name`
            # @return [String]
            attr_accessor :name
          
            # String value of the parameter.
            # Corresponds to the JSON property `value`
            # @return [String]
            attr_accessor :value
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @bool_value = args[:bool_value] if args.key?(:bool_value)
              @int_value = args[:int_value] if args.key?(:int_value)
              @message_value = args[:message_value] if args.key?(:message_value)
              @multi_int_value = args[:multi_int_value] if args.key?(:multi_int_value)
              @multi_message_value = args[:multi_message_value] if args.key?(:multi_message_value)
              @multi_value = args[:multi_value] if args.key?(:multi_value)
              @name = args[:name] if args.key?(:name)
              @value = args[:value] if args.key?(:value)
            end
            
            # Nested parameter value pairs associated with this parameter. Complex value
            # type for a parameter are returned as a list of parameter values. For example,
            # the address parameter may have a value as [`parameter: [`name: city, value:
            # abc`]`]
            class MessageValue
              include Google::Apis::Core::Hashable
            
              # Parameter values
              # Corresponds to the JSON property `parameter`
              # @return [Array<Google::Apis::AdminReportsV1::NestedParameter>]
              attr_accessor :parameter
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @parameter = args[:parameter] if args.key?(:parameter)
              end
            end
            
            # 
            class MultiMessageValue
              include Google::Apis::Core::Hashable
            
              # Parameter values
              # Corresponds to the JSON property `parameter`
              # @return [Array<Google::Apis::AdminReportsV1::NestedParameter>]
              attr_accessor :parameter
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @parameter = args[:parameter] if args.key?(:parameter)
              end
            end
          end
        end
        
        # Unique identifier for each activity record.
        class Id
          include Google::Apis::Core::Hashable
        
          # Application name to which the event belongs. For possible values see the list
          # of applications above in applicationName.
          # Corresponds to the JSON property `applicationName`
          # @return [String]
          attr_accessor :application_name
        
          # The unique identifier for a G suite account.
          # Corresponds to the JSON property `customerId`
          # @return [String]
          attr_accessor :customer_id
        
          # Time of occurrence of the activity. This is in UNIX epoch time in seconds.
          # Corresponds to the JSON property `time`
          # @return [DateTime]
          attr_accessor :time
        
          # Unique qualifier if multiple events have the same time.
          # Corresponds to the JSON property `uniqueQualifier`
          # @return [Fixnum]
          attr_accessor :unique_qualifier
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @application_name = args[:application_name] if args.key?(:application_name)
            @customer_id = args[:customer_id] if args.key?(:customer_id)
            @time = args[:time] if args.key?(:time)
            @unique_qualifier = args[:unique_qualifier] if args.key?(:unique_qualifier)
          end
        end
      end
      
      # An notification channel used to watch for resource changes.
      class Channel
        include Google::Apis::Core::Hashable
      
        # The address where notifications are delivered for this channel.
        # Corresponds to the JSON property `address`
        # @return [String]
        attr_accessor :address
      
        # Date and time of notification channel expiration, expressed as a Unix
        # timestamp, in milliseconds. Optional.
        # Corresponds to the JSON property `expiration`
        # @return [Fixnum]
        attr_accessor :expiration
      
        # A UUID or similar unique string that identifies this channel.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies this as a notification channel used to watch for changes to a
        # resource, which is "api#channel".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Additional parameters controlling delivery channel behavior. Optional.
        # Corresponds to the JSON property `params`
        # @return [Hash<String,String>]
        attr_accessor :params
      
        # A Boolean value to indicate whether payload is wanted. Optional.
        # Corresponds to the JSON property `payload`
        # @return [Boolean]
        attr_accessor :payload
        alias_method :payload?, :payload
      
        # An opaque ID that identifies the resource being watched on this channel.
        # Stable across different API versions.
        # Corresponds to the JSON property `resourceId`
        # @return [String]
        attr_accessor :resource_id
      
        # A version-specific identifier for the watched resource.
        # Corresponds to the JSON property `resourceUri`
        # @return [String]
        attr_accessor :resource_uri
      
        # An arbitrary string delivered to the target address with each notification
        # delivered over this channel. Optional.
        # Corresponds to the JSON property `token`
        # @return [String]
        attr_accessor :token
      
        # The type of delivery mechanism used for this channel.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @address = args[:address] if args.key?(:address)
          @expiration = args[:expiration] if args.key?(:expiration)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @params = args[:params] if args.key?(:params)
          @payload = args[:payload] if args.key?(:payload)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
          @resource_uri = args[:resource_uri] if args.key?(:resource_uri)
          @token = args[:token] if args.key?(:token)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # JSON template for a parameter used in various reports.
      class NestedParameter
        include Google::Apis::Core::Hashable
      
        # Boolean value of the parameter.
        # Corresponds to the JSON property `boolValue`
        # @return [Boolean]
        attr_accessor :bool_value
        alias_method :bool_value?, :bool_value
      
        # Integer value of the parameter.
        # Corresponds to the JSON property `intValue`
        # @return [Fixnum]
        attr_accessor :int_value
      
        # Multiple boolean values of the parameter.
        # Corresponds to the JSON property `multiBoolValue`
        # @return [Array<Boolean>]
        attr_accessor :multi_bool_value
      
        # Multiple integer values of the parameter.
        # Corresponds to the JSON property `multiIntValue`
        # @return [Array<Fixnum>]
        attr_accessor :multi_int_value
      
        # Multiple string values of the parameter.
        # Corresponds to the JSON property `multiValue`
        # @return [Array<String>]
        attr_accessor :multi_value
      
        # The name of the parameter.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # String value of the parameter.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bool_value = args[:bool_value] if args.key?(:bool_value)
          @int_value = args[:int_value] if args.key?(:int_value)
          @multi_bool_value = args[:multi_bool_value] if args.key?(:multi_bool_value)
          @multi_int_value = args[:multi_int_value] if args.key?(:multi_int_value)
          @multi_value = args[:multi_value] if args.key?(:multi_value)
          @name = args[:name] if args.key?(:name)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # JSON template for a usage report.
      class UsageReport
        include Google::Apis::Core::Hashable
      
        # The date of the report request.
        # Corresponds to the JSON property `date`
        # @return [String]
        attr_accessor :date
      
        # Information about the type of the item.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::AdminReportsV1::UsageReport::Entity]
        attr_accessor :entity
      
        # ETag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The type of API resource. For a usage report, the value is admin#reports#
        # usageReport.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Parameter value pairs for various applications. For the Customers usage report
        # parameters and values, see the customer usage parameters reference.
        # Corresponds to the JSON property `parameters`
        # @return [Array<Google::Apis::AdminReportsV1::UsageReport::Parameter>]
        attr_accessor :parameters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date = args[:date] if args.key?(:date)
          @entity = args[:entity] if args.key?(:entity)
          @etag = args[:etag] if args.key?(:etag)
          @kind = args[:kind] if args.key?(:kind)
          @parameters = args[:parameters] if args.key?(:parameters)
        end
        
        # Information about the type of the item.
        class Entity
          include Google::Apis::Core::Hashable
        
          # The unique identifier of the customer's account.
          # Corresponds to the JSON property `customerId`
          # @return [String]
          attr_accessor :customer_id
        
          # Object key. Only relevant if entity.type = "OBJECT" Note: external-facing name
          # of report is "Entities" rather than "Objects".
          # Corresponds to the JSON property `entityId`
          # @return [String]
          attr_accessor :entity_id
        
          # The user's immutable G Suite profile identifier.
          # Corresponds to the JSON property `profileId`
          # @return [String]
          attr_accessor :profile_id
        
          # The type of item. The value is customer.
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          # The user's email address. Only relevant if entity.type = "USER"
          # Corresponds to the JSON property `userEmail`
          # @return [String]
          attr_accessor :user_email
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @customer_id = args[:customer_id] if args.key?(:customer_id)
            @entity_id = args[:entity_id] if args.key?(:entity_id)
            @profile_id = args[:profile_id] if args.key?(:profile_id)
            @type = args[:type] if args.key?(:type)
            @user_email = args[:user_email] if args.key?(:user_email)
          end
        end
        
        # 
        class Parameter
          include Google::Apis::Core::Hashable
        
          # Boolean value of the parameter.
          # Corresponds to the JSON property `boolValue`
          # @return [Boolean]
          attr_accessor :bool_value
          alias_method :bool_value?, :bool_value
        
          # The RFC 3339 formatted value of the parameter, for example 2010-10-28T10:26:35.
          # 000Z.
          # Corresponds to the JSON property `datetimeValue`
          # @return [DateTime]
          attr_accessor :datetime_value
        
          # Integer value of the parameter.
          # Corresponds to the JSON property `intValue`
          # @return [Fixnum]
          attr_accessor :int_value
        
          # Nested message value of the parameter.
          # Corresponds to the JSON property `msgValue`
          # @return [Array<Hash<String,Object>>]
          attr_accessor :msg_value
        
          # 
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          # String value of the parameter.
          # Corresponds to the JSON property `stringValue`
          # @return [String]
          attr_accessor :string_value
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @bool_value = args[:bool_value] if args.key?(:bool_value)
            @datetime_value = args[:datetime_value] if args.key?(:datetime_value)
            @int_value = args[:int_value] if args.key?(:int_value)
            @msg_value = args[:msg_value] if args.key?(:msg_value)
            @name = args[:name] if args.key?(:name)
            @string_value = args[:string_value] if args.key?(:string_value)
          end
        end
      end
      
      # 
      class UsageReports
        include Google::Apis::Core::Hashable
      
        # ETag of the resource.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The type of API resource. For a usage report, the value is admin#reports#
        # usageReports.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token to specify next page. A report with multiple pages has a nextPageToken
        # property in the response. For your follow-on requests getting all of the
        # report's pages, enter the nextPageToken value in the pageToken query string.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Various application parameter records.
        # Corresponds to the JSON property `usageReports`
        # @return [Array<Google::Apis::AdminReportsV1::UsageReport>]
        attr_accessor :usage_reports
      
        # Warnings, if any.
        # Corresponds to the JSON property `warnings`
        # @return [Array<Google::Apis::AdminReportsV1::UsageReports::Warning>]
        attr_accessor :warnings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @usage_reports = args[:usage_reports] if args.key?(:usage_reports)
          @warnings = args[:warnings] if args.key?(:warnings)
        end
        
        # 
        class Warning
          include Google::Apis::Core::Hashable
        
          # Machine readable code or warning type. The warning code value is 200.
          # Corresponds to the JSON property `code`
          # @return [String]
          attr_accessor :code
        
          # Key-value pairs to give detailed information on the warning.
          # Corresponds to the JSON property `data`
          # @return [Array<Google::Apis::AdminReportsV1::UsageReports::Warning::Datum>]
          attr_accessor :data
        
          # The human readable messages for a warning are:
          # - Data is not available warning - Sorry, data for date yyyy-mm-dd for
          # application "application name" is not available.
          # - Partial data is available warning - Data for date yyyy-mm-dd for application
          # "application name" is not available right now, please try again after a few
          # hours.
          # Corresponds to the JSON property `message`
          # @return [String]
          attr_accessor :message
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @code = args[:code] if args.key?(:code)
            @data = args[:data] if args.key?(:data)
            @message = args[:message] if args.key?(:message)
          end
          
          # 
          class Datum
            include Google::Apis::Core::Hashable
          
            # Key associated with a key-value pair to give detailed information on the
            # warning.
            # Corresponds to the JSON property `key`
            # @return [String]
            attr_accessor :key
          
            # Value associated with a key-value pair to give detailed information on the
            # warning.
            # Corresponds to the JSON property `value`
            # @return [String]
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
        end
      end
    end
  end
end
