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
    module CloudsearchV1
      
      # Used to provide a search operator for boolean properties. This is
      # optional. Search operators let users restrict the query to specific fields
      # relevant to the type of item being searched.
      class BooleanOperatorOptions
        include Google::Apis::Core::Hashable
      
        # Indicates the operator name required in the query in order to isolate the
        # boolean property. For example, if operatorName is *closed* and the
        # property's name is *isClosed*, then queries like
        # *closed:&lt;value&gt;* will show results only where the value of the
        # property named *isClosed* matches *&lt;value&gt;*. By contrast, a
        # search that uses the same *&lt;value&gt;* without an operator will return
        # all items where *&lt;value&gt;* matches the value of any
        # String properties or text within the content field for the item.
        # The operator name can only contain lowercase letters (a-z).
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
        end
      end
      
      # Options for boolean properties.
      class BooleanPropertyOptions
        include Google::Apis::Core::Hashable
      
        # Used to provide a search operator for boolean properties. This is
        # optional. Search operators let users restrict the query to specific fields
        # relevant to the type of item being searched.
        # Corresponds to the JSON property `operatorOptions`
        # @return [Google::Apis::CloudsearchV1::BooleanOperatorOptions]
        attr_accessor :operator_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operator_options = args[:operator_options] if args.key?(:operator_options)
        end
      end
      
      # 
      class CheckAccessResponse
        include Google::Apis::Core::Hashable
      
        # Returns true if principal has access.  Returns false otherwise.
        # Corresponds to the JSON property `hasAccess`
        # @return [Boolean]
        attr_accessor :has_access
        alias_method :has_access?, :has_access
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @has_access = args[:has_access] if args.key?(:has_access)
        end
      end
      
      # 
      class CompositeFilter
        include Google::Apis::Core::Hashable
      
        # The logic operator of the sub filter.
        # Corresponds to the JSON property `logicOperator`
        # @return [String]
        attr_accessor :logic_operator
      
        # Sub filters.
        # Corresponds to the JSON property `subFilters`
        # @return [Array<Google::Apis::CloudsearchV1::Filter>]
        attr_accessor :sub_filters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @logic_operator = args[:logic_operator] if args.key?(:logic_operator)
          @sub_filters = args[:sub_filters] if args.key?(:sub_filters)
        end
      end
      
      # Aggregation of items by status code as of the specified date.
      class CustomerIndexStats
        include Google::Apis::Core::Hashable
      
        # Represents a whole calendar date, for example a date of birth. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the [Proleptic Gregorian Calendar](https://en.wikipedia.org/
        # wiki/Proleptic_Gregorian_calendar). The date must be a valid calendar date
        # between the year 1 and 9999.
        # Corresponds to the JSON property `date`
        # @return [Google::Apis::CloudsearchV1::Date]
        attr_accessor :date
      
        # Number of items aggregrated by status code.
        # Corresponds to the JSON property `itemCountByStatus`
        # @return [Array<Google::Apis::CloudsearchV1::ItemCountByStatus>]
        attr_accessor :item_count_by_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date = args[:date] if args.key?(:date)
          @item_count_by_status = args[:item_count_by_status] if args.key?(:item_count_by_status)
        end
      end
      
      # 
      class CustomerQueryStats
        include Google::Apis::Core::Hashable
      
        # Represents a whole calendar date, for example a date of birth. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the [Proleptic Gregorian Calendar](https://en.wikipedia.org/
        # wiki/Proleptic_Gregorian_calendar). The date must be a valid calendar date
        # between the year 1 and 9999.
        # Corresponds to the JSON property `date`
        # @return [Google::Apis::CloudsearchV1::Date]
        attr_accessor :date
      
        # 
        # Corresponds to the JSON property `queryCountByStatus`
        # @return [Array<Google::Apis::CloudsearchV1::QueryCountByStatus>]
        attr_accessor :query_count_by_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date = args[:date] if args.key?(:date)
          @query_count_by_status = args[:query_count_by_status] if args.key?(:query_count_by_status)
        end
      end
      
      # 
      class CustomerSessionStats
        include Google::Apis::Core::Hashable
      
        # Represents a whole calendar date, for example a date of birth. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the [Proleptic Gregorian Calendar](https://en.wikipedia.org/
        # wiki/Proleptic_Gregorian_calendar). The date must be a valid calendar date
        # between the year 1 and 9999.
        # Corresponds to the JSON property `date`
        # @return [Google::Apis::CloudsearchV1::Date]
        attr_accessor :date
      
        # The count of search sessions on the day
        # Corresponds to the JSON property `searchSessionsCount`
        # @return [Fixnum]
        attr_accessor :search_sessions_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date = args[:date] if args.key?(:date)
          @search_sessions_count = args[:search_sessions_count] if args.key?(:search_sessions_count)
        end
      end
      
      # 
      class CustomerUserStats
        include Google::Apis::Core::Hashable
      
        # Represents a whole calendar date, for example a date of birth. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the [Proleptic Gregorian Calendar](https://en.wikipedia.org/
        # wiki/Proleptic_Gregorian_calendar). The date must be a valid calendar date
        # between the year 1 and 9999.
        # Corresponds to the JSON property `date`
        # @return [Google::Apis::CloudsearchV1::Date]
        attr_accessor :date
      
        # The count of unique active users in the past one day
        # Corresponds to the JSON property `oneDayActiveUsersCount`
        # @return [Fixnum]
        attr_accessor :one_day_active_users_count
      
        # The count of unique active users in the past seven days
        # Corresponds to the JSON property `sevenDaysActiveUsersCount`
        # @return [Fixnum]
        attr_accessor :seven_days_active_users_count
      
        # The count of unique active users in the past thirty days
        # Corresponds to the JSON property `thirtyDaysActiveUsersCount`
        # @return [Fixnum]
        attr_accessor :thirty_days_active_users_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date = args[:date] if args.key?(:date)
          @one_day_active_users_count = args[:one_day_active_users_count] if args.key?(:one_day_active_users_count)
          @seven_days_active_users_count = args[:seven_days_active_users_count] if args.key?(:seven_days_active_users_count)
          @thirty_days_active_users_count = args[:thirty_days_active_users_count] if args.key?(:thirty_days_active_users_count)
        end
      end
      
      # Datasource is a logical namespace for items to be indexed.
      # All items must belong to a datasource.  This is the prerequisite before
      # items can be indexed into Cloud Search.
      class DataSource
        include Google::Apis::Core::Hashable
      
        # If true, Indexing API rejects any modification calls to this datasource
        # such as create, update, and delete.
        # Disabling this does not imply halting process of previously
        # accepted data.
        # Corresponds to the JSON property `disableModifications`
        # @return [Boolean]
        attr_accessor :disable_modifications
        alias_method :disable_modifications?, :disable_modifications
      
        # Disable serving any search or assist results.
        # Corresponds to the JSON property `disableServing`
        # @return [Boolean]
        attr_accessor :disable_serving
        alias_method :disable_serving?, :disable_serving
      
        # Required. Display name of the datasource
        # The maximum length is 300 characters.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # List of service accounts that have indexing access.
        # Corresponds to the JSON property `indexingServiceAccounts`
        # @return [Array<String>]
        attr_accessor :indexing_service_accounts
      
        # This field restricts visibility to items at the datasource level. Items
        # within the datasource are restricted to the union of users and groups
        # included in this field. Note that, this does not ensure access to a
        # specific item, as users need to have ACL permissions on the contained
        # items. This ensures a high level access on the entire datasource, and
        # that the individual items are not shared outside this visibility.
        # Corresponds to the JSON property `itemsVisibility`
        # @return [Array<Google::Apis::CloudsearchV1::GSuitePrincipal>]
        attr_accessor :items_visibility
      
        # Name of the datasource resource.
        # Format: datasources/`source_id`.
        # <br />The name is ignored when creating a datasource.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # IDs of the Long Running Operations (LROs) currently running for this
        # schema.
        # Corresponds to the JSON property `operationIds`
        # @return [Array<String>]
        attr_accessor :operation_ids
      
        # A short name or alias for the source.  This value will be used to match the
        # 'source' operator. For example, if the short name is *&lt;value&gt;* then
        # queries like *source:&lt;value&gt;* will only return results for this
        # source. The value must be unique across all datasources. The value must
        # only contain alphanumeric characters (a-zA-Z0-9). The value cannot start
        # with 'google' and cannot be one of the following: mail, gmail, docs, drive,
        # groups, sites, calendar, hangouts, gplus, keep, people, teams.
        # Its maximum length is 32 characters.
        # Corresponds to the JSON property `shortName`
        # @return [String]
        attr_accessor :short_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disable_modifications = args[:disable_modifications] if args.key?(:disable_modifications)
          @disable_serving = args[:disable_serving] if args.key?(:disable_serving)
          @display_name = args[:display_name] if args.key?(:display_name)
          @indexing_service_accounts = args[:indexing_service_accounts] if args.key?(:indexing_service_accounts)
          @items_visibility = args[:items_visibility] if args.key?(:items_visibility)
          @name = args[:name] if args.key?(:name)
          @operation_ids = args[:operation_ids] if args.key?(:operation_ids)
          @short_name = args[:short_name] if args.key?(:short_name)
        end
      end
      
      # Aggregation of items by status code as of the specified date.
      class DataSourceIndexStats
        include Google::Apis::Core::Hashable
      
        # Represents a whole calendar date, for example a date of birth. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the [Proleptic Gregorian Calendar](https://en.wikipedia.org/
        # wiki/Proleptic_Gregorian_calendar). The date must be a valid calendar date
        # between the year 1 and 9999.
        # Corresponds to the JSON property `date`
        # @return [Google::Apis::CloudsearchV1::Date]
        attr_accessor :date
      
        # Number of items aggregrated by status code.
        # Corresponds to the JSON property `itemCountByStatus`
        # @return [Array<Google::Apis::CloudsearchV1::ItemCountByStatus>]
        attr_accessor :item_count_by_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date = args[:date] if args.key?(:date)
          @item_count_by_status = args[:item_count_by_status] if args.key?(:item_count_by_status)
        end
      end
      
      # Restriction on Datasource.
      class DataSourceRestriction
        include Google::Apis::Core::Hashable
      
        # Filter options restricting the results. If multiple filters
        # are present, they are grouped by object type before joining.
        # Filters with the same object type are joined conjunctively, then
        # the resulting expressions are joined disjunctively.
        # The maximum number of elements is 20.
        # NOTE: Suggest API supports only few filters at the moment:
        # "objecttype", "type" and "mimetype".
        # For now, schema specific filters cannot be used to filter suggestions.
        # Corresponds to the JSON property `filterOptions`
        # @return [Array<Google::Apis::CloudsearchV1::FilterOptions>]
        attr_accessor :filter_options
      
        # Defines sources for the suggest/search APIs.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::CloudsearchV1::Source]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter_options = args[:filter_options] if args.key?(:filter_options)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # Represents a whole calendar date, for example a date of birth. The time of day
      # and time zone are either specified elsewhere or are not significant. The date
      # is relative to the [Proleptic Gregorian Calendar](https://en.wikipedia.org/
      # wiki/Proleptic_Gregorian_calendar). The date must be a valid calendar date
      # between the year 1 and 9999.
      class Date
        include Google::Apis::Core::Hashable
      
        # Day of month. Must be from 1 to 31 and valid for the year and month.
        # Corresponds to the JSON property `day`
        # @return [Fixnum]
        attr_accessor :day
      
        # Month of date. Must be from 1 to 12.
        # Corresponds to the JSON property `month`
        # @return [Fixnum]
        attr_accessor :month
      
        # Year of date. Must be from 1 to 9999.
        # Corresponds to the JSON property `year`
        # @return [Fixnum]
        attr_accessor :year
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @day = args[:day] if args.key?(:day)
          @month = args[:month] if args.key?(:month)
          @year = args[:year] if args.key?(:year)
        end
      end
      
      # Optional. Provides a search operator for date properties.
      # Search operators let users restrict the query to specific fields relevant
      # to the type of item being searched.
      class DateOperatorOptions
        include Google::Apis::Core::Hashable
      
        # Indicates the operator name required in the query in order to isolate the
        # date property using the greater-than operator. For example, if
        # greaterThanOperatorName is *closedafter* and the property's name is
        # *closeDate*, then queries like *closedafter:&lt;value&gt;* will
        # show results only where the value of the property named *closeDate* is
        # later than *&lt;value&gt;*.
        # The operator name can only contain lowercase letters (a-z).
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `greaterThanOperatorName`
        # @return [String]
        attr_accessor :greater_than_operator_name
      
        # Indicates the operator name required in the query in order to isolate the
        # date property using the less-than operator. For example, if
        # lessThanOperatorName is *closedbefore* and the property's name is
        # *closeDate*, then queries like *closedbefore:&lt;value&gt;* will
        # show results only where the value of the property named *closeDate* is
        # earlier than *&lt;value&gt;*.
        # The operator name can only contain lowercase letters (a-z).
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `lessThanOperatorName`
        # @return [String]
        attr_accessor :less_than_operator_name
      
        # Indicates the actual string required in the query in order to isolate the
        # date property. For example, suppose an issue tracking schema object
        # has a property named *closeDate* that specifies an operator with an
        # operatorName of *closedon*. For searches on that data, queries like
        # *closedon:&lt;value&gt;* will show results only where the value of the
        # *closeDate* property matches *&lt;value&gt;*. By contrast, a
        # search that uses the same *&lt;value&gt;* without an operator will return
        # all items where *&lt;value&gt;* matches the value of any String
        # properties or text within the content field for the indexed datasource.
        # The operator name can only contain lowercase letters (a-z).
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @greater_than_operator_name = args[:greater_than_operator_name] if args.key?(:greater_than_operator_name)
          @less_than_operator_name = args[:less_than_operator_name] if args.key?(:less_than_operator_name)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
        end
      end
      
      # Options for date properties.
      class DatePropertyOptions
        include Google::Apis::Core::Hashable
      
        # Optional. Provides a search operator for date properties.
        # Search operators let users restrict the query to specific fields relevant
        # to the type of item being searched.
        # Corresponds to the JSON property `operatorOptions`
        # @return [Google::Apis::CloudsearchV1::DateOperatorOptions]
        attr_accessor :operator_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operator_options = args[:operator_options] if args.key?(:operator_options)
        end
      end
      
      # List of date values.
      class DateValues
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `values`
        # @return [Array<Google::Apis::CloudsearchV1::Date>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # Shared request debug options for all cloudsearch RPC methods.
      class DebugOptions
        include Google::Apis::Core::Hashable
      
        # If you are asked by Google to help with debugging, set this field.
        # Otherwise, ignore this field.
        # Corresponds to the JSON property `enableDebugging`
        # @return [Boolean]
        attr_accessor :enable_debugging
        alias_method :enable_debugging?, :enable_debugging
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enable_debugging = args[:enable_debugging] if args.key?(:enable_debugging)
        end
      end
      
      # 
      class DeleteQueueItemsRequest
        include Google::Apis::Core::Hashable
      
        # Name of connector making this call.
        # <br />Format: datasources/`source_id`/connectors/`ID`
        # Corresponds to the JSON property `connectorName`
        # @return [String]
        attr_accessor :connector_name
      
        # Shared request debug options for all cloudsearch RPC methods.
        # Corresponds to the JSON property `debugOptions`
        # @return [Google::Apis::CloudsearchV1::DebugOptions]
        attr_accessor :debug_options
      
        # Name of a queue to delete items from.
        # Corresponds to the JSON property `queue`
        # @return [String]
        attr_accessor :queue
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @connector_name = args[:connector_name] if args.key?(:connector_name)
          @debug_options = args[:debug_options] if args.key?(:debug_options)
          @queue = args[:queue] if args.key?(:queue)
        end
      end
      
      # A reference to a top-level property within the object that should be
      # displayed in search results. The values of the chosen properties will be
      # displayed in the search results along with the
      # dislpay label
      # for that property if one is specified. If a display label is not specified,
      # only the values will be shown.
      class DisplayedProperty
        include Google::Apis::Core::Hashable
      
        # The name of the top-level property as defined in a property definition
        # for the object. If the name is not a defined property in the schema, an
        # error will be given when attempting to update the schema.
        # Corresponds to the JSON property `propertyName`
        # @return [String]
        attr_accessor :property_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @property_name = args[:property_name] if args.key?(:property_name)
        end
      end
      
      # Used to provide a search operator for double properties. This is
      # optional. Search operators let users restrict the query to specific fields
      # relevant to the type of item being searched.
      class DoubleOperatorOptions
        include Google::Apis::Core::Hashable
      
        # Indicates the operator name required in the query in order to use the
        # double property in sorting or as a facet.
        # The operator name can only contain lowercase letters (a-z).
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
        end
      end
      
      # Options for double properties.
      class DoublePropertyOptions
        include Google::Apis::Core::Hashable
      
        # Used to provide a search operator for double properties. This is
        # optional. Search operators let users restrict the query to specific fields
        # relevant to the type of item being searched.
        # Corresponds to the JSON property `operatorOptions`
        # @return [Google::Apis::CloudsearchV1::DoubleOperatorOptions]
        attr_accessor :operator_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operator_options = args[:operator_options] if args.key?(:operator_options)
        end
      end
      
      # List of double values.
      class DoubleValues
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `values`
        # @return [Array<Float>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # Drive follow-up search restricts (e.g. "followup:suggestions").
      class DriveFollowUpRestrict
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Drive location search restricts (e.g. "is:starred").
      class DriveLocationRestrict
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Drive mime-type search restricts (e.g. "type:pdf").
      class DriveMimeTypeRestrict
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The time span search restrict (e.g. "after:2017-09-11 before:2017-09-12").
      class DriveTimeSpanRestrict
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A person's email address.
      class EmailAddress
        include Google::Apis::Core::Hashable
      
        # The email address.
        # Corresponds to the JSON property `emailAddress`
        # @return [String]
        attr_accessor :email_address
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email_address = args[:email_address] if args.key?(:email_address)
        end
      end
      
      # Used to provide a search operator for enum properties. This is
      # optional. Search operators let users restrict the query to specific fields
      # relevant to the type of item being searched. For example, if you provide no
      # operator for a *priority* enum property with possible values *p0* and *p1*,
      # a query that contains the term *p0* will return items that have *p0* as the
      # value of the *priority* property, as well as any items that contain the
      # string *p0* in other fields. If you provide an operator name for the enum,
      # such as *priority*, then search users can use that operator to refine
      # results to only items that have *p0* as this property's value, with the
      # query *priority:p0*.
      class EnumOperatorOptions
        include Google::Apis::Core::Hashable
      
        # Indicates the operator name required in the query in order to isolate the
        # enum property. For example, if operatorName is *priority* and the
        # property's name is *priorityVal*, then queries like
        # *priority:&lt;value&gt;* will show results only where the value of the
        # property named *priorityVal* matches *&lt;value&gt;*. By contrast, a
        # search that uses the same *&lt;value&gt;* without an operator will return
        # all items where *&lt;value&gt;* matches the value of any String
        # properties or text within the content field for the item.
        # The operator name can only contain lowercase letters (a-z).
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
        end
      end
      
      # Options for enum properties, which allow you to define a restricted set of
      # strings to match user queries, set rankings for those string values, and
      # define an operator name to be paired with those strings so that users can
      # narrow results to only items with a specific value. For example, for items in
      # a request tracking system with priority information, you could define *p0* as
      # an allowable enum value and tie this enum to the operator name *priority* so
      # that search users could add *priority:p0* to their query to restrict the set
      # of results to only those items indexed with the value *p0*.
      class EnumPropertyOptions
        include Google::Apis::Core::Hashable
      
        # Used to provide a search operator for enum properties. This is
        # optional. Search operators let users restrict the query to specific fields
        # relevant to the type of item being searched. For example, if you provide no
        # operator for a *priority* enum property with possible values *p0* and *p1*,
        # a query that contains the term *p0* will return items that have *p0* as the
        # value of the *priority* property, as well as any items that contain the
        # string *p0* in other fields. If you provide an operator name for the enum,
        # such as *priority*, then search users can use that operator to refine
        # results to only items that have *p0* as this property's value, with the
        # query *priority:p0*.
        # Corresponds to the JSON property `operatorOptions`
        # @return [Google::Apis::CloudsearchV1::EnumOperatorOptions]
        attr_accessor :operator_options
      
        # Used to specify the ordered ranking for the enumeration that determines how
        # the integer values provided in the possible EnumValuePairs are used to rank
        # results. If specified, integer values must be provided for all possible
        # EnumValuePair values given for this property. Can only be used if
        # isRepeatable
        # is false.
        # Corresponds to the JSON property `orderedRanking`
        # @return [String]
        attr_accessor :ordered_ranking
      
        # The list of possible values for the enumeration property. All
        # EnumValuePairs must provide a string value. If you specify an integer value
        # for one EnumValuePair, then all possible EnumValuePairs must provide an
        # integer value. Both the string value and integer value must be unique over
        # all possible values. Once set, possible values cannot be removed or
        # modified. If you supply an ordered ranking and think you might insert
        # additional enum values in the future, leave gaps in the initial integer
        # values to allow adding a value in between previously registered values.
        # The maximum number of elements is 100.
        # Corresponds to the JSON property `possibleValues`
        # @return [Array<Google::Apis::CloudsearchV1::EnumValuePair>]
        attr_accessor :possible_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operator_options = args[:operator_options] if args.key?(:operator_options)
          @ordered_ranking = args[:ordered_ranking] if args.key?(:ordered_ranking)
          @possible_values = args[:possible_values] if args.key?(:possible_values)
        end
      end
      
      # The enumeration value pair defines two things: a required string value and
      # an optional integer value. The string value defines the necessary query
      # term required to retrieve that item, such as *p0* for a priority item.
      # The integer value determines the ranking of that string value relative
      # to other enumerated values for the same property. For example, you might
      # associate *p0* with *0* and define another enum pair such as *p1* and *1*.
      # You must use the integer value in combination with
      # ordered
      # ranking to
      # set the ranking of a given value relative to other enumerated values for
      # the same property name. Here, a ranking order of DESCENDING for *priority*
      # properties results in a ranking boost for items indexed with a value of
      # *p0* compared to items indexed with a value of *p1*. Without a specified
      # ranking order, the integer value has no effect on item ranking.
      class EnumValuePair
        include Google::Apis::Core::Hashable
      
        # The integer value of the EnumValuePair which must be non-negative.
        # Optional.
        # Corresponds to the JSON property `integerValue`
        # @return [Fixnum]
        attr_accessor :integer_value
      
        # The string value of the EnumValuePair.
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `stringValue`
        # @return [String]
        attr_accessor :string_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @integer_value = args[:integer_value] if args.key?(:integer_value)
          @string_value = args[:string_value] if args.key?(:string_value)
        end
      end
      
      # List of enum values.
      class EnumValues
        include Google::Apis::Core::Hashable
      
        # The maximum allowable length for string values is 32 characters.
        # Corresponds to the JSON property `values`
        # @return [Array<String>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # Error information about the response.
      class ErrorInfo
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `errorMessages`
        # @return [Array<Google::Apis::CloudsearchV1::ErrorMessage>]
        attr_accessor :error_messages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_messages = args[:error_messages] if args.key?(:error_messages)
        end
      end
      
      # Error message per source response.
      class ErrorMessage
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # Defines sources for the suggest/search APIs.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::CloudsearchV1::Source]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_message = args[:error_message] if args.key?(:error_message)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # A bucket in a facet is the basic unit of operation. A bucket can comprise
      # either a single value OR a contiguous range of values, depending on the
      # type of the field bucketed.
      # FacetBucket is currently used only for returning the response object.
      class FacetBucket
        include Google::Apis::Core::Hashable
      
        # Number of results that match the bucket value. Counts are only returned
        # for searches when count accuracy is ensured. Can be empty.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # Percent of results that match the bucket value. This value is between
        # (0-100]. Percentages are returned for all searches, but are an estimate.
        # Because percentages are always returned, you should render percentages
        # instead of counts.
        # Corresponds to the JSON property `percentage`
        # @return [Fixnum]
        attr_accessor :percentage
      
        # Definition of a single value with generic type.
        # Corresponds to the JSON property `value`
        # @return [Google::Apis::CloudsearchV1::Value]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @percentage = args[:percentage] if args.key?(:percentage)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Specifies operators to return facet results for. There will be one
      # FacetResult for every source_name/object_type/operator_name combination.
      class FacetOptions
        include Google::Apis::Core::Hashable
      
        # Maximum number of facet buckets that should be returned for this facet.
        # Defaults to 10.
        # Maximum value is 100.
        # Corresponds to the JSON property `numFacetBuckets`
        # @return [Fixnum]
        attr_accessor :num_facet_buckets
      
        # If object_type is set, only those objects of that type will be used to
        # compute facets. If empty, then all objects will be used to compute facets.
        # Corresponds to the JSON property `objectType`
        # @return [String]
        attr_accessor :object_type
      
        # Name of the operator chosen for faceting. @see
        # cloudsearch.SchemaPropertyOptions
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        # Source name to facet on. Format: datasources/`source_id`
        # If empty, all data sources will be used.
        # Corresponds to the JSON property `sourceName`
        # @return [String]
        attr_accessor :source_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @num_facet_buckets = args[:num_facet_buckets] if args.key?(:num_facet_buckets)
          @object_type = args[:object_type] if args.key?(:object_type)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
          @source_name = args[:source_name] if args.key?(:source_name)
        end
      end
      
      # Source specific facet response
      class FacetResult
        include Google::Apis::Core::Hashable
      
        # FacetBuckets for values in response containing at least a single result.
        # Corresponds to the JSON property `buckets`
        # @return [Array<Google::Apis::CloudsearchV1::FacetBucket>]
        attr_accessor :buckets
      
        # Object type for which facet results are returned. Can be empty.
        # Corresponds to the JSON property `objectType`
        # @return [String]
        attr_accessor :object_type
      
        # Name of the operator chosen for faceting. @see
        # cloudsearch.SchemaPropertyOptions
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        # Source name for which facet results are returned. Will not be empty.
        # Corresponds to the JSON property `sourceName`
        # @return [String]
        attr_accessor :source_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @buckets = args[:buckets] if args.key?(:buckets)
          @object_type = args[:object_type] if args.key?(:object_type)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
          @source_name = args[:source_name] if args.key?(:source_name)
        end
      end
      
      # 
      class FieldViolation
        include Google::Apis::Core::Hashable
      
        # Description of the error.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Path of field with violation.
        # Corresponds to the JSON property `field`
        # @return [String]
        attr_accessor :field
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @field = args[:field] if args.key?(:field)
        end
      end
      
      # A generic way of expressing filters in a query, which supports two
      # approaches: <br/><br/>
      # **1. Setting a ValueFilter.** The name must match an operator_name defined in
      # the schema for your data source.
      # <br/>
      # **2. Setting a CompositeFilter.** The filters are evaluated
      # using the logical operator. The top-level operators can only be either an AND
      # or a NOT. AND can appear only at the top-most level. OR can appear only under
      # a top-level AND.
      class Filter
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `compositeFilter`
        # @return [Google::Apis::CloudsearchV1::CompositeFilter]
        attr_accessor :composite_filter
      
        # 
        # Corresponds to the JSON property `valueFilter`
        # @return [Google::Apis::CloudsearchV1::ValueFilter]
        attr_accessor :value_filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @composite_filter = args[:composite_filter] if args.key?(:composite_filter)
          @value_filter = args[:value_filter] if args.key?(:value_filter)
        end
      end
      
      # Filter options to be applied on query.
      class FilterOptions
        include Google::Apis::Core::Hashable
      
        # A generic way of expressing filters in a query, which supports two
        # approaches: <br/><br/>
        # **1. Setting a ValueFilter.** The name must match an operator_name defined in
        # the schema for your data source.
        # <br/>
        # **2. Setting a CompositeFilter.** The filters are evaluated
        # using the logical operator. The top-level operators can only be either an AND
        # or a NOT. AND can appear only at the top-most level. OR can appear only under
        # a top-level AND.
        # Corresponds to the JSON property `filter`
        # @return [Google::Apis::CloudsearchV1::Filter]
        attr_accessor :filter
      
        # If object_type is set, only objects of that type are returned. This should
        # correspond to the name of the object that was registered within the
        # definition of schema. The maximum length is 256 characters.
        # Corresponds to the JSON property `objectType`
        # @return [String]
        attr_accessor :object_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter = args[:filter] if args.key?(:filter)
          @object_type = args[:object_type] if args.key?(:object_type)
        end
      end
      
      # Indicates which freshness property to use when adjusting search ranking for
      # an item. Fresher, more recent dates indicate higher quality. Use the
      # freshness option property that best works with your data. For fileshare
      # documents, last modified time is most relevant. For calendar event data,
      # the time when the event occurs is a more relevant freshness indicator. In
      # this way, calendar events that occur closer to the time of the search query
      # are considered higher quality and ranked accordingly.
      class FreshnessOptions
        include Google::Apis::Core::Hashable
      
        # The duration after which an object should be considered
        # stale. The default value is 180 days (in seconds).
        # Corresponds to the JSON property `freshnessDuration`
        # @return [String]
        attr_accessor :freshness_duration
      
        # This property indicates the freshness level of the object in the index.
        # If set, this property must be a top-level property within the
        # property definitions
        # and it must be a
        # timestamp type
        # or
        # date type.
        # Otherwise, the Indexing API uses
        # updateTime
        # as the freshness indicator.
        # The maximum length is 256 characters.
        # When a property is used to calculate fresheness, the value defaults
        # to 2 years from the current time.
        # Corresponds to the JSON property `freshnessProperty`
        # @return [String]
        attr_accessor :freshness_property
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @freshness_duration = args[:freshness_duration] if args.key?(:freshness_duration)
          @freshness_property = args[:freshness_property] if args.key?(:freshness_property)
        end
      end
      
      # 
      class GSuitePrincipal
        include Google::Apis::Core::Hashable
      
        # This principal represents all users of the G Suite domain of the
        # customer.
        # Corresponds to the JSON property `gsuiteDomain`
        # @return [Boolean]
        attr_accessor :gsuite_domain
        alias_method :gsuite_domain?, :gsuite_domain
      
        # This principal references a G Suite group account
        # Corresponds to the JSON property `gsuiteGroupEmail`
        # @return [String]
        attr_accessor :gsuite_group_email
      
        # This principal references a G Suite user account
        # Corresponds to the JSON property `gsuiteUserEmail`
        # @return [String]
        attr_accessor :gsuite_user_email
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gsuite_domain = args[:gsuite_domain] if args.key?(:gsuite_domain)
          @gsuite_group_email = args[:gsuite_group_email] if args.key?(:gsuite_group_email)
          @gsuite_user_email = args[:gsuite_user_email] if args.key?(:gsuite_user_email)
        end
      end
      
      # 
      class GetCustomerIndexStatsResponse
        include Google::Apis::Core::Hashable
      
        # Summary of indexed item counts, one for each day in the requested range.
        # Corresponds to the JSON property `stats`
        # @return [Array<Google::Apis::CloudsearchV1::CustomerIndexStats>]
        attr_accessor :stats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stats = args[:stats] if args.key?(:stats)
        end
      end
      
      # 
      class GetCustomerQueryStatsResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `stats`
        # @return [Array<Google::Apis::CloudsearchV1::CustomerQueryStats>]
        attr_accessor :stats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stats = args[:stats] if args.key?(:stats)
        end
      end
      
      # 
      class GetCustomerSessionStatsResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `stats`
        # @return [Array<Google::Apis::CloudsearchV1::CustomerSessionStats>]
        attr_accessor :stats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stats = args[:stats] if args.key?(:stats)
        end
      end
      
      # 
      class GetCustomerUserStatsResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `stats`
        # @return [Array<Google::Apis::CloudsearchV1::CustomerUserStats>]
        attr_accessor :stats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stats = args[:stats] if args.key?(:stats)
        end
      end
      
      # 
      class GetDataSourceIndexStatsResponse
        include Google::Apis::Core::Hashable
      
        # Summary of indexed item counts, one for each day in the requested range.
        # Corresponds to the JSON property `stats`
        # @return [Array<Google::Apis::CloudsearchV1::DataSourceIndexStats>]
        attr_accessor :stats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stats = args[:stats] if args.key?(:stats)
        end
      end
      
      # 
      class GetSearchApplicationQueryStatsResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `stats`
        # @return [Array<Google::Apis::CloudsearchV1::SearchApplicationQueryStats>]
        attr_accessor :stats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stats = args[:stats] if args.key?(:stats)
        end
      end
      
      # 
      class GetSearchApplicationSessionStatsResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `stats`
        # @return [Array<Google::Apis::CloudsearchV1::SearchApplicationSessionStats>]
        attr_accessor :stats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stats = args[:stats] if args.key?(:stats)
        end
      end
      
      # 
      class GetSearchApplicationUserStatsResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `stats`
        # @return [Array<Google::Apis::CloudsearchV1::SearchApplicationUserStats>]
        attr_accessor :stats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stats = args[:stats] if args.key?(:stats)
        end
      end
      
      # Gmail Action restricts (i.e. read/replied/snoozed).
      class GmailActionRestrict
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Gmail Attachment restricts (i.e. has:attachment, has:drive, filename:pdf).
      class GmailAttachmentRestrict
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Gmail Folder restricts (i.e. in Drafts/Sent/Chats/User Generated Labels).
      class GmailFolderRestrict
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Gmail Intelligent restricts (i.e. smartlabels, important).
      class GmailIntelligentRestrict
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Gmail Time restricts (i.e. received today, this week).
      class GmailTimeRestrict
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Used to provide a search operator for html properties. This is optional.
      # Search operators let users restrict the query to specific fields relevant
      # to the type of item being searched.
      class HtmlOperatorOptions
        include Google::Apis::Core::Hashable
      
        # Indicates the operator name required in the query in order to isolate the
        # html property. For example, if operatorName is *subject* and the
        # property's name is *subjectLine*, then queries like
        # *subject:&lt;value&gt;* will show results only where the value of the
        # property named *subjectLine* matches *&lt;value&gt;*. By contrast, a
        # search that uses the same *&lt;value&gt;* without an operator will return
        # all items where *&lt;value&gt;* matches the value of any
        # html properties or text within the content field for the item.
        # The operator name can only contain lowercase letters (a-z).
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
        end
      end
      
      # Options for html properties.
      class HtmlPropertyOptions
        include Google::Apis::Core::Hashable
      
        # Used to provide a search operator for html properties. This is optional.
        # Search operators let users restrict the query to specific fields relevant
        # to the type of item being searched.
        # Corresponds to the JSON property `operatorOptions`
        # @return [Google::Apis::CloudsearchV1::HtmlOperatorOptions]
        attr_accessor :operator_options
      
        # Indicates the search quality importance of the tokens within the
        # field when used for retrieval. Can only be set to DEFAULT or NONE.
        # Corresponds to the JSON property `retrievalImportance`
        # @return [Google::Apis::CloudsearchV1::RetrievalImportance]
        attr_accessor :retrieval_importance
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operator_options = args[:operator_options] if args.key?(:operator_options)
          @retrieval_importance = args[:retrieval_importance] if args.key?(:retrieval_importance)
        end
      end
      
      # List of html values.
      class HtmlValues
        include Google::Apis::Core::Hashable
      
        # The maximum allowable length for html values is 2048 characters.
        # Corresponds to the JSON property `values`
        # @return [Array<String>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # 
      class IndexItemOptions
        include Google::Apis::Core::Hashable
      
        # Specifies if the index request should allow gsuite principals that do not
        # exist or are deleted in the index request.
        # Corresponds to the JSON property `allowUnknownGsuitePrincipals`
        # @return [Boolean]
        attr_accessor :allow_unknown_gsuite_principals
        alias_method :allow_unknown_gsuite_principals?, :allow_unknown_gsuite_principals
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_unknown_gsuite_principals = args[:allow_unknown_gsuite_principals] if args.key?(:allow_unknown_gsuite_principals)
        end
      end
      
      # 
      class IndexItemRequest
        include Google::Apis::Core::Hashable
      
        # Name of connector making this call.
        # <br />Format: datasources/`source_id`/connectors/`ID`
        # Corresponds to the JSON property `connectorName`
        # @return [String]
        attr_accessor :connector_name
      
        # Shared request debug options for all cloudsearch RPC methods.
        # Corresponds to the JSON property `debugOptions`
        # @return [Google::Apis::CloudsearchV1::DebugOptions]
        attr_accessor :debug_options
      
        # 
        # Corresponds to the JSON property `indexItemOptions`
        # @return [Google::Apis::CloudsearchV1::IndexItemOptions]
        attr_accessor :index_item_options
      
        # Represents a single object that is an item in the search index, such as a
        # file, folder, or a database record.
        # Corresponds to the JSON property `item`
        # @return [Google::Apis::CloudsearchV1::Item]
        attr_accessor :item
      
        # Required. The RequestMode for this request.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @connector_name = args[:connector_name] if args.key?(:connector_name)
          @debug_options = args[:debug_options] if args.key?(:debug_options)
          @index_item_options = args[:index_item_options] if args.key?(:index_item_options)
          @item = args[:item] if args.key?(:item)
          @mode = args[:mode] if args.key?(:mode)
        end
      end
      
      # Used to provide a search operator for integer properties. This is
      # optional. Search operators let users restrict the query to specific fields
      # relevant to the type of item being searched.
      class IntegerOperatorOptions
        include Google::Apis::Core::Hashable
      
        # Indicates the operator name required in the query in order to isolate the
        # integer property using the greater-than operator. For example, if
        # greaterThanOperatorName is *priorityabove* and the property's name is
        # *priorityVal*, then queries like *priorityabove:&lt;value&gt;* will
        # show results only where the value of the property named *priorityVal* is
        # greater than *&lt;value&gt;*.
        # The operator name can only contain lowercase letters (a-z).
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `greaterThanOperatorName`
        # @return [String]
        attr_accessor :greater_than_operator_name
      
        # Indicates the operator name required in the query in order to isolate the
        # integer property using the less-than operator. For example, if
        # lessThanOperatorName is *prioritybelow* and the property's name is
        # *priorityVal*, then queries like *prioritybelow:&lt;value&gt;* will
        # show results only where the value of the property named *priorityVal* is
        # less than *&lt;value&gt;*.
        # The operator name can only contain lowercase letters (a-z).
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `lessThanOperatorName`
        # @return [String]
        attr_accessor :less_than_operator_name
      
        # Indicates the operator name required in the query in order to isolate the
        # integer property. For example, if operatorName is *priority* and the
        # property's name is *priorityVal*, then queries like
        # *priority:&lt;value&gt;* will show results only where the value of the
        # property named *priorityVal* matches *&lt;value&gt;*. By contrast, a
        # search that uses the same *&lt;value&gt;* without an operator will return
        # all items where *&lt;value&gt;* matches the value of any String
        # properties or text within the content field for the item.
        # The operator name can only contain lowercase letters (a-z).
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @greater_than_operator_name = args[:greater_than_operator_name] if args.key?(:greater_than_operator_name)
          @less_than_operator_name = args[:less_than_operator_name] if args.key?(:less_than_operator_name)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
        end
      end
      
      # Options for integer properties.
      class IntegerPropertyOptions
        include Google::Apis::Core::Hashable
      
        # The maximum value of the property. The minimum and maximum values for the
        # property are used to rank results according to the
        # ordered ranking.
        # Indexing requests with values greater than the maximum are accepted and
        # ranked with the same weight as items indexed with the maximum value.
        # Corresponds to the JSON property `maximumValue`
        # @return [Fixnum]
        attr_accessor :maximum_value
      
        # The minimum value of the property. The minimum and maximum values for the
        # property are used to rank results according to the
        # ordered ranking.
        # Indexing requests with values less than the minimum are accepted and
        # ranked with the same weight as items indexed with the minimum value.
        # Corresponds to the JSON property `minimumValue`
        # @return [Fixnum]
        attr_accessor :minimum_value
      
        # Used to provide a search operator for integer properties. This is
        # optional. Search operators let users restrict the query to specific fields
        # relevant to the type of item being searched.
        # Corresponds to the JSON property `operatorOptions`
        # @return [Google::Apis::CloudsearchV1::IntegerOperatorOptions]
        attr_accessor :operator_options
      
        # Used to specify the ordered ranking for the integer. Can only be used if
        # isRepeatable
        # is false.
        # Corresponds to the JSON property `orderedRanking`
        # @return [String]
        attr_accessor :ordered_ranking
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @maximum_value = args[:maximum_value] if args.key?(:maximum_value)
          @minimum_value = args[:minimum_value] if args.key?(:minimum_value)
          @operator_options = args[:operator_options] if args.key?(:operator_options)
          @ordered_ranking = args[:ordered_ranking] if args.key?(:ordered_ranking)
        end
      end
      
      # List of integer values.
      class IntegerValues
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `values`
        # @return [Array<Fixnum>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # Represents an interaction between a user and an item.
      class Interaction
        include Google::Apis::Core::Hashable
      
        # The time when the user acted on the item.  If multiple actions of the same
        # type exist for a single user, only the most recent action is recorded.
        # Corresponds to the JSON property `interactionTime`
        # @return [String]
        attr_accessor :interaction_time
      
        # Reference to a user, group, or domain.
        # Corresponds to the JSON property `principal`
        # @return [Google::Apis::CloudsearchV1::Principal]
        attr_accessor :principal
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @interaction_time = args[:interaction_time] if args.key?(:interaction_time)
          @principal = args[:principal] if args.key?(:principal)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Represents a single object that is an item in the search index, such as a
      # file, folder, or a database record.
      class Item
        include Google::Apis::Core::Hashable
      
        # Access control list information for the item. For more information see
        # https://developers.google.com/cloud-search/docs/guides/index-your-data#acls
        # Corresponds to the JSON property `acl`
        # @return [Google::Apis::CloudsearchV1::ItemAcl]
        attr_accessor :acl
      
        # Content of an item to be indexed and surfaced by Cloud Search.
        # Corresponds to the JSON property `content`
        # @return [Google::Apis::CloudsearchV1::ItemContent]
        attr_accessor :content
      
        # Type for this item.
        # Corresponds to the JSON property `itemType`
        # @return [String]
        attr_accessor :item_type
      
        # Available metadata fields for the item.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::CloudsearchV1::ItemMetadata]
        attr_accessor :metadata
      
        # Name of the Item. Format:
        # datasources/`source_id`/items/`item_id`
        # <br />This is a required field.
        # The maximum length is 1536 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Additional state connector can store for this item.
        # The maximum length is 10000 bytes.
        # Corresponds to the JSON property `payload`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :payload
      
        # Queue this item belongs to.
        # The maximum length is 100 characters.
        # Corresponds to the JSON property `queue`
        # @return [String]
        attr_accessor :queue
      
        # This contains item's status and any errors.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::CloudsearchV1::ItemStatus]
        attr_accessor :status
      
        # Available structured data fields for the item.
        # Corresponds to the JSON property `structuredData`
        # @return [Google::Apis::CloudsearchV1::ItemStructuredData]
        attr_accessor :structured_data
      
        # Required. The indexing system stores the version from the datasource as a
        # byte string and compares the Item version in the index
        # to the version of the queued Item using lexical ordering.
        # <br /><br />
        # Cloud Search Indexing won't index or delete any queued item with
        # a version value that is less than or equal to the version of the
        # currently indexed item.
        # The maximum length for this field is 1024 bytes.
        # Corresponds to the JSON property `version`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @acl = args[:acl] if args.key?(:acl)
          @content = args[:content] if args.key?(:content)
          @item_type = args[:item_type] if args.key?(:item_type)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @payload = args[:payload] if args.key?(:payload)
          @queue = args[:queue] if args.key?(:queue)
          @status = args[:status] if args.key?(:status)
          @structured_data = args[:structured_data] if args.key?(:structured_data)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Access control list information for the item. For more information see
      # https://developers.google.com/cloud-search/docs/guides/index-your-data#acls
      class ItemAcl
        include Google::Apis::Core::Hashable
      
        # Sets the type of access rules to apply when an item inherits its ACL from a
        # parent. This should always be set in tandem with the
        # inheritAclFrom
        # field. Also, when the
        # inheritAclFrom field
        # is set, this field should be set to a valid AclInheritanceType.
        # Corresponds to the JSON property `aclInheritanceType`
        # @return [String]
        attr_accessor :acl_inheritance_type
      
        # List of principals who are explicitly denied access to the item in search
        # results. While principals are denied access by default, use denied readers
        # to handle exceptions and override the list allowed readers.
        # The maximum number of elements is 100.
        # Corresponds to the JSON property `deniedReaders`
        # @return [Array<Google::Apis::CloudsearchV1::Principal>]
        attr_accessor :denied_readers
      
        # Name of the item to inherit the Access Permission List (ACL) from.
        # Note: ACL inheritance *only* provides access permissions
        # to child items and does not define structural relationships, nor does it
        # provide convenient ways to delete large groups of items.
        # Deleting an ACL parent from the index only alters the access permissions of
        # child items that reference the parent in the
        # inheritAclFrom
        # field. The item is still in the index, but may not
        # visible in search results. By contrast, deletion of a container item
        # also deletes all items that reference the container via the
        # containerName
        # field.
        # The maximum length for this field is 1536 characters.
        # Corresponds to the JSON property `inheritAclFrom`
        # @return [String]
        attr_accessor :inherit_acl_from
      
        # Optional. List of owners for the item. This field has no bearing on
        # document access permissions. It does, however, offer
        # a slight ranking boosts items where the querying user is an owner.
        # The maximum number of elements is 5.
        # Corresponds to the JSON property `owners`
        # @return [Array<Google::Apis::CloudsearchV1::Principal>]
        attr_accessor :owners
      
        # List of principals who are allowed to see the item in search results.
        # Optional if inheriting permissions from another item or if the item
        # is not intended to be visible, such as
        # virtual
        # containers.
        # The maximum number of elements is 1000.
        # Corresponds to the JSON property `readers`
        # @return [Array<Google::Apis::CloudsearchV1::Principal>]
        attr_accessor :readers
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @acl_inheritance_type = args[:acl_inheritance_type] if args.key?(:acl_inheritance_type)
          @denied_readers = args[:denied_readers] if args.key?(:denied_readers)
          @inherit_acl_from = args[:inherit_acl_from] if args.key?(:inherit_acl_from)
          @owners = args[:owners] if args.key?(:owners)
          @readers = args[:readers] if args.key?(:readers)
        end
      end
      
      # Content of an item to be indexed and surfaced by Cloud Search.
      class ItemContent
        include Google::Apis::Core::Hashable
      
        # Represents an upload session reference.
        # This reference is created via upload
        # method.
        # Updating of item content may refer to this uploaded content via
        # contentDataRef.
        # Corresponds to the JSON property `contentDataRef`
        # @return [Google::Apis::CloudsearchV1::UploadItemRef]
        attr_accessor :content_data_ref
      
        # 
        # Corresponds to the JSON property `contentFormat`
        # @return [String]
        attr_accessor :content_format
      
        # Hashing info calculated and provided by the API client for content.
        # Can be used with the items.push method to calculate modified state.
        # The maximum length is 2048 characters.
        # Corresponds to the JSON property `hash`
        # @return [String]
        attr_accessor :hash_prop
      
        # Content that is supplied inlined within the update method.
        # The maximum length is 102400 bytes (100 KiB).
        # Corresponds to the JSON property `inlineContent`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :inline_content
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_data_ref = args[:content_data_ref] if args.key?(:content_data_ref)
          @content_format = args[:content_format] if args.key?(:content_format)
          @hash_prop = args[:hash_prop] if args.key?(:hash_prop)
          @inline_content = args[:inline_content] if args.key?(:inline_content)
        end
      end
      
      # 
      class ItemCountByStatus
        include Google::Apis::Core::Hashable
      
        # Number of items matching the status code.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # Status of the items.
        # Corresponds to the JSON property `statusCode`
        # @return [String]
        attr_accessor :status_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @status_code = args[:status_code] if args.key?(:status_code)
        end
      end
      
      # Available metadata fields for the item.
      class ItemMetadata
        include Google::Apis::Core::Hashable
      
        # The name of the container for this item.
        # Deletion of the container item leads to automatic deletion of this
        # item.  Note: ACLs are not inherited from a container item.
        # To provide ACL inheritance for an item, use the
        # inheritAclFrom
        # field. The maximum length is 1536 characters.
        # Corresponds to the JSON property `containerName`
        # @return [String]
        attr_accessor :container_name
      
        # The BCP-47 language code for the item, such as "en-US" or "sr-Latn". For
        # more information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `contentLanguage`
        # @return [String]
        attr_accessor :content_language
      
        # The time when the item was created in the source repository.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Hashing value provided by the API caller.
        # This can be used with the
        # items.push
        # method to calculate modified state.
        # The maximum length is 2048 characters.
        # Corresponds to the JSON property `hash`
        # @return [String]
        attr_accessor :hash_prop
      
        # A list of interactions for the item.  Interactions are used to improve
        # Search quality, but are not exposed to end users.
        # The maximum number of elements is 1000.
        # Corresponds to the JSON property `interactions`
        # @return [Array<Google::Apis::CloudsearchV1::Interaction>]
        attr_accessor :interactions
      
        # Additional keywords or phrases that should match the item.
        # Used internally for user generated content.
        # The maximum number of elements is 100.
        # The maximum length is 8192 characters.
        # Corresponds to the JSON property `keywords`
        # @return [Array<String>]
        attr_accessor :keywords
      
        # The original mime-type of
        # ItemContent.content
        # in the source repository.
        # The maximum length is 256 characters.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # The type of the item.  This should correspond to the name of an object
        # definition in the schema registered for the data source.  For example, if
        # the schema for the data source contains an object definition with name
        # 'document', then item indexing requests for objects of that type should set
        # objectType to 'document'.
        # The maximum length is 256 characters.
        # Corresponds to the JSON property `objectType`
        # @return [String]
        attr_accessor :object_type
      
        # Additional search quality metadata of the item.
        # Corresponds to the JSON property `searchQualityMetadata`
        # @return [Google::Apis::CloudsearchV1::SearchQualityMetadata]
        attr_accessor :search_quality_metadata
      
        # Link to the source repository serving the data.  &#83;earch results apply
        # this link to the title.
        # The maximum length is 2048 characters.
        # Corresponds to the JSON property `sourceRepositoryUrl`
        # @return [String]
        attr_accessor :source_repository_url
      
        # The title of the item.  If given, this will be the displayed title of the
        # Search result.
        # The maximum length is 2048 characters.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The time when the item was last modified in the source repository.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @container_name = args[:container_name] if args.key?(:container_name)
          @content_language = args[:content_language] if args.key?(:content_language)
          @create_time = args[:create_time] if args.key?(:create_time)
          @hash_prop = args[:hash_prop] if args.key?(:hash_prop)
          @interactions = args[:interactions] if args.key?(:interactions)
          @keywords = args[:keywords] if args.key?(:keywords)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @object_type = args[:object_type] if args.key?(:object_type)
          @search_quality_metadata = args[:search_quality_metadata] if args.key?(:search_quality_metadata)
          @source_repository_url = args[:source_repository_url] if args.key?(:source_repository_url)
          @title = args[:title] if args.key?(:title)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # This contains item's status and any errors.
      class ItemStatus
        include Google::Apis::Core::Hashable
      
        # Status code.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # Error details in case the item is in ERROR state.
        # Corresponds to the JSON property `processingErrors`
        # @return [Array<Google::Apis::CloudsearchV1::ProcessingError>]
        attr_accessor :processing_errors
      
        # Repository error reported by connector.
        # Corresponds to the JSON property `repositoryErrors`
        # @return [Array<Google::Apis::CloudsearchV1::RepositoryError>]
        attr_accessor :repository_errors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @processing_errors = args[:processing_errors] if args.key?(:processing_errors)
          @repository_errors = args[:repository_errors] if args.key?(:repository_errors)
        end
      end
      
      # Available structured data fields for the item.
      class ItemStructuredData
        include Google::Apis::Core::Hashable
      
        # Hashing value provided by the API caller.
        # This can be used with the
        # items.push
        # method to calculate modified state.
        # The maximum length is 2048 characters.
        # Corresponds to the JSON property `hash`
        # @return [String]
        attr_accessor :hash_prop
      
        # A structured data object consisting of named properties.
        # Corresponds to the JSON property `object`
        # @return [Google::Apis::CloudsearchV1::StructuredDataObject]
        attr_accessor :object
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hash_prop = args[:hash_prop] if args.key?(:hash_prop)
          @object = args[:object] if args.key?(:object)
        end
      end
      
      # 
      class ListDataSourceResponse
        include Google::Apis::Core::Hashable
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # 
        # Corresponds to the JSON property `sources`
        # @return [Array<Google::Apis::CloudsearchV1::DataSource>]
        attr_accessor :sources
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @sources = args[:sources] if args.key?(:sources)
        end
      end
      
      # 
      class ListItemNamesForUnmappedIdentityResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `itemNames`
        # @return [Array<String>]
        attr_accessor :item_names
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @item_names = args[:item_names] if args.key?(:item_names)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class ListItemsResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::CloudsearchV1::Item>]
        attr_accessor :items
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # List sources response.
      class ListQuerySourcesResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # 
        # Corresponds to the JSON property `sources`
        # @return [Array<Google::Apis::CloudsearchV1::QuerySource>]
        attr_accessor :sources
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @sources = args[:sources] if args.key?(:sources)
        end
      end
      
      # 
      class ListSearchApplicationsResponse
        include Google::Apis::Core::Hashable
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # 
        # Corresponds to the JSON property `searchApplications`
        # @return [Array<Google::Apis::CloudsearchV1::SearchApplication>]
        attr_accessor :search_applications
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @search_applications = args[:search_applications] if args.key?(:search_applications)
        end
      end
      
      # 
      class ListUnmappedIdentitiesResponse
        include Google::Apis::Core::Hashable
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # 
        # Corresponds to the JSON property `unmappedIdentities`
        # @return [Array<Google::Apis::CloudsearchV1::UnmappedIdentity>]
        attr_accessor :unmapped_identities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @unmapped_identities = args[:unmapped_identities] if args.key?(:unmapped_identities)
        end
      end
      
      # Matched range of a snippet [start, end).
      class MatchRange
        include Google::Apis::Core::Hashable
      
        # End of the match in the snippet.
        # Corresponds to the JSON property `end`
        # @return [Fixnum]
        attr_accessor :end
      
        # Starting position of the match in the snippet.
        # Corresponds to the JSON property `start`
        # @return [Fixnum]
        attr_accessor :start
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end = args[:end] if args.key?(:end)
          @start = args[:start] if args.key?(:start)
        end
      end
      
      # Media resource.
      class Media
        include Google::Apis::Core::Hashable
      
        # Name of the media resource.
        # Corresponds to the JSON property `resourceName`
        # @return [String]
        attr_accessor :resource_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_name = args[:resource_name] if args.key?(:resource_name)
        end
      end
      
      # Metadata of a matched search result.
      class Metadata
        include Google::Apis::Core::Hashable
      
        # The creation time for this document or object in the search result.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Options that specify how to display a structured data search result.
        # Corresponds to the JSON property `displayOptions`
        # @return [Google::Apis::CloudsearchV1::ResultDisplayMetadata]
        attr_accessor :display_options
      
        # Indexed fields in structured data, returned as a generic named property.
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::CloudsearchV1::NamedProperty>]
        attr_accessor :fields
      
        # Mime type of the search result.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # Object type of the search result.
        # Corresponds to the JSON property `objectType`
        # @return [String]
        attr_accessor :object_type
      
        # Object to represent a person.
        # Corresponds to the JSON property `owner`
        # @return [Google::Apis::CloudsearchV1::Person]
        attr_accessor :owner
      
        # Defines sources for the suggest/search APIs.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::CloudsearchV1::Source]
        attr_accessor :source
      
        # The last modified date for the object in the search result. If not
        # set in the item, the value returned here is empty. When
        # `updateTime` is used for calculating freshness and is not set, this
        # value defaults to 2 years from the current time.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @display_options = args[:display_options] if args.key?(:display_options)
          @fields = args[:fields] if args.key?(:fields)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @object_type = args[:object_type] if args.key?(:object_type)
          @owner = args[:owner] if args.key?(:owner)
          @source = args[:source] if args.key?(:source)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # A metaline is a list of properties that are displayed along with the search
      # result to provide context.
      class Metaline
        include Google::Apis::Core::Hashable
      
        # The list of displayed properties for the metaline. The maxiumum number of
        # properties is 5.
        # Corresponds to the JSON property `properties`
        # @return [Array<Google::Apis::CloudsearchV1::DisplayedProperty>]
        attr_accessor :properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @properties = args[:properties] if args.key?(:properties)
        end
      end
      
      # A person's name.
      class Name
        include Google::Apis::Core::Hashable
      
        # The read-only display name formatted according to the locale specified by
        # the viewer's account or the <code>Accept-Language</code> HTTP header.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
        end
      end
      
      # A typed name-value pair for structured data.  The type of the value should
      # be the same as the registered type for the `name` property in the object
      # definition of `objectType`.
      class NamedProperty
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `booleanValue`
        # @return [Boolean]
        attr_accessor :boolean_value
        alias_method :boolean_value?, :boolean_value
      
        # List of date values.
        # Corresponds to the JSON property `dateValues`
        # @return [Google::Apis::CloudsearchV1::DateValues]
        attr_accessor :date_values
      
        # List of double values.
        # Corresponds to the JSON property `doubleValues`
        # @return [Google::Apis::CloudsearchV1::DoubleValues]
        attr_accessor :double_values
      
        # List of enum values.
        # Corresponds to the JSON property `enumValues`
        # @return [Google::Apis::CloudsearchV1::EnumValues]
        attr_accessor :enum_values
      
        # List of html values.
        # Corresponds to the JSON property `htmlValues`
        # @return [Google::Apis::CloudsearchV1::HtmlValues]
        attr_accessor :html_values
      
        # List of integer values.
        # Corresponds to the JSON property `integerValues`
        # @return [Google::Apis::CloudsearchV1::IntegerValues]
        attr_accessor :integer_values
      
        # The name of the property.  This name should correspond to the name of the
        # property that was registered for object definition in the schema.
        # The maximum allowable length for this property is 256 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # List of object values.
        # Corresponds to the JSON property `objectValues`
        # @return [Google::Apis::CloudsearchV1::ObjectValues]
        attr_accessor :object_values
      
        # List of text values.
        # Corresponds to the JSON property `textValues`
        # @return [Google::Apis::CloudsearchV1::TextValues]
        attr_accessor :text_values
      
        # List of timestamp values.
        # Corresponds to the JSON property `timestampValues`
        # @return [Google::Apis::CloudsearchV1::TimestampValues]
        attr_accessor :timestamp_values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boolean_value = args[:boolean_value] if args.key?(:boolean_value)
          @date_values = args[:date_values] if args.key?(:date_values)
          @double_values = args[:double_values] if args.key?(:double_values)
          @enum_values = args[:enum_values] if args.key?(:enum_values)
          @html_values = args[:html_values] if args.key?(:html_values)
          @integer_values = args[:integer_values] if args.key?(:integer_values)
          @name = args[:name] if args.key?(:name)
          @object_values = args[:object_values] if args.key?(:object_values)
          @text_values = args[:text_values] if args.key?(:text_values)
          @timestamp_values = args[:timestamp_values] if args.key?(:timestamp_values)
        end
      end
      
      # The definition for an object within a data source.
      class ObjectDefinition
        include Google::Apis::Core::Hashable
      
        # Name for the object, which then defines its type. Item indexing requests
        # should set the
        # objectType field
        # equal to this value. For example, if *name* is *Document*, then indexing
        # requests for items of type Document should set
        # objectType equal to
        # *Document*. Each object definition must be uniquely named within a schema.
        # The name must start with a letter and can only contain letters (A-Z, a-z)
        # or numbers (0-9).
        # The maximum length is 256 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The options for an object.
        # Corresponds to the JSON property `options`
        # @return [Google::Apis::CloudsearchV1::ObjectOptions]
        attr_accessor :options
      
        # The property definitions for the object.
        # The maximum number of elements is 1000.
        # Corresponds to the JSON property `propertyDefinitions`
        # @return [Array<Google::Apis::CloudsearchV1::PropertyDefinition>]
        attr_accessor :property_definitions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @options = args[:options] if args.key?(:options)
          @property_definitions = args[:property_definitions] if args.key?(:property_definitions)
        end
      end
      
      # The display options for an object.
      class ObjectDisplayOptions
        include Google::Apis::Core::Hashable
      
        # Defines the properties that will be displayed in the metalines of the
        # search results. The property values will be displayed in the order given
        # here. If a property holds multiple values, all of the values will be
        # diplayed before the next properties. For this reason, it is a good practice
        # to specify singular properties before repeated properties in this list. All
        # of the properties must set
        # is_returnable
        # to true. The maximum number of metalines is 3.
        # Corresponds to the JSON property `metalines`
        # @return [Array<Google::Apis::CloudsearchV1::Metaline>]
        attr_accessor :metalines
      
        # The user friendly label to display in the search result to inidicate the
        # type of the item. This is OPTIONAL; if not given, an object label will not
        # be displayed on the context line of the search results. The maximum length
        # is 32 characters.
        # Corresponds to the JSON property `objectDisplayLabel`
        # @return [String]
        attr_accessor :object_display_label
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metalines = args[:metalines] if args.key?(:metalines)
          @object_display_label = args[:object_display_label] if args.key?(:object_display_label)
        end
      end
      
      # The options for an object.
      class ObjectOptions
        include Google::Apis::Core::Hashable
      
        # The display options for an object.
        # Corresponds to the JSON property `displayOptions`
        # @return [Google::Apis::CloudsearchV1::ObjectDisplayOptions]
        attr_accessor :display_options
      
        # Indicates which freshness property to use when adjusting search ranking for
        # an item. Fresher, more recent dates indicate higher quality. Use the
        # freshness option property that best works with your data. For fileshare
        # documents, last modified time is most relevant. For calendar event data,
        # the time when the event occurs is a more relevant freshness indicator. In
        # this way, calendar events that occur closer to the time of the search query
        # are considered higher quality and ranked accordingly.
        # Corresponds to the JSON property `freshnessOptions`
        # @return [Google::Apis::CloudsearchV1::FreshnessOptions]
        attr_accessor :freshness_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_options = args[:display_options] if args.key?(:display_options)
          @freshness_options = args[:freshness_options] if args.key?(:freshness_options)
        end
      end
      
      # Options for object properties.
      class ObjectPropertyOptions
        include Google::Apis::Core::Hashable
      
        # The properties of the sub-object. These properties represent a nested
        # object. For example, if this property represents a postal address, the
        # subobjectProperties might be named *street*, *city*, and *state*.
        # The maximum number of elements is 1000.
        # Corresponds to the JSON property `subobjectProperties`
        # @return [Array<Google::Apis::CloudsearchV1::PropertyDefinition>]
        attr_accessor :subobject_properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @subobject_properties = args[:subobject_properties] if args.key?(:subobject_properties)
        end
      end
      
      # List of object values.
      class ObjectValues
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `values`
        # @return [Array<Google::Apis::CloudsearchV1::StructuredDataObject>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
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
        # @return [Google::Apis::CloudsearchV1::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
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
      
      # This field contains information about the person being suggested.
      class PeopleSuggestion
        include Google::Apis::Core::Hashable
      
        # Object to represent a person.
        # Corresponds to the JSON property `person`
        # @return [Google::Apis::CloudsearchV1::Person]
        attr_accessor :person
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @person = args[:person] if args.key?(:person)
        end
      end
      
      # Object to represent a person.
      class Person
        include Google::Apis::Core::Hashable
      
        # The person's email addresses
        # Corresponds to the JSON property `emailAddresses`
        # @return [Array<Google::Apis::CloudsearchV1::EmailAddress>]
        attr_accessor :email_addresses
      
        # The resource name of the person to provide information about.
        # See <a href="https://developers.google.com/people/api/rest/v1/people/get">
        # People.get</a> from Google People API.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Obfuscated ID of a person.
        # Corresponds to the JSON property `obfuscatedId`
        # @return [String]
        attr_accessor :obfuscated_id
      
        # The person's name
        # Corresponds to the JSON property `personNames`
        # @return [Array<Google::Apis::CloudsearchV1::Name>]
        attr_accessor :person_names
      
        # A person's read-only photo. A picture shown next to the person's name to
        # help others recognize the person in search results.
        # Corresponds to the JSON property `photos`
        # @return [Array<Google::Apis::CloudsearchV1::Photo>]
        attr_accessor :photos
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email_addresses = args[:email_addresses] if args.key?(:email_addresses)
          @name = args[:name] if args.key?(:name)
          @obfuscated_id = args[:obfuscated_id] if args.key?(:obfuscated_id)
          @person_names = args[:person_names] if args.key?(:person_names)
          @photos = args[:photos] if args.key?(:photos)
        end
      end
      
      # A person's photo.
      class Photo
        include Google::Apis::Core::Hashable
      
        # The URL of the photo.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # 
      class PollItemsRequest
        include Google::Apis::Core::Hashable
      
        # Name of connector making this call.
        # <br />Format: datasources/`source_id`/connectors/`ID`
        # Corresponds to the JSON property `connectorName`
        # @return [String]
        attr_accessor :connector_name
      
        # Shared request debug options for all cloudsearch RPC methods.
        # Corresponds to the JSON property `debugOptions`
        # @return [Google::Apis::CloudsearchV1::DebugOptions]
        attr_accessor :debug_options
      
        # Maximum number of items to return.
        # <br />The maximum and the default value is 1000
        # Corresponds to the JSON property `limit`
        # @return [Fixnum]
        attr_accessor :limit
      
        # Queue name to fetch items from.  If unspecified, PollItems will
        # fetch from 'default' queue.
        # The maximum length is 100 characters.
        # Corresponds to the JSON property `queue`
        # @return [String]
        attr_accessor :queue
      
        # Limit the items polled to the ones with these statuses.
        # Corresponds to the JSON property `statusCodes`
        # @return [Array<String>]
        attr_accessor :status_codes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @connector_name = args[:connector_name] if args.key?(:connector_name)
          @debug_options = args[:debug_options] if args.key?(:debug_options)
          @limit = args[:limit] if args.key?(:limit)
          @queue = args[:queue] if args.key?(:queue)
          @status_codes = args[:status_codes] if args.key?(:status_codes)
        end
      end
      
      # 
      class PollItemsResponse
        include Google::Apis::Core::Hashable
      
        # Set of items from the queue available for connector to process.
        # <br />These items have the following subset of fields populated: <br />
        # <br />version
        # <br />metadata.hash
        # <br />structured_data.hash
        # <br />content.hash
        # <br />payload
        # <br />status
        # <br />queue
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::CloudsearchV1::Item>]
        attr_accessor :items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
        end
      end
      
      # Reference to a user, group, or domain.
      class Principal
        include Google::Apis::Core::Hashable
      
        # This principal is a group identified using an external identity.
        # The name field must specify the group resource name with this format:
        # identitysources/`source_id`/groups/`ID`
        # Corresponds to the JSON property `groupResourceName`
        # @return [String]
        attr_accessor :group_resource_name
      
        # This principal is a GSuite user, group or domain.
        # Corresponds to the JSON property `gsuitePrincipal`
        # @return [Google::Apis::CloudsearchV1::GSuitePrincipal]
        attr_accessor :gsuite_principal
      
        # This principal is a user identified using an external identity.
        # The name field must specify the user resource name with this format:
        # identitysources/`source_id`/users/`ID`
        # Corresponds to the JSON property `userResourceName`
        # @return [String]
        attr_accessor :user_resource_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @group_resource_name = args[:group_resource_name] if args.key?(:group_resource_name)
          @gsuite_principal = args[:gsuite_principal] if args.key?(:gsuite_principal)
          @user_resource_name = args[:user_resource_name] if args.key?(:user_resource_name)
        end
      end
      
      # 
      class ProcessingError
        include Google::Apis::Core::Hashable
      
        # Error code indicating the nature of the error.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # Description of the error.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # In case the item fields are invalid, this field contains the details
        # about the validation errors.
        # Corresponds to the JSON property `fieldViolations`
        # @return [Array<Google::Apis::CloudsearchV1::FieldViolation>]
        attr_accessor :field_violations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @error_message = args[:error_message] if args.key?(:error_message)
          @field_violations = args[:field_violations] if args.key?(:field_violations)
        end
      end
      
      # The definition of a property within an object.
      class PropertyDefinition
        include Google::Apis::Core::Hashable
      
        # Options for boolean properties.
        # Corresponds to the JSON property `booleanPropertyOptions`
        # @return [Google::Apis::CloudsearchV1::BooleanPropertyOptions]
        attr_accessor :boolean_property_options
      
        # Options for date properties.
        # Corresponds to the JSON property `datePropertyOptions`
        # @return [Google::Apis::CloudsearchV1::DatePropertyOptions]
        attr_accessor :date_property_options
      
        # The display options for a property.
        # Corresponds to the JSON property `displayOptions`
        # @return [Google::Apis::CloudsearchV1::PropertyDisplayOptions]
        attr_accessor :display_options
      
        # Options for double properties.
        # Corresponds to the JSON property `doublePropertyOptions`
        # @return [Google::Apis::CloudsearchV1::DoublePropertyOptions]
        attr_accessor :double_property_options
      
        # Options for enum properties, which allow you to define a restricted set of
        # strings to match user queries, set rankings for those string values, and
        # define an operator name to be paired with those strings so that users can
        # narrow results to only items with a specific value. For example, for items in
        # a request tracking system with priority information, you could define *p0* as
        # an allowable enum value and tie this enum to the operator name *priority* so
        # that search users could add *priority:p0* to their query to restrict the set
        # of results to only those items indexed with the value *p0*.
        # Corresponds to the JSON property `enumPropertyOptions`
        # @return [Google::Apis::CloudsearchV1::EnumPropertyOptions]
        attr_accessor :enum_property_options
      
        # Options for html properties.
        # Corresponds to the JSON property `htmlPropertyOptions`
        # @return [Google::Apis::CloudsearchV1::HtmlPropertyOptions]
        attr_accessor :html_property_options
      
        # Options for integer properties.
        # Corresponds to the JSON property `integerPropertyOptions`
        # @return [Google::Apis::CloudsearchV1::IntegerPropertyOptions]
        attr_accessor :integer_property_options
      
        # Indicates that the property can be used for generating facets. Cannot be
        # true for properties whose type is object. IsReturnable must be true to set
        # this option.
        # Only supported for Boolean, Enum, and Text properties.
        # Corresponds to the JSON property `isFacetable`
        # @return [Boolean]
        attr_accessor :is_facetable
        alias_method :is_facetable?, :is_facetable
      
        # Indicates that multiple values are allowed for the property. For example, a
        # document only has one description but can have multiple comments. Cannot be
        # true for properties whose type is a boolean.
        # If set to false, properties that contain more than one value will cause the
        # indexing request for that item to be rejected.
        # Corresponds to the JSON property `isRepeatable`
        # @return [Boolean]
        attr_accessor :is_repeatable
        alias_method :is_repeatable?, :is_repeatable
      
        # Indicates that the property identifies data that should be returned in
        # search results via the Query API. If set to *true*, indicates that Query
        # API users can use matching property fields in results. However, storing
        # fields requires more space allocation and uses more bandwidth for search
        # queries, which impacts performance over large datasets. Set to *true* here
        # only if the field is needed for search results. Cannot be true for
        # properties whose type is an object.
        # Corresponds to the JSON property `isReturnable`
        # @return [Boolean]
        attr_accessor :is_returnable
        alias_method :is_returnable?, :is_returnable
      
        # Indicates that the property can be used for sorting. Cannot be true for
        # properties that are repeatable. Cannot be true for properties whose type
        # is object or user identifier. IsReturnable must be true to set this option.
        # Only supported for Boolean, Date, Double, Integer, and Timestamp
        # properties.
        # Corresponds to the JSON property `isSortable`
        # @return [Boolean]
        attr_accessor :is_sortable
        alias_method :is_sortable?, :is_sortable
      
        # Indicates that the property can be used for generating query suggestions.
        # Corresponds to the JSON property `isSuggestable`
        # @return [Boolean]
        attr_accessor :is_suggestable
        alias_method :is_suggestable?, :is_suggestable
      
        # Indicates that users can perform wildcard search for this
        # property. Only supported for Text properties. IsReturnable must be true to
        # set this option. In a given datasource maximum of 5 properties can be
        # marked as is_wildcard_searchable.
        # Note: This is an alpha feature and is enabled for whitelisted users only.
        # Corresponds to the JSON property `isWildcardSearchable`
        # @return [Boolean]
        attr_accessor :is_wildcard_searchable
        alias_method :is_wildcard_searchable?, :is_wildcard_searchable
      
        # The name of the property. Item indexing requests sent to the Indexing API
        # should set the property name
        # equal to this value. For example, if name is *subject_line*, then indexing
        # requests for document items with subject fields should set the
        # name for that field equal to
        # *subject_line*. Use the name as the identifier for the object property.
        # Once registered as a property for an object, you cannot re-use this name
        # for another property within that object.
        # The name must start with a letter and can only contain letters (A-Z, a-z)
        # or numbers (0-9).
        # The maximum length is 256 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Options for object properties.
        # Corresponds to the JSON property `objectPropertyOptions`
        # @return [Google::Apis::CloudsearchV1::ObjectPropertyOptions]
        attr_accessor :object_property_options
      
        # Options for text properties.
        # Corresponds to the JSON property `textPropertyOptions`
        # @return [Google::Apis::CloudsearchV1::TextPropertyOptions]
        attr_accessor :text_property_options
      
        # Options for timestamp properties.
        # Corresponds to the JSON property `timestampPropertyOptions`
        # @return [Google::Apis::CloudsearchV1::TimestampPropertyOptions]
        attr_accessor :timestamp_property_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boolean_property_options = args[:boolean_property_options] if args.key?(:boolean_property_options)
          @date_property_options = args[:date_property_options] if args.key?(:date_property_options)
          @display_options = args[:display_options] if args.key?(:display_options)
          @double_property_options = args[:double_property_options] if args.key?(:double_property_options)
          @enum_property_options = args[:enum_property_options] if args.key?(:enum_property_options)
          @html_property_options = args[:html_property_options] if args.key?(:html_property_options)
          @integer_property_options = args[:integer_property_options] if args.key?(:integer_property_options)
          @is_facetable = args[:is_facetable] if args.key?(:is_facetable)
          @is_repeatable = args[:is_repeatable] if args.key?(:is_repeatable)
          @is_returnable = args[:is_returnable] if args.key?(:is_returnable)
          @is_sortable = args[:is_sortable] if args.key?(:is_sortable)
          @is_suggestable = args[:is_suggestable] if args.key?(:is_suggestable)
          @is_wildcard_searchable = args[:is_wildcard_searchable] if args.key?(:is_wildcard_searchable)
          @name = args[:name] if args.key?(:name)
          @object_property_options = args[:object_property_options] if args.key?(:object_property_options)
          @text_property_options = args[:text_property_options] if args.key?(:text_property_options)
          @timestamp_property_options = args[:timestamp_property_options] if args.key?(:timestamp_property_options)
        end
      end
      
      # The display options for a property.
      class PropertyDisplayOptions
        include Google::Apis::Core::Hashable
      
        # The user friendly label for the property that will be used if the property
        # is specified to be displayed in ObjectDisplayOptions. If given, the display
        # label will be shown in front of the property values when the property is
        # part of the object display options. For example, if the property value is
        # '1', the value by itself may not be useful context for the user. If the
        # display name given was 'priority', then the user will see 'priority : 1' in
        # the search results which provides clear conext to search users. This is
        # OPTIONAL; if not given, only the property values will be displayed.
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `displayLabel`
        # @return [String]
        attr_accessor :display_label
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_label = args[:display_label] if args.key?(:display_label)
        end
      end
      
      # Represents an item to be pushed to the indexing queue.
      class PushItem
        include Google::Apis::Core::Hashable
      
        # Content hash of the item according to the repository. If specified, this is
        # used to determine how to modify this
        # item's status. Setting this field and the
        # type field results in argument
        # error.
        # The maximum length is 2048 characters.
        # Corresponds to the JSON property `contentHash`
        # @return [String]
        attr_accessor :content_hash
      
        # Metadata hash of the item according to the repository. If specified, this
        # is used to determine how to modify this
        # item's status. Setting this field and the
        # type field results in argument
        # error.
        # The maximum length is 2048 characters.
        # Corresponds to the JSON property `metadataHash`
        # @return [String]
        attr_accessor :metadata_hash
      
        # Provides additional document state information for the connector,
        # such as an alternate repository ID and other metadata.
        # The maximum length is 8192 bytes.
        # Corresponds to the JSON property `payload`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :payload
      
        # Queue to which this item belongs to.  The <code>default</code> queue is
        # chosen if this field is not specified. The maximum length is
        # 512 characters.
        # Corresponds to the JSON property `queue`
        # @return [String]
        attr_accessor :queue
      
        # Errors when the connector is communicating to the source repository.
        # Corresponds to the JSON property `repositoryError`
        # @return [Google::Apis::CloudsearchV1::RepositoryError]
        attr_accessor :repository_error
      
        # Structured data hash of the item according to the repository. If specified,
        # this is used to determine how to modify this item's status. Setting this
        # field and the type field
        # results in argument error.
        # The maximum length is 2048 characters.
        # Corresponds to the JSON property `structuredDataHash`
        # @return [String]
        attr_accessor :structured_data_hash
      
        # The type of the push operation that defines the push behavior.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_hash = args[:content_hash] if args.key?(:content_hash)
          @metadata_hash = args[:metadata_hash] if args.key?(:metadata_hash)
          @payload = args[:payload] if args.key?(:payload)
          @queue = args[:queue] if args.key?(:queue)
          @repository_error = args[:repository_error] if args.key?(:repository_error)
          @structured_data_hash = args[:structured_data_hash] if args.key?(:structured_data_hash)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class PushItemRequest
        include Google::Apis::Core::Hashable
      
        # Name of connector making this call.
        # <br />Format: datasources/`source_id`/connectors/`ID`
        # Corresponds to the JSON property `connectorName`
        # @return [String]
        attr_accessor :connector_name
      
        # Shared request debug options for all cloudsearch RPC methods.
        # Corresponds to the JSON property `debugOptions`
        # @return [Google::Apis::CloudsearchV1::DebugOptions]
        attr_accessor :debug_options
      
        # Represents an item to be pushed to the indexing queue.
        # Corresponds to the JSON property `item`
        # @return [Google::Apis::CloudsearchV1::PushItem]
        attr_accessor :item
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @connector_name = args[:connector_name] if args.key?(:connector_name)
          @debug_options = args[:debug_options] if args.key?(:debug_options)
          @item = args[:item] if args.key?(:item)
        end
      end
      
      # 
      class QueryCountByStatus
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # This represents the http status code.
        # Corresponds to the JSON property `statusCode`
        # @return [Fixnum]
        attr_accessor :status_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @status_code = args[:status_code] if args.key?(:status_code)
        end
      end
      
      # 
      class QueryInterpretation
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `interpretationType`
        # @return [String]
        attr_accessor :interpretation_type
      
        # The interpretation of the query used in search. For example, queries with
        # natural language intent like "email from john" will be interpreted as
        # "from:john source:mail". This field will not be filled when the reason is
        # NO_RESULTS_FOUND_FOR_USER_QUERY.
        # Corresponds to the JSON property `interpretedQuery`
        # @return [String]
        attr_accessor :interpreted_query
      
        # The reason for interpretation of the query. This field will not be
        # UNSPECIFIED if the interpretation type is not NONE.
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @interpretation_type = args[:interpretation_type] if args.key?(:interpretation_type)
          @interpreted_query = args[:interpreted_query] if args.key?(:interpreted_query)
          @reason = args[:reason] if args.key?(:reason)
        end
      end
      
      # Options to interpret user query.
      class QueryInterpretationOptions
        include Google::Apis::Core::Hashable
      
        # Flag to disable natural language (NL) interpretation of queries. Default is
        # false, Set to true to disable natural language interpretation. NL
        # interpretation only applies to predefined datasources.
        # Corresponds to the JSON property `disableNlInterpretation`
        # @return [Boolean]
        attr_accessor :disable_nl_interpretation
        alias_method :disable_nl_interpretation?, :disable_nl_interpretation
      
        # Enable this flag to turn off all internal optimizations like natural
        # language (NL) interpretation of queries, supplemental result retrieval,
        # and usage of synonyms including custom ones.
        # Nl interpretation will be disabled if either one of the two flags is true.
        # Corresponds to the JSON property `enableVerbatimMode`
        # @return [Boolean]
        attr_accessor :enable_verbatim_mode
        alias_method :enable_verbatim_mode?, :enable_verbatim_mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disable_nl_interpretation = args[:disable_nl_interpretation] if args.key?(:disable_nl_interpretation)
          @enable_verbatim_mode = args[:enable_verbatim_mode] if args.key?(:enable_verbatim_mode)
        end
      end
      
      # Information relevant only to a query entry.
      class QueryItem
        include Google::Apis::Core::Hashable
      
        # True if the text was generated by means other than a previous user search.
        # Corresponds to the JSON property `isSynthetic`
        # @return [Boolean]
        attr_accessor :is_synthetic
        alias_method :is_synthetic?, :is_synthetic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_synthetic = args[:is_synthetic] if args.key?(:is_synthetic)
        end
      end
      
      # The definition of a operator that can be used in a Search/Suggest request.
      class QueryOperator
        include Google::Apis::Core::Hashable
      
        # Display name of the operator
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Potential list of values for the opeatror field. This field is only filled
        # when we can safely enumerate all the possible values of this operator.
        # Corresponds to the JSON property `enumValues`
        # @return [Array<String>]
        attr_accessor :enum_values
      
        # Indicates the operator name that can be used to  isolate the property using
        # the greater-than operator.
        # Corresponds to the JSON property `greaterThanOperatorName`
        # @return [String]
        attr_accessor :greater_than_operator_name
      
        # Can this operator be used to get facets.
        # Corresponds to the JSON property `isFacetable`
        # @return [Boolean]
        attr_accessor :is_facetable
        alias_method :is_facetable?, :is_facetable
      
        # Indicates if multiple values can be set for this property.
        # Corresponds to the JSON property `isRepeatable`
        # @return [Boolean]
        attr_accessor :is_repeatable
        alias_method :is_repeatable?, :is_repeatable
      
        # Will the property associated with this facet be returned as part of search
        # results.
        # Corresponds to the JSON property `isReturnable`
        # @return [Boolean]
        attr_accessor :is_returnable
        alias_method :is_returnable?, :is_returnable
      
        # Can this operator be used to sort results.
        # Corresponds to the JSON property `isSortable`
        # @return [Boolean]
        attr_accessor :is_sortable
        alias_method :is_sortable?, :is_sortable
      
        # Can get suggestions for this field.
        # Corresponds to the JSON property `isSuggestable`
        # @return [Boolean]
        attr_accessor :is_suggestable
        alias_method :is_suggestable?, :is_suggestable
      
        # Indicates the operator name that can be used to  isolate the property using
        # the less-than operator.
        # Corresponds to the JSON property `lessThanOperatorName`
        # @return [String]
        attr_accessor :less_than_operator_name
      
        # The name of the operator.
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        # Type of the operator.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @enum_values = args[:enum_values] if args.key?(:enum_values)
          @greater_than_operator_name = args[:greater_than_operator_name] if args.key?(:greater_than_operator_name)
          @is_facetable = args[:is_facetable] if args.key?(:is_facetable)
          @is_repeatable = args[:is_repeatable] if args.key?(:is_repeatable)
          @is_returnable = args[:is_returnable] if args.key?(:is_returnable)
          @is_sortable = args[:is_sortable] if args.key?(:is_sortable)
          @is_suggestable = args[:is_suggestable] if args.key?(:is_suggestable)
          @less_than_operator_name = args[:less_than_operator_name] if args.key?(:less_than_operator_name)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # List of sources that the user can search using the query API.
      class QuerySource
        include Google::Apis::Core::Hashable
      
        # Display name of the data source.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # List of all operators applicable for this source.
        # Corresponds to the JSON property `operators`
        # @return [Array<Google::Apis::CloudsearchV1::QueryOperator>]
        attr_accessor :operators
      
        # A short name or alias for the source.  This value can be used with the
        # 'source' operator.
        # Corresponds to the JSON property `shortName`
        # @return [String]
        attr_accessor :short_name
      
        # Defines sources for the suggest/search APIs.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::CloudsearchV1::Source]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @operators = args[:operators] if args.key?(:operators)
          @short_name = args[:short_name] if args.key?(:short_name)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # This field does not contain anything as of now and is just used as an
      # indicator that the suggest result was a phrase completion.
      class QuerySuggestion
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Errors when the connector is communicating to the source repository.
      class RepositoryError
        include Google::Apis::Core::Hashable
      
        # Message that describes the error. The maximum allowable length
        # of the message is 8192 characters.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # Error codes.  Matches the definition of HTTP status codes.
        # Corresponds to the JSON property `httpStatusCode`
        # @return [Fixnum]
        attr_accessor :http_status_code
      
        # Type of error.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_message = args[:error_message] if args.key?(:error_message)
          @http_status_code = args[:http_status_code] if args.key?(:http_status_code)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Shared request options for all RPC methods.
      class RequestOptions
        include Google::Apis::Core::Hashable
      
        # Shared request debug options for all cloudsearch RPC methods.
        # Corresponds to the JSON property `debugOptions`
        # @return [Google::Apis::CloudsearchV1::DebugOptions]
        attr_accessor :debug_options
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn".
        # For more information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # For translations.
        # Set this field using the language set in browser or for the page. In the
        # event that the user's language preference is known, set this field to the
        # known user language.
        # When specified, the documents in search results are biased towards the
        # specified language.
        # The suggest API does not use this parameter. Instead, suggest autocompletes
        # only based on characters in the query.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Id of the application created using SearchApplicationsService.
        # Corresponds to the JSON property `searchApplicationId`
        # @return [String]
        attr_accessor :search_application_id
      
        # Current user's time zone id, such as "America/Los_Angeles" or
        # "Australia/Sydney". These IDs are defined by
        # [Unicode Common Locale Data Repository (CLDR)](http://cldr.unicode.org/)
        # project, and currently available in the file
        # [timezone.xml](http://unicode.org/repos/cldr/trunk/common/bcp47/timezone.xml).
        # This field is used to correctly interpret date and time queries.
        # If this field is not specified, the default time zone (UTC) is used.
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @debug_options = args[:debug_options] if args.key?(:debug_options)
          @language_code = args[:language_code] if args.key?(:language_code)
          @search_application_id = args[:search_application_id] if args.key?(:search_application_id)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
        end
      end
      
      # 
      class ResetSearchApplicationRequest
        include Google::Apis::Core::Hashable
      
        # Shared request debug options for all cloudsearch RPC methods.
        # Corresponds to the JSON property `debugOptions`
        # @return [Google::Apis::CloudsearchV1::DebugOptions]
        attr_accessor :debug_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @debug_options = args[:debug_options] if args.key?(:debug_options)
        end
      end
      
      # Debugging information about the response.
      class ResponseDebugInfo
        include Google::Apis::Core::Hashable
      
        # General debug info formatted for display.
        # Corresponds to the JSON property `formattedDebugInfo`
        # @return [String]
        attr_accessor :formatted_debug_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @formatted_debug_info = args[:formatted_debug_info] if args.key?(:formatted_debug_info)
        end
      end
      
      # Information relevant only to a restrict entry.
      # NextId: 12
      class RestrictItem
        include Google::Apis::Core::Hashable
      
        # Drive follow-up search restricts (e.g. "followup:suggestions").
        # Corresponds to the JSON property `driveFollowUpRestrict`
        # @return [Google::Apis::CloudsearchV1::DriveFollowUpRestrict]
        attr_accessor :drive_follow_up_restrict
      
        # Drive location search restricts (e.g. "is:starred").
        # Corresponds to the JSON property `driveLocationRestrict`
        # @return [Google::Apis::CloudsearchV1::DriveLocationRestrict]
        attr_accessor :drive_location_restrict
      
        # Drive mime-type search restricts (e.g. "type:pdf").
        # Corresponds to the JSON property `driveMimeTypeRestrict`
        # @return [Google::Apis::CloudsearchV1::DriveMimeTypeRestrict]
        attr_accessor :drive_mime_type_restrict
      
        # The time span search restrict (e.g. "after:2017-09-11 before:2017-09-12").
        # Corresponds to the JSON property `driveTimeSpanRestrict`
        # @return [Google::Apis::CloudsearchV1::DriveTimeSpanRestrict]
        attr_accessor :drive_time_span_restrict
      
        # Gmail Action restricts (i.e. read/replied/snoozed).
        # Corresponds to the JSON property `gmailActionRestrict`
        # @return [Google::Apis::CloudsearchV1::GmailActionRestrict]
        attr_accessor :gmail_action_restrict
      
        # Gmail Attachment restricts (i.e. has:attachment, has:drive, filename:pdf).
        # Corresponds to the JSON property `gmailAttachmentRestrict`
        # @return [Google::Apis::CloudsearchV1::GmailAttachmentRestrict]
        attr_accessor :gmail_attachment_restrict
      
        # Gmail Folder restricts (i.e. in Drafts/Sent/Chats/User Generated Labels).
        # Corresponds to the JSON property `gmailFolderRestrict`
        # @return [Google::Apis::CloudsearchV1::GmailFolderRestrict]
        attr_accessor :gmail_folder_restrict
      
        # Gmail Intelligent restricts (i.e. smartlabels, important).
        # Corresponds to the JSON property `gmailIntelligentRestrict`
        # @return [Google::Apis::CloudsearchV1::GmailIntelligentRestrict]
        attr_accessor :gmail_intelligent_restrict
      
        # Gmail Time restricts (i.e. received today, this week).
        # Corresponds to the JSON property `gmailTimeRestrict`
        # @return [Google::Apis::CloudsearchV1::GmailTimeRestrict]
        attr_accessor :gmail_time_restrict
      
        # The search restrict (e.g. "after:2017-09-11 before:2017-09-12").
        # Corresponds to the JSON property `searchOperator`
        # @return [String]
        attr_accessor :search_operator
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @drive_follow_up_restrict = args[:drive_follow_up_restrict] if args.key?(:drive_follow_up_restrict)
          @drive_location_restrict = args[:drive_location_restrict] if args.key?(:drive_location_restrict)
          @drive_mime_type_restrict = args[:drive_mime_type_restrict] if args.key?(:drive_mime_type_restrict)
          @drive_time_span_restrict = args[:drive_time_span_restrict] if args.key?(:drive_time_span_restrict)
          @gmail_action_restrict = args[:gmail_action_restrict] if args.key?(:gmail_action_restrict)
          @gmail_attachment_restrict = args[:gmail_attachment_restrict] if args.key?(:gmail_attachment_restrict)
          @gmail_folder_restrict = args[:gmail_folder_restrict] if args.key?(:gmail_folder_restrict)
          @gmail_intelligent_restrict = args[:gmail_intelligent_restrict] if args.key?(:gmail_intelligent_restrict)
          @gmail_time_restrict = args[:gmail_time_restrict] if args.key?(:gmail_time_restrict)
          @search_operator = args[:search_operator] if args.key?(:search_operator)
        end
      end
      
      # Result count information
      class ResultCounts
        include Google::Apis::Core::Hashable
      
        # Result count information for each source with results.
        # Corresponds to the JSON property `sourceResultCounts`
        # @return [Array<Google::Apis::CloudsearchV1::SourceResultCount>]
        attr_accessor :source_result_counts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @source_result_counts = args[:source_result_counts] if args.key?(:source_result_counts)
        end
      end
      
      # Debugging information about the result.
      class ResultDebugInfo
        include Google::Apis::Core::Hashable
      
        # General debug info formatted for display.
        # Corresponds to the JSON property `formattedDebugInfo`
        # @return [String]
        attr_accessor :formatted_debug_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @formatted_debug_info = args[:formatted_debug_info] if args.key?(:formatted_debug_info)
        end
      end
      
      # Display Fields for Search Results
      class ResultDisplayField
        include Google::Apis::Core::Hashable
      
        # The display label for the property.
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        # The operator name of the property.
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        # A typed name-value pair for structured data.  The type of the value should
        # be the same as the registered type for the `name` property in the object
        # definition of `objectType`.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::CloudsearchV1::NamedProperty]
        attr_accessor :property
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label = args[:label] if args.key?(:label)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
          @property = args[:property] if args.key?(:property)
        end
      end
      
      # The collection of fields that make up a displayed line
      class ResultDisplayLine
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::CloudsearchV1::ResultDisplayField>]
        attr_accessor :fields
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
        end
      end
      
      # 
      class ResultDisplayMetadata
        include Google::Apis::Core::Hashable
      
        # The metalines content to be displayed with the result.
        # Corresponds to the JSON property `metalines`
        # @return [Array<Google::Apis::CloudsearchV1::ResultDisplayLine>]
        attr_accessor :metalines
      
        # The display label for the object.
        # Corresponds to the JSON property `objectTypeLabel`
        # @return [String]
        attr_accessor :object_type_label
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metalines = args[:metalines] if args.key?(:metalines)
          @object_type_label = args[:object_type_label] if args.key?(:object_type_label)
        end
      end
      
      # 
      class RetrievalImportance
        include Google::Apis::Core::Hashable
      
        # Indicates the ranking importance given to property when it is matched
        # during retrieval. Once set, the token importance of a property cannot be
        # changed.
        # Corresponds to the JSON property `importance`
        # @return [String]
        attr_accessor :importance
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @importance = args[:importance] if args.key?(:importance)
        end
      end
      
      # The schema definition for a data source.
      class Schema
        include Google::Apis::Core::Hashable
      
        # The list of top-level objects for the data source.
        # The maximum number of elements is 10.
        # Corresponds to the JSON property `objectDefinitions`
        # @return [Array<Google::Apis::CloudsearchV1::ObjectDefinition>]
        attr_accessor :object_definitions
      
        # IDs of the Long Running Operations (LROs) currently running for this
        # schema. After modifying the schema, wait for operations to complete
        # before indexing additional content.
        # Corresponds to the JSON property `operationIds`
        # @return [Array<String>]
        attr_accessor :operation_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @object_definitions = args[:object_definitions] if args.key?(:object_definitions)
          @operation_ids = args[:operation_ids] if args.key?(:operation_ids)
        end
      end
      
      # Scoring configurations for a source while processing a
      # Search or
      # Suggest request.
      class ScoringConfig
        include Google::Apis::Core::Hashable
      
        # Whether to use freshness as a ranking signal. By default, freshness is used
        # as a ranking signal. Note that this setting is not available in the Admin
        # UI.
        # Corresponds to the JSON property `disableFreshness`
        # @return [Boolean]
        attr_accessor :disable_freshness
        alias_method :disable_freshness?, :disable_freshness
      
        # Whether to personalize the results. By default, personal signals will
        # be used to boost results.
        # Corresponds to the JSON property `disablePersonalization`
        # @return [Boolean]
        attr_accessor :disable_personalization
        alias_method :disable_personalization?, :disable_personalization
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disable_freshness = args[:disable_freshness] if args.key?(:disable_freshness)
          @disable_personalization = args[:disable_personalization] if args.key?(:disable_personalization)
        end
      end
      
      # SearchApplication
      class SearchApplication
        include Google::Apis::Core::Hashable
      
        # Retrictions applied to the configurations.
        # The maximum number of elements is 10.
        # Corresponds to the JSON property `dataSourceRestrictions`
        # @return [Array<Google::Apis::CloudsearchV1::DataSourceRestriction>]
        attr_accessor :data_source_restrictions
      
        # The default fields for returning facet results.
        # The sources specified here also have been included in
        # data_source_restrictions
        # above.
        # Corresponds to the JSON property `defaultFacetOptions`
        # @return [Array<Google::Apis::CloudsearchV1::FacetOptions>]
        attr_accessor :default_facet_options
      
        # The default options for sorting the search results
        # Corresponds to the JSON property `defaultSortOptions`
        # @return [Google::Apis::CloudsearchV1::SortOptions]
        attr_accessor :default_sort_options
      
        # Display name of the Search Application.
        # The maximum length is 300 characters.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Name of the Search Application.
        # <br />Format: searchapplications/`application_id`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # IDs of the Long Running Operations (LROs) currently running for this
        # schema. Output only field.
        # Corresponds to the JSON property `operationIds`
        # @return [Array<String>]
        attr_accessor :operation_ids
      
        # Scoring configurations for a source while processing a
        # Search or
        # Suggest request.
        # Corresponds to the JSON property `scoringConfig`
        # @return [Google::Apis::CloudsearchV1::ScoringConfig]
        attr_accessor :scoring_config
      
        # Configuration for a sources specified in data_source_restrictions.
        # Corresponds to the JSON property `sourceConfig`
        # @return [Array<Google::Apis::CloudsearchV1::SourceConfig>]
        attr_accessor :source_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_source_restrictions = args[:data_source_restrictions] if args.key?(:data_source_restrictions)
          @default_facet_options = args[:default_facet_options] if args.key?(:default_facet_options)
          @default_sort_options = args[:default_sort_options] if args.key?(:default_sort_options)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @operation_ids = args[:operation_ids] if args.key?(:operation_ids)
          @scoring_config = args[:scoring_config] if args.key?(:scoring_config)
          @source_config = args[:source_config] if args.key?(:source_config)
        end
      end
      
      # 
      class SearchApplicationQueryStats
        include Google::Apis::Core::Hashable
      
        # Represents a whole calendar date, for example a date of birth. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the [Proleptic Gregorian Calendar](https://en.wikipedia.org/
        # wiki/Proleptic_Gregorian_calendar). The date must be a valid calendar date
        # between the year 1 and 9999.
        # Corresponds to the JSON property `date`
        # @return [Google::Apis::CloudsearchV1::Date]
        attr_accessor :date
      
        # 
        # Corresponds to the JSON property `queryCountByStatus`
        # @return [Array<Google::Apis::CloudsearchV1::QueryCountByStatus>]
        attr_accessor :query_count_by_status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date = args[:date] if args.key?(:date)
          @query_count_by_status = args[:query_count_by_status] if args.key?(:query_count_by_status)
        end
      end
      
      # 
      class SearchApplicationSessionStats
        include Google::Apis::Core::Hashable
      
        # Represents a whole calendar date, for example a date of birth. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the [Proleptic Gregorian Calendar](https://en.wikipedia.org/
        # wiki/Proleptic_Gregorian_calendar). The date must be a valid calendar date
        # between the year 1 and 9999.
        # Corresponds to the JSON property `date`
        # @return [Google::Apis::CloudsearchV1::Date]
        attr_accessor :date
      
        # The count of search sessions on the day
        # Corresponds to the JSON property `searchSessionsCount`
        # @return [Fixnum]
        attr_accessor :search_sessions_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date = args[:date] if args.key?(:date)
          @search_sessions_count = args[:search_sessions_count] if args.key?(:search_sessions_count)
        end
      end
      
      # 
      class SearchApplicationUserStats
        include Google::Apis::Core::Hashable
      
        # Represents a whole calendar date, for example a date of birth. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the [Proleptic Gregorian Calendar](https://en.wikipedia.org/
        # wiki/Proleptic_Gregorian_calendar). The date must be a valid calendar date
        # between the year 1 and 9999.
        # Corresponds to the JSON property `date`
        # @return [Google::Apis::CloudsearchV1::Date]
        attr_accessor :date
      
        # The count of unique active users in the past one day
        # Corresponds to the JSON property `oneDayActiveUsersCount`
        # @return [Fixnum]
        attr_accessor :one_day_active_users_count
      
        # The count of unique active users in the past seven days
        # Corresponds to the JSON property `sevenDaysActiveUsersCount`
        # @return [Fixnum]
        attr_accessor :seven_days_active_users_count
      
        # The count of unique active users in the past thirty days
        # Corresponds to the JSON property `thirtyDaysActiveUsersCount`
        # @return [Fixnum]
        attr_accessor :thirty_days_active_users_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date = args[:date] if args.key?(:date)
          @one_day_active_users_count = args[:one_day_active_users_count] if args.key?(:one_day_active_users_count)
          @seven_days_active_users_count = args[:seven_days_active_users_count] if args.key?(:seven_days_active_users_count)
          @thirty_days_active_users_count = args[:thirty_days_active_users_count] if args.key?(:thirty_days_active_users_count)
        end
      end
      
      # 
      class SearchItemsByViewUrlRequest
        include Google::Apis::Core::Hashable
      
        # Shared request debug options for all cloudsearch RPC methods.
        # Corresponds to the JSON property `debugOptions`
        # @return [Google::Apis::CloudsearchV1::DebugOptions]
        attr_accessor :debug_options
      
        # The next_page_token value returned from a previous request, if any.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # Specify the full view URL to find the corresponding item.
        # The maximum length is 2048 characters.
        # Corresponds to the JSON property `viewUrl`
        # @return [String]
        attr_accessor :view_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @debug_options = args[:debug_options] if args.key?(:debug_options)
          @page_token = args[:page_token] if args.key?(:page_token)
          @view_url = args[:view_url] if args.key?(:view_url)
        end
      end
      
      # 
      class SearchItemsByViewUrlResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::CloudsearchV1::Item>]
        attr_accessor :items
      
        # Token to retrieve the next page of results, or empty if there are no
        # more results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Additional search quality metadata of the item.
      class SearchQualityMetadata
        include Google::Apis::Core::Hashable
      
        # An indication of the quality of the item, used to influence search quality.
        # Value should be between 0.0 (lowest quality) and 1.0 (highest quality). The
        # default value is 0.0.
        # Corresponds to the JSON property `quality`
        # @return [Float]
        attr_accessor :quality
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @quality = args[:quality] if args.key?(:quality)
        end
      end
      
      # The search API request.
      class SearchRequest
        include Google::Apis::Core::Hashable
      
        # The sources to use for querying. If not specified, all data sources
        # from the current search application are used.
        # Corresponds to the JSON property `dataSourceRestrictions`
        # @return [Array<Google::Apis::CloudsearchV1::DataSourceRestriction>]
        attr_accessor :data_source_restrictions
      
        # 
        # Corresponds to the JSON property `facetOptions`
        # @return [Array<Google::Apis::CloudsearchV1::FacetOptions>]
        attr_accessor :facet_options
      
        # Maximum number of search results to return in one page.
        # Valid values are between 1 and 100, inclusive.
        # Default value is 10.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # The raw query string.
        # See supported search operators in the [Cloud search
        # Cheat
        # Sheet](https://gsuite.google.com/learning-center/products/cloudsearch/cheat-
        # sheet/)
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # Options to interpret user query.
        # Corresponds to the JSON property `queryInterpretationOptions`
        # @return [Google::Apis::CloudsearchV1::QueryInterpretationOptions]
        attr_accessor :query_interpretation_options
      
        # Shared request options for all RPC methods.
        # Corresponds to the JSON property `requestOptions`
        # @return [Google::Apis::CloudsearchV1::RequestOptions]
        attr_accessor :request_options
      
        # The options for sorting the search results
        # Corresponds to the JSON property `sortOptions`
        # @return [Google::Apis::CloudsearchV1::SortOptions]
        attr_accessor :sort_options
      
        # Starting index of the results.
        # Corresponds to the JSON property `start`
        # @return [Fixnum]
        attr_accessor :start
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_source_restrictions = args[:data_source_restrictions] if args.key?(:data_source_restrictions)
          @facet_options = args[:facet_options] if args.key?(:facet_options)
          @page_size = args[:page_size] if args.key?(:page_size)
          @query = args[:query] if args.key?(:query)
          @query_interpretation_options = args[:query_interpretation_options] if args.key?(:query_interpretation_options)
          @request_options = args[:request_options] if args.key?(:request_options)
          @sort_options = args[:sort_options] if args.key?(:sort_options)
          @start = args[:start] if args.key?(:start)
        end
      end
      
      # The search API response.
      class SearchResponse
        include Google::Apis::Core::Hashable
      
        # Debugging information about the response.
        # Corresponds to the JSON property `debugInfo`
        # @return [Google::Apis::CloudsearchV1::ResponseDebugInfo]
        attr_accessor :debug_info
      
        # Error information about the response.
        # Corresponds to the JSON property `errorInfo`
        # @return [Google::Apis::CloudsearchV1::ErrorInfo]
        attr_accessor :error_info
      
        # Repeated facet results.
        # Corresponds to the JSON property `facetResults`
        # @return [Array<Google::Apis::CloudsearchV1::FacetResult>]
        attr_accessor :facet_results
      
        # Whether there are more search results matching the query.
        # Corresponds to the JSON property `hasMoreResults`
        # @return [Boolean]
        attr_accessor :has_more_results
        alias_method :has_more_results?, :has_more_results
      
        # Query interpretation result for user query. Empty if query interpretation
        # is disabled.
        # Corresponds to the JSON property `queryInterpretation`
        # @return [Google::Apis::CloudsearchV1::QueryInterpretation]
        attr_accessor :query_interpretation
      
        # The estimated result count for this query.
        # Corresponds to the JSON property `resultCountEstimate`
        # @return [Fixnum]
        attr_accessor :result_count_estimate
      
        # The exact result count for this query.
        # Corresponds to the JSON property `resultCountExact`
        # @return [Fixnum]
        attr_accessor :result_count_exact
      
        # Result count information
        # Corresponds to the JSON property `resultCounts`
        # @return [Google::Apis::CloudsearchV1::ResultCounts]
        attr_accessor :result_counts
      
        # Results from a search query.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::CloudsearchV1::SearchResult>]
        attr_accessor :results
      
        # Suggested spelling for the query.
        # Corresponds to the JSON property `spellResults`
        # @return [Array<Google::Apis::CloudsearchV1::SpellResult>]
        attr_accessor :spell_results
      
        # Structured results for the user query. These results are not counted
        # against the page_size.
        # Corresponds to the JSON property `structuredResults`
        # @return [Array<Google::Apis::CloudsearchV1::StructuredResult>]
        attr_accessor :structured_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @debug_info = args[:debug_info] if args.key?(:debug_info)
          @error_info = args[:error_info] if args.key?(:error_info)
          @facet_results = args[:facet_results] if args.key?(:facet_results)
          @has_more_results = args[:has_more_results] if args.key?(:has_more_results)
          @query_interpretation = args[:query_interpretation] if args.key?(:query_interpretation)
          @result_count_estimate = args[:result_count_estimate] if args.key?(:result_count_estimate)
          @result_count_exact = args[:result_count_exact] if args.key?(:result_count_exact)
          @result_counts = args[:result_counts] if args.key?(:result_counts)
          @results = args[:results] if args.key?(:results)
          @spell_results = args[:spell_results] if args.key?(:spell_results)
          @structured_results = args[:structured_results] if args.key?(:structured_results)
        end
      end
      
      # Results containing indexed information for a document.
      class SearchResult
        include Google::Apis::Core::Hashable
      
        # If source is clustered, provide list of clustered results. There will only
        # be one level of clustered results. If current source is not enabled for
        # clustering, this field will be empty.
        # Corresponds to the JSON property `clusteredResults`
        # @return [Array<Google::Apis::CloudsearchV1::SearchResult>]
        attr_accessor :clustered_results
      
        # Debugging information about the result.
        # Corresponds to the JSON property `debugInfo`
        # @return [Google::Apis::CloudsearchV1::ResultDebugInfo]
        attr_accessor :debug_info
      
        # Metadata of a matched search result.
        # Corresponds to the JSON property `metadata`
        # @return [Google::Apis::CloudsearchV1::Metadata]
        attr_accessor :metadata
      
        # Snippet of the search result, which summarizes the content of the resulting
        # page.
        # Corresponds to the JSON property `snippet`
        # @return [Google::Apis::CloudsearchV1::Snippet]
        attr_accessor :snippet
      
        # Title of the search result.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The URL of the search result. The URL contains a Google redirect to the
        # actual item. This URL is signed and shouldn't be changed.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @clustered_results = args[:clustered_results] if args.key?(:clustered_results)
          @debug_info = args[:debug_info] if args.key?(:debug_info)
          @metadata = args[:metadata] if args.key?(:metadata)
          @snippet = args[:snippet] if args.key?(:snippet)
          @title = args[:title] if args.key?(:title)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Snippet of the search result, which summarizes the content of the resulting
      # page.
      class Snippet
        include Google::Apis::Core::Hashable
      
        # The matched ranges in the snippet.
        # Corresponds to the JSON property `matchRanges`
        # @return [Array<Google::Apis::CloudsearchV1::MatchRange>]
        attr_accessor :match_ranges
      
        # The snippet of the document.
        # The snippet of the document. May contain escaped HTML character that
        # should be unescaped prior to rendering.
        # Corresponds to the JSON property `snippet`
        # @return [String]
        attr_accessor :snippet
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @match_ranges = args[:match_ranges] if args.key?(:match_ranges)
          @snippet = args[:snippet] if args.key?(:snippet)
        end
      end
      
      # 
      class SortOptions
        include Google::Apis::Core::Hashable
      
        # Name of the operator corresponding to the field to sort on.
        # The corresponding property must be marked as
        # sortable.
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        # Ascending is the default sort order
        # Corresponds to the JSON property `sortOrder`
        # @return [String]
        attr_accessor :sort_order
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
          @sort_order = args[:sort_order] if args.key?(:sort_order)
        end
      end
      
      # Defines sources for the suggest/search APIs.
      class Source
        include Google::Apis::Core::Hashable
      
        # Source name for content indexed by the
        # Indexing API.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Predefined content source for Google Apps.
        # Corresponds to the JSON property `predefinedSource`
        # @return [String]
        attr_accessor :predefined_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @predefined_source = args[:predefined_source] if args.key?(:predefined_source)
        end
      end
      
      # Configurations for a source while processing a
      # Search or
      # Suggest request.
      class SourceConfig
        include Google::Apis::Core::Hashable
      
        # Set search results crowding limits. Crowding is a situation in which
        # multiple results from the same source or host "crowd out" other results,
        # diminishing the quality of search for users. To foster better search quality
        # and source diversity in search results, you can set a condition to reduce
        # repetitive results by source.
        # Corresponds to the JSON property `crowdingConfig`
        # @return [Google::Apis::CloudsearchV1::SourceCrowdingConfig]
        attr_accessor :crowding_config
      
        # Set the scoring configuration. This allows modifying the ranking of results
        # for a source.
        # Corresponds to the JSON property `scoringConfig`
        # @return [Google::Apis::CloudsearchV1::SourceScoringConfig]
        attr_accessor :scoring_config
      
        # Defines sources for the suggest/search APIs.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::CloudsearchV1::Source]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crowding_config = args[:crowding_config] if args.key?(:crowding_config)
          @scoring_config = args[:scoring_config] if args.key?(:scoring_config)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # Set search results crowding limits. Crowding is a situation in which
      # multiple results from the same source or host "crowd out" other results,
      # diminishing the quality of search for users. To foster better search quality
      # and source diversity in search results, you can set a condition to reduce
      # repetitive results by source.
      class SourceCrowdingConfig
        include Google::Apis::Core::Hashable
      
        # Maximum number of results allowed from a source.
        # No limits will be set on results if this value is less than or equal to 0.
        # Corresponds to the JSON property `numResults`
        # @return [Fixnum]
        attr_accessor :num_results
      
        # Maximum number of suggestions allowed from a source.
        # No limits will be set on results if this value is less than or equal to 0.
        # Corresponds to the JSON property `numSuggestions`
        # @return [Fixnum]
        attr_accessor :num_suggestions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @num_results = args[:num_results] if args.key?(:num_results)
          @num_suggestions = args[:num_suggestions] if args.key?(:num_suggestions)
        end
      end
      
      # Per source result count information.
      class SourceResultCount
        include Google::Apis::Core::Hashable
      
        # Whether there are more search results for this source.
        # Corresponds to the JSON property `hasMoreResults`
        # @return [Boolean]
        attr_accessor :has_more_results
        alias_method :has_more_results?, :has_more_results
      
        # The estimated result count for this source.
        # Corresponds to the JSON property `resultCountEstimate`
        # @return [Fixnum]
        attr_accessor :result_count_estimate
      
        # The exact result count for this source.
        # Corresponds to the JSON property `resultCountExact`
        # @return [Fixnum]
        attr_accessor :result_count_exact
      
        # Defines sources for the suggest/search APIs.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::CloudsearchV1::Source]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @has_more_results = args[:has_more_results] if args.key?(:has_more_results)
          @result_count_estimate = args[:result_count_estimate] if args.key?(:result_count_estimate)
          @result_count_exact = args[:result_count_exact] if args.key?(:result_count_exact)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # Set the scoring configuration. This allows modifying the ranking of results
      # for a source.
      class SourceScoringConfig
        include Google::Apis::Core::Hashable
      
        # Importance of the source.
        # Corresponds to the JSON property `sourceImportance`
        # @return [String]
        attr_accessor :source_importance
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @source_importance = args[:source_importance] if args.key?(:source_importance)
        end
      end
      
      # 
      class SpellResult
        include Google::Apis::Core::Hashable
      
        # The suggested spelling of the query.
        # Corresponds to the JSON property `suggestedQuery`
        # @return [String]
        attr_accessor :suggested_query
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @suggested_query = args[:suggested_query] if args.key?(:suggested_query)
        end
      end
      
      # Start upload file request.
      class StartUploadItemRequest
        include Google::Apis::Core::Hashable
      
        # Name of connector making this call.
        # <br />Format: datasources/`source_id`/connectors/`ID`
        # Corresponds to the JSON property `connectorName`
        # @return [String]
        attr_accessor :connector_name
      
        # Shared request debug options for all cloudsearch RPC methods.
        # Corresponds to the JSON property `debugOptions`
        # @return [Google::Apis::CloudsearchV1::DebugOptions]
        attr_accessor :debug_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @connector_name = args[:connector_name] if args.key?(:connector_name)
          @debug_options = args[:debug_options] if args.key?(:debug_options)
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
      
      # A structured data object consisting of named properties.
      class StructuredDataObject
        include Google::Apis::Core::Hashable
      
        # The properties for the object.
        # The maximum number of elements is 1000.
        # Corresponds to the JSON property `properties`
        # @return [Array<Google::Apis::CloudsearchV1::NamedProperty>]
        attr_accessor :properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @properties = args[:properties] if args.key?(:properties)
        end
      end
      
      # Structured results that are returned as part of search request.
      class StructuredResult
        include Google::Apis::Core::Hashable
      
        # Object to represent a person.
        # Corresponds to the JSON property `person`
        # @return [Google::Apis::CloudsearchV1::Person]
        attr_accessor :person
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @person = args[:person] if args.key?(:person)
        end
      end
      
      # Request of suggest API.
      class SuggestRequest
        include Google::Apis::Core::Hashable
      
        # The sources to use for suggestions. If not specified, all data sources
        # from the current search application are used.
        # Suggestions are based on Gmail titles. Suggestions from third party sources
        # are not available.
        # Corresponds to the JSON property `dataSourceRestrictions`
        # @return [Array<Google::Apis::CloudsearchV1::DataSourceRestriction>]
        attr_accessor :data_source_restrictions
      
        # Partial query for which autocomplete suggestions will be shown.
        # For example, if the query is "sea", then the server might return
        # "season", "search", "seagull" and so on.
        # Corresponds to the JSON property `query`
        # @return [String]
        attr_accessor :query
      
        # Shared request options for all RPC methods.
        # Corresponds to the JSON property `requestOptions`
        # @return [Google::Apis::CloudsearchV1::RequestOptions]
        attr_accessor :request_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_source_restrictions = args[:data_source_restrictions] if args.key?(:data_source_restrictions)
          @query = args[:query] if args.key?(:query)
          @request_options = args[:request_options] if args.key?(:request_options)
        end
      end
      
      # Response of the suggest API.
      class SuggestResponse
        include Google::Apis::Core::Hashable
      
        # List of suggestions.
        # Corresponds to the JSON property `suggestResults`
        # @return [Array<Google::Apis::CloudsearchV1::SuggestResult>]
        attr_accessor :suggest_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @suggest_results = args[:suggest_results] if args.key?(:suggest_results)
        end
      end
      
      # One suggestion result.
      class SuggestResult
        include Google::Apis::Core::Hashable
      
        # This field contains information about the person being suggested.
        # Corresponds to the JSON property `peopleSuggestion`
        # @return [Google::Apis::CloudsearchV1::PeopleSuggestion]
        attr_accessor :people_suggestion
      
        # This field does not contain anything as of now and is just used as an
        # indicator that the suggest result was a phrase completion.
        # Corresponds to the JSON property `querySuggestion`
        # @return [Google::Apis::CloudsearchV1::QuerySuggestion]
        attr_accessor :query_suggestion
      
        # Defines sources for the suggest/search APIs.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::CloudsearchV1::Source]
        attr_accessor :source
      
        # The suggested query that will be used for search, when the user
        # clicks on the suggestion
        # Corresponds to the JSON property `suggestedQuery`
        # @return [String]
        attr_accessor :suggested_query
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @people_suggestion = args[:people_suggestion] if args.key?(:people_suggestion)
          @query_suggestion = args[:query_suggestion] if args.key?(:query_suggestion)
          @source = args[:source] if args.key?(:source)
          @suggested_query = args[:suggested_query] if args.key?(:suggested_query)
        end
      end
      
      # Used to provide a search operator for text properties. This is optional.
      # Search operators let users restrict the query to specific fields relevant
      # to the type of item being searched.
      class TextOperatorOptions
        include Google::Apis::Core::Hashable
      
        # If true, the text value will be tokenized as one atomic value in
        # operator searches and facet matches. For example, if the operator name is
        # "genre" and the value is "science-fiction" the query restrictions
        # "genre:science" and "genre:fiction" will not match the item;
        # "genre:science-fiction" will. Value matching is case-sensitive
        # and does not remove special characters.
        # If false, the text will be tokenized. For example, if the value is
        # "science-fiction" the queries "genre:science" and "genre:fiction" will
        # match the item.
        # Corresponds to the JSON property `exactMatchWithOperator`
        # @return [Boolean]
        attr_accessor :exact_match_with_operator
        alias_method :exact_match_with_operator?, :exact_match_with_operator
      
        # Indicates the operator name required in the query in order to isolate the
        # text property. For example, if operatorName is *subject* and the
        # property's name is *subjectLine*, then queries like
        # *subject:&lt;value&gt;* will show results only where the value of the
        # property named *subjectLine* matches *&lt;value&gt;*. By contrast, a
        # search that uses the same *&lt;value&gt;* without an operator will return
        # all items where *&lt;value&gt;* matches the value of any
        # text properties or text within the content field for the item.
        # The operator name can only contain lowercase letters (a-z).
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exact_match_with_operator = args[:exact_match_with_operator] if args.key?(:exact_match_with_operator)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
        end
      end
      
      # Options for text properties.
      class TextPropertyOptions
        include Google::Apis::Core::Hashable
      
        # Used to provide a search operator for text properties. This is optional.
        # Search operators let users restrict the query to specific fields relevant
        # to the type of item being searched.
        # Corresponds to the JSON property `operatorOptions`
        # @return [Google::Apis::CloudsearchV1::TextOperatorOptions]
        attr_accessor :operator_options
      
        # Indicates the search quality importance of the tokens within the
        # field when used for retrieval.
        # Corresponds to the JSON property `retrievalImportance`
        # @return [Google::Apis::CloudsearchV1::RetrievalImportance]
        attr_accessor :retrieval_importance
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operator_options = args[:operator_options] if args.key?(:operator_options)
          @retrieval_importance = args[:retrieval_importance] if args.key?(:retrieval_importance)
        end
      end
      
      # List of text values.
      class TextValues
        include Google::Apis::Core::Hashable
      
        # The maximum allowable length for text values is 2048 characters.
        # Corresponds to the JSON property `values`
        # @return [Array<String>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # Used to provide a search operator for timestamp properties. This is
      # optional. Search operators let users restrict the query to specific fields
      # relevant to the type of item being searched.
      class TimestampOperatorOptions
        include Google::Apis::Core::Hashable
      
        # Indicates the operator name required in the query in order to isolate the
        # timestamp property using the greater-than operator. For example, if
        # greaterThanOperatorName is *closedafter* and the property's name is
        # *closeDate*, then queries like *closedafter:&lt;value&gt;* will
        # show results only where the value of the property named *closeDate* is
        # later than *&lt;value&gt;*.
        # The operator name can only contain lowercase letters (a-z).
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `greaterThanOperatorName`
        # @return [String]
        attr_accessor :greater_than_operator_name
      
        # Indicates the operator name required in the query in order to isolate the
        # timestamp property using the less-than operator. For example, if
        # lessThanOperatorName is *closedbefore* and the property's name is
        # *closeDate*, then queries like *closedbefore:&lt;value&gt;* will
        # show results only where the value of the property named *closeDate* is
        # earlier than *&lt;value&gt;*.
        # The operator name can only contain lowercase letters (a-z).
        # The maximum length is 32 characters.
        # Corresponds to the JSON property `lessThanOperatorName`
        # @return [String]
        attr_accessor :less_than_operator_name
      
        # Indicates the operator name required in the query in order to isolate the
        # timestamp property. For example, if operatorName is *closedon* and the
        # property's name is *closeDate*, then queries like
        # *closedon:&lt;value&gt;* will show results only where the value of the
        # property named *closeDate* matches *&lt;value&gt;*. By contrast, a
        # search that uses the same *&lt;value&gt;* without an operator will return
        # all items where *&lt;value&gt;* matches the value of any String
        # properties or text within the content field for the item. The operator
        # name can only contain lowercase letters (a-z). The maximum length is 32
        # characters.
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @greater_than_operator_name = args[:greater_than_operator_name] if args.key?(:greater_than_operator_name)
          @less_than_operator_name = args[:less_than_operator_name] if args.key?(:less_than_operator_name)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
        end
      end
      
      # Options for timestamp properties.
      class TimestampPropertyOptions
        include Google::Apis::Core::Hashable
      
        # Used to provide a search operator for timestamp properties. This is
        # optional. Search operators let users restrict the query to specific fields
        # relevant to the type of item being searched.
        # Corresponds to the JSON property `operatorOptions`
        # @return [Google::Apis::CloudsearchV1::TimestampOperatorOptions]
        attr_accessor :operator_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operator_options = args[:operator_options] if args.key?(:operator_options)
        end
      end
      
      # List of timestamp values.
      class TimestampValues
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `values`
        # @return [Array<String>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # 
      class UnmappedIdentity
        include Google::Apis::Core::Hashable
      
        # Reference to a user, group, or domain.
        # Corresponds to the JSON property `externalIdentity`
        # @return [Google::Apis::CloudsearchV1::Principal]
        attr_accessor :external_identity
      
        # The resolution status for the external identity.
        # Corresponds to the JSON property `resolutionStatusCode`
        # @return [String]
        attr_accessor :resolution_status_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @external_identity = args[:external_identity] if args.key?(:external_identity)
          @resolution_status_code = args[:resolution_status_code] if args.key?(:resolution_status_code)
        end
      end
      
      # 
      class UnreserveItemsRequest
        include Google::Apis::Core::Hashable
      
        # Name of connector making this call.
        # <br />Format: datasources/`source_id`/connectors/`ID`
        # Corresponds to the JSON property `connectorName`
        # @return [String]
        attr_accessor :connector_name
      
        # Shared request debug options for all cloudsearch RPC methods.
        # Corresponds to the JSON property `debugOptions`
        # @return [Google::Apis::CloudsearchV1::DebugOptions]
        attr_accessor :debug_options
      
        # Name of a queue to unreserve items from.
        # Corresponds to the JSON property `queue`
        # @return [String]
        attr_accessor :queue
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @connector_name = args[:connector_name] if args.key?(:connector_name)
          @debug_options = args[:debug_options] if args.key?(:debug_options)
          @queue = args[:queue] if args.key?(:queue)
        end
      end
      
      # 
      class UpdateDataSourceRequest
        include Google::Apis::Core::Hashable
      
        # Shared request debug options for all cloudsearch RPC methods.
        # Corresponds to the JSON property `debugOptions`
        # @return [Google::Apis::CloudsearchV1::DebugOptions]
        attr_accessor :debug_options
      
        # Datasource is a logical namespace for items to be indexed.
        # All items must belong to a datasource.  This is the prerequisite before
        # items can be indexed into Cloud Search.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::CloudsearchV1::DataSource]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @debug_options = args[:debug_options] if args.key?(:debug_options)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # 
      class UpdateSchemaRequest
        include Google::Apis::Core::Hashable
      
        # Shared request debug options for all cloudsearch RPC methods.
        # Corresponds to the JSON property `debugOptions`
        # @return [Google::Apis::CloudsearchV1::DebugOptions]
        attr_accessor :debug_options
      
        # The schema definition for a data source.
        # Corresponds to the JSON property `schema`
        # @return [Google::Apis::CloudsearchV1::Schema]
        attr_accessor :schema
      
        # If true, the request will be validated without side effects.
        # Corresponds to the JSON property `validateOnly`
        # @return [Boolean]
        attr_accessor :validate_only
        alias_method :validate_only?, :validate_only
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @debug_options = args[:debug_options] if args.key?(:debug_options)
          @schema = args[:schema] if args.key?(:schema)
          @validate_only = args[:validate_only] if args.key?(:validate_only)
        end
      end
      
      # Represents an upload session reference.
      # This reference is created via upload
      # method.
      # Updating of item content may refer to this uploaded content via
      # contentDataRef.
      class UploadItemRef
        include Google::Apis::Core::Hashable
      
        # Name of the content reference.
        # The maximum length is 2048 characters.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Definition of a single value with generic type.
      class Value
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `booleanValue`
        # @return [Boolean]
        attr_accessor :boolean_value
        alias_method :boolean_value?, :boolean_value
      
        # Represents a whole calendar date, for example a date of birth. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the [Proleptic Gregorian Calendar](https://en.wikipedia.org/
        # wiki/Proleptic_Gregorian_calendar). The date must be a valid calendar date
        # between the year 1 and 9999.
        # Corresponds to the JSON property `dateValue`
        # @return [Google::Apis::CloudsearchV1::Date]
        attr_accessor :date_value
      
        # 
        # Corresponds to the JSON property `doubleValue`
        # @return [Float]
        attr_accessor :double_value
      
        # 
        # Corresponds to the JSON property `integerValue`
        # @return [Fixnum]
        attr_accessor :integer_value
      
        # 
        # Corresponds to the JSON property `stringValue`
        # @return [String]
        attr_accessor :string_value
      
        # 
        # Corresponds to the JSON property `timestampValue`
        # @return [String]
        attr_accessor :timestamp_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boolean_value = args[:boolean_value] if args.key?(:boolean_value)
          @date_value = args[:date_value] if args.key?(:date_value)
          @double_value = args[:double_value] if args.key?(:double_value)
          @integer_value = args[:integer_value] if args.key?(:integer_value)
          @string_value = args[:string_value] if args.key?(:string_value)
          @timestamp_value = args[:timestamp_value] if args.key?(:timestamp_value)
        end
      end
      
      # 
      class ValueFilter
        include Google::Apis::Core::Hashable
      
        # The `operator_name` applied to the query, such as *price_greater_than*.
        # The filter can work against both types of filters defined in the schema
        # for your data source:
        # <br/><br/>
        # 1. `operator_name`, where the query filters results by the property
        # that matches the value.
        # <br/>
        # 2. `greater_than_operator_name` or `less_than_operator_name` in your
        # schema. The query filters the results for the property values that are
        # greater than or less than  the supplied value in the query.
        # Corresponds to the JSON property `operatorName`
        # @return [String]
        attr_accessor :operator_name
      
        # Definition of a single value with generic type.
        # Corresponds to the JSON property `value`
        # @return [Google::Apis::CloudsearchV1::Value]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operator_name = args[:operator_name] if args.key?(:operator_name)
          @value = args[:value] if args.key?(:value)
        end
      end
    end
  end
end
