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
      
      class Account
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ChildLink
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Permissions
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountRef
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountSummaries
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountTicket
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountTreeRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountTreeResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Accounts
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdWordsAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteUploadDataRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Column
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Columns
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomDataSource
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ChildLink
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ParentLink
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomDataSources
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomDimension
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ParentLink
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomDimensions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomMetric
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ParentLink
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomMetrics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EntityAdWordsLink
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Entity
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EntityAdWordsLinks
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EntityUserLink
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Entity
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Permissions
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EntityUserLinks
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Experiment
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ParentLink
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Variation
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Experiments
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Filter
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class AdvancedDetails
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class LowercaseDetails
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ParentLink
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class SearchAndReplaceDetails
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class UppercaseDetails
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FilterExpression
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FilterRef
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Filters
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GaData
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ColumnHeader
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class DataTable
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Col
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Row
            class Representation < Google::Apis::Core::JsonRepresentation; end
            
            class C
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ProfileInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Query
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Goal
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class EventDetails
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class EventCondition
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ParentLink
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class UrlDestinationDetails
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Step
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class VisitNumPagesDetails
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class VisitTimeOnSiteDetails
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Goals
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HashClientIdRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HashClientIdResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IncludeConditions
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LinkedForeignAccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class McfData
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ColumnHeader
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ProfileInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Query
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Row
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class ConversionPathValue
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Profile
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ChildLink
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ParentLink
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Permissions
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProfileFilterLink
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProfileFilterLinks
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProfileRef
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProfileSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Profiles
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RealtimeData
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ColumnHeader
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ProfileInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Query
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RemarketingAudience
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class AudienceDefinition
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class StateBasedAudienceDefinition
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class ExcludeConditions
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RemarketingAudiences
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Segment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Segments
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnsampledReport
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class CloudStorageDownloadDetails
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class DriveDownloadDetails
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UnsampledReports
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Upload
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Uploads
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserDeletionRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Id
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserRef
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebPropertyRef
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebPropertySummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Webproperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Webproperty
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ChildLink
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ParentLink
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Permissions
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Account
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :child_link, as: 'childLink', class: Google::Apis::AnalyticsV3::Account::ChildLink, decorator: Google::Apis::AnalyticsV3::Account::ChildLink::Representation
      
          property :created, as: 'created', type: DateTime
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :permissions, as: 'permissions', class: Google::Apis::AnalyticsV3::Account::Permissions, decorator: Google::Apis::AnalyticsV3::Account::Permissions::Representation
      
          property :self_link, as: 'selfLink'
          property :starred, as: 'starred'
          property :updated, as: 'updated', type: DateTime
      
        end
        
        class ChildLink
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :href, as: 'href'
            property :type, as: 'type'
          end
        end
        
        class Permissions
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :effective, as: 'effective'
          end
        end
      end
      
      class AccountRef
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :href, as: 'href'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class AccountSummaries
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::AccountSummary, decorator: Google::Apis::AnalyticsV3::AccountSummary::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class AccountSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :starred, as: 'starred'
          collection :web_properties, as: 'webProperties', class: Google::Apis::AnalyticsV3::WebPropertySummary, decorator: Google::Apis::AnalyticsV3::WebPropertySummary::Representation
      
        end
      end
      
      class AccountTicket
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account, as: 'account', class: Google::Apis::AnalyticsV3::Account, decorator: Google::Apis::AnalyticsV3::Account::Representation
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :profile, as: 'profile', class: Google::Apis::AnalyticsV3::Profile, decorator: Google::Apis::AnalyticsV3::Profile::Representation
      
          property :redirect_uri, as: 'redirectUri'
          property :webproperty, as: 'webproperty', class: Google::Apis::AnalyticsV3::Webproperty, decorator: Google::Apis::AnalyticsV3::Webproperty::Representation
      
        end
      end
      
      class AccountTreeRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_name, as: 'accountName'
          property :kind, as: 'kind'
          property :profile_name, as: 'profileName'
          property :timezone, as: 'timezone'
          property :webproperty_name, as: 'webpropertyName'
          property :website_url, as: 'websiteUrl'
        end
      end
      
      class AccountTreeResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account, as: 'account', class: Google::Apis::AnalyticsV3::Account, decorator: Google::Apis::AnalyticsV3::Account::Representation
      
          property :kind, as: 'kind'
          property :profile, as: 'profile', class: Google::Apis::AnalyticsV3::Profile, decorator: Google::Apis::AnalyticsV3::Profile::Representation
      
          property :webproperty, as: 'webproperty', class: Google::Apis::AnalyticsV3::Webproperty, decorator: Google::Apis::AnalyticsV3::Webproperty::Representation
      
        end
      end
      
      class Accounts
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::Account, decorator: Google::Apis::AnalyticsV3::Account::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class AdWordsAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_tagging_enabled, as: 'autoTaggingEnabled'
          property :customer_id, as: 'customerId'
          property :kind, as: 'kind'
        end
      end
      
      class DeleteUploadDataRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :custom_data_import_uids, as: 'customDataImportUids'
        end
      end
      
      class Column
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :attributes, as: 'attributes'
          property :id, as: 'id'
          property :kind, as: 'kind'
        end
      end
      
      class Columns
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :attribute_names, as: 'attributeNames'
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::Column, decorator: Google::Apis::AnalyticsV3::Column::Representation
      
          property :kind, as: 'kind'
          property :total_results, as: 'totalResults'
        end
      end
      
      class CustomDataSource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :child_link, as: 'childLink', class: Google::Apis::AnalyticsV3::CustomDataSource::ChildLink, decorator: Google::Apis::AnalyticsV3::CustomDataSource::ChildLink::Representation
      
          property :created, as: 'created', type: DateTime
      
          property :description, as: 'description'
          property :id, as: 'id'
          property :import_behavior, as: 'importBehavior'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :parent_link, as: 'parentLink', class: Google::Apis::AnalyticsV3::CustomDataSource::ParentLink, decorator: Google::Apis::AnalyticsV3::CustomDataSource::ParentLink::Representation
      
          collection :profiles_linked, as: 'profilesLinked'
          collection :schema, as: 'schema'
          property :self_link, as: 'selfLink'
          property :type, as: 'type'
          property :updated, as: 'updated', type: DateTime
      
          property :upload_type, as: 'uploadType'
          property :web_property_id, as: 'webPropertyId'
        end
        
        class ChildLink
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :href, as: 'href'
            property :type, as: 'type'
          end
        end
        
        class ParentLink
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :href, as: 'href'
            property :type, as: 'type'
          end
        end
      end
      
      class CustomDataSources
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::CustomDataSource, decorator: Google::Apis::AnalyticsV3::CustomDataSource::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class CustomDimension
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :active, as: 'active'
          property :created, as: 'created', type: DateTime
      
          property :id, as: 'id'
          property :index, as: 'index'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :parent_link, as: 'parentLink', class: Google::Apis::AnalyticsV3::CustomDimension::ParentLink, decorator: Google::Apis::AnalyticsV3::CustomDimension::ParentLink::Representation
      
          property :scope, as: 'scope'
          property :self_link, as: 'selfLink'
          property :updated, as: 'updated', type: DateTime
      
          property :web_property_id, as: 'webPropertyId'
        end
        
        class ParentLink
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :href, as: 'href'
            property :type, as: 'type'
          end
        end
      end
      
      class CustomDimensions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::CustomDimension, decorator: Google::Apis::AnalyticsV3::CustomDimension::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class CustomMetric
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :active, as: 'active'
          property :created, as: 'created', type: DateTime
      
          property :id, as: 'id'
          property :index, as: 'index'
          property :kind, as: 'kind'
          property :max_value, as: 'max_value'
          property :min_value, as: 'min_value'
          property :name, as: 'name'
          property :parent_link, as: 'parentLink', class: Google::Apis::AnalyticsV3::CustomMetric::ParentLink, decorator: Google::Apis::AnalyticsV3::CustomMetric::ParentLink::Representation
      
          property :scope, as: 'scope'
          property :self_link, as: 'selfLink'
          property :type, as: 'type'
          property :updated, as: 'updated', type: DateTime
      
          property :web_property_id, as: 'webPropertyId'
        end
        
        class ParentLink
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :href, as: 'href'
            property :type, as: 'type'
          end
        end
      end
      
      class CustomMetrics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::CustomMetric, decorator: Google::Apis::AnalyticsV3::CustomMetric::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class EntityAdWordsLink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ad_words_accounts, as: 'adWordsAccounts', class: Google::Apis::AnalyticsV3::AdWordsAccount, decorator: Google::Apis::AnalyticsV3::AdWordsAccount::Representation
      
          property :entity, as: 'entity', class: Google::Apis::AnalyticsV3::EntityAdWordsLink::Entity, decorator: Google::Apis::AnalyticsV3::EntityAdWordsLink::Entity::Representation
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :profile_ids, as: 'profileIds'
          property :self_link, as: 'selfLink'
        end
        
        class Entity
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :web_property_ref, as: 'webPropertyRef', class: Google::Apis::AnalyticsV3::WebPropertyRef, decorator: Google::Apis::AnalyticsV3::WebPropertyRef::Representation
        
          end
        end
      end
      
      class EntityAdWordsLinks
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::EntityAdWordsLink, decorator: Google::Apis::AnalyticsV3::EntityAdWordsLink::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
        end
      end
      
      class EntityUserLink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :entity, as: 'entity', class: Google::Apis::AnalyticsV3::EntityUserLink::Entity, decorator: Google::Apis::AnalyticsV3::EntityUserLink::Entity::Representation
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :permissions, as: 'permissions', class: Google::Apis::AnalyticsV3::EntityUserLink::Permissions, decorator: Google::Apis::AnalyticsV3::EntityUserLink::Permissions::Representation
      
          property :self_link, as: 'selfLink'
          property :user_ref, as: 'userRef', class: Google::Apis::AnalyticsV3::UserRef, decorator: Google::Apis::AnalyticsV3::UserRef::Representation
      
        end
        
        class Entity
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :account_ref, as: 'accountRef', class: Google::Apis::AnalyticsV3::AccountRef, decorator: Google::Apis::AnalyticsV3::AccountRef::Representation
        
            property :profile_ref, as: 'profileRef', class: Google::Apis::AnalyticsV3::ProfileRef, decorator: Google::Apis::AnalyticsV3::ProfileRef::Representation
        
            property :web_property_ref, as: 'webPropertyRef', class: Google::Apis::AnalyticsV3::WebPropertyRef, decorator: Google::Apis::AnalyticsV3::WebPropertyRef::Representation
        
          end
        end
        
        class Permissions
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :effective, as: 'effective'
            collection :local, as: 'local'
          end
        end
      end
      
      class EntityUserLinks
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::EntityUserLink, decorator: Google::Apis::AnalyticsV3::EntityUserLink::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
        end
      end
      
      class Experiment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :created, as: 'created', type: DateTime
      
          property :description, as: 'description'
          property :editable_in_ga_ui, as: 'editableInGaUi'
          property :end_time, as: 'endTime', type: DateTime
      
          property :equal_weighting, as: 'equalWeighting'
          property :id, as: 'id'
          property :internal_web_property_id, as: 'internalWebPropertyId'
          property :kind, as: 'kind'
          property :minimum_experiment_length_in_days, as: 'minimumExperimentLengthInDays'
          property :name, as: 'name'
          property :objective_metric, as: 'objectiveMetric'
          property :optimization_type, as: 'optimizationType'
          property :parent_link, as: 'parentLink', class: Google::Apis::AnalyticsV3::Experiment::ParentLink, decorator: Google::Apis::AnalyticsV3::Experiment::ParentLink::Representation
      
          property :profile_id, as: 'profileId'
          property :reason_experiment_ended, as: 'reasonExperimentEnded'
          property :rewrite_variation_urls_as_original, as: 'rewriteVariationUrlsAsOriginal'
          property :self_link, as: 'selfLink'
          property :serving_framework, as: 'servingFramework'
          property :snippet, as: 'snippet'
          property :start_time, as: 'startTime', type: DateTime
      
          property :status, as: 'status'
          property :traffic_coverage, as: 'trafficCoverage'
          property :updated, as: 'updated', type: DateTime
      
          collection :variations, as: 'variations', class: Google::Apis::AnalyticsV3::Experiment::Variation, decorator: Google::Apis::AnalyticsV3::Experiment::Variation::Representation
      
          property :web_property_id, as: 'webPropertyId'
          property :winner_confidence_level, as: 'winnerConfidenceLevel'
          property :winner_found, as: 'winnerFound'
        end
        
        class ParentLink
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :href, as: 'href'
            property :type, as: 'type'
          end
        end
        
        class Variation
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :name, as: 'name'
            property :status, as: 'status'
            property :url, as: 'url'
            property :weight, as: 'weight'
            property :won, as: 'won'
          end
        end
      end
      
      class Experiments
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::Experiment, decorator: Google::Apis::AnalyticsV3::Experiment::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class Filter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :advanced_details, as: 'advancedDetails', class: Google::Apis::AnalyticsV3::Filter::AdvancedDetails, decorator: Google::Apis::AnalyticsV3::Filter::AdvancedDetails::Representation
      
          property :created, as: 'created', type: DateTime
      
          property :exclude_details, as: 'excludeDetails', class: Google::Apis::AnalyticsV3::FilterExpression, decorator: Google::Apis::AnalyticsV3::FilterExpression::Representation
      
          property :id, as: 'id'
          property :include_details, as: 'includeDetails', class: Google::Apis::AnalyticsV3::FilterExpression, decorator: Google::Apis::AnalyticsV3::FilterExpression::Representation
      
          property :kind, as: 'kind'
          property :lowercase_details, as: 'lowercaseDetails', class: Google::Apis::AnalyticsV3::Filter::LowercaseDetails, decorator: Google::Apis::AnalyticsV3::Filter::LowercaseDetails::Representation
      
          property :name, as: 'name'
          property :parent_link, as: 'parentLink', class: Google::Apis::AnalyticsV3::Filter::ParentLink, decorator: Google::Apis::AnalyticsV3::Filter::ParentLink::Representation
      
          property :search_and_replace_details, as: 'searchAndReplaceDetails', class: Google::Apis::AnalyticsV3::Filter::SearchAndReplaceDetails, decorator: Google::Apis::AnalyticsV3::Filter::SearchAndReplaceDetails::Representation
      
          property :self_link, as: 'selfLink'
          property :type, as: 'type'
          property :updated, as: 'updated', type: DateTime
      
          property :uppercase_details, as: 'uppercaseDetails', class: Google::Apis::AnalyticsV3::Filter::UppercaseDetails, decorator: Google::Apis::AnalyticsV3::Filter::UppercaseDetails::Representation
      
        end
        
        class AdvancedDetails
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :case_sensitive, as: 'caseSensitive'
            property :extract_a, as: 'extractA'
            property :extract_b, as: 'extractB'
            property :field_a, as: 'fieldA'
            property :field_a_index, as: 'fieldAIndex'
            property :field_a_required, as: 'fieldARequired'
            property :field_b, as: 'fieldB'
            property :field_b_index, as: 'fieldBIndex'
            property :field_b_required, as: 'fieldBRequired'
            property :output_constructor, as: 'outputConstructor'
            property :output_to_field, as: 'outputToField'
            property :output_to_field_index, as: 'outputToFieldIndex'
            property :override_output_field, as: 'overrideOutputField'
          end
        end
        
        class LowercaseDetails
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :field, as: 'field'
            property :field_index, as: 'fieldIndex'
          end
        end
        
        class ParentLink
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :href, as: 'href'
            property :type, as: 'type'
          end
        end
        
        class SearchAndReplaceDetails
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :case_sensitive, as: 'caseSensitive'
            property :field, as: 'field'
            property :field_index, as: 'fieldIndex'
            property :replace_string, as: 'replaceString'
            property :search_string, as: 'searchString'
          end
        end
        
        class UppercaseDetails
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :field, as: 'field'
            property :field_index, as: 'fieldIndex'
          end
        end
      end
      
      class FilterExpression
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :case_sensitive, as: 'caseSensitive'
          property :expression_value, as: 'expressionValue'
          property :field, as: 'field'
          property :field_index, as: 'fieldIndex'
          property :kind, as: 'kind'
          property :match_type, as: 'matchType'
        end
      end
      
      class FilterRef
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :href, as: 'href'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class Filters
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::Filter, decorator: Google::Apis::AnalyticsV3::Filter::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class GaData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :column_headers, as: 'columnHeaders', class: Google::Apis::AnalyticsV3::GaData::ColumnHeader, decorator: Google::Apis::AnalyticsV3::GaData::ColumnHeader::Representation
      
          property :contains_sampled_data, as: 'containsSampledData'
          property :data_last_refreshed, :numeric_string => true, as: 'dataLastRefreshed'
          property :data_table, as: 'dataTable', class: Google::Apis::AnalyticsV3::GaData::DataTable, decorator: Google::Apis::AnalyticsV3::GaData::DataTable::Representation
      
          property :id, as: 'id'
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :profile_info, as: 'profileInfo', class: Google::Apis::AnalyticsV3::GaData::ProfileInfo, decorator: Google::Apis::AnalyticsV3::GaData::ProfileInfo::Representation
      
          property :query, as: 'query', class: Google::Apis::AnalyticsV3::GaData::Query, decorator: Google::Apis::AnalyticsV3::GaData::Query::Representation
      
          collection :rows, as: 'rows', :class => Array do
        include Representable::JSON::Collection
        items
      end
      
          property :sample_size, :numeric_string => true, as: 'sampleSize'
          property :sample_space, :numeric_string => true, as: 'sampleSpace'
          property :self_link, as: 'selfLink'
          property :total_results, as: 'totalResults'
          hash :totals_for_all_results, as: 'totalsForAllResults'
        end
        
        class ColumnHeader
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :column_type, as: 'columnType'
            property :data_type, as: 'dataType'
            property :name, as: 'name'
          end
        end
        
        class DataTable
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :cols, as: 'cols', class: Google::Apis::AnalyticsV3::GaData::DataTable::Col, decorator: Google::Apis::AnalyticsV3::GaData::DataTable::Col::Representation
        
            collection :rows, as: 'rows', class: Google::Apis::AnalyticsV3::GaData::DataTable::Row, decorator: Google::Apis::AnalyticsV3::GaData::DataTable::Row::Representation
        
          end
          
          class Col
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :id, as: 'id'
              property :label, as: 'label'
              property :type, as: 'type'
            end
          end
          
          class Row
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              collection :c, as: 'c', class: Google::Apis::AnalyticsV3::GaData::DataTable::Row::C, decorator: Google::Apis::AnalyticsV3::GaData::DataTable::Row::C::Representation
          
            end
            
            class C
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :v, as: 'v'
              end
            end
          end
        end
        
        class ProfileInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :account_id, as: 'accountId'
            property :internal_web_property_id, as: 'internalWebPropertyId'
            property :profile_id, as: 'profileId'
            property :profile_name, as: 'profileName'
            property :table_id, as: 'tableId'
            property :web_property_id, as: 'webPropertyId'
          end
        end
        
        class Query
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :dimensions, as: 'dimensions'
            property :end_date, as: 'end-date'
            property :filters, as: 'filters'
            property :ids, as: 'ids'
            property :max_results, as: 'max-results'
            collection :metrics, as: 'metrics'
            property :sampling_level, as: 'samplingLevel'
            property :segment, as: 'segment'
            collection :sort, as: 'sort'
            property :start_date, as: 'start-date'
            property :start_index, as: 'start-index'
          end
        end
      end
      
      class Goal
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :active, as: 'active'
          property :created, as: 'created', type: DateTime
      
          property :event_details, as: 'eventDetails', class: Google::Apis::AnalyticsV3::Goal::EventDetails, decorator: Google::Apis::AnalyticsV3::Goal::EventDetails::Representation
      
          property :id, as: 'id'
          property :internal_web_property_id, as: 'internalWebPropertyId'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :parent_link, as: 'parentLink', class: Google::Apis::AnalyticsV3::Goal::ParentLink, decorator: Google::Apis::AnalyticsV3::Goal::ParentLink::Representation
      
          property :profile_id, as: 'profileId'
          property :self_link, as: 'selfLink'
          property :type, as: 'type'
          property :updated, as: 'updated', type: DateTime
      
          property :url_destination_details, as: 'urlDestinationDetails', class: Google::Apis::AnalyticsV3::Goal::UrlDestinationDetails, decorator: Google::Apis::AnalyticsV3::Goal::UrlDestinationDetails::Representation
      
          property :value, as: 'value'
          property :visit_num_pages_details, as: 'visitNumPagesDetails', class: Google::Apis::AnalyticsV3::Goal::VisitNumPagesDetails, decorator: Google::Apis::AnalyticsV3::Goal::VisitNumPagesDetails::Representation
      
          property :visit_time_on_site_details, as: 'visitTimeOnSiteDetails', class: Google::Apis::AnalyticsV3::Goal::VisitTimeOnSiteDetails, decorator: Google::Apis::AnalyticsV3::Goal::VisitTimeOnSiteDetails::Representation
      
          property :web_property_id, as: 'webPropertyId'
        end
        
        class EventDetails
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :event_conditions, as: 'eventConditions', class: Google::Apis::AnalyticsV3::Goal::EventDetails::EventCondition, decorator: Google::Apis::AnalyticsV3::Goal::EventDetails::EventCondition::Representation
        
            property :use_event_value, as: 'useEventValue'
          end
          
          class EventCondition
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :comparison_type, as: 'comparisonType'
              property :comparison_value, :numeric_string => true, as: 'comparisonValue'
              property :expression, as: 'expression'
              property :match_type, as: 'matchType'
              property :type, as: 'type'
            end
          end
        end
        
        class ParentLink
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :href, as: 'href'
            property :type, as: 'type'
          end
        end
        
        class UrlDestinationDetails
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :case_sensitive, as: 'caseSensitive'
            property :first_step_required, as: 'firstStepRequired'
            property :match_type, as: 'matchType'
            collection :steps, as: 'steps', class: Google::Apis::AnalyticsV3::Goal::UrlDestinationDetails::Step, decorator: Google::Apis::AnalyticsV3::Goal::UrlDestinationDetails::Step::Representation
        
            property :url, as: 'url'
          end
          
          class Step
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :name, as: 'name'
              property :number, as: 'number'
              property :url, as: 'url'
            end
          end
        end
        
        class VisitNumPagesDetails
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :comparison_type, as: 'comparisonType'
            property :comparison_value, :numeric_string => true, as: 'comparisonValue'
          end
        end
        
        class VisitTimeOnSiteDetails
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :comparison_type, as: 'comparisonType'
            property :comparison_value, :numeric_string => true, as: 'comparisonValue'
          end
        end
      end
      
      class Goals
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::Goal, decorator: Google::Apis::AnalyticsV3::Goal::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class HashClientIdRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_id, as: 'clientId'
          property :kind, as: 'kind'
          property :web_property_id, as: 'webPropertyId'
        end
      end
      
      class HashClientIdResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_id, as: 'clientId'
          property :hashed_client_id, as: 'hashedClientId'
          property :kind, as: 'kind'
          property :web_property_id, as: 'webPropertyId'
        end
      end
      
      class IncludeConditions
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :days_to_look_back, as: 'daysToLookBack'
          property :is_smart_list, as: 'isSmartList'
          property :kind, as: 'kind'
          property :membership_duration_days, as: 'membershipDurationDays'
          property :segment, as: 'segment'
        end
      end
      
      class LinkedForeignAccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :eligible_for_search, as: 'eligibleForSearch'
          property :id, as: 'id'
          property :internal_web_property_id, as: 'internalWebPropertyId'
          property :kind, as: 'kind'
          property :linked_account_id, as: 'linkedAccountId'
          property :remarketing_audience_id, as: 'remarketingAudienceId'
          property :status, as: 'status'
          property :type, as: 'type'
          property :web_property_id, as: 'webPropertyId'
        end
      end
      
      class McfData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :column_headers, as: 'columnHeaders', class: Google::Apis::AnalyticsV3::McfData::ColumnHeader, decorator: Google::Apis::AnalyticsV3::McfData::ColumnHeader::Representation
      
          property :contains_sampled_data, as: 'containsSampledData'
          property :id, as: 'id'
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :profile_info, as: 'profileInfo', class: Google::Apis::AnalyticsV3::McfData::ProfileInfo, decorator: Google::Apis::AnalyticsV3::McfData::ProfileInfo::Representation
      
          property :query, as: 'query', class: Google::Apis::AnalyticsV3::McfData::Query, decorator: Google::Apis::AnalyticsV3::McfData::Query::Representation
      
          collection :rows, as: 'rows', :class => Array do
        include Representable::JSON::Collection
        items class: Google::Apis::AnalyticsV3::McfData::Row, decorator: Google::Apis::AnalyticsV3::McfData::Row::Representation
      
      end
      
          property :sample_size, :numeric_string => true, as: 'sampleSize'
          property :sample_space, :numeric_string => true, as: 'sampleSpace'
          property :self_link, as: 'selfLink'
          property :total_results, as: 'totalResults'
          hash :totals_for_all_results, as: 'totalsForAllResults'
        end
        
        class ColumnHeader
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :column_type, as: 'columnType'
            property :data_type, as: 'dataType'
            property :name, as: 'name'
          end
        end
        
        class ProfileInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :account_id, as: 'accountId'
            property :internal_web_property_id, as: 'internalWebPropertyId'
            property :profile_id, as: 'profileId'
            property :profile_name, as: 'profileName'
            property :table_id, as: 'tableId'
            property :web_property_id, as: 'webPropertyId'
          end
        end
        
        class Query
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :dimensions, as: 'dimensions'
            property :end_date, as: 'end-date'
            property :filters, as: 'filters'
            property :ids, as: 'ids'
            property :max_results, as: 'max-results'
            collection :metrics, as: 'metrics'
            property :sampling_level, as: 'samplingLevel'
            property :segment, as: 'segment'
            collection :sort, as: 'sort'
            property :start_date, as: 'start-date'
            property :start_index, as: 'start-index'
          end
        end
        
        class Row
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :conversion_path_value, as: 'conversionPathValue', class: Google::Apis::AnalyticsV3::McfData::Row::ConversionPathValue, decorator: Google::Apis::AnalyticsV3::McfData::Row::ConversionPathValue::Representation
        
            property :primitive_value, as: 'primitiveValue'
          end
          
          class ConversionPathValue
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :interaction_type, as: 'interactionType'
              property :node_value, as: 'nodeValue'
            end
          end
        end
      end
      
      class Profile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :bot_filtering_enabled, as: 'botFilteringEnabled'
          property :child_link, as: 'childLink', class: Google::Apis::AnalyticsV3::Profile::ChildLink, decorator: Google::Apis::AnalyticsV3::Profile::ChildLink::Representation
      
          property :created, as: 'created', type: DateTime
      
          property :currency, as: 'currency'
          property :default_page, as: 'defaultPage'
          property :e_commerce_tracking, as: 'eCommerceTracking'
          property :enhanced_e_commerce_tracking, as: 'enhancedECommerceTracking'
          property :exclude_query_parameters, as: 'excludeQueryParameters'
          property :id, as: 'id'
          property :internal_web_property_id, as: 'internalWebPropertyId'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :parent_link, as: 'parentLink', class: Google::Apis::AnalyticsV3::Profile::ParentLink, decorator: Google::Apis::AnalyticsV3::Profile::ParentLink::Representation
      
          property :permissions, as: 'permissions', class: Google::Apis::AnalyticsV3::Profile::Permissions, decorator: Google::Apis::AnalyticsV3::Profile::Permissions::Representation
      
          property :self_link, as: 'selfLink'
          property :site_search_category_parameters, as: 'siteSearchCategoryParameters'
          property :site_search_query_parameters, as: 'siteSearchQueryParameters'
          property :starred, as: 'starred'
          property :strip_site_search_category_parameters, as: 'stripSiteSearchCategoryParameters'
          property :strip_site_search_query_parameters, as: 'stripSiteSearchQueryParameters'
          property :timezone, as: 'timezone'
          property :type, as: 'type'
          property :updated, as: 'updated', type: DateTime
      
          property :web_property_id, as: 'webPropertyId'
          property :website_url, as: 'websiteUrl'
        end
        
        class ChildLink
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :href, as: 'href'
            property :type, as: 'type'
          end
        end
        
        class ParentLink
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :href, as: 'href'
            property :type, as: 'type'
          end
        end
        
        class Permissions
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :effective, as: 'effective'
          end
        end
      end
      
      class ProfileFilterLink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :filter_ref, as: 'filterRef', class: Google::Apis::AnalyticsV3::FilterRef, decorator: Google::Apis::AnalyticsV3::FilterRef::Representation
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :profile_ref, as: 'profileRef', class: Google::Apis::AnalyticsV3::ProfileRef, decorator: Google::Apis::AnalyticsV3::ProfileRef::Representation
      
          property :rank, as: 'rank'
          property :self_link, as: 'selfLink'
        end
      end
      
      class ProfileFilterLinks
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::ProfileFilterLink, decorator: Google::Apis::AnalyticsV3::ProfileFilterLink::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class ProfileRef
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :href, as: 'href'
          property :id, as: 'id'
          property :internal_web_property_id, as: 'internalWebPropertyId'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :web_property_id, as: 'webPropertyId'
        end
      end
      
      class ProfileSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :starred, as: 'starred'
          property :type, as: 'type'
        end
      end
      
      class Profiles
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::Profile, decorator: Google::Apis::AnalyticsV3::Profile::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class RealtimeData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :column_headers, as: 'columnHeaders', class: Google::Apis::AnalyticsV3::RealtimeData::ColumnHeader, decorator: Google::Apis::AnalyticsV3::RealtimeData::ColumnHeader::Representation
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :profile_info, as: 'profileInfo', class: Google::Apis::AnalyticsV3::RealtimeData::ProfileInfo, decorator: Google::Apis::AnalyticsV3::RealtimeData::ProfileInfo::Representation
      
          property :query, as: 'query', class: Google::Apis::AnalyticsV3::RealtimeData::Query, decorator: Google::Apis::AnalyticsV3::RealtimeData::Query::Representation
      
          collection :rows, as: 'rows', :class => Array do
        include Representable::JSON::Collection
        items
      end
      
          property :self_link, as: 'selfLink'
          property :total_results, as: 'totalResults'
          hash :totals_for_all_results, as: 'totalsForAllResults'
        end
        
        class ColumnHeader
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :column_type, as: 'columnType'
            property :data_type, as: 'dataType'
            property :name, as: 'name'
          end
        end
        
        class ProfileInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :account_id, as: 'accountId'
            property :internal_web_property_id, as: 'internalWebPropertyId'
            property :profile_id, as: 'profileId'
            property :profile_name, as: 'profileName'
            property :table_id, as: 'tableId'
            property :web_property_id, as: 'webPropertyId'
          end
        end
        
        class Query
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :dimensions, as: 'dimensions'
            property :filters, as: 'filters'
            property :ids, as: 'ids'
            property :max_results, as: 'max-results'
            collection :metrics, as: 'metrics'
            collection :sort, as: 'sort'
          end
        end
      end
      
      class RemarketingAudience
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :audience_definition, as: 'audienceDefinition', class: Google::Apis::AnalyticsV3::RemarketingAudience::AudienceDefinition, decorator: Google::Apis::AnalyticsV3::RemarketingAudience::AudienceDefinition::Representation
      
          property :audience_type, as: 'audienceType'
          property :created, as: 'created', type: DateTime
      
          property :description, as: 'description'
          property :id, as: 'id'
          property :internal_web_property_id, as: 'internalWebPropertyId'
          property :kind, as: 'kind'
          collection :linked_ad_accounts, as: 'linkedAdAccounts', class: Google::Apis::AnalyticsV3::LinkedForeignAccount, decorator: Google::Apis::AnalyticsV3::LinkedForeignAccount::Representation
      
          collection :linked_views, as: 'linkedViews'
          property :name, as: 'name'
          property :state_based_audience_definition, as: 'stateBasedAudienceDefinition', class: Google::Apis::AnalyticsV3::RemarketingAudience::StateBasedAudienceDefinition, decorator: Google::Apis::AnalyticsV3::RemarketingAudience::StateBasedAudienceDefinition::Representation
      
          property :updated, as: 'updated', type: DateTime
      
          property :web_property_id, as: 'webPropertyId'
        end
        
        class AudienceDefinition
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :include_conditions, as: 'includeConditions', class: Google::Apis::AnalyticsV3::IncludeConditions, decorator: Google::Apis::AnalyticsV3::IncludeConditions::Representation
        
          end
        end
        
        class StateBasedAudienceDefinition
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :exclude_conditions, as: 'excludeConditions', class: Google::Apis::AnalyticsV3::RemarketingAudience::StateBasedAudienceDefinition::ExcludeConditions, decorator: Google::Apis::AnalyticsV3::RemarketingAudience::StateBasedAudienceDefinition::ExcludeConditions::Representation
        
            property :include_conditions, as: 'includeConditions', class: Google::Apis::AnalyticsV3::IncludeConditions, decorator: Google::Apis::AnalyticsV3::IncludeConditions::Representation
        
          end
          
          class ExcludeConditions
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :exclusion_duration, as: 'exclusionDuration'
              property :segment, as: 'segment'
            end
          end
        end
      end
      
      class RemarketingAudiences
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::RemarketingAudience, decorator: Google::Apis::AnalyticsV3::RemarketingAudience::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class Segment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :created, as: 'created', type: DateTime
      
          property :definition, as: 'definition'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :segment_id, as: 'segmentId'
          property :self_link, as: 'selfLink'
          property :type, as: 'type'
          property :updated, as: 'updated', type: DateTime
      
        end
      end
      
      class Segments
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::Segment, decorator: Google::Apis::AnalyticsV3::Segment::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class UnsampledReport
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :cloud_storage_download_details, as: 'cloudStorageDownloadDetails', class: Google::Apis::AnalyticsV3::UnsampledReport::CloudStorageDownloadDetails, decorator: Google::Apis::AnalyticsV3::UnsampledReport::CloudStorageDownloadDetails::Representation
      
          property :created, as: 'created', type: DateTime
      
          property :dimensions, as: 'dimensions'
          property :download_type, as: 'downloadType'
          property :drive_download_details, as: 'driveDownloadDetails', class: Google::Apis::AnalyticsV3::UnsampledReport::DriveDownloadDetails, decorator: Google::Apis::AnalyticsV3::UnsampledReport::DriveDownloadDetails::Representation
      
          property :end_date, as: 'end-date'
          property :filters, as: 'filters'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :metrics, as: 'metrics'
          property :profile_id, as: 'profileId'
          property :segment, as: 'segment'
          property :self_link, as: 'selfLink'
          property :start_date, as: 'start-date'
          property :status, as: 'status'
          property :title, as: 'title'
          property :updated, as: 'updated', type: DateTime
      
          property :web_property_id, as: 'webPropertyId'
        end
        
        class CloudStorageDownloadDetails
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :bucket_id, as: 'bucketId'
            property :obj_id, as: 'objectId'
          end
        end
        
        class DriveDownloadDetails
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :document_id, as: 'documentId'
          end
        end
      end
      
      class UnsampledReports
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::UnsampledReport, decorator: Google::Apis::AnalyticsV3::UnsampledReport::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class Upload
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :custom_data_source_id, as: 'customDataSourceId'
          collection :errors, as: 'errors'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :status, as: 'status'
          property :upload_time, as: 'uploadTime', type: DateTime
      
        end
      end
      
      class Uploads
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::Upload, decorator: Google::Apis::AnalyticsV3::Upload::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
        end
      end
      
      class UserDeletionRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deletion_request_time, as: 'deletionRequestTime', type: DateTime
      
          property :firebase_project_id, as: 'firebaseProjectId'
          property :id, as: 'id', class: Google::Apis::AnalyticsV3::UserDeletionRequest::Id, decorator: Google::Apis::AnalyticsV3::UserDeletionRequest::Id::Representation
      
          property :kind, as: 'kind'
          property :property_id, as: 'propertyId'
          property :web_property_id, as: 'webPropertyId'
        end
        
        class Id
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :type, as: 'type'
            property :user_id, as: 'userId'
          end
        end
      end
      
      class UserRef
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :id, as: 'id'
          property :kind, as: 'kind'
        end
      end
      
      class WebPropertyRef
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :href, as: 'href'
          property :id, as: 'id'
          property :internal_web_property_id, as: 'internalWebPropertyId'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class WebPropertySummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :internal_web_property_id, as: 'internalWebPropertyId'
          property :kind, as: 'kind'
          property :level, as: 'level'
          property :name, as: 'name'
          collection :profiles, as: 'profiles', class: Google::Apis::AnalyticsV3::ProfileSummary, decorator: Google::Apis::AnalyticsV3::ProfileSummary::Representation
      
          property :starred, as: 'starred'
          property :website_url, as: 'websiteUrl'
        end
      end
      
      class Webproperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AnalyticsV3::Webproperty, decorator: Google::Apis::AnalyticsV3::Webproperty::Representation
      
          property :items_per_page, as: 'itemsPerPage'
          property :kind, as: 'kind'
          property :next_link, as: 'nextLink'
          property :previous_link, as: 'previousLink'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
          property :username, as: 'username'
        end
      end
      
      class Webproperty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :child_link, as: 'childLink', class: Google::Apis::AnalyticsV3::Webproperty::ChildLink, decorator: Google::Apis::AnalyticsV3::Webproperty::ChildLink::Representation
      
          property :created, as: 'created', type: DateTime
      
          property :data_retention_reset_on_new_activity, as: 'dataRetentionResetOnNewActivity'
          property :data_retention_ttl, as: 'dataRetentionTtl'
          property :default_profile_id, :numeric_string => true, as: 'defaultProfileId'
          property :id, as: 'id'
          property :industry_vertical, as: 'industryVertical'
          property :internal_web_property_id, as: 'internalWebPropertyId'
          property :kind, as: 'kind'
          property :level, as: 'level'
          property :name, as: 'name'
          property :parent_link, as: 'parentLink', class: Google::Apis::AnalyticsV3::Webproperty::ParentLink, decorator: Google::Apis::AnalyticsV3::Webproperty::ParentLink::Representation
      
          property :permissions, as: 'permissions', class: Google::Apis::AnalyticsV3::Webproperty::Permissions, decorator: Google::Apis::AnalyticsV3::Webproperty::Permissions::Representation
      
          property :profile_count, as: 'profileCount'
          property :self_link, as: 'selfLink'
          property :starred, as: 'starred'
          property :updated, as: 'updated', type: DateTime
      
          property :website_url, as: 'websiteUrl'
        end
        
        class ChildLink
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :href, as: 'href'
            property :type, as: 'type'
          end
        end
        
        class ParentLink
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :href, as: 'href'
            property :type, as: 'type'
          end
        end
        
        class Permissions
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :effective, as: 'effective'
          end
        end
      end
    end
  end
end
