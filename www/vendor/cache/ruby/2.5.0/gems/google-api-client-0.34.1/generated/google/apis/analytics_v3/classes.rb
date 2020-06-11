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
    module AnalyticsV3
      
      # JSON template for Analytics account entry.
      class Account
        include Google::Apis::Core::Hashable
      
        # Child link for an account entry. Points to the list of web properties for this
        # account.
        # Corresponds to the JSON property `childLink`
        # @return [Google::Apis::AnalyticsV3::Account::ChildLink]
        attr_accessor :child_link
      
        # Time the account was created.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # Account ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type for Analytics account.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Account name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Permissions the user has for this account.
        # Corresponds to the JSON property `permissions`
        # @return [Google::Apis::AnalyticsV3::Account::Permissions]
        attr_accessor :permissions
      
        # Link for this account.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Indicates whether this account is starred or not.
        # Corresponds to the JSON property `starred`
        # @return [Boolean]
        attr_accessor :starred
        alias_method :starred?, :starred
      
        # Time the account was last modified.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @child_link = args[:child_link] if args.key?(:child_link)
          @created = args[:created] if args.key?(:created)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @permissions = args[:permissions] if args.key?(:permissions)
          @self_link = args[:self_link] if args.key?(:self_link)
          @starred = args[:starred] if args.key?(:starred)
          @updated = args[:updated] if args.key?(:updated)
        end
        
        # Child link for an account entry. Points to the list of web properties for this
        # account.
        class ChildLink
          include Google::Apis::Core::Hashable
        
          # Link to the list of web properties for this account.
          # Corresponds to the JSON property `href`
          # @return [String]
          attr_accessor :href
        
          # Type of the child link. Its value is "analytics#webproperties".
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @href = args[:href] if args.key?(:href)
            @type = args[:type] if args.key?(:type)
          end
        end
        
        # Permissions the user has for this account.
        class Permissions
          include Google::Apis::Core::Hashable
        
          # All the permissions that the user has for this account. These include any
          # implied permissions (e.g., EDIT implies VIEW).
          # Corresponds to the JSON property `effective`
          # @return [Array<String>]
          attr_accessor :effective
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @effective = args[:effective] if args.key?(:effective)
          end
        end
      end
      
      # JSON template for a linked account.
      class AccountRef
        include Google::Apis::Core::Hashable
      
        # Link for this account.
        # Corresponds to the JSON property `href`
        # @return [String]
        attr_accessor :href
      
        # Account ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Analytics account reference.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Account name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @href = args[:href] if args.key?(:href)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # An AccountSummary collection lists a summary of accounts, properties and views
      # (profiles) to which the user has access. Each resource in the collection
      # corresponds to a single AccountSummary.
      class AccountSummaries
        include Google::Apis::Core::Hashable
      
        # A list of AccountSummaries.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::AccountSummary>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this AccountSummary collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this AccountSummary collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of results
        # in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # JSON template for an Analytics AccountSummary. An AccountSummary is a
      # lightweight tree comprised of properties/profiles.
      class AccountSummary
        include Google::Apis::Core::Hashable
      
        # Account ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type for Analytics AccountSummary.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Account name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Indicates whether this account is starred or not.
        # Corresponds to the JSON property `starred`
        # @return [Boolean]
        attr_accessor :starred
        alias_method :starred?, :starred
      
        # List of web properties under this account.
        # Corresponds to the JSON property `webProperties`
        # @return [Array<Google::Apis::AnalyticsV3::WebPropertySummary>]
        attr_accessor :web_properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @starred = args[:starred] if args.key?(:starred)
          @web_properties = args[:web_properties] if args.key?(:web_properties)
        end
      end
      
      # JSON template for an Analytics account ticket. The account ticket consists of
      # the ticket ID and the basic information for the account, property and profile.
      class AccountTicket
        include Google::Apis::Core::Hashable
      
        # JSON template for Analytics account entry.
        # Corresponds to the JSON property `account`
        # @return [Google::Apis::AnalyticsV3::Account]
        attr_accessor :account
      
        # Account ticket ID used to access the account ticket.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type for account ticket.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # JSON template for an Analytics view (profile).
        # Corresponds to the JSON property `profile`
        # @return [Google::Apis::AnalyticsV3::Profile]
        attr_accessor :profile
      
        # Redirect URI where the user will be sent after accepting Terms of Service.
        # Must be configured in APIs console as a callback URL.
        # Corresponds to the JSON property `redirectUri`
        # @return [String]
        attr_accessor :redirect_uri
      
        # JSON template for an Analytics web property.
        # Corresponds to the JSON property `webproperty`
        # @return [Google::Apis::AnalyticsV3::Webproperty]
        attr_accessor :webproperty
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account = args[:account] if args.key?(:account)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @profile = args[:profile] if args.key?(:profile)
          @redirect_uri = args[:redirect_uri] if args.key?(:redirect_uri)
          @webproperty = args[:webproperty] if args.key?(:webproperty)
        end
      end
      
      # JSON template for an Analytics account tree requests. The account tree request
      # is used in the provisioning api to create an account, property, and view (
      # profile). It contains the basic information required to make these fields.
      class AccountTreeRequest
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `accountName`
        # @return [String]
        attr_accessor :account_name
      
        # Resource type for account ticket.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # 
        # Corresponds to the JSON property `profileName`
        # @return [String]
        attr_accessor :profile_name
      
        # 
        # Corresponds to the JSON property `timezone`
        # @return [String]
        attr_accessor :timezone
      
        # 
        # Corresponds to the JSON property `webpropertyName`
        # @return [String]
        attr_accessor :webproperty_name
      
        # 
        # Corresponds to the JSON property `websiteUrl`
        # @return [String]
        attr_accessor :website_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_name = args[:account_name] if args.key?(:account_name)
          @kind = args[:kind] if args.key?(:kind)
          @profile_name = args[:profile_name] if args.key?(:profile_name)
          @timezone = args[:timezone] if args.key?(:timezone)
          @webproperty_name = args[:webproperty_name] if args.key?(:webproperty_name)
          @website_url = args[:website_url] if args.key?(:website_url)
        end
      end
      
      # JSON template for an Analytics account tree response. The account tree
      # response is used in the provisioning api to return the result of creating an
      # account, property, and view (profile).
      class AccountTreeResponse
        include Google::Apis::Core::Hashable
      
        # JSON template for Analytics account entry.
        # Corresponds to the JSON property `account`
        # @return [Google::Apis::AnalyticsV3::Account]
        attr_accessor :account
      
        # Resource type for account ticket.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # JSON template for an Analytics view (profile).
        # Corresponds to the JSON property `profile`
        # @return [Google::Apis::AnalyticsV3::Profile]
        attr_accessor :profile
      
        # JSON template for an Analytics web property.
        # Corresponds to the JSON property `webproperty`
        # @return [Google::Apis::AnalyticsV3::Webproperty]
        attr_accessor :webproperty
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account = args[:account] if args.key?(:account)
          @kind = args[:kind] if args.key?(:kind)
          @profile = args[:profile] if args.key?(:profile)
          @webproperty = args[:webproperty] if args.key?(:webproperty)
        end
      end
      
      # An account collection provides a list of Analytics accounts to which a user
      # has access. The account collection is the entry point to all management
      # information. Each resource in the collection corresponds to a single Analytics
      # account.
      class Accounts
        include Google::Apis::Core::Hashable
      
        # A list of accounts.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::Account>]
        attr_accessor :items
      
        # The maximum number of entries the response can contain, regardless of the
        # actual number of entries returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Next link for this account collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Previous link for this account collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the entries, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of results
        # in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # JSON template for an Google Ads account.
      class AdWordsAccount
        include Google::Apis::Core::Hashable
      
        # True if auto-tagging is enabled on the Google Ads account. Read-only after the
        # insert operation.
        # Corresponds to the JSON property `autoTaggingEnabled`
        # @return [Boolean]
        attr_accessor :auto_tagging_enabled
        alias_method :auto_tagging_enabled?, :auto_tagging_enabled
      
        # Customer ID. This field is required when creating a Google Ads link.
        # Corresponds to the JSON property `customerId`
        # @return [String]
        attr_accessor :customer_id
      
        # Resource type for Google Ads account.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @auto_tagging_enabled = args[:auto_tagging_enabled] if args.key?(:auto_tagging_enabled)
          @customer_id = args[:customer_id] if args.key?(:customer_id)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Request template for the delete upload data request.
      class DeleteUploadDataRequest
        include Google::Apis::Core::Hashable
      
        # A list of upload UIDs.
        # Corresponds to the JSON property `customDataImportUids`
        # @return [Array<String>]
        attr_accessor :custom_data_import_uids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @custom_data_import_uids = args[:custom_data_import_uids] if args.key?(:custom_data_import_uids)
        end
      end
      
      # JSON template for a metadata column.
      class Column
        include Google::Apis::Core::Hashable
      
        # Map of attribute name and value for this column.
        # Corresponds to the JSON property `attributes`
        # @return [Hash<String,String>]
        attr_accessor :attributes
      
        # Column id.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type for Analytics column.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attributes = args[:attributes] if args.key?(:attributes)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Lists columns (dimensions and metrics) for a particular report type.
      class Columns
        include Google::Apis::Core::Hashable
      
        # List of attributes names returned by columns.
        # Corresponds to the JSON property `attributeNames`
        # @return [Array<String>]
        attr_accessor :attribute_names
      
        # Etag of collection. This etag can be compared with the last response etag to
        # check if response has changed.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # List of columns for a report type.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::Column>]
        attr_accessor :items
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Total number of columns returned in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute_names = args[:attribute_names] if args.key?(:attribute_names)
          @etag = args[:etag] if args.key?(:etag)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @total_results = args[:total_results] if args.key?(:total_results)
        end
      end
      
      # JSON template for an Analytics custom data source.
      class CustomDataSource
        include Google::Apis::Core::Hashable
      
        # Account ID to which this custom data source belongs.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # 
        # Corresponds to the JSON property `childLink`
        # @return [Google::Apis::AnalyticsV3::CustomDataSource::ChildLink]
        attr_accessor :child_link
      
        # Time this custom data source was created.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # Description of custom data source.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Custom data source ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # 
        # Corresponds to the JSON property `importBehavior`
        # @return [String]
        attr_accessor :import_behavior
      
        # Resource type for Analytics custom data source.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this custom data source.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Parent link for this custom data source. Points to the web property to which
        # this custom data source belongs.
        # Corresponds to the JSON property `parentLink`
        # @return [Google::Apis::AnalyticsV3::CustomDataSource::ParentLink]
        attr_accessor :parent_link
      
        # IDs of views (profiles) linked to the custom data source.
        # Corresponds to the JSON property `profilesLinked`
        # @return [Array<String>]
        attr_accessor :profiles_linked
      
        # Collection of schema headers of the custom data source.
        # Corresponds to the JSON property `schema`
        # @return [Array<String>]
        attr_accessor :schema
      
        # Link for this Analytics custom data source.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Type of the custom data source.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Time this custom data source was last modified.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # Upload type of the custom data source.
        # Corresponds to the JSON property `uploadType`
        # @return [String]
        attr_accessor :upload_type
      
        # Web property ID of the form UA-XXXXX-YY to which this custom data source
        # belongs.
        # Corresponds to the JSON property `webPropertyId`
        # @return [String]
        attr_accessor :web_property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @child_link = args[:child_link] if args.key?(:child_link)
          @created = args[:created] if args.key?(:created)
          @description = args[:description] if args.key?(:description)
          @id = args[:id] if args.key?(:id)
          @import_behavior = args[:import_behavior] if args.key?(:import_behavior)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @parent_link = args[:parent_link] if args.key?(:parent_link)
          @profiles_linked = args[:profiles_linked] if args.key?(:profiles_linked)
          @schema = args[:schema] if args.key?(:schema)
          @self_link = args[:self_link] if args.key?(:self_link)
          @type = args[:type] if args.key?(:type)
          @updated = args[:updated] if args.key?(:updated)
          @upload_type = args[:upload_type] if args.key?(:upload_type)
          @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
        end
        
        # 
        class ChildLink
          include Google::Apis::Core::Hashable
        
          # Link to the list of daily uploads for this custom data source. Link to the
          # list of uploads for this custom data source.
          # Corresponds to the JSON property `href`
          # @return [String]
          attr_accessor :href
        
          # Value is "analytics#dailyUploads". Value is "analytics#uploads".
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @href = args[:href] if args.key?(:href)
            @type = args[:type] if args.key?(:type)
          end
        end
        
        # Parent link for this custom data source. Points to the web property to which
        # this custom data source belongs.
        class ParentLink
          include Google::Apis::Core::Hashable
        
          # Link to the web property to which this custom data source belongs.
          # Corresponds to the JSON property `href`
          # @return [String]
          attr_accessor :href
        
          # Value is "analytics#webproperty".
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @href = args[:href] if args.key?(:href)
            @type = args[:type] if args.key?(:type)
          end
        end
      end
      
      # Lists Analytics custom data sources to which the user has access. Each
      # resource in the collection corresponds to a single Analytics custom data
      # source.
      class CustomDataSources
        include Google::Apis::Core::Hashable
      
        # Collection of custom data sources.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::CustomDataSource>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this custom data source collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this custom data source collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of results
        # in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # JSON template for Analytics Custom Dimension.
      class CustomDimension
        include Google::Apis::Core::Hashable
      
        # Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Boolean indicating whether the custom dimension is active.
        # Corresponds to the JSON property `active`
        # @return [Boolean]
        attr_accessor :active
        alias_method :active?, :active
      
        # Time the custom dimension was created.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # Custom dimension ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Index of the custom dimension.
        # Corresponds to the JSON property `index`
        # @return [Fixnum]
        attr_accessor :index
      
        # Kind value for a custom dimension. Set to "analytics#customDimension". It is a
        # read-only field.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of the custom dimension.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Parent link for the custom dimension. Points to the property to which the
        # custom dimension belongs.
        # Corresponds to the JSON property `parentLink`
        # @return [Google::Apis::AnalyticsV3::CustomDimension::ParentLink]
        attr_accessor :parent_link
      
        # Scope of the custom dimension: HIT, SESSION, USER or PRODUCT.
        # Corresponds to the JSON property `scope`
        # @return [String]
        attr_accessor :scope
      
        # Link for the custom dimension
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Time the custom dimension was last modified.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # Property ID.
        # Corresponds to the JSON property `webPropertyId`
        # @return [String]
        attr_accessor :web_property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @active = args[:active] if args.key?(:active)
          @created = args[:created] if args.key?(:created)
          @id = args[:id] if args.key?(:id)
          @index = args[:index] if args.key?(:index)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @parent_link = args[:parent_link] if args.key?(:parent_link)
          @scope = args[:scope] if args.key?(:scope)
          @self_link = args[:self_link] if args.key?(:self_link)
          @updated = args[:updated] if args.key?(:updated)
          @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
        end
        
        # Parent link for the custom dimension. Points to the property to which the
        # custom dimension belongs.
        class ParentLink
          include Google::Apis::Core::Hashable
        
          # Link to the property to which the custom dimension belongs.
          # Corresponds to the JSON property `href`
          # @return [String]
          attr_accessor :href
        
          # Type of the parent link. Set to "analytics#webproperty".
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @href = args[:href] if args.key?(:href)
            @type = args[:type] if args.key?(:type)
          end
        end
      end
      
      # A custom dimension collection lists Analytics custom dimensions to which the
      # user has access. Each resource in the collection corresponds to a single
      # Analytics custom dimension.
      class CustomDimensions
        include Google::Apis::Core::Hashable
      
        # Collection of custom dimensions.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::CustomDimension>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this custom dimension collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this custom dimension collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of results
        # in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # JSON template for Analytics Custom Metric.
      class CustomMetric
        include Google::Apis::Core::Hashable
      
        # Account ID.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Boolean indicating whether the custom metric is active.
        # Corresponds to the JSON property `active`
        # @return [Boolean]
        attr_accessor :active
        alias_method :active?, :active
      
        # Time the custom metric was created.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # Custom metric ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Index of the custom metric.
        # Corresponds to the JSON property `index`
        # @return [Fixnum]
        attr_accessor :index
      
        # Kind value for a custom metric. Set to "analytics#customMetric". It is a read-
        # only field.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Max value of custom metric.
        # Corresponds to the JSON property `max_value`
        # @return [String]
        attr_accessor :max_value
      
        # Min value of custom metric.
        # Corresponds to the JSON property `min_value`
        # @return [String]
        attr_accessor :min_value
      
        # Name of the custom metric.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Parent link for the custom metric. Points to the property to which the custom
        # metric belongs.
        # Corresponds to the JSON property `parentLink`
        # @return [Google::Apis::AnalyticsV3::CustomMetric::ParentLink]
        attr_accessor :parent_link
      
        # Scope of the custom metric: HIT or PRODUCT.
        # Corresponds to the JSON property `scope`
        # @return [String]
        attr_accessor :scope
      
        # Link for the custom metric
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Data type of custom metric.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Time the custom metric was last modified.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # Property ID.
        # Corresponds to the JSON property `webPropertyId`
        # @return [String]
        attr_accessor :web_property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @active = args[:active] if args.key?(:active)
          @created = args[:created] if args.key?(:created)
          @id = args[:id] if args.key?(:id)
          @index = args[:index] if args.key?(:index)
          @kind = args[:kind] if args.key?(:kind)
          @max_value = args[:max_value] if args.key?(:max_value)
          @min_value = args[:min_value] if args.key?(:min_value)
          @name = args[:name] if args.key?(:name)
          @parent_link = args[:parent_link] if args.key?(:parent_link)
          @scope = args[:scope] if args.key?(:scope)
          @self_link = args[:self_link] if args.key?(:self_link)
          @type = args[:type] if args.key?(:type)
          @updated = args[:updated] if args.key?(:updated)
          @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
        end
        
        # Parent link for the custom metric. Points to the property to which the custom
        # metric belongs.
        class ParentLink
          include Google::Apis::Core::Hashable
        
          # Link to the property to which the custom metric belongs.
          # Corresponds to the JSON property `href`
          # @return [String]
          attr_accessor :href
        
          # Type of the parent link. Set to "analytics#webproperty".
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @href = args[:href] if args.key?(:href)
            @type = args[:type] if args.key?(:type)
          end
        end
      end
      
      # A custom metric collection lists Analytics custom metrics to which the user
      # has access. Each resource in the collection corresponds to a single Analytics
      # custom metric.
      class CustomMetrics
        include Google::Apis::Core::Hashable
      
        # Collection of custom metrics.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::CustomMetric>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this custom metric collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this custom metric collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of results
        # in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # JSON template for Analytics Entity Google Ads Link.
      class EntityAdWordsLink
        include Google::Apis::Core::Hashable
      
        # A list of Google Ads client accounts. These cannot be MCC accounts. This field
        # is required when creating a Google Ads link. It cannot be empty.
        # Corresponds to the JSON property `adWordsAccounts`
        # @return [Array<Google::Apis::AnalyticsV3::AdWordsAccount>]
        attr_accessor :ad_words_accounts
      
        # Web property being linked.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::AnalyticsV3::EntityAdWordsLink::Entity]
        attr_accessor :entity
      
        # Entity Google Ads link ID
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type for entity Google Ads link.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of the link. This field is required when creating a Google Ads link.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # IDs of linked Views (Profiles) represented as strings.
        # Corresponds to the JSON property `profileIds`
        # @return [Array<String>]
        attr_accessor :profile_ids
      
        # URL link for this Google Analytics - Google Ads link.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ad_words_accounts = args[:ad_words_accounts] if args.key?(:ad_words_accounts)
          @entity = args[:entity] if args.key?(:entity)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @profile_ids = args[:profile_ids] if args.key?(:profile_ids)
          @self_link = args[:self_link] if args.key?(:self_link)
        end
        
        # Web property being linked.
        class Entity
          include Google::Apis::Core::Hashable
        
          # JSON template for a web property reference.
          # Corresponds to the JSON property `webPropertyRef`
          # @return [Google::Apis::AnalyticsV3::WebPropertyRef]
          attr_accessor :web_property_ref
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @web_property_ref = args[:web_property_ref] if args.key?(:web_property_ref)
          end
        end
      end
      
      # An entity Google Ads link collection provides a list of GA-Google Ads links
      # Each resource in this collection corresponds to a single link.
      class EntityAdWordsLinks
        include Google::Apis::Core::Hashable
      
        # A list of entity Google Ads links.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::EntityAdWordsLink>]
        attr_accessor :items
      
        # The maximum number of entries the response can contain, regardless of the
        # actual number of entries returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Next link for this Google Ads link collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Previous link for this Google Ads link collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the entries, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of results
        # in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
        end
      end
      
      # JSON template for an Analytics Entity-User Link. Returns permissions that a
      # user has for an entity.
      class EntityUserLink
        include Google::Apis::Core::Hashable
      
        # Entity for this link. It can be an account, a web property, or a view (profile)
        # .
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::AnalyticsV3::EntityUserLink::Entity]
        attr_accessor :entity
      
        # Entity user link ID
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type for entity user link.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Permissions the user has for this entity.
        # Corresponds to the JSON property `permissions`
        # @return [Google::Apis::AnalyticsV3::EntityUserLink::Permissions]
        attr_accessor :permissions
      
        # Self link for this resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # JSON template for a user reference.
        # Corresponds to the JSON property `userRef`
        # @return [Google::Apis::AnalyticsV3::UserRef]
        attr_accessor :user_ref
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity = args[:entity] if args.key?(:entity)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @permissions = args[:permissions] if args.key?(:permissions)
          @self_link = args[:self_link] if args.key?(:self_link)
          @user_ref = args[:user_ref] if args.key?(:user_ref)
        end
        
        # Entity for this link. It can be an account, a web property, or a view (profile)
        # .
        class Entity
          include Google::Apis::Core::Hashable
        
          # JSON template for a linked account.
          # Corresponds to the JSON property `accountRef`
          # @return [Google::Apis::AnalyticsV3::AccountRef]
          attr_accessor :account_ref
        
          # JSON template for a linked view (profile).
          # Corresponds to the JSON property `profileRef`
          # @return [Google::Apis::AnalyticsV3::ProfileRef]
          attr_accessor :profile_ref
        
          # JSON template for a web property reference.
          # Corresponds to the JSON property `webPropertyRef`
          # @return [Google::Apis::AnalyticsV3::WebPropertyRef]
          attr_accessor :web_property_ref
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @account_ref = args[:account_ref] if args.key?(:account_ref)
            @profile_ref = args[:profile_ref] if args.key?(:profile_ref)
            @web_property_ref = args[:web_property_ref] if args.key?(:web_property_ref)
          end
        end
        
        # Permissions the user has for this entity.
        class Permissions
          include Google::Apis::Core::Hashable
        
          # Effective permissions represent all the permissions that a user has for this
          # entity. These include any implied permissions (e.g., EDIT implies VIEW) or
          # inherited permissions from the parent entity. Effective permissions are read-
          # only.
          # Corresponds to the JSON property `effective`
          # @return [Array<String>]
          attr_accessor :effective
        
          # Permissions that a user has been assigned at this very level. Does not include
          # any implied or inherited permissions. Local permissions are modifiable.
          # Corresponds to the JSON property `local`
          # @return [Array<String>]
          attr_accessor :local
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @effective = args[:effective] if args.key?(:effective)
            @local = args[:local] if args.key?(:local)
          end
        end
      end
      
      # An entity user link collection provides a list of Analytics ACL links Each
      # resource in this collection corresponds to a single link.
      class EntityUserLinks
        include Google::Apis::Core::Hashable
      
        # A list of entity user links.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::EntityUserLink>]
        attr_accessor :items
      
        # The maximum number of entries the response can contain, regardless of the
        # actual number of entries returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Next link for this account collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Previous link for this account collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the entries, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of results
        # in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
        end
      end
      
      # JSON template for Analytics experiment resource.
      class Experiment
        include Google::Apis::Core::Hashable
      
        # Account ID to which this experiment belongs. This field is read-only.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Time the experiment was created. This field is read-only.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # Notes about this experiment.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # If true, the end user will be able to edit the experiment via the Google
        # Analytics user interface.
        # Corresponds to the JSON property `editableInGaUi`
        # @return [Boolean]
        attr_accessor :editable_in_ga_ui
        alias_method :editable_in_ga_ui?, :editable_in_ga_ui
      
        # The ending time of the experiment (the time the status changed from RUNNING to
        # ENDED). This field is present only if the experiment has ended. This field is
        # read-only.
        # Corresponds to the JSON property `endTime`
        # @return [DateTime]
        attr_accessor :end_time
      
        # Boolean specifying whether to distribute traffic evenly across all variations.
        # If the value is False, content experiments follows the default behavior of
        # adjusting traffic dynamically based on variation performance. Optional --
        # defaults to False. This field may not be changed for an experiment whose
        # status is ENDED.
        # Corresponds to the JSON property `equalWeighting`
        # @return [Boolean]
        attr_accessor :equal_weighting
        alias_method :equal_weighting?, :equal_weighting
      
        # Experiment ID. Required for patch and update. Disallowed for create.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Internal ID for the web property to which this experiment belongs. This field
        # is read-only.
        # Corresponds to the JSON property `internalWebPropertyId`
        # @return [String]
        attr_accessor :internal_web_property_id
      
        # Resource type for an Analytics experiment. This field is read-only.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # An integer number in [3, 90]. Specifies the minimum length of the experiment.
        # Can be changed for a running experiment. This field may not be changed for an
        # experiments whose status is ENDED.
        # Corresponds to the JSON property `minimumExperimentLengthInDays`
        # @return [Fixnum]
        attr_accessor :minimum_experiment_length_in_days
      
        # Experiment name. This field may not be changed for an experiment whose status
        # is ENDED. This field is required when creating an experiment.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The metric that the experiment is optimizing. Valid values: "ga:goal(n)
        # Completions", "ga:adsenseAdsClicks", "ga:adsenseAdsViewed", "ga:adsenseRevenue"
        # , "ga:bounces", "ga:pageviews", "ga:sessionDuration", "ga:transactions", "ga:
        # transactionRevenue". This field is required if status is "RUNNING" and
        # servingFramework is one of "REDIRECT" or "API".
        # Corresponds to the JSON property `objectiveMetric`
        # @return [String]
        attr_accessor :objective_metric
      
        # Whether the objectiveMetric should be minimized or maximized. Possible values:
        # "MAXIMUM", "MINIMUM". Optional--defaults to "MAXIMUM". Cannot be specified
        # without objectiveMetric. Cannot be modified when status is "RUNNING" or "ENDED"
        # .
        # Corresponds to the JSON property `optimizationType`
        # @return [String]
        attr_accessor :optimization_type
      
        # Parent link for an experiment. Points to the view (profile) to which this
        # experiment belongs.
        # Corresponds to the JSON property `parentLink`
        # @return [Google::Apis::AnalyticsV3::Experiment::ParentLink]
        attr_accessor :parent_link
      
        # View (Profile) ID to which this experiment belongs. This field is read-only.
        # Corresponds to the JSON property `profileId`
        # @return [String]
        attr_accessor :profile_id
      
        # Why the experiment ended. Possible values: "STOPPED_BY_USER", "WINNER_FOUND", "
        # EXPERIMENT_EXPIRED", "ENDED_WITH_NO_WINNER", "GOAL_OBJECTIVE_CHANGED". "
        # ENDED_WITH_NO_WINNER" means that the experiment didn't expire but no winner
        # was projected to be found. If the experiment status is changed via the API to
        # ENDED this field is set to STOPPED_BY_USER. This field is read-only.
        # Corresponds to the JSON property `reasonExperimentEnded`
        # @return [String]
        attr_accessor :reason_experiment_ended
      
        # Boolean specifying whether variations URLS are rewritten to match those of the
        # original. This field may not be changed for an experiments whose status is
        # ENDED.
        # Corresponds to the JSON property `rewriteVariationUrlsAsOriginal`
        # @return [Boolean]
        attr_accessor :rewrite_variation_urls_as_original
        alias_method :rewrite_variation_urls_as_original?, :rewrite_variation_urls_as_original
      
        # Link for this experiment. This field is read-only.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The framework used to serve the experiment variations and evaluate the results.
        # One of:
        # - REDIRECT: Google Analytics redirects traffic to different variation pages,
        # reports the chosen variation and evaluates the results.
        # - API: Google Analytics chooses and reports the variation to serve and
        # evaluates the results; the caller is responsible for serving the selected
        # variation.
        # - EXTERNAL: The variations will be served externally and the chosen variation
        # reported to Google Analytics. The caller is responsible for serving the
        # selected variation and evaluating the results.
        # Corresponds to the JSON property `servingFramework`
        # @return [String]
        attr_accessor :serving_framework
      
        # The snippet of code to include on the control page(s). This field is read-only.
        # Corresponds to the JSON property `snippet`
        # @return [String]
        attr_accessor :snippet
      
        # The starting time of the experiment (the time the status changed from
        # READY_TO_RUN to RUNNING). This field is present only if the experiment has
        # started. This field is read-only.
        # Corresponds to the JSON property `startTime`
        # @return [DateTime]
        attr_accessor :start_time
      
        # Experiment status. Possible values: "DRAFT", "READY_TO_RUN", "RUNNING", "ENDED"
        # . Experiments can be created in the "DRAFT", "READY_TO_RUN" or "RUNNING" state.
        # This field is required when creating an experiment.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # A floating-point number in (0, 1]. Specifies the fraction of the traffic that
        # participates in the experiment. Can be changed for a running experiment. This
        # field may not be changed for an experiments whose status is ENDED.
        # Corresponds to the JSON property `trafficCoverage`
        # @return [Float]
        attr_accessor :traffic_coverage
      
        # Time the experiment was last modified. This field is read-only.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # Array of variations. The first variation in the array is the original. The
        # number of variations may not change once an experiment is in the RUNNING state.
        # At least two variations are required before status can be set to RUNNING.
        # Corresponds to the JSON property `variations`
        # @return [Array<Google::Apis::AnalyticsV3::Experiment::Variation>]
        attr_accessor :variations
      
        # Web property ID to which this experiment belongs. The web property ID is of
        # the form UA-XXXXX-YY. This field is read-only.
        # Corresponds to the JSON property `webPropertyId`
        # @return [String]
        attr_accessor :web_property_id
      
        # A floating-point number in (0, 1). Specifies the necessary confidence level to
        # choose a winner. This field may not be changed for an experiments whose status
        # is ENDED.
        # Corresponds to the JSON property `winnerConfidenceLevel`
        # @return [Float]
        attr_accessor :winner_confidence_level
      
        # Boolean specifying whether a winner has been found for this experiment. This
        # field is read-only.
        # Corresponds to the JSON property `winnerFound`
        # @return [Boolean]
        attr_accessor :winner_found
        alias_method :winner_found?, :winner_found
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @created = args[:created] if args.key?(:created)
          @description = args[:description] if args.key?(:description)
          @editable_in_ga_ui = args[:editable_in_ga_ui] if args.key?(:editable_in_ga_ui)
          @end_time = args[:end_time] if args.key?(:end_time)
          @equal_weighting = args[:equal_weighting] if args.key?(:equal_weighting)
          @id = args[:id] if args.key?(:id)
          @internal_web_property_id = args[:internal_web_property_id] if args.key?(:internal_web_property_id)
          @kind = args[:kind] if args.key?(:kind)
          @minimum_experiment_length_in_days = args[:minimum_experiment_length_in_days] if args.key?(:minimum_experiment_length_in_days)
          @name = args[:name] if args.key?(:name)
          @objective_metric = args[:objective_metric] if args.key?(:objective_metric)
          @optimization_type = args[:optimization_type] if args.key?(:optimization_type)
          @parent_link = args[:parent_link] if args.key?(:parent_link)
          @profile_id = args[:profile_id] if args.key?(:profile_id)
          @reason_experiment_ended = args[:reason_experiment_ended] if args.key?(:reason_experiment_ended)
          @rewrite_variation_urls_as_original = args[:rewrite_variation_urls_as_original] if args.key?(:rewrite_variation_urls_as_original)
          @self_link = args[:self_link] if args.key?(:self_link)
          @serving_framework = args[:serving_framework] if args.key?(:serving_framework)
          @snippet = args[:snippet] if args.key?(:snippet)
          @start_time = args[:start_time] if args.key?(:start_time)
          @status = args[:status] if args.key?(:status)
          @traffic_coverage = args[:traffic_coverage] if args.key?(:traffic_coverage)
          @updated = args[:updated] if args.key?(:updated)
          @variations = args[:variations] if args.key?(:variations)
          @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
          @winner_confidence_level = args[:winner_confidence_level] if args.key?(:winner_confidence_level)
          @winner_found = args[:winner_found] if args.key?(:winner_found)
        end
        
        # Parent link for an experiment. Points to the view (profile) to which this
        # experiment belongs.
        class ParentLink
          include Google::Apis::Core::Hashable
        
          # Link to the view (profile) to which this experiment belongs. This field is
          # read-only.
          # Corresponds to the JSON property `href`
          # @return [String]
          attr_accessor :href
        
          # Value is "analytics#profile". This field is read-only.
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @href = args[:href] if args.key?(:href)
            @type = args[:type] if args.key?(:type)
          end
        end
        
        # 
        class Variation
          include Google::Apis::Core::Hashable
        
          # The name of the variation. This field is required when creating an experiment.
          # This field may not be changed for an experiment whose status is ENDED.
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          # Status of the variation. Possible values: "ACTIVE", "INACTIVE". INACTIVE
          # variations are not served. This field may not be changed for an experiment
          # whose status is ENDED.
          # Corresponds to the JSON property `status`
          # @return [String]
          attr_accessor :status
        
          # The URL of the variation. This field may not be changed for an experiment
          # whose status is RUNNING or ENDED.
          # Corresponds to the JSON property `url`
          # @return [String]
          attr_accessor :url
        
          # Weight that this variation should receive. Only present if the experiment is
          # running. This field is read-only.
          # Corresponds to the JSON property `weight`
          # @return [Float]
          attr_accessor :weight
        
          # True if the experiment has ended and this variation performed (statistically)
          # significantly better than the original. This field is read-only.
          # Corresponds to the JSON property `won`
          # @return [Boolean]
          attr_accessor :won
          alias_method :won?, :won
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @name = args[:name] if args.key?(:name)
            @status = args[:status] if args.key?(:status)
            @url = args[:url] if args.key?(:url)
            @weight = args[:weight] if args.key?(:weight)
            @won = args[:won] if args.key?(:won)
          end
        end
      end
      
      # An experiment collection lists Analytics experiments to which the user has
      # access. Each view (profile) can have a set of experiments. Each resource in
      # the Experiment collection corresponds to a single Analytics experiment.
      class Experiments
        include Google::Apis::Core::Hashable
      
        # A list of experiments.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::Experiment>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this experiment collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this experiment collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of
        # resources in the result.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # JSON template for an Analytics account filter.
      class Filter
        include Google::Apis::Core::Hashable
      
        # Account ID to which this filter belongs.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Details for the filter of the type ADVANCED.
        # Corresponds to the JSON property `advancedDetails`
        # @return [Google::Apis::AnalyticsV3::Filter::AdvancedDetails]
        attr_accessor :advanced_details
      
        # Time this filter was created.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # JSON template for an Analytics filter expression.
        # Corresponds to the JSON property `excludeDetails`
        # @return [Google::Apis::AnalyticsV3::FilterExpression]
        attr_accessor :exclude_details
      
        # Filter ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # JSON template for an Analytics filter expression.
        # Corresponds to the JSON property `includeDetails`
        # @return [Google::Apis::AnalyticsV3::FilterExpression]
        attr_accessor :include_details
      
        # Resource type for Analytics filter.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Details for the filter of the type LOWER.
        # Corresponds to the JSON property `lowercaseDetails`
        # @return [Google::Apis::AnalyticsV3::Filter::LowercaseDetails]
        attr_accessor :lowercase_details
      
        # Name of this filter.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Parent link for this filter. Points to the account to which this filter
        # belongs.
        # Corresponds to the JSON property `parentLink`
        # @return [Google::Apis::AnalyticsV3::Filter::ParentLink]
        attr_accessor :parent_link
      
        # Details for the filter of the type SEARCH_AND_REPLACE.
        # Corresponds to the JSON property `searchAndReplaceDetails`
        # @return [Google::Apis::AnalyticsV3::Filter::SearchAndReplaceDetails]
        attr_accessor :search_and_replace_details
      
        # Link for this filter.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Type of this filter. Possible values are INCLUDE, EXCLUDE, LOWERCASE,
        # UPPERCASE, SEARCH_AND_REPLACE and ADVANCED.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Time this filter was last modified.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # Details for the filter of the type UPPER.
        # Corresponds to the JSON property `uppercaseDetails`
        # @return [Google::Apis::AnalyticsV3::Filter::UppercaseDetails]
        attr_accessor :uppercase_details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advanced_details = args[:advanced_details] if args.key?(:advanced_details)
          @created = args[:created] if args.key?(:created)
          @exclude_details = args[:exclude_details] if args.key?(:exclude_details)
          @id = args[:id] if args.key?(:id)
          @include_details = args[:include_details] if args.key?(:include_details)
          @kind = args[:kind] if args.key?(:kind)
          @lowercase_details = args[:lowercase_details] if args.key?(:lowercase_details)
          @name = args[:name] if args.key?(:name)
          @parent_link = args[:parent_link] if args.key?(:parent_link)
          @search_and_replace_details = args[:search_and_replace_details] if args.key?(:search_and_replace_details)
          @self_link = args[:self_link] if args.key?(:self_link)
          @type = args[:type] if args.key?(:type)
          @updated = args[:updated] if args.key?(:updated)
          @uppercase_details = args[:uppercase_details] if args.key?(:uppercase_details)
        end
        
        # Details for the filter of the type ADVANCED.
        class AdvancedDetails
          include Google::Apis::Core::Hashable
        
          # Indicates if the filter expressions are case sensitive.
          # Corresponds to the JSON property `caseSensitive`
          # @return [Boolean]
          attr_accessor :case_sensitive
          alias_method :case_sensitive?, :case_sensitive
        
          # Expression to extract from field A.
          # Corresponds to the JSON property `extractA`
          # @return [String]
          attr_accessor :extract_a
        
          # Expression to extract from field B.
          # Corresponds to the JSON property `extractB`
          # @return [String]
          attr_accessor :extract_b
        
          # Field A.
          # Corresponds to the JSON property `fieldA`
          # @return [String]
          attr_accessor :field_a
        
          # The Index of the custom dimension. Required if field is a CUSTOM_DIMENSION.
          # Corresponds to the JSON property `fieldAIndex`
          # @return [Fixnum]
          attr_accessor :field_a_index
        
          # Indicates if field A is required to match.
          # Corresponds to the JSON property `fieldARequired`
          # @return [Boolean]
          attr_accessor :field_a_required
          alias_method :field_a_required?, :field_a_required
        
          # Field B.
          # Corresponds to the JSON property `fieldB`
          # @return [String]
          attr_accessor :field_b
        
          # The Index of the custom dimension. Required if field is a CUSTOM_DIMENSION.
          # Corresponds to the JSON property `fieldBIndex`
          # @return [Fixnum]
          attr_accessor :field_b_index
        
          # Indicates if field B is required to match.
          # Corresponds to the JSON property `fieldBRequired`
          # @return [Boolean]
          attr_accessor :field_b_required
          alias_method :field_b_required?, :field_b_required
        
          # Expression used to construct the output value.
          # Corresponds to the JSON property `outputConstructor`
          # @return [String]
          attr_accessor :output_constructor
        
          # Output field.
          # Corresponds to the JSON property `outputToField`
          # @return [String]
          attr_accessor :output_to_field
        
          # The Index of the custom dimension. Required if field is a CUSTOM_DIMENSION.
          # Corresponds to the JSON property `outputToFieldIndex`
          # @return [Fixnum]
          attr_accessor :output_to_field_index
        
          # Indicates if the existing value of the output field, if any, should be
          # overridden by the output expression.
          # Corresponds to the JSON property `overrideOutputField`
          # @return [Boolean]
          attr_accessor :override_output_field
          alias_method :override_output_field?, :override_output_field
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @case_sensitive = args[:case_sensitive] if args.key?(:case_sensitive)
            @extract_a = args[:extract_a] if args.key?(:extract_a)
            @extract_b = args[:extract_b] if args.key?(:extract_b)
            @field_a = args[:field_a] if args.key?(:field_a)
            @field_a_index = args[:field_a_index] if args.key?(:field_a_index)
            @field_a_required = args[:field_a_required] if args.key?(:field_a_required)
            @field_b = args[:field_b] if args.key?(:field_b)
            @field_b_index = args[:field_b_index] if args.key?(:field_b_index)
            @field_b_required = args[:field_b_required] if args.key?(:field_b_required)
            @output_constructor = args[:output_constructor] if args.key?(:output_constructor)
            @output_to_field = args[:output_to_field] if args.key?(:output_to_field)
            @output_to_field_index = args[:output_to_field_index] if args.key?(:output_to_field_index)
            @override_output_field = args[:override_output_field] if args.key?(:override_output_field)
          end
        end
        
        # Details for the filter of the type LOWER.
        class LowercaseDetails
          include Google::Apis::Core::Hashable
        
          # Field to use in the filter.
          # Corresponds to the JSON property `field`
          # @return [String]
          attr_accessor :field
        
          # The Index of the custom dimension. Required if field is a CUSTOM_DIMENSION.
          # Corresponds to the JSON property `fieldIndex`
          # @return [Fixnum]
          attr_accessor :field_index
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @field = args[:field] if args.key?(:field)
            @field_index = args[:field_index] if args.key?(:field_index)
          end
        end
        
        # Parent link for this filter. Points to the account to which this filter
        # belongs.
        class ParentLink
          include Google::Apis::Core::Hashable
        
          # Link to the account to which this filter belongs.
          # Corresponds to the JSON property `href`
          # @return [String]
          attr_accessor :href
        
          # Value is "analytics#account".
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @href = args[:href] if args.key?(:href)
            @type = args[:type] if args.key?(:type)
          end
        end
        
        # Details for the filter of the type SEARCH_AND_REPLACE.
        class SearchAndReplaceDetails
          include Google::Apis::Core::Hashable
        
          # Determines if the filter is case sensitive.
          # Corresponds to the JSON property `caseSensitive`
          # @return [Boolean]
          attr_accessor :case_sensitive
          alias_method :case_sensitive?, :case_sensitive
        
          # Field to use in the filter.
          # Corresponds to the JSON property `field`
          # @return [String]
          attr_accessor :field
        
          # The Index of the custom dimension. Required if field is a CUSTOM_DIMENSION.
          # Corresponds to the JSON property `fieldIndex`
          # @return [Fixnum]
          attr_accessor :field_index
        
          # Term to replace the search term with.
          # Corresponds to the JSON property `replaceString`
          # @return [String]
          attr_accessor :replace_string
        
          # Term to search.
          # Corresponds to the JSON property `searchString`
          # @return [String]
          attr_accessor :search_string
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @case_sensitive = args[:case_sensitive] if args.key?(:case_sensitive)
            @field = args[:field] if args.key?(:field)
            @field_index = args[:field_index] if args.key?(:field_index)
            @replace_string = args[:replace_string] if args.key?(:replace_string)
            @search_string = args[:search_string] if args.key?(:search_string)
          end
        end
        
        # Details for the filter of the type UPPER.
        class UppercaseDetails
          include Google::Apis::Core::Hashable
        
          # Field to use in the filter.
          # Corresponds to the JSON property `field`
          # @return [String]
          attr_accessor :field
        
          # The Index of the custom dimension. Required if field is a CUSTOM_DIMENSION.
          # Corresponds to the JSON property `fieldIndex`
          # @return [Fixnum]
          attr_accessor :field_index
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @field = args[:field] if args.key?(:field)
            @field_index = args[:field_index] if args.key?(:field_index)
          end
        end
      end
      
      # JSON template for an Analytics filter expression.
      class FilterExpression
        include Google::Apis::Core::Hashable
      
        # Determines if the filter is case sensitive.
        # Corresponds to the JSON property `caseSensitive`
        # @return [Boolean]
        attr_accessor :case_sensitive
        alias_method :case_sensitive?, :case_sensitive
      
        # Filter expression value
        # Corresponds to the JSON property `expressionValue`
        # @return [String]
        attr_accessor :expression_value
      
        # Field to filter. Possible values:
        # - Content and Traffic
        # - PAGE_REQUEST_URI,
        # - PAGE_HOSTNAME,
        # - PAGE_TITLE,
        # - REFERRAL,
        # - COST_DATA_URI (Campaign target URL),
        # - HIT_TYPE,
        # - INTERNAL_SEARCH_TERM,
        # - INTERNAL_SEARCH_TYPE,
        # - SOURCE_PROPERTY_TRACKING_ID,
        # - Campaign or AdGroup
        # - CAMPAIGN_SOURCE,
        # - CAMPAIGN_MEDIUM,
        # - CAMPAIGN_NAME,
        # - CAMPAIGN_AD_GROUP,
        # - CAMPAIGN_TERM,
        # - CAMPAIGN_CONTENT,
        # - CAMPAIGN_CODE,
        # - CAMPAIGN_REFERRAL_PATH,
        # - E-Commerce
        # - TRANSACTION_COUNTRY,
        # - TRANSACTION_REGION,
        # - TRANSACTION_CITY,
        # - TRANSACTION_AFFILIATION (Store or order location),
        # - ITEM_NAME,
        # - ITEM_CODE,
        # - ITEM_VARIATION,
        # - TRANSACTION_ID,
        # - TRANSACTION_CURRENCY_CODE,
        # - PRODUCT_ACTION_TYPE,
        # - Audience/Users
        # - BROWSER,
        # - BROWSER_VERSION,
        # - BROWSER_SIZE,
        # - PLATFORM,
        # - PLATFORM_VERSION,
        # - LANGUAGE,
        # - SCREEN_RESOLUTION,
        # - SCREEN_COLORS,
        # - JAVA_ENABLED (Boolean Field),
        # - FLASH_VERSION,
        # - GEO_SPEED (Connection speed),
        # - VISITOR_TYPE,
        # - GEO_ORGANIZATION (ISP organization),
        # - GEO_DOMAIN,
        # - GEO_IP_ADDRESS,
        # - GEO_IP_VERSION,
        # - Location
        # - GEO_COUNTRY,
        # - GEO_REGION,
        # - GEO_CITY,
        # - Event
        # - EVENT_CATEGORY,
        # - EVENT_ACTION,
        # - EVENT_LABEL,
        # - Other
        # - CUSTOM_FIELD_1,
        # - CUSTOM_FIELD_2,
        # - USER_DEFINED_VALUE,
        # - Application
        # - APP_ID,
        # - APP_INSTALLER_ID,
        # - APP_NAME,
        # - APP_VERSION,
        # - SCREEN,
        # - IS_APP (Boolean Field),
        # - IS_FATAL_EXCEPTION (Boolean Field),
        # - EXCEPTION_DESCRIPTION,
        # - Mobile device
        # - IS_MOBILE (Boolean Field, Deprecated. Use DEVICE_CATEGORY=mobile),
        # - IS_TABLET (Boolean Field, Deprecated. Use DEVICE_CATEGORY=tablet),
        # - DEVICE_CATEGORY,
        # - MOBILE_HAS_QWERTY_KEYBOARD (Boolean Field),
        # - MOBILE_HAS_NFC_SUPPORT (Boolean Field),
        # - MOBILE_HAS_CELLULAR_RADIO (Boolean Field),
        # - MOBILE_HAS_WIFI_SUPPORT (Boolean Field),
        # - MOBILE_BRAND_NAME,
        # - MOBILE_MODEL_NAME,
        # - MOBILE_MARKETING_NAME,
        # - MOBILE_POINTING_METHOD,
        # - Social
        # - SOCIAL_NETWORK,
        # - SOCIAL_ACTION,
        # - SOCIAL_ACTION_TARGET,
        # - Custom dimension
        # - CUSTOM_DIMENSION (See accompanying field index),
        # Corresponds to the JSON property `field`
        # @return [String]
        attr_accessor :field
      
        # The Index of the custom dimension. Set only if the field is a is
        # CUSTOM_DIMENSION.
        # Corresponds to the JSON property `fieldIndex`
        # @return [Fixnum]
        attr_accessor :field_index
      
        # Kind value for filter expression
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Match type for this filter. Possible values are BEGINS_WITH, EQUAL, ENDS_WITH,
        # CONTAINS, or MATCHES. GEO_DOMAIN, GEO_IP_ADDRESS, PAGE_REQUEST_URI, or
        # PAGE_HOSTNAME filters can use any match type; all other filters must use
        # MATCHES.
        # Corresponds to the JSON property `matchType`
        # @return [String]
        attr_accessor :match_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @case_sensitive = args[:case_sensitive] if args.key?(:case_sensitive)
          @expression_value = args[:expression_value] if args.key?(:expression_value)
          @field = args[:field] if args.key?(:field)
          @field_index = args[:field_index] if args.key?(:field_index)
          @kind = args[:kind] if args.key?(:kind)
          @match_type = args[:match_type] if args.key?(:match_type)
        end
      end
      
      # JSON template for a profile filter link.
      class FilterRef
        include Google::Apis::Core::Hashable
      
        # Account ID to which this filter belongs.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Link for this filter.
        # Corresponds to the JSON property `href`
        # @return [String]
        attr_accessor :href
      
        # Filter ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Kind value for filter reference.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this filter.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @href = args[:href] if args.key?(:href)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A filter collection lists filters created by users in an Analytics account.
      # Each resource in the collection corresponds to a filter.
      class Filters
        include Google::Apis::Core::Hashable
      
        # A list of filters.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::Filter>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1,000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this filter collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this filter collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of results
        # in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # Analytics data for a given view (profile).
      class GaData
        include Google::Apis::Core::Hashable
      
        # Column headers that list dimension names followed by the metric names. The
        # order of dimensions and metrics is same as specified in the request.
        # Corresponds to the JSON property `columnHeaders`
        # @return [Array<Google::Apis::AnalyticsV3::GaData::ColumnHeader>]
        attr_accessor :column_headers
      
        # Determines if Analytics data contains samples.
        # Corresponds to the JSON property `containsSampledData`
        # @return [Boolean]
        attr_accessor :contains_sampled_data
        alias_method :contains_sampled_data?, :contains_sampled_data
      
        # The last refreshed time in seconds for Analytics data.
        # Corresponds to the JSON property `dataLastRefreshed`
        # @return [Fixnum]
        attr_accessor :data_last_refreshed
      
        # 
        # Corresponds to the JSON property `dataTable`
        # @return [Google::Apis::AnalyticsV3::GaData::DataTable]
        attr_accessor :data_table
      
        # Unique ID for this data response.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The maximum number of rows the response can contain, regardless of the actual
        # number of rows returned. Its value ranges from 1 to 10,000 with a value of
        # 1000 by default, or otherwise specified by the max-results query parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this Analytics data query.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this Analytics data query.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # Information for the view (profile), for which the Analytics data was requested.
        # Corresponds to the JSON property `profileInfo`
        # @return [Google::Apis::AnalyticsV3::GaData::ProfileInfo]
        attr_accessor :profile_info
      
        # Analytics data request query parameters.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::AnalyticsV3::GaData::Query]
        attr_accessor :query
      
        # Analytics data rows, where each row contains a list of dimension values
        # followed by the metric values. The order of dimensions and metrics is same as
        # specified in the request.
        # Corresponds to the JSON property `rows`
        # @return [Array<Array<String>>]
        attr_accessor :rows
      
        # The number of samples used to calculate the result.
        # Corresponds to the JSON property `sampleSize`
        # @return [Fixnum]
        attr_accessor :sample_size
      
        # Total size of the sample space from which the samples were selected.
        # Corresponds to the JSON property `sampleSpace`
        # @return [Fixnum]
        attr_accessor :sample_space
      
        # Link to this page.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The total number of rows for the query, regardless of the number of rows in
        # the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Total values for the requested metrics over all the results, not just the
        # results returned in this response. The order of the metric totals is same as
        # the metric order specified in the request.
        # Corresponds to the JSON property `totalsForAllResults`
        # @return [Hash<String,String>]
        attr_accessor :totals_for_all_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column_headers = args[:column_headers] if args.key?(:column_headers)
          @contains_sampled_data = args[:contains_sampled_data] if args.key?(:contains_sampled_data)
          @data_last_refreshed = args[:data_last_refreshed] if args.key?(:data_last_refreshed)
          @data_table = args[:data_table] if args.key?(:data_table)
          @id = args[:id] if args.key?(:id)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @profile_info = args[:profile_info] if args.key?(:profile_info)
          @query = args[:query] if args.key?(:query)
          @rows = args[:rows] if args.key?(:rows)
          @sample_size = args[:sample_size] if args.key?(:sample_size)
          @sample_space = args[:sample_space] if args.key?(:sample_space)
          @self_link = args[:self_link] if args.key?(:self_link)
          @total_results = args[:total_results] if args.key?(:total_results)
          @totals_for_all_results = args[:totals_for_all_results] if args.key?(:totals_for_all_results)
        end
        
        # 
        class ColumnHeader
          include Google::Apis::Core::Hashable
        
          # Column Type. Either DIMENSION or METRIC.
          # Corresponds to the JSON property `columnType`
          # @return [String]
          attr_accessor :column_type
        
          # Data type. Dimension column headers have only STRING as the data type. Metric
          # column headers have data types for metric values such as INTEGER, DOUBLE,
          # CURRENCY etc.
          # Corresponds to the JSON property `dataType`
          # @return [String]
          attr_accessor :data_type
        
          # Column name.
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @column_type = args[:column_type] if args.key?(:column_type)
            @data_type = args[:data_type] if args.key?(:data_type)
            @name = args[:name] if args.key?(:name)
          end
        end
        
        # 
        class DataTable
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `cols`
          # @return [Array<Google::Apis::AnalyticsV3::GaData::DataTable::Col>]
          attr_accessor :cols
        
          # 
          # Corresponds to the JSON property `rows`
          # @return [Array<Google::Apis::AnalyticsV3::GaData::DataTable::Row>]
          attr_accessor :rows
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @cols = args[:cols] if args.key?(:cols)
            @rows = args[:rows] if args.key?(:rows)
          end
          
          # 
          class Col
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `id`
            # @return [String]
            attr_accessor :id
          
            # 
            # Corresponds to the JSON property `label`
            # @return [String]
            attr_accessor :label
          
            # 
            # Corresponds to the JSON property `type`
            # @return [String]
            attr_accessor :type
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @id = args[:id] if args.key?(:id)
              @label = args[:label] if args.key?(:label)
              @type = args[:type] if args.key?(:type)
            end
          end
          
          # 
          class Row
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `c`
            # @return [Array<Google::Apis::AnalyticsV3::GaData::DataTable::Row::C>]
            attr_accessor :c
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @c = args[:c] if args.key?(:c)
            end
            
            # 
            class C
              include Google::Apis::Core::Hashable
            
              # 
              # Corresponds to the JSON property `v`
              # @return [String]
              attr_accessor :v
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @v = args[:v] if args.key?(:v)
              end
            end
          end
        end
        
        # Information for the view (profile), for which the Analytics data was requested.
        class ProfileInfo
          include Google::Apis::Core::Hashable
        
          # Account ID to which this view (profile) belongs.
          # Corresponds to the JSON property `accountId`
          # @return [String]
          attr_accessor :account_id
        
          # Internal ID for the web property to which this view (profile) belongs.
          # Corresponds to the JSON property `internalWebPropertyId`
          # @return [String]
          attr_accessor :internal_web_property_id
        
          # View (Profile) ID.
          # Corresponds to the JSON property `profileId`
          # @return [String]
          attr_accessor :profile_id
        
          # View (Profile) name.
          # Corresponds to the JSON property `profileName`
          # @return [String]
          attr_accessor :profile_name
        
          # Table ID for view (profile).
          # Corresponds to the JSON property `tableId`
          # @return [String]
          attr_accessor :table_id
        
          # Web Property ID to which this view (profile) belongs.
          # Corresponds to the JSON property `webPropertyId`
          # @return [String]
          attr_accessor :web_property_id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @account_id = args[:account_id] if args.key?(:account_id)
            @internal_web_property_id = args[:internal_web_property_id] if args.key?(:internal_web_property_id)
            @profile_id = args[:profile_id] if args.key?(:profile_id)
            @profile_name = args[:profile_name] if args.key?(:profile_name)
            @table_id = args[:table_id] if args.key?(:table_id)
            @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
          end
        end
        
        # Analytics data request query parameters.
        class Query
          include Google::Apis::Core::Hashable
        
          # List of analytics dimensions.
          # Corresponds to the JSON property `dimensions`
          # @return [String]
          attr_accessor :dimensions
        
          # End date.
          # Corresponds to the JSON property `end-date`
          # @return [String]
          attr_accessor :end_date
        
          # Comma-separated list of dimension or metric filters.
          # Corresponds to the JSON property `filters`
          # @return [String]
          attr_accessor :filters
        
          # Unique table ID.
          # Corresponds to the JSON property `ids`
          # @return [String]
          attr_accessor :ids
        
          # Maximum results per page.
          # Corresponds to the JSON property `max-results`
          # @return [Fixnum]
          attr_accessor :max_results
        
          # List of analytics metrics.
          # Corresponds to the JSON property `metrics`
          # @return [Array<String>]
          attr_accessor :metrics
        
          # Desired sampling level
          # Corresponds to the JSON property `samplingLevel`
          # @return [String]
          attr_accessor :sampling_level
        
          # Analytics advanced segment.
          # Corresponds to the JSON property `segment`
          # @return [String]
          attr_accessor :segment
        
          # List of dimensions or metrics based on which Analytics data is sorted.
          # Corresponds to the JSON property `sort`
          # @return [Array<String>]
          attr_accessor :sort
        
          # Start date.
          # Corresponds to the JSON property `start-date`
          # @return [String]
          attr_accessor :start_date
        
          # Start index.
          # Corresponds to the JSON property `start-index`
          # @return [Fixnum]
          attr_accessor :start_index
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @dimensions = args[:dimensions] if args.key?(:dimensions)
            @end_date = args[:end_date] if args.key?(:end_date)
            @filters = args[:filters] if args.key?(:filters)
            @ids = args[:ids] if args.key?(:ids)
            @max_results = args[:max_results] if args.key?(:max_results)
            @metrics = args[:metrics] if args.key?(:metrics)
            @sampling_level = args[:sampling_level] if args.key?(:sampling_level)
            @segment = args[:segment] if args.key?(:segment)
            @sort = args[:sort] if args.key?(:sort)
            @start_date = args[:start_date] if args.key?(:start_date)
            @start_index = args[:start_index] if args.key?(:start_index)
          end
        end
      end
      
      # JSON template for Analytics goal resource.
      class Goal
        include Google::Apis::Core::Hashable
      
        # Account ID to which this goal belongs.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Determines whether this goal is active.
        # Corresponds to the JSON property `active`
        # @return [Boolean]
        attr_accessor :active
        alias_method :active?, :active
      
        # Time this goal was created.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # Details for the goal of the type EVENT.
        # Corresponds to the JSON property `eventDetails`
        # @return [Google::Apis::AnalyticsV3::Goal::EventDetails]
        attr_accessor :event_details
      
        # Goal ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Internal ID for the web property to which this goal belongs.
        # Corresponds to the JSON property `internalWebPropertyId`
        # @return [String]
        attr_accessor :internal_web_property_id
      
        # Resource type for an Analytics goal.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Goal name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Parent link for a goal. Points to the view (profile) to which this goal
        # belongs.
        # Corresponds to the JSON property `parentLink`
        # @return [Google::Apis::AnalyticsV3::Goal::ParentLink]
        attr_accessor :parent_link
      
        # View (Profile) ID to which this goal belongs.
        # Corresponds to the JSON property `profileId`
        # @return [String]
        attr_accessor :profile_id
      
        # Link for this goal.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Goal type. Possible values are URL_DESTINATION, VISIT_TIME_ON_SITE,
        # VISIT_NUM_PAGES, AND EVENT.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Time this goal was last modified.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # Details for the goal of the type URL_DESTINATION.
        # Corresponds to the JSON property `urlDestinationDetails`
        # @return [Google::Apis::AnalyticsV3::Goal::UrlDestinationDetails]
        attr_accessor :url_destination_details
      
        # Goal value.
        # Corresponds to the JSON property `value`
        # @return [Float]
        attr_accessor :value
      
        # Details for the goal of the type VISIT_NUM_PAGES.
        # Corresponds to the JSON property `visitNumPagesDetails`
        # @return [Google::Apis::AnalyticsV3::Goal::VisitNumPagesDetails]
        attr_accessor :visit_num_pages_details
      
        # Details for the goal of the type VISIT_TIME_ON_SITE.
        # Corresponds to the JSON property `visitTimeOnSiteDetails`
        # @return [Google::Apis::AnalyticsV3::Goal::VisitTimeOnSiteDetails]
        attr_accessor :visit_time_on_site_details
      
        # Web property ID to which this goal belongs. The web property ID is of the form
        # UA-XXXXX-YY.
        # Corresponds to the JSON property `webPropertyId`
        # @return [String]
        attr_accessor :web_property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @active = args[:active] if args.key?(:active)
          @created = args[:created] if args.key?(:created)
          @event_details = args[:event_details] if args.key?(:event_details)
          @id = args[:id] if args.key?(:id)
          @internal_web_property_id = args[:internal_web_property_id] if args.key?(:internal_web_property_id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @parent_link = args[:parent_link] if args.key?(:parent_link)
          @profile_id = args[:profile_id] if args.key?(:profile_id)
          @self_link = args[:self_link] if args.key?(:self_link)
          @type = args[:type] if args.key?(:type)
          @updated = args[:updated] if args.key?(:updated)
          @url_destination_details = args[:url_destination_details] if args.key?(:url_destination_details)
          @value = args[:value] if args.key?(:value)
          @visit_num_pages_details = args[:visit_num_pages_details] if args.key?(:visit_num_pages_details)
          @visit_time_on_site_details = args[:visit_time_on_site_details] if args.key?(:visit_time_on_site_details)
          @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
        end
        
        # Details for the goal of the type EVENT.
        class EventDetails
          include Google::Apis::Core::Hashable
        
          # List of event conditions.
          # Corresponds to the JSON property `eventConditions`
          # @return [Array<Google::Apis::AnalyticsV3::Goal::EventDetails::EventCondition>]
          attr_accessor :event_conditions
        
          # Determines if the event value should be used as the value for this goal.
          # Corresponds to the JSON property `useEventValue`
          # @return [Boolean]
          attr_accessor :use_event_value
          alias_method :use_event_value?, :use_event_value
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @event_conditions = args[:event_conditions] if args.key?(:event_conditions)
            @use_event_value = args[:use_event_value] if args.key?(:use_event_value)
          end
          
          # 
          class EventCondition
            include Google::Apis::Core::Hashable
          
            # Type of comparison. Possible values are LESS_THAN, GREATER_THAN or EQUAL.
            # Corresponds to the JSON property `comparisonType`
            # @return [String]
            attr_accessor :comparison_type
          
            # Value used for this comparison.
            # Corresponds to the JSON property `comparisonValue`
            # @return [Fixnum]
            attr_accessor :comparison_value
          
            # Expression used for this match.
            # Corresponds to the JSON property `expression`
            # @return [String]
            attr_accessor :expression
          
            # Type of the match to be performed. Possible values are REGEXP, BEGINS_WITH, or
            # EXACT.
            # Corresponds to the JSON property `matchType`
            # @return [String]
            attr_accessor :match_type
          
            # Type of this event condition. Possible values are CATEGORY, ACTION, LABEL, or
            # VALUE.
            # Corresponds to the JSON property `type`
            # @return [String]
            attr_accessor :type
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @comparison_type = args[:comparison_type] if args.key?(:comparison_type)
              @comparison_value = args[:comparison_value] if args.key?(:comparison_value)
              @expression = args[:expression] if args.key?(:expression)
              @match_type = args[:match_type] if args.key?(:match_type)
              @type = args[:type] if args.key?(:type)
            end
          end
        end
        
        # Parent link for a goal. Points to the view (profile) to which this goal
        # belongs.
        class ParentLink
          include Google::Apis::Core::Hashable
        
          # Link to the view (profile) to which this goal belongs.
          # Corresponds to the JSON property `href`
          # @return [String]
          attr_accessor :href
        
          # Value is "analytics#profile".
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @href = args[:href] if args.key?(:href)
            @type = args[:type] if args.key?(:type)
          end
        end
        
        # Details for the goal of the type URL_DESTINATION.
        class UrlDestinationDetails
          include Google::Apis::Core::Hashable
        
          # Determines if the goal URL must exactly match the capitalization of visited
          # URLs.
          # Corresponds to the JSON property `caseSensitive`
          # @return [Boolean]
          attr_accessor :case_sensitive
          alias_method :case_sensitive?, :case_sensitive
        
          # Determines if the first step in this goal is required.
          # Corresponds to the JSON property `firstStepRequired`
          # @return [Boolean]
          attr_accessor :first_step_required
          alias_method :first_step_required?, :first_step_required
        
          # Match type for the goal URL. Possible values are HEAD, EXACT, or REGEX.
          # Corresponds to the JSON property `matchType`
          # @return [String]
          attr_accessor :match_type
        
          # List of steps configured for this goal funnel.
          # Corresponds to the JSON property `steps`
          # @return [Array<Google::Apis::AnalyticsV3::Goal::UrlDestinationDetails::Step>]
          attr_accessor :steps
        
          # URL for this goal.
          # Corresponds to the JSON property `url`
          # @return [String]
          attr_accessor :url
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @case_sensitive = args[:case_sensitive] if args.key?(:case_sensitive)
            @first_step_required = args[:first_step_required] if args.key?(:first_step_required)
            @match_type = args[:match_type] if args.key?(:match_type)
            @steps = args[:steps] if args.key?(:steps)
            @url = args[:url] if args.key?(:url)
          end
          
          # 
          class Step
            include Google::Apis::Core::Hashable
          
            # Step name.
            # Corresponds to the JSON property `name`
            # @return [String]
            attr_accessor :name
          
            # Step number.
            # Corresponds to the JSON property `number`
            # @return [Fixnum]
            attr_accessor :number
          
            # URL for this step.
            # Corresponds to the JSON property `url`
            # @return [String]
            attr_accessor :url
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @name = args[:name] if args.key?(:name)
              @number = args[:number] if args.key?(:number)
              @url = args[:url] if args.key?(:url)
            end
          end
        end
        
        # Details for the goal of the type VISIT_NUM_PAGES.
        class VisitNumPagesDetails
          include Google::Apis::Core::Hashable
        
          # Type of comparison. Possible values are LESS_THAN, GREATER_THAN, or EQUAL.
          # Corresponds to the JSON property `comparisonType`
          # @return [String]
          attr_accessor :comparison_type
        
          # Value used for this comparison.
          # Corresponds to the JSON property `comparisonValue`
          # @return [Fixnum]
          attr_accessor :comparison_value
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @comparison_type = args[:comparison_type] if args.key?(:comparison_type)
            @comparison_value = args[:comparison_value] if args.key?(:comparison_value)
          end
        end
        
        # Details for the goal of the type VISIT_TIME_ON_SITE.
        class VisitTimeOnSiteDetails
          include Google::Apis::Core::Hashable
        
          # Type of comparison. Possible values are LESS_THAN or GREATER_THAN.
          # Corresponds to the JSON property `comparisonType`
          # @return [String]
          attr_accessor :comparison_type
        
          # Value used for this comparison.
          # Corresponds to the JSON property `comparisonValue`
          # @return [Fixnum]
          attr_accessor :comparison_value
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @comparison_type = args[:comparison_type] if args.key?(:comparison_type)
            @comparison_value = args[:comparison_value] if args.key?(:comparison_value)
          end
        end
      end
      
      # A goal collection lists Analytics goals to which the user has access. Each
      # view (profile) can have a set of goals. Each resource in the Goal collection
      # corresponds to a single Analytics goal.
      class Goals
        include Google::Apis::Core::Hashable
      
        # A list of goals.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::Goal>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this goal collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this goal collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of
        # resources in the result.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # JSON template for a hash Client Id request resource.
      class HashClientIdRequest
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `clientId`
        # @return [String]
        attr_accessor :client_id
      
        # 
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # 
        # Corresponds to the JSON property `webPropertyId`
        # @return [String]
        attr_accessor :web_property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_id = args[:client_id] if args.key?(:client_id)
          @kind = args[:kind] if args.key?(:kind)
          @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
        end
      end
      
      # JSON template for a hash Client Id response resource.
      class HashClientIdResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `clientId`
        # @return [String]
        attr_accessor :client_id
      
        # 
        # Corresponds to the JSON property `hashedClientId`
        # @return [String]
        attr_accessor :hashed_client_id
      
        # 
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # 
        # Corresponds to the JSON property `webPropertyId`
        # @return [String]
        attr_accessor :web_property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_id = args[:client_id] if args.key?(:client_id)
          @hashed_client_id = args[:hashed_client_id] if args.key?(:hashed_client_id)
          @kind = args[:kind] if args.key?(:kind)
          @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
        end
      end
      
      # JSON template for an Analytics Remarketing Include Conditions.
      class IncludeConditions
        include Google::Apis::Core::Hashable
      
        # The look-back window lets you specify a time frame for evaluating the behavior
        # that qualifies users for your audience. For example, if your filters include
        # users from Central Asia, and Transactions Greater than 2, and you set the look-
        # back window to 14 days, then any user from Central Asia whose cumulative
        # transactions exceed 2 during the last 14 days is added to the audience.
        # Corresponds to the JSON property `daysToLookBack`
        # @return [Fixnum]
        attr_accessor :days_to_look_back
      
        # Boolean indicating whether this segment is a smart list. https://support.
        # google.com/analytics/answer/4628577
        # Corresponds to the JSON property `isSmartList`
        # @return [Boolean]
        attr_accessor :is_smart_list
        alias_method :is_smart_list?, :is_smart_list
      
        # Resource type for include conditions.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Number of days (in the range 1 to 540) a user remains in the audience.
        # Corresponds to the JSON property `membershipDurationDays`
        # @return [Fixnum]
        attr_accessor :membership_duration_days
      
        # The segment condition that will cause a user to be added to an audience.
        # Corresponds to the JSON property `segment`
        # @return [String]
        attr_accessor :segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @days_to_look_back = args[:days_to_look_back] if args.key?(:days_to_look_back)
          @is_smart_list = args[:is_smart_list] if args.key?(:is_smart_list)
          @kind = args[:kind] if args.key?(:kind)
          @membership_duration_days = args[:membership_duration_days] if args.key?(:membership_duration_days)
          @segment = args[:segment] if args.key?(:segment)
        end
      end
      
      # JSON template for an Analytics Remarketing Audience Foreign Link.
      class LinkedForeignAccount
        include Google::Apis::Core::Hashable
      
        # Account ID to which this linked foreign account belongs.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Boolean indicating whether this is eligible for search.
        # Corresponds to the JSON property `eligibleForSearch`
        # @return [Boolean]
        attr_accessor :eligible_for_search
        alias_method :eligible_for_search?, :eligible_for_search
      
        # Entity ad account link ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Internal ID for the web property to which this linked foreign account belongs.
        # Corresponds to the JSON property `internalWebPropertyId`
        # @return [String]
        attr_accessor :internal_web_property_id
      
        # Resource type for linked foreign account.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The foreign account ID. For example the an Google Ads `linkedAccountId` has
        # the following format XXX-XXX-XXXX.
        # Corresponds to the JSON property `linkedAccountId`
        # @return [String]
        attr_accessor :linked_account_id
      
        # Remarketing audience ID to which this linked foreign account belongs.
        # Corresponds to the JSON property `remarketingAudienceId`
        # @return [String]
        attr_accessor :remarketing_audience_id
      
        # The status of this foreign account link.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # The type of the foreign account. For example, `ADWORDS_LINKS`, `DBM_LINKS`, `
        # MCC_LINKS` or `OPTIMIZE`.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Web property ID of the form UA-XXXXX-YY to which this linked foreign account
        # belongs.
        # Corresponds to the JSON property `webPropertyId`
        # @return [String]
        attr_accessor :web_property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @eligible_for_search = args[:eligible_for_search] if args.key?(:eligible_for_search)
          @id = args[:id] if args.key?(:id)
          @internal_web_property_id = args[:internal_web_property_id] if args.key?(:internal_web_property_id)
          @kind = args[:kind] if args.key?(:kind)
          @linked_account_id = args[:linked_account_id] if args.key?(:linked_account_id)
          @remarketing_audience_id = args[:remarketing_audience_id] if args.key?(:remarketing_audience_id)
          @status = args[:status] if args.key?(:status)
          @type = args[:type] if args.key?(:type)
          @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
        end
      end
      
      # Multi-Channel Funnels data for a given view (profile).
      class McfData
        include Google::Apis::Core::Hashable
      
        # Column headers that list dimension names followed by the metric names. The
        # order of dimensions and metrics is same as specified in the request.
        # Corresponds to the JSON property `columnHeaders`
        # @return [Array<Google::Apis::AnalyticsV3::McfData::ColumnHeader>]
        attr_accessor :column_headers
      
        # Determines if the Analytics data contains sampled data.
        # Corresponds to the JSON property `containsSampledData`
        # @return [Boolean]
        attr_accessor :contains_sampled_data
        alias_method :contains_sampled_data?, :contains_sampled_data
      
        # Unique ID for this data response.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The maximum number of rows the response can contain, regardless of the actual
        # number of rows returned. Its value ranges from 1 to 10,000 with a value of
        # 1000 by default, or otherwise specified by the max-results query parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this Analytics data query.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this Analytics data query.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # Information for the view (profile), for which the Analytics data was requested.
        # Corresponds to the JSON property `profileInfo`
        # @return [Google::Apis::AnalyticsV3::McfData::ProfileInfo]
        attr_accessor :profile_info
      
        # Analytics data request query parameters.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::AnalyticsV3::McfData::Query]
        attr_accessor :query
      
        # Analytics data rows, where each row contains a list of dimension values
        # followed by the metric values. The order of dimensions and metrics is same as
        # specified in the request.
        # Corresponds to the JSON property `rows`
        # @return [Array<Array<Google::Apis::AnalyticsV3::McfData::Row>>]
        attr_accessor :rows
      
        # The number of samples used to calculate the result.
        # Corresponds to the JSON property `sampleSize`
        # @return [Fixnum]
        attr_accessor :sample_size
      
        # Total size of the sample space from which the samples were selected.
        # Corresponds to the JSON property `sampleSpace`
        # @return [Fixnum]
        attr_accessor :sample_space
      
        # Link to this page.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The total number of rows for the query, regardless of the number of rows in
        # the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Total values for the requested metrics over all the results, not just the
        # results returned in this response. The order of the metric totals is same as
        # the metric order specified in the request.
        # Corresponds to the JSON property `totalsForAllResults`
        # @return [Hash<String,String>]
        attr_accessor :totals_for_all_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column_headers = args[:column_headers] if args.key?(:column_headers)
          @contains_sampled_data = args[:contains_sampled_data] if args.key?(:contains_sampled_data)
          @id = args[:id] if args.key?(:id)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @profile_info = args[:profile_info] if args.key?(:profile_info)
          @query = args[:query] if args.key?(:query)
          @rows = args[:rows] if args.key?(:rows)
          @sample_size = args[:sample_size] if args.key?(:sample_size)
          @sample_space = args[:sample_space] if args.key?(:sample_space)
          @self_link = args[:self_link] if args.key?(:self_link)
          @total_results = args[:total_results] if args.key?(:total_results)
          @totals_for_all_results = args[:totals_for_all_results] if args.key?(:totals_for_all_results)
        end
        
        # 
        class ColumnHeader
          include Google::Apis::Core::Hashable
        
          # Column Type. Either DIMENSION or METRIC.
          # Corresponds to the JSON property `columnType`
          # @return [String]
          attr_accessor :column_type
        
          # Data type. Dimension and metric values data types such as INTEGER, DOUBLE,
          # CURRENCY, MCF_SEQUENCE etc.
          # Corresponds to the JSON property `dataType`
          # @return [String]
          attr_accessor :data_type
        
          # Column name.
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @column_type = args[:column_type] if args.key?(:column_type)
            @data_type = args[:data_type] if args.key?(:data_type)
            @name = args[:name] if args.key?(:name)
          end
        end
        
        # Information for the view (profile), for which the Analytics data was requested.
        class ProfileInfo
          include Google::Apis::Core::Hashable
        
          # Account ID to which this view (profile) belongs.
          # Corresponds to the JSON property `accountId`
          # @return [String]
          attr_accessor :account_id
        
          # Internal ID for the web property to which this view (profile) belongs.
          # Corresponds to the JSON property `internalWebPropertyId`
          # @return [String]
          attr_accessor :internal_web_property_id
        
          # View (Profile) ID.
          # Corresponds to the JSON property `profileId`
          # @return [String]
          attr_accessor :profile_id
        
          # View (Profile) name.
          # Corresponds to the JSON property `profileName`
          # @return [String]
          attr_accessor :profile_name
        
          # Table ID for view (profile).
          # Corresponds to the JSON property `tableId`
          # @return [String]
          attr_accessor :table_id
        
          # Web Property ID to which this view (profile) belongs.
          # Corresponds to the JSON property `webPropertyId`
          # @return [String]
          attr_accessor :web_property_id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @account_id = args[:account_id] if args.key?(:account_id)
            @internal_web_property_id = args[:internal_web_property_id] if args.key?(:internal_web_property_id)
            @profile_id = args[:profile_id] if args.key?(:profile_id)
            @profile_name = args[:profile_name] if args.key?(:profile_name)
            @table_id = args[:table_id] if args.key?(:table_id)
            @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
          end
        end
        
        # Analytics data request query parameters.
        class Query
          include Google::Apis::Core::Hashable
        
          # List of analytics dimensions.
          # Corresponds to the JSON property `dimensions`
          # @return [String]
          attr_accessor :dimensions
        
          # End date.
          # Corresponds to the JSON property `end-date`
          # @return [String]
          attr_accessor :end_date
        
          # Comma-separated list of dimension or metric filters.
          # Corresponds to the JSON property `filters`
          # @return [String]
          attr_accessor :filters
        
          # Unique table ID.
          # Corresponds to the JSON property `ids`
          # @return [String]
          attr_accessor :ids
        
          # Maximum results per page.
          # Corresponds to the JSON property `max-results`
          # @return [Fixnum]
          attr_accessor :max_results
        
          # List of analytics metrics.
          # Corresponds to the JSON property `metrics`
          # @return [Array<String>]
          attr_accessor :metrics
        
          # Desired sampling level
          # Corresponds to the JSON property `samplingLevel`
          # @return [String]
          attr_accessor :sampling_level
        
          # Analytics advanced segment.
          # Corresponds to the JSON property `segment`
          # @return [String]
          attr_accessor :segment
        
          # List of dimensions or metrics based on which Analytics data is sorted.
          # Corresponds to the JSON property `sort`
          # @return [Array<String>]
          attr_accessor :sort
        
          # Start date.
          # Corresponds to the JSON property `start-date`
          # @return [String]
          attr_accessor :start_date
        
          # Start index.
          # Corresponds to the JSON property `start-index`
          # @return [Fixnum]
          attr_accessor :start_index
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @dimensions = args[:dimensions] if args.key?(:dimensions)
            @end_date = args[:end_date] if args.key?(:end_date)
            @filters = args[:filters] if args.key?(:filters)
            @ids = args[:ids] if args.key?(:ids)
            @max_results = args[:max_results] if args.key?(:max_results)
            @metrics = args[:metrics] if args.key?(:metrics)
            @sampling_level = args[:sampling_level] if args.key?(:sampling_level)
            @segment = args[:segment] if args.key?(:segment)
            @sort = args[:sort] if args.key?(:sort)
            @start_date = args[:start_date] if args.key?(:start_date)
            @start_index = args[:start_index] if args.key?(:start_index)
          end
        end
        
        # A union object representing a dimension or metric value. Only one of "
        # primitiveValue" or "conversionPathValue" attribute will be populated.
        class Row
          include Google::Apis::Core::Hashable
        
          # A conversion path dimension value, containing a list of interactions with
          # their attributes.
          # Corresponds to the JSON property `conversionPathValue`
          # @return [Array<Google::Apis::AnalyticsV3::McfData::Row::ConversionPathValue>]
          attr_accessor :conversion_path_value
        
          # A primitive dimension value. A primitive metric value.
          # Corresponds to the JSON property `primitiveValue`
          # @return [String]
          attr_accessor :primitive_value
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @conversion_path_value = args[:conversion_path_value] if args.key?(:conversion_path_value)
            @primitive_value = args[:primitive_value] if args.key?(:primitive_value)
          end
          
          # 
          class ConversionPathValue
            include Google::Apis::Core::Hashable
          
            # Type of an interaction on conversion path. Such as CLICK, IMPRESSION etc.
            # Corresponds to the JSON property `interactionType`
            # @return [String]
            attr_accessor :interaction_type
          
            # Node value of an interaction on conversion path. Such as source, medium etc.
            # Corresponds to the JSON property `nodeValue`
            # @return [String]
            attr_accessor :node_value
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @interaction_type = args[:interaction_type] if args.key?(:interaction_type)
              @node_value = args[:node_value] if args.key?(:node_value)
            end
          end
        end
      end
      
      # JSON template for an Analytics view (profile).
      class Profile
        include Google::Apis::Core::Hashable
      
        # Account ID to which this view (profile) belongs.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Indicates whether bot filtering is enabled for this view (profile).
        # Corresponds to the JSON property `botFilteringEnabled`
        # @return [Boolean]
        attr_accessor :bot_filtering_enabled
        alias_method :bot_filtering_enabled?, :bot_filtering_enabled
      
        # Child link for this view (profile). Points to the list of goals for this view (
        # profile).
        # Corresponds to the JSON property `childLink`
        # @return [Google::Apis::AnalyticsV3::Profile::ChildLink]
        attr_accessor :child_link
      
        # Time this view (profile) was created.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # The currency type associated with this view (profile), defaults to USD. The
        # supported values are:
        # USD, JPY, EUR, GBP, AUD, KRW, BRL, CNY, DKK, RUB, SEK, NOK, PLN, TRY, TWD, HKD,
        # THB, IDR, ARS, MXN, VND, PHP, INR, CHF, CAD, CZK, NZD, HUF, BGN, LTL, ZAR,
        # UAH, AED, BOB, CLP, COP, EGP, HRK, ILS, MAD, MYR, PEN, PKR, RON, RSD, SAR, SGD,
        # VEF, LVL
        # Corresponds to the JSON property `currency`
        # @return [String]
        attr_accessor :currency
      
        # Default page for this view (profile).
        # Corresponds to the JSON property `defaultPage`
        # @return [String]
        attr_accessor :default_page
      
        # Indicates whether ecommerce tracking is enabled for this view (profile).
        # Corresponds to the JSON property `eCommerceTracking`
        # @return [Boolean]
        attr_accessor :e_commerce_tracking
        alias_method :e_commerce_tracking?, :e_commerce_tracking
      
        # Indicates whether enhanced ecommerce tracking is enabled for this view (
        # profile). This property can only be enabled if ecommerce tracking is enabled.
        # Corresponds to the JSON property `enhancedECommerceTracking`
        # @return [Boolean]
        attr_accessor :enhanced_e_commerce_tracking
        alias_method :enhanced_e_commerce_tracking?, :enhanced_e_commerce_tracking
      
        # The query parameters that are excluded from this view (profile).
        # Corresponds to the JSON property `excludeQueryParameters`
        # @return [String]
        attr_accessor :exclude_query_parameters
      
        # View (Profile) ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Internal ID for the web property to which this view (profile) belongs.
        # Corresponds to the JSON property `internalWebPropertyId`
        # @return [String]
        attr_accessor :internal_web_property_id
      
        # Resource type for Analytics view (profile).
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this view (profile).
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Parent link for this view (profile). Points to the web property to which this
        # view (profile) belongs.
        # Corresponds to the JSON property `parentLink`
        # @return [Google::Apis::AnalyticsV3::Profile::ParentLink]
        attr_accessor :parent_link
      
        # Permissions the user has for this view (profile).
        # Corresponds to the JSON property `permissions`
        # @return [Google::Apis::AnalyticsV3::Profile::Permissions]
        attr_accessor :permissions
      
        # Link for this view (profile).
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Site search category parameters for this view (profile).
        # Corresponds to the JSON property `siteSearchCategoryParameters`
        # @return [String]
        attr_accessor :site_search_category_parameters
      
        # The site search query parameters for this view (profile).
        # Corresponds to the JSON property `siteSearchQueryParameters`
        # @return [String]
        attr_accessor :site_search_query_parameters
      
        # Indicates whether this view (profile) is starred or not.
        # Corresponds to the JSON property `starred`
        # @return [Boolean]
        attr_accessor :starred
        alias_method :starred?, :starred
      
        # Whether or not Analytics will strip search category parameters from the URLs
        # in your reports.
        # Corresponds to the JSON property `stripSiteSearchCategoryParameters`
        # @return [Boolean]
        attr_accessor :strip_site_search_category_parameters
        alias_method :strip_site_search_category_parameters?, :strip_site_search_category_parameters
      
        # Whether or not Analytics will strip search query parameters from the URLs in
        # your reports.
        # Corresponds to the JSON property `stripSiteSearchQueryParameters`
        # @return [Boolean]
        attr_accessor :strip_site_search_query_parameters
        alias_method :strip_site_search_query_parameters?, :strip_site_search_query_parameters
      
        # Time zone for which this view (profile) has been configured. Time zones are
        # identified by strings from the TZ database.
        # Corresponds to the JSON property `timezone`
        # @return [String]
        attr_accessor :timezone
      
        # View (Profile) type. Supported types: WEB or APP.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Time this view (profile) was last modified.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # Web property ID of the form UA-XXXXX-YY to which this view (profile) belongs.
        # Corresponds to the JSON property `webPropertyId`
        # @return [String]
        attr_accessor :web_property_id
      
        # Website URL for this view (profile).
        # Corresponds to the JSON property `websiteUrl`
        # @return [String]
        attr_accessor :website_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @bot_filtering_enabled = args[:bot_filtering_enabled] if args.key?(:bot_filtering_enabled)
          @child_link = args[:child_link] if args.key?(:child_link)
          @created = args[:created] if args.key?(:created)
          @currency = args[:currency] if args.key?(:currency)
          @default_page = args[:default_page] if args.key?(:default_page)
          @e_commerce_tracking = args[:e_commerce_tracking] if args.key?(:e_commerce_tracking)
          @enhanced_e_commerce_tracking = args[:enhanced_e_commerce_tracking] if args.key?(:enhanced_e_commerce_tracking)
          @exclude_query_parameters = args[:exclude_query_parameters] if args.key?(:exclude_query_parameters)
          @id = args[:id] if args.key?(:id)
          @internal_web_property_id = args[:internal_web_property_id] if args.key?(:internal_web_property_id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @parent_link = args[:parent_link] if args.key?(:parent_link)
          @permissions = args[:permissions] if args.key?(:permissions)
          @self_link = args[:self_link] if args.key?(:self_link)
          @site_search_category_parameters = args[:site_search_category_parameters] if args.key?(:site_search_category_parameters)
          @site_search_query_parameters = args[:site_search_query_parameters] if args.key?(:site_search_query_parameters)
          @starred = args[:starred] if args.key?(:starred)
          @strip_site_search_category_parameters = args[:strip_site_search_category_parameters] if args.key?(:strip_site_search_category_parameters)
          @strip_site_search_query_parameters = args[:strip_site_search_query_parameters] if args.key?(:strip_site_search_query_parameters)
          @timezone = args[:timezone] if args.key?(:timezone)
          @type = args[:type] if args.key?(:type)
          @updated = args[:updated] if args.key?(:updated)
          @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
          @website_url = args[:website_url] if args.key?(:website_url)
        end
        
        # Child link for this view (profile). Points to the list of goals for this view (
        # profile).
        class ChildLink
          include Google::Apis::Core::Hashable
        
          # Link to the list of goals for this view (profile).
          # Corresponds to the JSON property `href`
          # @return [String]
          attr_accessor :href
        
          # Value is "analytics#goals".
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @href = args[:href] if args.key?(:href)
            @type = args[:type] if args.key?(:type)
          end
        end
        
        # Parent link for this view (profile). Points to the web property to which this
        # view (profile) belongs.
        class ParentLink
          include Google::Apis::Core::Hashable
        
          # Link to the web property to which this view (profile) belongs.
          # Corresponds to the JSON property `href`
          # @return [String]
          attr_accessor :href
        
          # Value is "analytics#webproperty".
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @href = args[:href] if args.key?(:href)
            @type = args[:type] if args.key?(:type)
          end
        end
        
        # Permissions the user has for this view (profile).
        class Permissions
          include Google::Apis::Core::Hashable
        
          # All the permissions that the user has for this view (profile). These include
          # any implied permissions (e.g., EDIT implies VIEW) or inherited permissions
          # from the parent web property.
          # Corresponds to the JSON property `effective`
          # @return [Array<String>]
          attr_accessor :effective
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @effective = args[:effective] if args.key?(:effective)
          end
        end
      end
      
      # JSON template for an Analytics profile filter link.
      class ProfileFilterLink
        include Google::Apis::Core::Hashable
      
        # JSON template for a profile filter link.
        # Corresponds to the JSON property `filterRef`
        # @return [Google::Apis::AnalyticsV3::FilterRef]
        attr_accessor :filter_ref
      
        # Profile filter link ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type for Analytics filter.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # JSON template for a linked view (profile).
        # Corresponds to the JSON property `profileRef`
        # @return [Google::Apis::AnalyticsV3::ProfileRef]
        attr_accessor :profile_ref
      
        # The rank of this profile filter link relative to the other filters linked to
        # the same profile.
        # For readonly (i.e., list and get) operations, the rank always starts at 1.
        # For write (i.e., create, update, or delete) operations, you may specify a
        # value between 0 and 255 inclusively, [0, 255]. In order to insert a link at
        # the end of the list, either don't specify a rank or set a rank to a number
        # greater than the largest rank in the list. In order to insert a link to the
        # beginning of the list specify a rank that is less than or equal to 1. The new
        # link will move all existing filters with the same or lower rank down the list.
        # After the link is inserted/updated/deleted all profile filter links will be
        # renumbered starting at 1.
        # Corresponds to the JSON property `rank`
        # @return [Fixnum]
        attr_accessor :rank
      
        # Link for this profile filter link.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter_ref = args[:filter_ref] if args.key?(:filter_ref)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @profile_ref = args[:profile_ref] if args.key?(:profile_ref)
          @rank = args[:rank] if args.key?(:rank)
          @self_link = args[:self_link] if args.key?(:self_link)
        end
      end
      
      # A profile filter link collection lists profile filter links between profiles
      # and filters. Each resource in the collection corresponds to a profile filter
      # link.
      class ProfileFilterLinks
        include Google::Apis::Core::Hashable
      
        # A list of profile filter links.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::ProfileFilterLink>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1,000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this profile filter link collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this profile filter link collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of results
        # in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # JSON template for a linked view (profile).
      class ProfileRef
        include Google::Apis::Core::Hashable
      
        # Account ID to which this view (profile) belongs.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Link for this view (profile).
        # Corresponds to the JSON property `href`
        # @return [String]
        attr_accessor :href
      
        # View (Profile) ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Internal ID for the web property to which this view (profile) belongs.
        # Corresponds to the JSON property `internalWebPropertyId`
        # @return [String]
        attr_accessor :internal_web_property_id
      
        # Analytics view (profile) reference.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this view (profile).
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Web property ID of the form UA-XXXXX-YY to which this view (profile) belongs.
        # Corresponds to the JSON property `webPropertyId`
        # @return [String]
        attr_accessor :web_property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @href = args[:href] if args.key?(:href)
          @id = args[:id] if args.key?(:id)
          @internal_web_property_id = args[:internal_web_property_id] if args.key?(:internal_web_property_id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
        end
      end
      
      # JSON template for an Analytics ProfileSummary. ProfileSummary returns basic
      # information (i.e., summary) for a profile.
      class ProfileSummary
        include Google::Apis::Core::Hashable
      
        # View (profile) ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type for Analytics ProfileSummary.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # View (profile) name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Indicates whether this view (profile) is starred or not.
        # Corresponds to the JSON property `starred`
        # @return [Boolean]
        attr_accessor :starred
        alias_method :starred?, :starred
      
        # View (Profile) type. Supported types: WEB or APP.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @starred = args[:starred] if args.key?(:starred)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A view (profile) collection lists Analytics views (profiles) to which the user
      # has access. Each resource in the collection corresponds to a single Analytics
      # view (profile).
      class Profiles
        include Google::Apis::Core::Hashable
      
        # A list of views (profiles).
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::Profile>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this view (profile) collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this view (profile) collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of results
        # in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # Real time data for a given view (profile).
      class RealtimeData
        include Google::Apis::Core::Hashable
      
        # Column headers that list dimension names followed by the metric names. The
        # order of dimensions and metrics is same as specified in the request.
        # Corresponds to the JSON property `columnHeaders`
        # @return [Array<Google::Apis::AnalyticsV3::RealtimeData::ColumnHeader>]
        attr_accessor :column_headers
      
        # Unique ID for this data response.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Information for the view (profile), for which the real time data was requested.
        # Corresponds to the JSON property `profileInfo`
        # @return [Google::Apis::AnalyticsV3::RealtimeData::ProfileInfo]
        attr_accessor :profile_info
      
        # Real time data request query parameters.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::AnalyticsV3::RealtimeData::Query]
        attr_accessor :query
      
        # Real time data rows, where each row contains a list of dimension values
        # followed by the metric values. The order of dimensions and metrics is same as
        # specified in the request.
        # Corresponds to the JSON property `rows`
        # @return [Array<Array<String>>]
        attr_accessor :rows
      
        # Link to this page.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The total number of rows for the query, regardless of the number of rows in
        # the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Total values for the requested metrics over all the results, not just the
        # results returned in this response. The order of the metric totals is same as
        # the metric order specified in the request.
        # Corresponds to the JSON property `totalsForAllResults`
        # @return [Hash<String,String>]
        attr_accessor :totals_for_all_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @column_headers = args[:column_headers] if args.key?(:column_headers)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @profile_info = args[:profile_info] if args.key?(:profile_info)
          @query = args[:query] if args.key?(:query)
          @rows = args[:rows] if args.key?(:rows)
          @self_link = args[:self_link] if args.key?(:self_link)
          @total_results = args[:total_results] if args.key?(:total_results)
          @totals_for_all_results = args[:totals_for_all_results] if args.key?(:totals_for_all_results)
        end
        
        # 
        class ColumnHeader
          include Google::Apis::Core::Hashable
        
          # Column Type. Either DIMENSION or METRIC.
          # Corresponds to the JSON property `columnType`
          # @return [String]
          attr_accessor :column_type
        
          # Data type. Dimension column headers have only STRING as the data type. Metric
          # column headers have data types for metric values such as INTEGER, DOUBLE,
          # CURRENCY etc.
          # Corresponds to the JSON property `dataType`
          # @return [String]
          attr_accessor :data_type
        
          # Column name.
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @column_type = args[:column_type] if args.key?(:column_type)
            @data_type = args[:data_type] if args.key?(:data_type)
            @name = args[:name] if args.key?(:name)
          end
        end
        
        # Information for the view (profile), for which the real time data was requested.
        class ProfileInfo
          include Google::Apis::Core::Hashable
        
          # Account ID to which this view (profile) belongs.
          # Corresponds to the JSON property `accountId`
          # @return [String]
          attr_accessor :account_id
        
          # Internal ID for the web property to which this view (profile) belongs.
          # Corresponds to the JSON property `internalWebPropertyId`
          # @return [String]
          attr_accessor :internal_web_property_id
        
          # View (Profile) ID.
          # Corresponds to the JSON property `profileId`
          # @return [String]
          attr_accessor :profile_id
        
          # View (Profile) name.
          # Corresponds to the JSON property `profileName`
          # @return [String]
          attr_accessor :profile_name
        
          # Table ID for view (profile).
          # Corresponds to the JSON property `tableId`
          # @return [String]
          attr_accessor :table_id
        
          # Web Property ID to which this view (profile) belongs.
          # Corresponds to the JSON property `webPropertyId`
          # @return [String]
          attr_accessor :web_property_id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @account_id = args[:account_id] if args.key?(:account_id)
            @internal_web_property_id = args[:internal_web_property_id] if args.key?(:internal_web_property_id)
            @profile_id = args[:profile_id] if args.key?(:profile_id)
            @profile_name = args[:profile_name] if args.key?(:profile_name)
            @table_id = args[:table_id] if args.key?(:table_id)
            @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
          end
        end
        
        # Real time data request query parameters.
        class Query
          include Google::Apis::Core::Hashable
        
          # List of real time dimensions.
          # Corresponds to the JSON property `dimensions`
          # @return [String]
          attr_accessor :dimensions
        
          # Comma-separated list of dimension or metric filters.
          # Corresponds to the JSON property `filters`
          # @return [String]
          attr_accessor :filters
        
          # Unique table ID.
          # Corresponds to the JSON property `ids`
          # @return [String]
          attr_accessor :ids
        
          # Maximum results per page.
          # Corresponds to the JSON property `max-results`
          # @return [Fixnum]
          attr_accessor :max_results
        
          # List of real time metrics.
          # Corresponds to the JSON property `metrics`
          # @return [Array<String>]
          attr_accessor :metrics
        
          # List of dimensions or metrics based on which real time data is sorted.
          # Corresponds to the JSON property `sort`
          # @return [Array<String>]
          attr_accessor :sort
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @dimensions = args[:dimensions] if args.key?(:dimensions)
            @filters = args[:filters] if args.key?(:filters)
            @ids = args[:ids] if args.key?(:ids)
            @max_results = args[:max_results] if args.key?(:max_results)
            @metrics = args[:metrics] if args.key?(:metrics)
            @sort = args[:sort] if args.key?(:sort)
          end
        end
      end
      
      # JSON template for an Analytics remarketing audience.
      class RemarketingAudience
        include Google::Apis::Core::Hashable
      
        # Account ID to which this remarketing audience belongs.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # The simple audience definition that will cause a user to be added to an
        # audience.
        # Corresponds to the JSON property `audienceDefinition`
        # @return [Google::Apis::AnalyticsV3::RemarketingAudience::AudienceDefinition]
        attr_accessor :audience_definition
      
        # The type of audience, either SIMPLE or STATE_BASED.
        # Corresponds to the JSON property `audienceType`
        # @return [String]
        attr_accessor :audience_type
      
        # Time this remarketing audience was created.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # The description of this remarketing audience.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Remarketing Audience ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Internal ID for the web property to which this remarketing audience belongs.
        # Corresponds to the JSON property `internalWebPropertyId`
        # @return [String]
        attr_accessor :internal_web_property_id
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The linked ad accounts associated with this remarketing audience. A
        # remarketing audience can have only one linkedAdAccount currently.
        # Corresponds to the JSON property `linkedAdAccounts`
        # @return [Array<Google::Apis::AnalyticsV3::LinkedForeignAccount>]
        attr_accessor :linked_ad_accounts
      
        # The views (profiles) that this remarketing audience is linked to.
        # Corresponds to the JSON property `linkedViews`
        # @return [Array<String>]
        attr_accessor :linked_views
      
        # The name of this remarketing audience.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A state based audience definition that will cause a user to be added or
        # removed from an audience.
        # Corresponds to the JSON property `stateBasedAudienceDefinition`
        # @return [Google::Apis::AnalyticsV3::RemarketingAudience::StateBasedAudienceDefinition]
        attr_accessor :state_based_audience_definition
      
        # Time this remarketing audience was last modified.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # Web property ID of the form UA-XXXXX-YY to which this remarketing audience
        # belongs.
        # Corresponds to the JSON property `webPropertyId`
        # @return [String]
        attr_accessor :web_property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @audience_definition = args[:audience_definition] if args.key?(:audience_definition)
          @audience_type = args[:audience_type] if args.key?(:audience_type)
          @created = args[:created] if args.key?(:created)
          @description = args[:description] if args.key?(:description)
          @id = args[:id] if args.key?(:id)
          @internal_web_property_id = args[:internal_web_property_id] if args.key?(:internal_web_property_id)
          @kind = args[:kind] if args.key?(:kind)
          @linked_ad_accounts = args[:linked_ad_accounts] if args.key?(:linked_ad_accounts)
          @linked_views = args[:linked_views] if args.key?(:linked_views)
          @name = args[:name] if args.key?(:name)
          @state_based_audience_definition = args[:state_based_audience_definition] if args.key?(:state_based_audience_definition)
          @updated = args[:updated] if args.key?(:updated)
          @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
        end
        
        # The simple audience definition that will cause a user to be added to an
        # audience.
        class AudienceDefinition
          include Google::Apis::Core::Hashable
        
          # JSON template for an Analytics Remarketing Include Conditions.
          # Corresponds to the JSON property `includeConditions`
          # @return [Google::Apis::AnalyticsV3::IncludeConditions]
          attr_accessor :include_conditions
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @include_conditions = args[:include_conditions] if args.key?(:include_conditions)
          end
        end
        
        # A state based audience definition that will cause a user to be added or
        # removed from an audience.
        class StateBasedAudienceDefinition
          include Google::Apis::Core::Hashable
        
          # Defines the conditions to exclude users from the audience.
          # Corresponds to the JSON property `excludeConditions`
          # @return [Google::Apis::AnalyticsV3::RemarketingAudience::StateBasedAudienceDefinition::ExcludeConditions]
          attr_accessor :exclude_conditions
        
          # JSON template for an Analytics Remarketing Include Conditions.
          # Corresponds to the JSON property `includeConditions`
          # @return [Google::Apis::AnalyticsV3::IncludeConditions]
          attr_accessor :include_conditions
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @exclude_conditions = args[:exclude_conditions] if args.key?(:exclude_conditions)
            @include_conditions = args[:include_conditions] if args.key?(:include_conditions)
          end
          
          # Defines the conditions to exclude users from the audience.
          class ExcludeConditions
            include Google::Apis::Core::Hashable
          
            # Whether to make the exclusion TEMPORARY or PERMANENT.
            # Corresponds to the JSON property `exclusionDuration`
            # @return [String]
            attr_accessor :exclusion_duration
          
            # The segment condition that will cause a user to be removed from an audience.
            # Corresponds to the JSON property `segment`
            # @return [String]
            attr_accessor :segment
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @exclusion_duration = args[:exclusion_duration] if args.key?(:exclusion_duration)
              @segment = args[:segment] if args.key?(:segment)
            end
          end
        end
      end
      
      # A remarketing audience collection lists Analytics remarketing audiences to
      # which the user has access. Each resource in the collection corresponds to a
      # single Analytics remarketing audience.
      class RemarketingAudiences
        include Google::Apis::Core::Hashable
      
        # A list of remarketing audiences.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::RemarketingAudience>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this remarketing audience collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this view (profile) collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of results
        # in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # JSON template for an Analytics segment.
      class Segment
        include Google::Apis::Core::Hashable
      
        # Time the segment was created.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # Segment definition.
        # Corresponds to the JSON property `definition`
        # @return [String]
        attr_accessor :definition
      
        # Segment ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type for Analytics segment.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Segment name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Segment ID. Can be used with the 'segment' parameter in Core Reporting API.
        # Corresponds to the JSON property `segmentId`
        # @return [String]
        attr_accessor :segment_id
      
        # Link for this segment.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Type for a segment. Possible values are "BUILT_IN" or "CUSTOM".
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Time the segment was last modified.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @created = args[:created] if args.key?(:created)
          @definition = args[:definition] if args.key?(:definition)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @segment_id = args[:segment_id] if args.key?(:segment_id)
          @self_link = args[:self_link] if args.key?(:self_link)
          @type = args[:type] if args.key?(:type)
          @updated = args[:updated] if args.key?(:updated)
        end
      end
      
      # An segment collection lists Analytics segments that the user has access to.
      # Each resource in the collection corresponds to a single Analytics segment.
      class Segments
        include Google::Apis::Core::Hashable
      
        # A list of segments.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::Segment>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type for segments.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this segment collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this segment collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of results
        # in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # JSON template for Analytics unsampled report resource.
      class UnsampledReport
        include Google::Apis::Core::Hashable
      
        # Account ID to which this unsampled report belongs.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Download details for a file stored in Google Cloud Storage.
        # Corresponds to the JSON property `cloudStorageDownloadDetails`
        # @return [Google::Apis::AnalyticsV3::UnsampledReport::CloudStorageDownloadDetails]
        attr_accessor :cloud_storage_download_details
      
        # Time this unsampled report was created.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # The dimensions for the unsampled report.
        # Corresponds to the JSON property `dimensions`
        # @return [String]
        attr_accessor :dimensions
      
        # The type of download you need to use for the report data file. Possible values
        # include `GOOGLE_DRIVE` and `GOOGLE_CLOUD_STORAGE`. If the value is `
        # GOOGLE_DRIVE`, see the `driveDownloadDetails` field. If the value is `
        # GOOGLE_CLOUD_STORAGE`, see the `cloudStorageDownloadDetails` field.
        # Corresponds to the JSON property `downloadType`
        # @return [String]
        attr_accessor :download_type
      
        # Download details for a file stored in Google Drive.
        # Corresponds to the JSON property `driveDownloadDetails`
        # @return [Google::Apis::AnalyticsV3::UnsampledReport::DriveDownloadDetails]
        attr_accessor :drive_download_details
      
        # The end date for the unsampled report.
        # Corresponds to the JSON property `end-date`
        # @return [String]
        attr_accessor :end_date
      
        # The filters for the unsampled report.
        # Corresponds to the JSON property `filters`
        # @return [String]
        attr_accessor :filters
      
        # Unsampled report ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type for an Analytics unsampled report.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The metrics for the unsampled report.
        # Corresponds to the JSON property `metrics`
        # @return [String]
        attr_accessor :metrics
      
        # View (Profile) ID to which this unsampled report belongs.
        # Corresponds to the JSON property `profileId`
        # @return [String]
        attr_accessor :profile_id
      
        # The segment for the unsampled report.
        # Corresponds to the JSON property `segment`
        # @return [String]
        attr_accessor :segment
      
        # Link for this unsampled report.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # The start date for the unsampled report.
        # Corresponds to the JSON property `start-date`
        # @return [String]
        attr_accessor :start_date
      
        # Status of this unsampled report. Possible values are PENDING, COMPLETED, or
        # FAILED.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # Title of the unsampled report.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Time this unsampled report was last modified.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # Web property ID to which this unsampled report belongs. The web property ID is
        # of the form UA-XXXXX-YY.
        # Corresponds to the JSON property `webPropertyId`
        # @return [String]
        attr_accessor :web_property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @cloud_storage_download_details = args[:cloud_storage_download_details] if args.key?(:cloud_storage_download_details)
          @created = args[:created] if args.key?(:created)
          @dimensions = args[:dimensions] if args.key?(:dimensions)
          @download_type = args[:download_type] if args.key?(:download_type)
          @drive_download_details = args[:drive_download_details] if args.key?(:drive_download_details)
          @end_date = args[:end_date] if args.key?(:end_date)
          @filters = args[:filters] if args.key?(:filters)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @metrics = args[:metrics] if args.key?(:metrics)
          @profile_id = args[:profile_id] if args.key?(:profile_id)
          @segment = args[:segment] if args.key?(:segment)
          @self_link = args[:self_link] if args.key?(:self_link)
          @start_date = args[:start_date] if args.key?(:start_date)
          @status = args[:status] if args.key?(:status)
          @title = args[:title] if args.key?(:title)
          @updated = args[:updated] if args.key?(:updated)
          @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
        end
        
        # Download details for a file stored in Google Cloud Storage.
        class CloudStorageDownloadDetails
          include Google::Apis::Core::Hashable
        
          # Id of the bucket the file object is stored in.
          # Corresponds to the JSON property `bucketId`
          # @return [String]
          attr_accessor :bucket_id
        
          # Id of the file object containing the report data.
          # Corresponds to the JSON property `objectId`
          # @return [String]
          attr_accessor :obj_id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @bucket_id = args[:bucket_id] if args.key?(:bucket_id)
            @obj_id = args[:obj_id] if args.key?(:obj_id)
          end
        end
        
        # Download details for a file stored in Google Drive.
        class DriveDownloadDetails
          include Google::Apis::Core::Hashable
        
          # Id of the document/file containing the report data.
          # Corresponds to the JSON property `documentId`
          # @return [String]
          attr_accessor :document_id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @document_id = args[:document_id] if args.key?(:document_id)
          end
        end
      end
      
      # An unsampled report collection lists Analytics unsampled reports to which the
      # user has access. Each view (profile) can have a set of unsampled reports. Each
      # resource in the unsampled report collection corresponds to a single Analytics
      # unsampled report.
      class UnsampledReports
        include Google::Apis::Core::Hashable
      
        # A list of unsampled reports.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::UnsampledReport>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this unsampled report collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this unsampled report collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of
        # resources in the result.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # Metadata returned for an upload operation.
      class Upload
        include Google::Apis::Core::Hashable
      
        # Account Id to which this upload belongs.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Custom data source Id to which this data import belongs.
        # Corresponds to the JSON property `customDataSourceId`
        # @return [String]
        attr_accessor :custom_data_source_id
      
        # Data import errors collection.
        # Corresponds to the JSON property `errors`
        # @return [Array<String>]
        attr_accessor :errors
      
        # A unique ID for this upload.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type for Analytics upload.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Upload status. Possible values: PENDING, COMPLETED, FAILED, DELETING, DELETED.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # Time this file is uploaded.
        # Corresponds to the JSON property `uploadTime`
        # @return [DateTime]
        attr_accessor :upload_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @custom_data_source_id = args[:custom_data_source_id] if args.key?(:custom_data_source_id)
          @errors = args[:errors] if args.key?(:errors)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @status = args[:status] if args.key?(:status)
          @upload_time = args[:upload_time] if args.key?(:upload_time)
        end
      end
      
      # Upload collection lists Analytics uploads to which the user has access. Each
      # custom data source can have a set of uploads. Each resource in the upload
      # collection corresponds to a single Analytics data upload.
      class Uploads
        include Google::Apis::Core::Hashable
      
        # A list of uploads.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::Upload>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this upload collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this upload collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of
        # resources in the result.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
        end
      end
      
      # JSON template for a user deletion request resource.
      class UserDeletionRequest
        include Google::Apis::Core::Hashable
      
        # This marks the point in time for which all user data before should be deleted
        # Corresponds to the JSON property `deletionRequestTime`
        # @return [DateTime]
        attr_accessor :deletion_request_time
      
        # Firebase Project Id
        # Corresponds to the JSON property `firebaseProjectId`
        # @return [String]
        attr_accessor :firebase_project_id
      
        # User ID.
        # Corresponds to the JSON property `id`
        # @return [Google::Apis::AnalyticsV3::UserDeletionRequest::Id]
        attr_accessor :id
      
        # Value is "analytics#userDeletionRequest".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Property ID
        # Corresponds to the JSON property `propertyId`
        # @return [String]
        attr_accessor :property_id
      
        # Web property ID of the form UA-XXXXX-YY.
        # Corresponds to the JSON property `webPropertyId`
        # @return [String]
        attr_accessor :web_property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deletion_request_time = args[:deletion_request_time] if args.key?(:deletion_request_time)
          @firebase_project_id = args[:firebase_project_id] if args.key?(:firebase_project_id)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @property_id = args[:property_id] if args.key?(:property_id)
          @web_property_id = args[:web_property_id] if args.key?(:web_property_id)
        end
        
        # User ID.
        class Id
          include Google::Apis::Core::Hashable
        
          # Type of user
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          # The User's id
          # Corresponds to the JSON property `userId`
          # @return [String]
          attr_accessor :user_id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @type = args[:type] if args.key?(:type)
            @user_id = args[:user_id] if args.key?(:user_id)
          end
        end
      end
      
      # JSON template for a user reference.
      class UserRef
        include Google::Apis::Core::Hashable
      
        # Email ID of this user.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # User ID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # 
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @email = args[:email] if args.key?(:email)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # JSON template for a web property reference.
      class WebPropertyRef
        include Google::Apis::Core::Hashable
      
        # Account ID to which this web property belongs.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Link for this web property.
        # Corresponds to the JSON property `href`
        # @return [String]
        attr_accessor :href
      
        # Web property ID of the form UA-XXXXX-YY.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Internal ID for this web property.
        # Corresponds to the JSON property `internalWebPropertyId`
        # @return [String]
        attr_accessor :internal_web_property_id
      
        # Analytics web property reference.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this web property.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @href = args[:href] if args.key?(:href)
          @id = args[:id] if args.key?(:id)
          @internal_web_property_id = args[:internal_web_property_id] if args.key?(:internal_web_property_id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # JSON template for an Analytics WebPropertySummary. WebPropertySummary returns
      # basic information (i.e., summary) for a web property.
      class WebPropertySummary
        include Google::Apis::Core::Hashable
      
        # Web property ID of the form UA-XXXXX-YY.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Internal ID for this web property.
        # Corresponds to the JSON property `internalWebPropertyId`
        # @return [String]
        attr_accessor :internal_web_property_id
      
        # Resource type for Analytics WebPropertySummary.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Level for this web property. Possible values are STANDARD or PREMIUM.
        # Corresponds to the JSON property `level`
        # @return [String]
        attr_accessor :level
      
        # Web property name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # List of profiles under this web property.
        # Corresponds to the JSON property `profiles`
        # @return [Array<Google::Apis::AnalyticsV3::ProfileSummary>]
        attr_accessor :profiles
      
        # Indicates whether this web property is starred or not.
        # Corresponds to the JSON property `starred`
        # @return [Boolean]
        attr_accessor :starred
        alias_method :starred?, :starred
      
        # Website url for this web property.
        # Corresponds to the JSON property `websiteUrl`
        # @return [String]
        attr_accessor :website_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @internal_web_property_id = args[:internal_web_property_id] if args.key?(:internal_web_property_id)
          @kind = args[:kind] if args.key?(:kind)
          @level = args[:level] if args.key?(:level)
          @name = args[:name] if args.key?(:name)
          @profiles = args[:profiles] if args.key?(:profiles)
          @starred = args[:starred] if args.key?(:starred)
          @website_url = args[:website_url] if args.key?(:website_url)
        end
      end
      
      # A web property collection lists Analytics web properties to which the user has
      # access. Each resource in the collection corresponds to a single Analytics web
      # property.
      class Webproperties
        include Google::Apis::Core::Hashable
      
        # A list of web properties.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AnalyticsV3::Webproperty>]
        attr_accessor :items
      
        # The maximum number of resources the response can contain, regardless of the
        # actual number of resources returned. Its value ranges from 1 to 1000 with a
        # value of 1000 by default, or otherwise specified by the max-results query
        # parameter.
        # Corresponds to the JSON property `itemsPerPage`
        # @return [Fixnum]
        attr_accessor :items_per_page
      
        # Collection type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Link to next page for this web property collection.
        # Corresponds to the JSON property `nextLink`
        # @return [String]
        attr_accessor :next_link
      
        # Link to previous page for this web property collection.
        # Corresponds to the JSON property `previousLink`
        # @return [String]
        attr_accessor :previous_link
      
        # The starting index of the resources, which is 1 by default or otherwise
        # specified by the start-index query parameter.
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # The total number of results for the query, regardless of the number of results
        # in the response.
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        # Email ID of the authenticated user
        # Corresponds to the JSON property `username`
        # @return [String]
        attr_accessor :username
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @items_per_page = args[:items_per_page] if args.key?(:items_per_page)
          @kind = args[:kind] if args.key?(:kind)
          @next_link = args[:next_link] if args.key?(:next_link)
          @previous_link = args[:previous_link] if args.key?(:previous_link)
          @start_index = args[:start_index] if args.key?(:start_index)
          @total_results = args[:total_results] if args.key?(:total_results)
          @username = args[:username] if args.key?(:username)
        end
      end
      
      # JSON template for an Analytics web property.
      class Webproperty
        include Google::Apis::Core::Hashable
      
        # Account ID to which this web property belongs.
        # Corresponds to the JSON property `accountId`
        # @return [String]
        attr_accessor :account_id
      
        # Child link for this web property. Points to the list of views (profiles) for
        # this web property.
        # Corresponds to the JSON property `childLink`
        # @return [Google::Apis::AnalyticsV3::Webproperty::ChildLink]
        attr_accessor :child_link
      
        # Time this web property was created.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # Set to true to reset the retention period of the user identifier with each new
        # event from that user (thus setting the expiration date to current time plus
        # retention period).
        # Set to false to delete data associated with the user identifier automatically
        # after the rentention period.
        # This property cannot be set on insert.
        # Corresponds to the JSON property `dataRetentionResetOnNewActivity`
        # @return [Boolean]
        attr_accessor :data_retention_reset_on_new_activity
        alias_method :data_retention_reset_on_new_activity?, :data_retention_reset_on_new_activity
      
        # The length of time for which user and event data is retained.
        # This property cannot be set on insert.
        # Corresponds to the JSON property `dataRetentionTtl`
        # @return [String]
        attr_accessor :data_retention_ttl
      
        # Default view (profile) ID.
        # Corresponds to the JSON property `defaultProfileId`
        # @return [Fixnum]
        attr_accessor :default_profile_id
      
        # Web property ID of the form UA-XXXXX-YY.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The industry vertical/category selected for this web property.
        # Corresponds to the JSON property `industryVertical`
        # @return [String]
        attr_accessor :industry_vertical
      
        # Internal ID for this web property.
        # Corresponds to the JSON property `internalWebPropertyId`
        # @return [String]
        attr_accessor :internal_web_property_id
      
        # Resource type for Analytics WebProperty.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Level for this web property. Possible values are STANDARD or PREMIUM.
        # Corresponds to the JSON property `level`
        # @return [String]
        attr_accessor :level
      
        # Name of this web property.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Parent link for this web property. Points to the account to which this web
        # property belongs.
        # Corresponds to the JSON property `parentLink`
        # @return [Google::Apis::AnalyticsV3::Webproperty::ParentLink]
        attr_accessor :parent_link
      
        # Permissions the user has for this web property.
        # Corresponds to the JSON property `permissions`
        # @return [Google::Apis::AnalyticsV3::Webproperty::Permissions]
        attr_accessor :permissions
      
        # View (Profile) count for this web property.
        # Corresponds to the JSON property `profileCount`
        # @return [Fixnum]
        attr_accessor :profile_count
      
        # Link for this web property.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Indicates whether this web property is starred or not.
        # Corresponds to the JSON property `starred`
        # @return [Boolean]
        attr_accessor :starred
        alias_method :starred?, :starred
      
        # Time this web property was last modified.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # Website url for this web property.
        # Corresponds to the JSON property `websiteUrl`
        # @return [String]
        attr_accessor :website_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @child_link = args[:child_link] if args.key?(:child_link)
          @created = args[:created] if args.key?(:created)
          @data_retention_reset_on_new_activity = args[:data_retention_reset_on_new_activity] if args.key?(:data_retention_reset_on_new_activity)
          @data_retention_ttl = args[:data_retention_ttl] if args.key?(:data_retention_ttl)
          @default_profile_id = args[:default_profile_id] if args.key?(:default_profile_id)
          @id = args[:id] if args.key?(:id)
          @industry_vertical = args[:industry_vertical] if args.key?(:industry_vertical)
          @internal_web_property_id = args[:internal_web_property_id] if args.key?(:internal_web_property_id)
          @kind = args[:kind] if args.key?(:kind)
          @level = args[:level] if args.key?(:level)
          @name = args[:name] if args.key?(:name)
          @parent_link = args[:parent_link] if args.key?(:parent_link)
          @permissions = args[:permissions] if args.key?(:permissions)
          @profile_count = args[:profile_count] if args.key?(:profile_count)
          @self_link = args[:self_link] if args.key?(:self_link)
          @starred = args[:starred] if args.key?(:starred)
          @updated = args[:updated] if args.key?(:updated)
          @website_url = args[:website_url] if args.key?(:website_url)
        end
        
        # Child link for this web property. Points to the list of views (profiles) for
        # this web property.
        class ChildLink
          include Google::Apis::Core::Hashable
        
          # Link to the list of views (profiles) for this web property.
          # Corresponds to the JSON property `href`
          # @return [String]
          attr_accessor :href
        
          # Type of the parent link. Its value is "analytics#profiles".
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @href = args[:href] if args.key?(:href)
            @type = args[:type] if args.key?(:type)
          end
        end
        
        # Parent link for this web property. Points to the account to which this web
        # property belongs.
        class ParentLink
          include Google::Apis::Core::Hashable
        
          # Link to the account for this web property.
          # Corresponds to the JSON property `href`
          # @return [String]
          attr_accessor :href
        
          # Type of the parent link. Its value is "analytics#account".
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @href = args[:href] if args.key?(:href)
            @type = args[:type] if args.key?(:type)
          end
        end
        
        # Permissions the user has for this web property.
        class Permissions
          include Google::Apis::Core::Hashable
        
          # All the permissions that the user has for this web property. These include any
          # implied permissions (e.g., EDIT implies VIEW) or inherited permissions from
          # the parent account.
          # Corresponds to the JSON property `effective`
          # @return [Array<String>]
          attr_accessor :effective
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @effective = args[:effective] if args.key?(:effective)
          end
        end
      end
    end
  end
end
