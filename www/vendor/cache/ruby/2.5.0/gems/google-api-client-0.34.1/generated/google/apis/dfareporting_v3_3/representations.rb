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
    module DfareportingV3_3
      
      class Account
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountActiveAdSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountPermission
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountPermissionGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountPermissionGroupsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountPermissionsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountUserProfile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountUserProfilesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Activities
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Ad
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdBlockingConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdSlot
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Advertiser
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdvertiserGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdvertiserGroupsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdvertiserLandingPagesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdvertisersListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AudienceSegment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AudienceSegmentGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Browser
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BrowsersListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Campaign
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CampaignCreativeAssociation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CampaignCreativeAssociationsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CampaignsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChangeLog
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ChangeLogsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CitiesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class City
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClickTag
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClickThroughUrl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ClickThroughUrlSuffixProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompanionClickThroughOverride
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompanionSetting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CompatibleFields
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConnectionType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConnectionTypesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContentCategoriesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContentCategory
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Conversion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConversionError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConversionStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConversionsBatchInsertRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConversionsBatchInsertResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConversionsBatchUpdateRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConversionsBatchUpdateResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CountriesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Country
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Creative
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeAsset
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeAssetId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeAssetMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeAssetSelection
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeAssignment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeClickThroughUrl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeCustomEvent
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeField
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeFieldAssignment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeFieldValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeFieldValuesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeFieldsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeGroupAssignment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeGroupsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeOptimizationConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeRotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CrossDimensionReachReportCompatibleFields
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomFloodlightVariable
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomRichMediaEvents
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomViewabilityMetric
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomViewabilityMetricConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DateRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DayPartTargeting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeepLink
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DefaultClickThroughEventTagProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeliverySchedule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DfpSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Dimension
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DimensionFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DimensionValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DimensionValueList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DimensionValueRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DirectorySite
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DirectorySiteSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DirectorySitesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DynamicTargetingKey
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DynamicTargetingKeysListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EncryptionInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventTag
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventTagOverride
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EventTagsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class File
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Urls
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FileList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Flight
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FloodlightActivitiesGenerateTagResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FloodlightActivitiesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FloodlightActivity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FloodlightActivityDynamicTag
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FloodlightActivityGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FloodlightActivityGroupsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FloodlightActivityPublisherDynamicTag
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FloodlightConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FloodlightConfigurationsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FloodlightReportCompatibleFields
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FrequencyCap
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FsCommand
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GeoTargeting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InventoryItem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InventoryItemsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class KeyValueTargetingExpression
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LandingPage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Language
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LanguageTargeting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LanguagesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LastModifiedInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPopulationClause
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPopulationRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListPopulationTerm
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTargetingExpression
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LookbackConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Metric
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Metro
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetrosListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MobileApp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MobileAppsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MobileCarrier
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MobileCarriersListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ObjectFilter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OffsetPosition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OmnitureSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperatingSystem
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperatingSystemVersion
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperatingSystemVersionsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperatingSystemsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OptimizationActivity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Order
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderContact
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderDocument
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrderDocumentsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OrdersListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PathToConversionReportCompatibleFields
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Placement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlacementAssignment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlacementGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlacementGroupsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlacementStrategiesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlacementStrategy
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlacementTag
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlacementsGenerateTagsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlacementsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlatformType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PlatformTypesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PopupWindowProperties
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PostalCode
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PostalCodesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Pricing
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PricingSchedule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PricingSchedulePricingPeriod
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Project
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProjectsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReachReportCompatibleFields
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Recipient
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Region
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RegionsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RemarketingList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RemarketingListShare
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RemarketingListsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Report
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Criteria
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class CrossDimensionReachCriteria
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Delivery
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class FloodlightCriteria
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class ReportProperties
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class PathToConversionCriteria
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class ReportProperties
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ReachCriteria
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Schedule
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportCompatibleFields
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportsConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RichMediaExitOverride
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Rule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Site
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SiteCompanionSetting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SiteContact
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SiteSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SiteSkippableSetting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SiteTranscodeSetting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SiteVideoSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SitesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Size
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SizesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SkippableSetting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SortedDimension
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Subaccount
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubaccountsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TagData
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TagSetting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TagSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetWindow
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetableRemarketingList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetableRemarketingListsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetingTemplate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetingTemplatesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TechnologyTargeting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ThirdPartyAuthenticationToken
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ThirdPartyTrackingUrl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TranscodeSetting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UniversalAdId
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserDefinedVariableConfiguration
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserProfile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserProfileList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserRole
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserRolePermission
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserRolePermissionGroup
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserRolePermissionGroupsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserRolePermissionsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserRolesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoFormat
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoFormatsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoOffset
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VideoSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Account
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :account_permission_ids, as: 'accountPermissionIds'
          property :account_profile, as: 'accountProfile'
          property :active, as: 'active'
          property :active_ads_limit_tier, as: 'activeAdsLimitTier'
          property :active_view_opt_out, as: 'activeViewOptOut'
          collection :available_permission_ids, as: 'availablePermissionIds'
          property :country_id, :numeric_string => true, as: 'countryId'
          property :currency_id, :numeric_string => true, as: 'currencyId'
          property :default_creative_size_id, :numeric_string => true, as: 'defaultCreativeSizeId'
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :locale, as: 'locale'
          property :maximum_image_size, :numeric_string => true, as: 'maximumImageSize'
          property :name, as: 'name'
          property :nielsen_ocr_enabled, as: 'nielsenOcrEnabled'
          property :reports_configuration, as: 'reportsConfiguration', class: Google::Apis::DfareportingV3_3::ReportsConfiguration, decorator: Google::Apis::DfareportingV3_3::ReportsConfiguration::Representation
      
          property :share_reports_with_twitter, as: 'shareReportsWithTwitter'
          property :teaser_size_limit, :numeric_string => true, as: 'teaserSizeLimit'
        end
      end
      
      class AccountActiveAdSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :active_ads, :numeric_string => true, as: 'activeAds'
          property :active_ads_limit_tier, as: 'activeAdsLimitTier'
          property :available_ads, :numeric_string => true, as: 'availableAds'
          property :kind, as: 'kind'
        end
      end
      
      class AccountPermission
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :account_profiles, as: 'accountProfiles'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :level, as: 'level'
          property :name, as: 'name'
          property :permission_group_id, :numeric_string => true, as: 'permissionGroupId'
        end
      end
      
      class AccountPermissionGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class AccountPermissionGroupsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :account_permission_groups, as: 'accountPermissionGroups', class: Google::Apis::DfareportingV3_3::AccountPermissionGroup, decorator: Google::Apis::DfareportingV3_3::AccountPermissionGroup::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class AccountPermissionsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :account_permissions, as: 'accountPermissions', class: Google::Apis::DfareportingV3_3::AccountPermission, decorator: Google::Apis::DfareportingV3_3::AccountPermission::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class AccountUserProfile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :active, as: 'active'
          property :advertiser_filter, as: 'advertiserFilter', class: Google::Apis::DfareportingV3_3::ObjectFilter, decorator: Google::Apis::DfareportingV3_3::ObjectFilter::Representation
      
          property :campaign_filter, as: 'campaignFilter', class: Google::Apis::DfareportingV3_3::ObjectFilter, decorator: Google::Apis::DfareportingV3_3::ObjectFilter::Representation
      
          property :comments, as: 'comments'
          property :email, as: 'email'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :locale, as: 'locale'
          property :name, as: 'name'
          property :site_filter, as: 'siteFilter', class: Google::Apis::DfareportingV3_3::ObjectFilter, decorator: Google::Apis::DfareportingV3_3::ObjectFilter::Representation
      
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :trafficker_type, as: 'traffickerType'
          property :user_access_type, as: 'userAccessType'
          property :user_role_filter, as: 'userRoleFilter', class: Google::Apis::DfareportingV3_3::ObjectFilter, decorator: Google::Apis::DfareportingV3_3::ObjectFilter::Representation
      
          property :user_role_id, :numeric_string => true, as: 'userRoleId'
        end
      end
      
      class AccountUserProfilesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :account_user_profiles, as: 'accountUserProfiles', class: Google::Apis::DfareportingV3_3::AccountUserProfile, decorator: Google::Apis::DfareportingV3_3::AccountUserProfile::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class AccountsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :accounts, as: 'accounts', class: Google::Apis::DfareportingV3_3::Account, decorator: Google::Apis::DfareportingV3_3::Account::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Activities
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :filters, as: 'filters', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :kind, as: 'kind'
          collection :metric_names, as: 'metricNames'
        end
      end
      
      class Ad
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :active, as: 'active'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :advertiser_id_dimension_value, as: 'advertiserIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :archived, as: 'archived'
          property :audience_segment_id, :numeric_string => true, as: 'audienceSegmentId'
          property :campaign_id, :numeric_string => true, as: 'campaignId'
          property :campaign_id_dimension_value, as: 'campaignIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :click_through_url, as: 'clickThroughUrl', class: Google::Apis::DfareportingV3_3::ClickThroughUrl, decorator: Google::Apis::DfareportingV3_3::ClickThroughUrl::Representation
      
          property :click_through_url_suffix_properties, as: 'clickThroughUrlSuffixProperties', class: Google::Apis::DfareportingV3_3::ClickThroughUrlSuffixProperties, decorator: Google::Apis::DfareportingV3_3::ClickThroughUrlSuffixProperties::Representation
      
          property :comments, as: 'comments'
          property :compatibility, as: 'compatibility'
          property :create_info, as: 'createInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          collection :creative_group_assignments, as: 'creativeGroupAssignments', class: Google::Apis::DfareportingV3_3::CreativeGroupAssignment, decorator: Google::Apis::DfareportingV3_3::CreativeGroupAssignment::Representation
      
          property :creative_rotation, as: 'creativeRotation', class: Google::Apis::DfareportingV3_3::CreativeRotation, decorator: Google::Apis::DfareportingV3_3::CreativeRotation::Representation
      
          property :day_part_targeting, as: 'dayPartTargeting', class: Google::Apis::DfareportingV3_3::DayPartTargeting, decorator: Google::Apis::DfareportingV3_3::DayPartTargeting::Representation
      
          property :default_click_through_event_tag_properties, as: 'defaultClickThroughEventTagProperties', class: Google::Apis::DfareportingV3_3::DefaultClickThroughEventTagProperties, decorator: Google::Apis::DfareportingV3_3::DefaultClickThroughEventTagProperties::Representation
      
          property :delivery_schedule, as: 'deliverySchedule', class: Google::Apis::DfareportingV3_3::DeliverySchedule, decorator: Google::Apis::DfareportingV3_3::DeliverySchedule::Representation
      
          property :dynamic_click_tracker, as: 'dynamicClickTracker'
          property :end_time, as: 'endTime', type: DateTime
      
          collection :event_tag_overrides, as: 'eventTagOverrides', class: Google::Apis::DfareportingV3_3::EventTagOverride, decorator: Google::Apis::DfareportingV3_3::EventTagOverride::Representation
      
          property :geo_targeting, as: 'geoTargeting', class: Google::Apis::DfareportingV3_3::GeoTargeting, decorator: Google::Apis::DfareportingV3_3::GeoTargeting::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :id_dimension_value, as: 'idDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :key_value_targeting_expression, as: 'keyValueTargetingExpression', class: Google::Apis::DfareportingV3_3::KeyValueTargetingExpression, decorator: Google::Apis::DfareportingV3_3::KeyValueTargetingExpression::Representation
      
          property :kind, as: 'kind'
          property :language_targeting, as: 'languageTargeting', class: Google::Apis::DfareportingV3_3::LanguageTargeting, decorator: Google::Apis::DfareportingV3_3::LanguageTargeting::Representation
      
          property :last_modified_info, as: 'lastModifiedInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          property :name, as: 'name'
          collection :placement_assignments, as: 'placementAssignments', class: Google::Apis::DfareportingV3_3::PlacementAssignment, decorator: Google::Apis::DfareportingV3_3::PlacementAssignment::Representation
      
          property :remarketing_list_expression, as: 'remarketingListExpression', class: Google::Apis::DfareportingV3_3::ListTargetingExpression, decorator: Google::Apis::DfareportingV3_3::ListTargetingExpression::Representation
      
          property :size, as: 'size', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
          property :ssl_compliant, as: 'sslCompliant'
          property :ssl_required, as: 'sslRequired'
          property :start_time, as: 'startTime', type: DateTime
      
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :targeting_template_id, :numeric_string => true, as: 'targetingTemplateId'
          property :technology_targeting, as: 'technologyTargeting', class: Google::Apis::DfareportingV3_3::TechnologyTargeting, decorator: Google::Apis::DfareportingV3_3::TechnologyTargeting::Representation
      
          property :type, as: 'type'
        end
      end
      
      class AdBlockingConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :click_through_url, as: 'clickThroughUrl'
          property :creative_bundle_id, :numeric_string => true, as: 'creativeBundleId'
          property :enabled, as: 'enabled'
          property :override_click_through_url, as: 'overrideClickThroughUrl'
        end
      end
      
      class AdSlot
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :comment, as: 'comment'
          property :compatibility, as: 'compatibility'
          property :height, :numeric_string => true, as: 'height'
          property :linked_placement_id, :numeric_string => true, as: 'linkedPlacementId'
          property :name, as: 'name'
          property :payment_source_type, as: 'paymentSourceType'
          property :primary, as: 'primary'
          property :width, :numeric_string => true, as: 'width'
        end
      end
      
      class AdsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :ads, as: 'ads', class: Google::Apis::DfareportingV3_3::Ad, decorator: Google::Apis::DfareportingV3_3::Ad::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Advertiser
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :advertiser_group_id, :numeric_string => true, as: 'advertiserGroupId'
          property :click_through_url_suffix, as: 'clickThroughUrlSuffix'
          property :default_click_through_event_tag_id, :numeric_string => true, as: 'defaultClickThroughEventTagId'
          property :default_email, as: 'defaultEmail'
          property :floodlight_configuration_id, :numeric_string => true, as: 'floodlightConfigurationId'
          property :floodlight_configuration_id_dimension_value, as: 'floodlightConfigurationIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :id_dimension_value, as: 'idDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :original_floodlight_configuration_id, :numeric_string => true, as: 'originalFloodlightConfigurationId'
          property :status, as: 'status'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :suspended, as: 'suspended'
        end
      end
      
      class AdvertiserGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class AdvertiserGroupsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :advertiser_groups, as: 'advertiserGroups', class: Google::Apis::DfareportingV3_3::AdvertiserGroup, decorator: Google::Apis::DfareportingV3_3::AdvertiserGroup::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class AdvertiserLandingPagesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :landing_pages, as: 'landingPages', class: Google::Apis::DfareportingV3_3::LandingPage, decorator: Google::Apis::DfareportingV3_3::LandingPage::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class AdvertisersListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :advertisers, as: 'advertisers', class: Google::Apis::DfareportingV3_3::Advertiser, decorator: Google::Apis::DfareportingV3_3::Advertiser::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class AudienceSegment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allocation, as: 'allocation'
          property :id, :numeric_string => true, as: 'id'
          property :name, as: 'name'
        end
      end
      
      class AudienceSegmentGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :audience_segments, as: 'audienceSegments', class: Google::Apis::DfareportingV3_3::AudienceSegment, decorator: Google::Apis::DfareportingV3_3::AudienceSegment::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :name, as: 'name'
        end
      end
      
      class Browser
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :browser_version_id, :numeric_string => true, as: 'browserVersionId'
          property :dart_id, :numeric_string => true, as: 'dartId'
          property :kind, as: 'kind'
          property :major_version, as: 'majorVersion'
          property :minor_version, as: 'minorVersion'
          property :name, as: 'name'
        end
      end
      
      class BrowsersListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :browsers, as: 'browsers', class: Google::Apis::DfareportingV3_3::Browser, decorator: Google::Apis::DfareportingV3_3::Browser::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Campaign
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :ad_blocking_configuration, as: 'adBlockingConfiguration', class: Google::Apis::DfareportingV3_3::AdBlockingConfiguration, decorator: Google::Apis::DfareportingV3_3::AdBlockingConfiguration::Representation
      
          collection :additional_creative_optimization_configurations, as: 'additionalCreativeOptimizationConfigurations', class: Google::Apis::DfareportingV3_3::CreativeOptimizationConfiguration, decorator: Google::Apis::DfareportingV3_3::CreativeOptimizationConfiguration::Representation
      
          property :advertiser_group_id, :numeric_string => true, as: 'advertiserGroupId'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :advertiser_id_dimension_value, as: 'advertiserIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :archived, as: 'archived'
          collection :audience_segment_groups, as: 'audienceSegmentGroups', class: Google::Apis::DfareportingV3_3::AudienceSegmentGroup, decorator: Google::Apis::DfareportingV3_3::AudienceSegmentGroup::Representation
      
          property :billing_invoice_code, as: 'billingInvoiceCode'
          property :click_through_url_suffix_properties, as: 'clickThroughUrlSuffixProperties', class: Google::Apis::DfareportingV3_3::ClickThroughUrlSuffixProperties, decorator: Google::Apis::DfareportingV3_3::ClickThroughUrlSuffixProperties::Representation
      
          property :comment, as: 'comment'
          property :create_info, as: 'createInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          collection :creative_group_ids, as: 'creativeGroupIds'
          property :creative_optimization_configuration, as: 'creativeOptimizationConfiguration', class: Google::Apis::DfareportingV3_3::CreativeOptimizationConfiguration, decorator: Google::Apis::DfareportingV3_3::CreativeOptimizationConfiguration::Representation
      
          property :default_click_through_event_tag_properties, as: 'defaultClickThroughEventTagProperties', class: Google::Apis::DfareportingV3_3::DefaultClickThroughEventTagProperties, decorator: Google::Apis::DfareportingV3_3::DefaultClickThroughEventTagProperties::Representation
      
          property :default_landing_page_id, :numeric_string => true, as: 'defaultLandingPageId'
          property :end_date, as: 'endDate', type: Date
      
          collection :event_tag_overrides, as: 'eventTagOverrides', class: Google::Apis::DfareportingV3_3::EventTagOverride, decorator: Google::Apis::DfareportingV3_3::EventTagOverride::Representation
      
          property :external_id, as: 'externalId'
          property :id, :numeric_string => true, as: 'id'
          property :id_dimension_value, as: 'idDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :kind, as: 'kind'
          property :last_modified_info, as: 'lastModifiedInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          property :name, as: 'name'
          property :nielsen_ocr_enabled, as: 'nielsenOcrEnabled'
          property :start_date, as: 'startDate', type: Date
      
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          collection :trafficker_emails, as: 'traffickerEmails'
        end
      end
      
      class CampaignCreativeAssociation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creative_id, :numeric_string => true, as: 'creativeId'
          property :kind, as: 'kind'
        end
      end
      
      class CampaignCreativeAssociationsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :campaign_creative_associations, as: 'campaignCreativeAssociations', class: Google::Apis::DfareportingV3_3::CampaignCreativeAssociation, decorator: Google::Apis::DfareportingV3_3::CampaignCreativeAssociation::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class CampaignsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :campaigns, as: 'campaigns', class: Google::Apis::DfareportingV3_3::Campaign, decorator: Google::Apis::DfareportingV3_3::Campaign::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ChangeLog
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :action, as: 'action'
          property :change_time, as: 'changeTime', type: DateTime
      
          property :field_name, as: 'fieldName'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :new_value, as: 'newValue'
          property :object_id_prop, :numeric_string => true, as: 'objectId'
          property :object_type, as: 'objectType'
          property :old_value, as: 'oldValue'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :transaction_id, :numeric_string => true, as: 'transactionId'
          property :user_profile_id, :numeric_string => true, as: 'userProfileId'
          property :user_profile_name, as: 'userProfileName'
        end
      end
      
      class ChangeLogsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :change_logs, as: 'changeLogs', class: Google::Apis::DfareportingV3_3::ChangeLog, decorator: Google::Apis::DfareportingV3_3::ChangeLog::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class CitiesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :cities, as: 'cities', class: Google::Apis::DfareportingV3_3::City, decorator: Google::Apis::DfareportingV3_3::City::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class City
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country_code, as: 'countryCode'
          property :country_dart_id, :numeric_string => true, as: 'countryDartId'
          property :dart_id, :numeric_string => true, as: 'dartId'
          property :kind, as: 'kind'
          property :metro_code, as: 'metroCode'
          property :metro_dma_id, :numeric_string => true, as: 'metroDmaId'
          property :name, as: 'name'
          property :region_code, as: 'regionCode'
          property :region_dart_id, :numeric_string => true, as: 'regionDartId'
        end
      end
      
      class ClickTag
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :click_through_url, as: 'clickThroughUrl', class: Google::Apis::DfareportingV3_3::CreativeClickThroughUrl, decorator: Google::Apis::DfareportingV3_3::CreativeClickThroughUrl::Representation
      
          property :event_name, as: 'eventName'
          property :name, as: 'name'
        end
      end
      
      class ClickThroughUrl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :computed_click_through_url, as: 'computedClickThroughUrl'
          property :custom_click_through_url, as: 'customClickThroughUrl'
          property :default_landing_page, as: 'defaultLandingPage'
          property :landing_page_id, :numeric_string => true, as: 'landingPageId'
        end
      end
      
      class ClickThroughUrlSuffixProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :click_through_url_suffix, as: 'clickThroughUrlSuffix'
          property :override_inherited_suffix, as: 'overrideInheritedSuffix'
        end
      end
      
      class CompanionClickThroughOverride
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :click_through_url, as: 'clickThroughUrl', class: Google::Apis::DfareportingV3_3::ClickThroughUrl, decorator: Google::Apis::DfareportingV3_3::ClickThroughUrl::Representation
      
          property :creative_id, :numeric_string => true, as: 'creativeId'
        end
      end
      
      class CompanionSetting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :companions_disabled, as: 'companionsDisabled'
          collection :enabled_sizes, as: 'enabledSizes', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
          property :image_only, as: 'imageOnly'
          property :kind, as: 'kind'
        end
      end
      
      class CompatibleFields
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cross_dimension_reach_report_compatible_fields, as: 'crossDimensionReachReportCompatibleFields', class: Google::Apis::DfareportingV3_3::CrossDimensionReachReportCompatibleFields, decorator: Google::Apis::DfareportingV3_3::CrossDimensionReachReportCompatibleFields::Representation
      
          property :floodlight_report_compatible_fields, as: 'floodlightReportCompatibleFields', class: Google::Apis::DfareportingV3_3::FloodlightReportCompatibleFields, decorator: Google::Apis::DfareportingV3_3::FloodlightReportCompatibleFields::Representation
      
          property :kind, as: 'kind'
          property :path_to_conversion_report_compatible_fields, as: 'pathToConversionReportCompatibleFields', class: Google::Apis::DfareportingV3_3::PathToConversionReportCompatibleFields, decorator: Google::Apis::DfareportingV3_3::PathToConversionReportCompatibleFields::Representation
      
          property :reach_report_compatible_fields, as: 'reachReportCompatibleFields', class: Google::Apis::DfareportingV3_3::ReachReportCompatibleFields, decorator: Google::Apis::DfareportingV3_3::ReachReportCompatibleFields::Representation
      
          property :report_compatible_fields, as: 'reportCompatibleFields', class: Google::Apis::DfareportingV3_3::ReportCompatibleFields, decorator: Google::Apis::DfareportingV3_3::ReportCompatibleFields::Representation
      
        end
      end
      
      class ConnectionType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class ConnectionTypesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :connection_types, as: 'connectionTypes', class: Google::Apis::DfareportingV3_3::ConnectionType, decorator: Google::Apis::DfareportingV3_3::ConnectionType::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ContentCategoriesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :content_categories, as: 'contentCategories', class: Google::Apis::DfareportingV3_3::ContentCategory, decorator: Google::Apis::DfareportingV3_3::ContentCategory::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ContentCategory
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class Conversion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :child_directed_treatment, as: 'childDirectedTreatment'
          collection :custom_variables, as: 'customVariables', class: Google::Apis::DfareportingV3_3::CustomFloodlightVariable, decorator: Google::Apis::DfareportingV3_3::CustomFloodlightVariable::Representation
      
          property :encrypted_user_id, as: 'encryptedUserId'
          collection :encrypted_user_id_candidates, as: 'encryptedUserIdCandidates'
          property :floodlight_activity_id, :numeric_string => true, as: 'floodlightActivityId'
          property :floodlight_configuration_id, :numeric_string => true, as: 'floodlightConfigurationId'
          property :gclid, as: 'gclid'
          property :kind, as: 'kind'
          property :limit_ad_tracking, as: 'limitAdTracking'
          property :match_id, as: 'matchId'
          property :mobile_device_id, as: 'mobileDeviceId'
          property :non_personalized_ad, as: 'nonPersonalizedAd'
          property :ordinal, as: 'ordinal'
          property :quantity, :numeric_string => true, as: 'quantity'
          property :timestamp_micros, :numeric_string => true, as: 'timestampMicros'
          property :treatment_for_underage, as: 'treatmentForUnderage'
          property :value, as: 'value'
        end
      end
      
      class ConversionError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :kind, as: 'kind'
          property :message, as: 'message'
        end
      end
      
      class ConversionStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :conversion, as: 'conversion', class: Google::Apis::DfareportingV3_3::Conversion, decorator: Google::Apis::DfareportingV3_3::Conversion::Representation
      
          collection :errors, as: 'errors', class: Google::Apis::DfareportingV3_3::ConversionError, decorator: Google::Apis::DfareportingV3_3::ConversionError::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ConversionsBatchInsertRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :conversions, as: 'conversions', class: Google::Apis::DfareportingV3_3::Conversion, decorator: Google::Apis::DfareportingV3_3::Conversion::Representation
      
          property :encryption_info, as: 'encryptionInfo', class: Google::Apis::DfareportingV3_3::EncryptionInfo, decorator: Google::Apis::DfareportingV3_3::EncryptionInfo::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ConversionsBatchInsertResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :has_failures, as: 'hasFailures'
          property :kind, as: 'kind'
          collection :status, as: 'status', class: Google::Apis::DfareportingV3_3::ConversionStatus, decorator: Google::Apis::DfareportingV3_3::ConversionStatus::Representation
      
        end
      end
      
      class ConversionsBatchUpdateRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :conversions, as: 'conversions', class: Google::Apis::DfareportingV3_3::Conversion, decorator: Google::Apis::DfareportingV3_3::Conversion::Representation
      
          property :encryption_info, as: 'encryptionInfo', class: Google::Apis::DfareportingV3_3::EncryptionInfo, decorator: Google::Apis::DfareportingV3_3::EncryptionInfo::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class ConversionsBatchUpdateResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :has_failures, as: 'hasFailures'
          property :kind, as: 'kind'
          collection :status, as: 'status', class: Google::Apis::DfareportingV3_3::ConversionStatus, decorator: Google::Apis::DfareportingV3_3::ConversionStatus::Representation
      
        end
      end
      
      class CountriesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :countries, as: 'countries', class: Google::Apis::DfareportingV3_3::Country, decorator: Google::Apis::DfareportingV3_3::Country::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Country
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country_code, as: 'countryCode'
          property :dart_id, :numeric_string => true, as: 'dartId'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :ssl_enabled, as: 'sslEnabled'
        end
      end
      
      class Creative
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :active, as: 'active'
          property :ad_parameters, as: 'adParameters'
          collection :ad_tag_keys, as: 'adTagKeys'
          collection :additional_sizes, as: 'additionalSizes', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :allow_script_access, as: 'allowScriptAccess'
          property :archived, as: 'archived'
          property :artwork_type, as: 'artworkType'
          property :authoring_source, as: 'authoringSource'
          property :authoring_tool, as: 'authoringTool'
          property :auto_advance_images, as: 'autoAdvanceImages'
          property :background_color, as: 'backgroundColor'
          property :backup_image_click_through_url, as: 'backupImageClickThroughUrl', class: Google::Apis::DfareportingV3_3::CreativeClickThroughUrl, decorator: Google::Apis::DfareportingV3_3::CreativeClickThroughUrl::Representation
      
          collection :backup_image_features, as: 'backupImageFeatures'
          property :backup_image_reporting_label, as: 'backupImageReportingLabel'
          property :backup_image_target_window, as: 'backupImageTargetWindow', class: Google::Apis::DfareportingV3_3::TargetWindow, decorator: Google::Apis::DfareportingV3_3::TargetWindow::Representation
      
          collection :click_tags, as: 'clickTags', class: Google::Apis::DfareportingV3_3::ClickTag, decorator: Google::Apis::DfareportingV3_3::ClickTag::Representation
      
          property :commercial_id, as: 'commercialId'
          collection :companion_creatives, as: 'companionCreatives'
          collection :compatibility, as: 'compatibility'
          property :convert_flash_to_html5, as: 'convertFlashToHtml5'
          collection :counter_custom_events, as: 'counterCustomEvents', class: Google::Apis::DfareportingV3_3::CreativeCustomEvent, decorator: Google::Apis::DfareportingV3_3::CreativeCustomEvent::Representation
      
          property :creative_asset_selection, as: 'creativeAssetSelection', class: Google::Apis::DfareportingV3_3::CreativeAssetSelection, decorator: Google::Apis::DfareportingV3_3::CreativeAssetSelection::Representation
      
          collection :creative_assets, as: 'creativeAssets', class: Google::Apis::DfareportingV3_3::CreativeAsset, decorator: Google::Apis::DfareportingV3_3::CreativeAsset::Representation
      
          collection :creative_field_assignments, as: 'creativeFieldAssignments', class: Google::Apis::DfareportingV3_3::CreativeFieldAssignment, decorator: Google::Apis::DfareportingV3_3::CreativeFieldAssignment::Representation
      
          collection :custom_key_values, as: 'customKeyValues'
          property :dynamic_asset_selection, as: 'dynamicAssetSelection'
          collection :exit_custom_events, as: 'exitCustomEvents', class: Google::Apis::DfareportingV3_3::CreativeCustomEvent, decorator: Google::Apis::DfareportingV3_3::CreativeCustomEvent::Representation
      
          property :fs_command, as: 'fsCommand', class: Google::Apis::DfareportingV3_3::FsCommand, decorator: Google::Apis::DfareportingV3_3::FsCommand::Representation
      
          property :html_code, as: 'htmlCode'
          property :html_code_locked, as: 'htmlCodeLocked'
          property :id, :numeric_string => true, as: 'id'
          property :id_dimension_value, as: 'idDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :kind, as: 'kind'
          property :last_modified_info, as: 'lastModifiedInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          property :latest_trafficked_creative_id, :numeric_string => true, as: 'latestTraffickedCreativeId'
          property :media_description, as: 'mediaDescription'
          property :media_duration, as: 'mediaDuration'
          property :name, as: 'name'
          property :override_css, as: 'overrideCss'
          property :progress_offset, as: 'progressOffset', class: Google::Apis::DfareportingV3_3::VideoOffset, decorator: Google::Apis::DfareportingV3_3::VideoOffset::Representation
      
          property :redirect_url, as: 'redirectUrl'
          property :rendering_id, :numeric_string => true, as: 'renderingId'
          property :rendering_id_dimension_value, as: 'renderingIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :required_flash_plugin_version, as: 'requiredFlashPluginVersion'
          property :required_flash_version, as: 'requiredFlashVersion'
          property :size, as: 'size', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
          property :skip_offset, as: 'skipOffset', class: Google::Apis::DfareportingV3_3::VideoOffset, decorator: Google::Apis::DfareportingV3_3::VideoOffset::Representation
      
          property :skippable, as: 'skippable'
          property :ssl_compliant, as: 'sslCompliant'
          property :ssl_override, as: 'sslOverride'
          property :studio_advertiser_id, :numeric_string => true, as: 'studioAdvertiserId'
          property :studio_creative_id, :numeric_string => true, as: 'studioCreativeId'
          property :studio_trafficked_creative_id, :numeric_string => true, as: 'studioTraffickedCreativeId'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :third_party_backup_image_impressions_url, as: 'thirdPartyBackupImageImpressionsUrl'
          property :third_party_rich_media_impressions_url, as: 'thirdPartyRichMediaImpressionsUrl'
          collection :third_party_urls, as: 'thirdPartyUrls', class: Google::Apis::DfareportingV3_3::ThirdPartyTrackingUrl, decorator: Google::Apis::DfareportingV3_3::ThirdPartyTrackingUrl::Representation
      
          collection :timer_custom_events, as: 'timerCustomEvents', class: Google::Apis::DfareportingV3_3::CreativeCustomEvent, decorator: Google::Apis::DfareportingV3_3::CreativeCustomEvent::Representation
      
          property :total_file_size, :numeric_string => true, as: 'totalFileSize'
          property :type, as: 'type'
          property :universal_ad_id, as: 'universalAdId', class: Google::Apis::DfareportingV3_3::UniversalAdId, decorator: Google::Apis::DfareportingV3_3::UniversalAdId::Representation
      
          property :version, as: 'version'
        end
      end
      
      class CreativeAsset
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action_script3, as: 'actionScript3'
          property :active, as: 'active'
          collection :additional_sizes, as: 'additionalSizes', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
          property :alignment, as: 'alignment'
          property :artwork_type, as: 'artworkType'
          property :asset_identifier, as: 'assetIdentifier', class: Google::Apis::DfareportingV3_3::CreativeAssetId, decorator: Google::Apis::DfareportingV3_3::CreativeAssetId::Representation
      
          property :audio_bit_rate, as: 'audioBitRate'
          property :audio_sample_rate, as: 'audioSampleRate'
          property :backup_image_exit, as: 'backupImageExit', class: Google::Apis::DfareportingV3_3::CreativeCustomEvent, decorator: Google::Apis::DfareportingV3_3::CreativeCustomEvent::Representation
      
          property :bit_rate, as: 'bitRate'
          property :child_asset_type, as: 'childAssetType'
          property :collapsed_size, as: 'collapsedSize', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
          collection :companion_creative_ids, as: 'companionCreativeIds'
          property :custom_start_time_value, as: 'customStartTimeValue'
          collection :detected_features, as: 'detectedFeatures'
          property :display_type, as: 'displayType'
          property :duration, as: 'duration'
          property :duration_type, as: 'durationType'
          property :expanded_dimension, as: 'expandedDimension', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
          property :file_size, :numeric_string => true, as: 'fileSize'
          property :flash_version, as: 'flashVersion'
          property :frame_rate, as: 'frameRate'
          property :hide_flash_objects, as: 'hideFlashObjects'
          property :hide_selection_boxes, as: 'hideSelectionBoxes'
          property :horizontally_locked, as: 'horizontallyLocked'
          property :id, :numeric_string => true, as: 'id'
          property :id_dimension_value, as: 'idDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :media_duration, as: 'mediaDuration'
          property :mime_type, as: 'mimeType'
          property :offset, as: 'offset', class: Google::Apis::DfareportingV3_3::OffsetPosition, decorator: Google::Apis::DfareportingV3_3::OffsetPosition::Representation
      
          property :orientation, as: 'orientation'
          property :original_backup, as: 'originalBackup'
          property :polite_load, as: 'politeLoad'
          property :position, as: 'position', class: Google::Apis::DfareportingV3_3::OffsetPosition, decorator: Google::Apis::DfareportingV3_3::OffsetPosition::Representation
      
          property :position_left_unit, as: 'positionLeftUnit'
          property :position_top_unit, as: 'positionTopUnit'
          property :progressive_serving_url, as: 'progressiveServingUrl'
          property :pushdown, as: 'pushdown'
          property :pushdown_duration, as: 'pushdownDuration'
          property :role, as: 'role'
          property :size, as: 'size', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
          property :ssl_compliant, as: 'sslCompliant'
          property :start_time_type, as: 'startTimeType'
          property :streaming_serving_url, as: 'streamingServingUrl'
          property :transparency, as: 'transparency'
          property :vertically_locked, as: 'verticallyLocked'
          property :window_mode, as: 'windowMode'
          property :z_index, as: 'zIndex'
          property :zip_filename, as: 'zipFilename'
          property :zip_filesize, as: 'zipFilesize'
        end
      end
      
      class CreativeAssetId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :type, as: 'type'
        end
      end
      
      class CreativeAssetMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :asset_identifier, as: 'assetIdentifier', class: Google::Apis::DfareportingV3_3::CreativeAssetId, decorator: Google::Apis::DfareportingV3_3::CreativeAssetId::Representation
      
          collection :click_tags, as: 'clickTags', class: Google::Apis::DfareportingV3_3::ClickTag, decorator: Google::Apis::DfareportingV3_3::ClickTag::Representation
      
          collection :detected_features, as: 'detectedFeatures'
          property :id, :numeric_string => true, as: 'id'
          property :id_dimension_value, as: 'idDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :kind, as: 'kind'
          collection :warned_validation_rules, as: 'warnedValidationRules'
        end
      end
      
      class CreativeAssetSelection
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_asset_id, :numeric_string => true, as: 'defaultAssetId'
          collection :rules, as: 'rules', class: Google::Apis::DfareportingV3_3::Rule, decorator: Google::Apis::DfareportingV3_3::Rule::Representation
      
        end
      end
      
      class CreativeAssignment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :active, as: 'active'
          property :apply_event_tags, as: 'applyEventTags'
          property :click_through_url, as: 'clickThroughUrl', class: Google::Apis::DfareportingV3_3::ClickThroughUrl, decorator: Google::Apis::DfareportingV3_3::ClickThroughUrl::Representation
      
          collection :companion_creative_overrides, as: 'companionCreativeOverrides', class: Google::Apis::DfareportingV3_3::CompanionClickThroughOverride, decorator: Google::Apis::DfareportingV3_3::CompanionClickThroughOverride::Representation
      
          collection :creative_group_assignments, as: 'creativeGroupAssignments', class: Google::Apis::DfareportingV3_3::CreativeGroupAssignment, decorator: Google::Apis::DfareportingV3_3::CreativeGroupAssignment::Representation
      
          property :creative_id, :numeric_string => true, as: 'creativeId'
          property :creative_id_dimension_value, as: 'creativeIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :end_time, as: 'endTime', type: DateTime
      
          collection :rich_media_exit_overrides, as: 'richMediaExitOverrides', class: Google::Apis::DfareportingV3_3::RichMediaExitOverride, decorator: Google::Apis::DfareportingV3_3::RichMediaExitOverride::Representation
      
          property :sequence, as: 'sequence'
          property :ssl_compliant, as: 'sslCompliant'
          property :start_time, as: 'startTime', type: DateTime
      
          property :weight, as: 'weight'
        end
      end
      
      class CreativeClickThroughUrl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :computed_click_through_url, as: 'computedClickThroughUrl'
          property :custom_click_through_url, as: 'customClickThroughUrl'
          property :landing_page_id, :numeric_string => true, as: 'landingPageId'
        end
      end
      
      class CreativeCustomEvent
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :advertiser_custom_event_id, :numeric_string => true, as: 'advertiserCustomEventId'
          property :advertiser_custom_event_name, as: 'advertiserCustomEventName'
          property :advertiser_custom_event_type, as: 'advertiserCustomEventType'
          property :artwork_label, as: 'artworkLabel'
          property :artwork_type, as: 'artworkType'
          property :exit_click_through_url, as: 'exitClickThroughUrl', class: Google::Apis::DfareportingV3_3::CreativeClickThroughUrl, decorator: Google::Apis::DfareportingV3_3::CreativeClickThroughUrl::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :popup_window_properties, as: 'popupWindowProperties', class: Google::Apis::DfareportingV3_3::PopupWindowProperties, decorator: Google::Apis::DfareportingV3_3::PopupWindowProperties::Representation
      
          property :target_type, as: 'targetType'
          property :video_reporting_id, as: 'videoReportingId'
        end
      end
      
      class CreativeField
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :advertiser_id_dimension_value, as: 'advertiserIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
        end
      end
      
      class CreativeFieldAssignment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creative_field_id, :numeric_string => true, as: 'creativeFieldId'
          property :creative_field_value_id, :numeric_string => true, as: 'creativeFieldValueId'
        end
      end
      
      class CreativeFieldValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :value, as: 'value'
        end
      end
      
      class CreativeFieldValuesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :creative_field_values, as: 'creativeFieldValues', class: Google::Apis::DfareportingV3_3::CreativeFieldValue, decorator: Google::Apis::DfareportingV3_3::CreativeFieldValue::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class CreativeFieldsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :creative_fields, as: 'creativeFields', class: Google::Apis::DfareportingV3_3::CreativeField, decorator: Google::Apis::DfareportingV3_3::CreativeField::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class CreativeGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :advertiser_id_dimension_value, as: 'advertiserIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :group_number, as: 'groupNumber'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
        end
      end
      
      class CreativeGroupAssignment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creative_group_id, :numeric_string => true, as: 'creativeGroupId'
          property :creative_group_number, as: 'creativeGroupNumber'
        end
      end
      
      class CreativeGroupsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :creative_groups, as: 'creativeGroups', class: Google::Apis::DfareportingV3_3::CreativeGroup, decorator: Google::Apis::DfareportingV3_3::CreativeGroup::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class CreativeOptimizationConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          property :name, as: 'name'
          collection :optimization_activitys, as: 'optimizationActivitys', class: Google::Apis::DfareportingV3_3::OptimizationActivity, decorator: Google::Apis::DfareportingV3_3::OptimizationActivity::Representation
      
          property :optimization_model, as: 'optimizationModel'
        end
      end
      
      class CreativeRotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :creative_assignments, as: 'creativeAssignments', class: Google::Apis::DfareportingV3_3::CreativeAssignment, decorator: Google::Apis::DfareportingV3_3::CreativeAssignment::Representation
      
          property :creative_optimization_configuration_id, :numeric_string => true, as: 'creativeOptimizationConfigurationId'
          property :type, as: 'type'
          property :weight_calculation_strategy, as: 'weightCalculationStrategy'
        end
      end
      
      class CreativesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :creatives, as: 'creatives', class: Google::Apis::DfareportingV3_3::Creative, decorator: Google::Apis::DfareportingV3_3::Creative::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class CrossDimensionReachReportCompatibleFields
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :breakdown, as: 'breakdown', class: Google::Apis::DfareportingV3_3::Dimension, decorator: Google::Apis::DfareportingV3_3::Dimension::Representation
      
          collection :dimension_filters, as: 'dimensionFilters', class: Google::Apis::DfareportingV3_3::Dimension, decorator: Google::Apis::DfareportingV3_3::Dimension::Representation
      
          property :kind, as: 'kind'
          collection :metrics, as: 'metrics', class: Google::Apis::DfareportingV3_3::Metric, decorator: Google::Apis::DfareportingV3_3::Metric::Representation
      
          collection :overlap_metrics, as: 'overlapMetrics', class: Google::Apis::DfareportingV3_3::Metric, decorator: Google::Apis::DfareportingV3_3::Metric::Representation
      
        end
      end
      
      class CustomFloodlightVariable
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :type, as: 'type'
          property :value, as: 'value'
        end
      end
      
      class CustomRichMediaEvents
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :filtered_event_ids, as: 'filteredEventIds', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class CustomViewabilityMetric
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :configuration, as: 'configuration', class: Google::Apis::DfareportingV3_3::CustomViewabilityMetricConfiguration, decorator: Google::Apis::DfareportingV3_3::CustomViewabilityMetricConfiguration::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :name, as: 'name'
        end
      end
      
      class CustomViewabilityMetricConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audible, as: 'audible'
          property :time_millis, as: 'timeMillis'
          property :time_percent, as: 'timePercent'
          property :viewability_percent, as: 'viewabilityPercent'
        end
      end
      
      class DateRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_date, as: 'endDate', type: Date
      
          property :kind, as: 'kind'
          property :relative_date_range, as: 'relativeDateRange'
          property :start_date, as: 'startDate', type: Date
      
        end
      end
      
      class DayPartTargeting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :days_of_week, as: 'daysOfWeek'
          collection :hours_of_day, as: 'hoursOfDay'
          property :user_local_time, as: 'userLocalTime'
        end
      end
      
      class DeepLink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_url, as: 'appUrl'
          property :fallback_url, as: 'fallbackUrl'
          property :kind, as: 'kind'
          property :mobile_app, as: 'mobileApp', class: Google::Apis::DfareportingV3_3::MobileApp, decorator: Google::Apis::DfareportingV3_3::MobileApp::Representation
      
          collection :remarketing_list_ids, as: 'remarketingListIds'
        end
      end
      
      class DefaultClickThroughEventTagProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_click_through_event_tag_id, :numeric_string => true, as: 'defaultClickThroughEventTagId'
          property :override_inherited_event_tag, as: 'overrideInheritedEventTag'
        end
      end
      
      class DeliverySchedule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :frequency_cap, as: 'frequencyCap', class: Google::Apis::DfareportingV3_3::FrequencyCap, decorator: Google::Apis::DfareportingV3_3::FrequencyCap::Representation
      
          property :hard_cutoff, as: 'hardCutoff'
          property :impression_ratio, :numeric_string => true, as: 'impressionRatio'
          property :priority, as: 'priority'
        end
      end
      
      class DfpSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dfp_network_code, as: 'dfpNetworkCode'
          property :dfp_network_name, as: 'dfpNetworkName'
          property :programmatic_placement_accepted, as: 'programmaticPlacementAccepted'
          property :pub_paid_placement_accepted, as: 'pubPaidPlacementAccepted'
          property :publisher_portal_only, as: 'publisherPortalOnly'
        end
      end
      
      class Dimension
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class DimensionFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dimension_name, as: 'dimensionName'
          property :kind, as: 'kind'
          property :value, as: 'value'
        end
      end
      
      class DimensionValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dimension_name, as: 'dimensionName'
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :match_type, as: 'matchType'
          property :value, as: 'value'
        end
      end
      
      class DimensionValueList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class DimensionValueRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dimension_name, as: 'dimensionName'
          property :end_date, as: 'endDate', type: Date
      
          collection :filters, as: 'filters', class: Google::Apis::DfareportingV3_3::DimensionFilter, decorator: Google::Apis::DfareportingV3_3::DimensionFilter::Representation
      
          property :kind, as: 'kind'
          property :start_date, as: 'startDate', type: Date
      
        end
      end
      
      class DirectorySite
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :active, as: 'active'
          property :id, :numeric_string => true, as: 'id'
          property :id_dimension_value, as: 'idDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          collection :inpage_tag_formats, as: 'inpageTagFormats'
          collection :interstitial_tag_formats, as: 'interstitialTagFormats'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :settings, as: 'settings', class: Google::Apis::DfareportingV3_3::DirectorySiteSettings, decorator: Google::Apis::DfareportingV3_3::DirectorySiteSettings::Representation
      
          property :url, as: 'url'
        end
      end
      
      class DirectorySiteSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :active_view_opt_out, as: 'activeViewOptOut'
          property :dfp_settings, as: 'dfpSettings', class: Google::Apis::DfareportingV3_3::DfpSettings, decorator: Google::Apis::DfareportingV3_3::DfpSettings::Representation
      
          property :instream_video_placement_accepted, as: 'instreamVideoPlacementAccepted'
          property :interstitial_placement_accepted, as: 'interstitialPlacementAccepted'
        end
      end
      
      class DirectorySitesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :directory_sites, as: 'directorySites', class: Google::Apis::DfareportingV3_3::DirectorySite, decorator: Google::Apis::DfareportingV3_3::DirectorySite::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class DynamicTargetingKey
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :object_id_prop, :numeric_string => true, as: 'objectId'
          property :object_type, as: 'objectType'
        end
      end
      
      class DynamicTargetingKeysListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :dynamic_targeting_keys, as: 'dynamicTargetingKeys', class: Google::Apis::DfareportingV3_3::DynamicTargetingKey, decorator: Google::Apis::DfareportingV3_3::DynamicTargetingKey::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class EncryptionInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :encryption_entity_id, :numeric_string => true, as: 'encryptionEntityId'
          property :encryption_entity_type, as: 'encryptionEntityType'
          property :encryption_source, as: 'encryptionSource'
          property :kind, as: 'kind'
        end
      end
      
      class EventTag
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :advertiser_id_dimension_value, as: 'advertiserIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :campaign_id, :numeric_string => true, as: 'campaignId'
          property :campaign_id_dimension_value, as: 'campaignIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :enabled_by_default, as: 'enabledByDefault'
          property :exclude_from_adx_requests, as: 'excludeFromAdxRequests'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :site_filter_type, as: 'siteFilterType'
          collection :site_ids, as: 'siteIds'
          property :ssl_compliant, as: 'sslCompliant'
          property :status, as: 'status'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :type, as: 'type'
          property :url, as: 'url'
          property :url_escape_levels, as: 'urlEscapeLevels'
        end
      end
      
      class EventTagOverride
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enabled, as: 'enabled'
          property :id, :numeric_string => true, as: 'id'
        end
      end
      
      class EventTagsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :event_tags, as: 'eventTags', class: Google::Apis::DfareportingV3_3::EventTag, decorator: Google::Apis::DfareportingV3_3::EventTag::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class File
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :date_range, as: 'dateRange', class: Google::Apis::DfareportingV3_3::DateRange, decorator: Google::Apis::DfareportingV3_3::DateRange::Representation
      
          property :etag, as: 'etag'
          property :file_name, as: 'fileName'
          property :format, as: 'format'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :last_modified_time, :numeric_string => true, as: 'lastModifiedTime'
          property :report_id, :numeric_string => true, as: 'reportId'
          property :status, as: 'status'
          property :urls, as: 'urls', class: Google::Apis::DfareportingV3_3::File::Urls, decorator: Google::Apis::DfareportingV3_3::File::Urls::Representation
      
        end
        
        class Urls
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :api_url, as: 'apiUrl'
            property :browser_url, as: 'browserUrl'
          end
        end
      end
      
      class FileList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::DfareportingV3_3::File, decorator: Google::Apis::DfareportingV3_3::File::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Flight
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_date, as: 'endDate', type: Date
      
          property :rate_or_cost, :numeric_string => true, as: 'rateOrCost'
          property :start_date, as: 'startDate', type: Date
      
          property :units, :numeric_string => true, as: 'units'
        end
      end
      
      class FloodlightActivitiesGenerateTagResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :floodlight_activity_tag, as: 'floodlightActivityTag'
          property :global_site_tag_global_snippet, as: 'globalSiteTagGlobalSnippet'
          property :kind, as: 'kind'
        end
      end
      
      class FloodlightActivitiesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :floodlight_activities, as: 'floodlightActivities', class: Google::Apis::DfareportingV3_3::FloodlightActivity, decorator: Google::Apis::DfareportingV3_3::FloodlightActivity::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class FloodlightActivity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :advertiser_id_dimension_value, as: 'advertiserIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :cache_busting_type, as: 'cacheBustingType'
          property :counting_method, as: 'countingMethod'
          collection :default_tags, as: 'defaultTags', class: Google::Apis::DfareportingV3_3::FloodlightActivityDynamicTag, decorator: Google::Apis::DfareportingV3_3::FloodlightActivityDynamicTag::Representation
      
          property :expected_url, as: 'expectedUrl'
          property :floodlight_activity_group_id, :numeric_string => true, as: 'floodlightActivityGroupId'
          property :floodlight_activity_group_name, as: 'floodlightActivityGroupName'
          property :floodlight_activity_group_tag_string, as: 'floodlightActivityGroupTagString'
          property :floodlight_activity_group_type, as: 'floodlightActivityGroupType'
          property :floodlight_configuration_id, :numeric_string => true, as: 'floodlightConfigurationId'
          property :floodlight_configuration_id_dimension_value, as: 'floodlightConfigurationIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :floodlight_tag_type, as: 'floodlightTagType'
          property :hidden, as: 'hidden'
          property :id, :numeric_string => true, as: 'id'
          property :id_dimension_value, as: 'idDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :notes, as: 'notes'
          collection :publisher_tags, as: 'publisherTags', class: Google::Apis::DfareportingV3_3::FloodlightActivityPublisherDynamicTag, decorator: Google::Apis::DfareportingV3_3::FloodlightActivityPublisherDynamicTag::Representation
      
          property :secure, as: 'secure'
          property :ssl_compliant, as: 'sslCompliant'
          property :ssl_required, as: 'sslRequired'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :tag_format, as: 'tagFormat'
          property :tag_string, as: 'tagString'
          collection :user_defined_variable_types, as: 'userDefinedVariableTypes'
        end
      end
      
      class FloodlightActivityDynamicTag
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          property :name, as: 'name'
          property :tag, as: 'tag'
        end
      end
      
      class FloodlightActivityGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :advertiser_id_dimension_value, as: 'advertiserIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :floodlight_configuration_id, :numeric_string => true, as: 'floodlightConfigurationId'
          property :floodlight_configuration_id_dimension_value, as: 'floodlightConfigurationIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :id_dimension_value, as: 'idDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :tag_string, as: 'tagString'
          property :type, as: 'type'
        end
      end
      
      class FloodlightActivityGroupsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :floodlight_activity_groups, as: 'floodlightActivityGroups', class: Google::Apis::DfareportingV3_3::FloodlightActivityGroup, decorator: Google::Apis::DfareportingV3_3::FloodlightActivityGroup::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class FloodlightActivityPublisherDynamicTag
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :click_through, as: 'clickThrough'
          property :directory_site_id, :numeric_string => true, as: 'directorySiteId'
          property :dynamic_tag, as: 'dynamicTag', class: Google::Apis::DfareportingV3_3::FloodlightActivityDynamicTag, decorator: Google::Apis::DfareportingV3_3::FloodlightActivityDynamicTag::Representation
      
          property :site_id, :numeric_string => true, as: 'siteId'
          property :site_id_dimension_value, as: 'siteIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :view_through, as: 'viewThrough'
        end
      end
      
      class FloodlightConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :advertiser_id_dimension_value, as: 'advertiserIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :analytics_data_sharing_enabled, as: 'analyticsDataSharingEnabled'
          property :custom_viewability_metric, as: 'customViewabilityMetric', class: Google::Apis::DfareportingV3_3::CustomViewabilityMetric, decorator: Google::Apis::DfareportingV3_3::CustomViewabilityMetric::Representation
      
          property :exposure_to_conversion_enabled, as: 'exposureToConversionEnabled'
          property :first_day_of_week, as: 'firstDayOfWeek'
          property :id, :numeric_string => true, as: 'id'
          property :id_dimension_value, as: 'idDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :in_app_attribution_tracking_enabled, as: 'inAppAttributionTrackingEnabled'
          property :kind, as: 'kind'
          property :lookback_configuration, as: 'lookbackConfiguration', class: Google::Apis::DfareportingV3_3::LookbackConfiguration, decorator: Google::Apis::DfareportingV3_3::LookbackConfiguration::Representation
      
          property :natural_search_conversion_attribution_option, as: 'naturalSearchConversionAttributionOption'
          property :omniture_settings, as: 'omnitureSettings', class: Google::Apis::DfareportingV3_3::OmnitureSettings, decorator: Google::Apis::DfareportingV3_3::OmnitureSettings::Representation
      
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :tag_settings, as: 'tagSettings', class: Google::Apis::DfareportingV3_3::TagSettings, decorator: Google::Apis::DfareportingV3_3::TagSettings::Representation
      
          collection :third_party_authentication_tokens, as: 'thirdPartyAuthenticationTokens', class: Google::Apis::DfareportingV3_3::ThirdPartyAuthenticationToken, decorator: Google::Apis::DfareportingV3_3::ThirdPartyAuthenticationToken::Representation
      
          collection :user_defined_variable_configurations, as: 'userDefinedVariableConfigurations', class: Google::Apis::DfareportingV3_3::UserDefinedVariableConfiguration, decorator: Google::Apis::DfareportingV3_3::UserDefinedVariableConfiguration::Representation
      
        end
      end
      
      class FloodlightConfigurationsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :floodlight_configurations, as: 'floodlightConfigurations', class: Google::Apis::DfareportingV3_3::FloodlightConfiguration, decorator: Google::Apis::DfareportingV3_3::FloodlightConfiguration::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class FloodlightReportCompatibleFields
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :dimension_filters, as: 'dimensionFilters', class: Google::Apis::DfareportingV3_3::Dimension, decorator: Google::Apis::DfareportingV3_3::Dimension::Representation
      
          collection :dimensions, as: 'dimensions', class: Google::Apis::DfareportingV3_3::Dimension, decorator: Google::Apis::DfareportingV3_3::Dimension::Representation
      
          property :kind, as: 'kind'
          collection :metrics, as: 'metrics', class: Google::Apis::DfareportingV3_3::Metric, decorator: Google::Apis::DfareportingV3_3::Metric::Representation
      
        end
      end
      
      class FrequencyCap
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :duration, :numeric_string => true, as: 'duration'
          property :impressions, :numeric_string => true, as: 'impressions'
        end
      end
      
      class FsCommand
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :left, as: 'left'
          property :position_option, as: 'positionOption'
          property :top, as: 'top'
          property :window_height, as: 'windowHeight'
          property :window_width, as: 'windowWidth'
        end
      end
      
      class GeoTargeting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :cities, as: 'cities', class: Google::Apis::DfareportingV3_3::City, decorator: Google::Apis::DfareportingV3_3::City::Representation
      
          collection :countries, as: 'countries', class: Google::Apis::DfareportingV3_3::Country, decorator: Google::Apis::DfareportingV3_3::Country::Representation
      
          property :exclude_countries, as: 'excludeCountries'
          collection :metros, as: 'metros', class: Google::Apis::DfareportingV3_3::Metro, decorator: Google::Apis::DfareportingV3_3::Metro::Representation
      
          collection :postal_codes, as: 'postalCodes', class: Google::Apis::DfareportingV3_3::PostalCode, decorator: Google::Apis::DfareportingV3_3::PostalCode::Representation
      
          collection :regions, as: 'regions', class: Google::Apis::DfareportingV3_3::Region, decorator: Google::Apis::DfareportingV3_3::Region::Representation
      
        end
      end
      
      class InventoryItem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          collection :ad_slots, as: 'adSlots', class: Google::Apis::DfareportingV3_3::AdSlot, decorator: Google::Apis::DfareportingV3_3::AdSlot::Representation
      
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :content_category_id, :numeric_string => true, as: 'contentCategoryId'
          property :estimated_click_through_rate, :numeric_string => true, as: 'estimatedClickThroughRate'
          property :estimated_conversion_rate, :numeric_string => true, as: 'estimatedConversionRate'
          property :id, :numeric_string => true, as: 'id'
          property :in_plan, as: 'inPlan'
          property :kind, as: 'kind'
          property :last_modified_info, as: 'lastModifiedInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          property :name, as: 'name'
          property :negotiation_channel_id, :numeric_string => true, as: 'negotiationChannelId'
          property :order_id, :numeric_string => true, as: 'orderId'
          property :placement_strategy_id, :numeric_string => true, as: 'placementStrategyId'
          property :pricing, as: 'pricing', class: Google::Apis::DfareportingV3_3::Pricing, decorator: Google::Apis::DfareportingV3_3::Pricing::Representation
      
          property :project_id, :numeric_string => true, as: 'projectId'
          property :rfp_id, :numeric_string => true, as: 'rfpId'
          property :site_id, :numeric_string => true, as: 'siteId'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :type, as: 'type'
        end
      end
      
      class InventoryItemsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :inventory_items, as: 'inventoryItems', class: Google::Apis::DfareportingV3_3::InventoryItem, decorator: Google::Apis::DfareportingV3_3::InventoryItem::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class KeyValueTargetingExpression
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expression, as: 'expression'
        end
      end
      
      class LandingPage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :archived, as: 'archived'
          collection :deep_links, as: 'deepLinks', class: Google::Apis::DfareportingV3_3::DeepLink, decorator: Google::Apis::DfareportingV3_3::DeepLink::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :url, as: 'url'
        end
      end
      
      class Language
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :language_code, as: 'languageCode'
          property :name, as: 'name'
        end
      end
      
      class LanguageTargeting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :languages, as: 'languages', class: Google::Apis::DfareportingV3_3::Language, decorator: Google::Apis::DfareportingV3_3::Language::Representation
      
        end
      end
      
      class LanguagesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :languages, as: 'languages', class: Google::Apis::DfareportingV3_3::Language, decorator: Google::Apis::DfareportingV3_3::Language::Representation
      
        end
      end
      
      class LastModifiedInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :time, :numeric_string => true, as: 'time'
        end
      end
      
      class ListPopulationClause
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :terms, as: 'terms', class: Google::Apis::DfareportingV3_3::ListPopulationTerm, decorator: Google::Apis::DfareportingV3_3::ListPopulationTerm::Representation
      
        end
      end
      
      class ListPopulationRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :floodlight_activity_id, :numeric_string => true, as: 'floodlightActivityId'
          property :floodlight_activity_name, as: 'floodlightActivityName'
          collection :list_population_clauses, as: 'listPopulationClauses', class: Google::Apis::DfareportingV3_3::ListPopulationClause, decorator: Google::Apis::DfareportingV3_3::ListPopulationClause::Representation
      
        end
      end
      
      class ListPopulationTerm
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contains, as: 'contains'
          property :negation, as: 'negation'
          property :operator, as: 'operator'
          property :remarketing_list_id, :numeric_string => true, as: 'remarketingListId'
          property :type, as: 'type'
          property :value, as: 'value'
          property :variable_friendly_name, as: 'variableFriendlyName'
          property :variable_name, as: 'variableName'
        end
      end
      
      class ListTargetingExpression
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expression, as: 'expression'
        end
      end
      
      class LookbackConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :click_duration, as: 'clickDuration'
          property :post_impression_activities_duration, as: 'postImpressionActivitiesDuration'
        end
      end
      
      class Metric
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class Metro
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country_code, as: 'countryCode'
          property :country_dart_id, :numeric_string => true, as: 'countryDartId'
          property :dart_id, :numeric_string => true, as: 'dartId'
          property :dma_id, :numeric_string => true, as: 'dmaId'
          property :kind, as: 'kind'
          property :metro_code, as: 'metroCode'
          property :name, as: 'name'
        end
      end
      
      class MetrosListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :metros, as: 'metros', class: Google::Apis::DfareportingV3_3::Metro, decorator: Google::Apis::DfareportingV3_3::Metro::Representation
      
        end
      end
      
      class MobileApp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :directory, as: 'directory'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :publisher_name, as: 'publisherName'
          property :title, as: 'title'
        end
      end
      
      class MobileAppsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :mobile_apps, as: 'mobileApps', class: Google::Apis::DfareportingV3_3::MobileApp, decorator: Google::Apis::DfareportingV3_3::MobileApp::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class MobileCarrier
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country_code, as: 'countryCode'
          property :country_dart_id, :numeric_string => true, as: 'countryDartId'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class MobileCarriersListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :mobile_carriers, as: 'mobileCarriers', class: Google::Apis::DfareportingV3_3::MobileCarrier, decorator: Google::Apis::DfareportingV3_3::MobileCarrier::Representation
      
        end
      end
      
      class ObjectFilter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :object_ids, as: 'objectIds'
          property :status, as: 'status'
        end
      end
      
      class OffsetPosition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :left, as: 'left'
          property :top, as: 'top'
        end
      end
      
      class OmnitureSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :omniture_cost_data_enabled, as: 'omnitureCostDataEnabled'
          property :omniture_integration_enabled, as: 'omnitureIntegrationEnabled'
        end
      end
      
      class OperatingSystem
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dart_id, :numeric_string => true, as: 'dartId'
          property :desktop, as: 'desktop'
          property :kind, as: 'kind'
          property :mobile, as: 'mobile'
          property :name, as: 'name'
        end
      end
      
      class OperatingSystemVersion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :major_version, as: 'majorVersion'
          property :minor_version, as: 'minorVersion'
          property :name, as: 'name'
          property :operating_system, as: 'operatingSystem', class: Google::Apis::DfareportingV3_3::OperatingSystem, decorator: Google::Apis::DfareportingV3_3::OperatingSystem::Representation
      
        end
      end
      
      class OperatingSystemVersionsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :operating_system_versions, as: 'operatingSystemVersions', class: Google::Apis::DfareportingV3_3::OperatingSystemVersion, decorator: Google::Apis::DfareportingV3_3::OperatingSystemVersion::Representation
      
        end
      end
      
      class OperatingSystemsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :operating_systems, as: 'operatingSystems', class: Google::Apis::DfareportingV3_3::OperatingSystem, decorator: Google::Apis::DfareportingV3_3::OperatingSystem::Representation
      
        end
      end
      
      class OptimizationActivity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :floodlight_activity_id, :numeric_string => true, as: 'floodlightActivityId'
          property :floodlight_activity_id_dimension_value, as: 'floodlightActivityIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :weight, as: 'weight'
        end
      end
      
      class Order
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          collection :approver_user_profile_ids, as: 'approverUserProfileIds'
          property :buyer_invoice_id, as: 'buyerInvoiceId'
          property :buyer_organization_name, as: 'buyerOrganizationName'
          property :comments, as: 'comments'
          collection :contacts, as: 'contacts', class: Google::Apis::DfareportingV3_3::OrderContact, decorator: Google::Apis::DfareportingV3_3::OrderContact::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :last_modified_info, as: 'lastModifiedInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          property :name, as: 'name'
          property :notes, as: 'notes'
          property :planning_term_id, :numeric_string => true, as: 'planningTermId'
          property :project_id, :numeric_string => true, as: 'projectId'
          property :seller_order_id, as: 'sellerOrderId'
          property :seller_organization_name, as: 'sellerOrganizationName'
          collection :site_id, as: 'siteId'
          collection :site_names, as: 'siteNames'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :terms_and_conditions, as: 'termsAndConditions'
        end
      end
      
      class OrderContact
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contact_info, as: 'contactInfo'
          property :contact_name, as: 'contactName'
          property :contact_title, as: 'contactTitle'
          property :contact_type, as: 'contactType'
          property :signature_user_profile_id, :numeric_string => true, as: 'signatureUserProfileId'
        end
      end
      
      class OrderDocument
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :amended_order_document_id, :numeric_string => true, as: 'amendedOrderDocumentId'
          collection :approved_by_user_profile_ids, as: 'approvedByUserProfileIds'
          property :cancelled, as: 'cancelled'
          property :created_info, as: 'createdInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          property :effective_date, as: 'effectiveDate', type: Date
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          collection :last_sent_recipients, as: 'lastSentRecipients'
          property :last_sent_time, as: 'lastSentTime', type: DateTime
      
          property :order_id, :numeric_string => true, as: 'orderId'
          property :project_id, :numeric_string => true, as: 'projectId'
          property :signed, as: 'signed'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :title, as: 'title'
          property :type, as: 'type'
        end
      end
      
      class OrderDocumentsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :order_documents, as: 'orderDocuments', class: Google::Apis::DfareportingV3_3::OrderDocument, decorator: Google::Apis::DfareportingV3_3::OrderDocument::Representation
      
        end
      end
      
      class OrdersListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :orders, as: 'orders', class: Google::Apis::DfareportingV3_3::Order, decorator: Google::Apis::DfareportingV3_3::Order::Representation
      
        end
      end
      
      class PathToConversionReportCompatibleFields
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :conversion_dimensions, as: 'conversionDimensions', class: Google::Apis::DfareportingV3_3::Dimension, decorator: Google::Apis::DfareportingV3_3::Dimension::Representation
      
          collection :custom_floodlight_variables, as: 'customFloodlightVariables', class: Google::Apis::DfareportingV3_3::Dimension, decorator: Google::Apis::DfareportingV3_3::Dimension::Representation
      
          property :kind, as: 'kind'
          collection :metrics, as: 'metrics', class: Google::Apis::DfareportingV3_3::Metric, decorator: Google::Apis::DfareportingV3_3::Metric::Representation
      
          collection :per_interaction_dimensions, as: 'perInteractionDimensions', class: Google::Apis::DfareportingV3_3::Dimension, decorator: Google::Apis::DfareportingV3_3::Dimension::Representation
      
        end
      end
      
      class Placement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :ad_blocking_opt_out, as: 'adBlockingOptOut'
          collection :additional_sizes, as: 'additionalSizes', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :advertiser_id_dimension_value, as: 'advertiserIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :archived, as: 'archived'
          property :campaign_id, :numeric_string => true, as: 'campaignId'
          property :campaign_id_dimension_value, as: 'campaignIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :comment, as: 'comment'
          property :compatibility, as: 'compatibility'
          property :content_category_id, :numeric_string => true, as: 'contentCategoryId'
          property :create_info, as: 'createInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          property :directory_site_id, :numeric_string => true, as: 'directorySiteId'
          property :directory_site_id_dimension_value, as: 'directorySiteIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :external_id, as: 'externalId'
          property :id, :numeric_string => true, as: 'id'
          property :id_dimension_value, as: 'idDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :key_name, as: 'keyName'
          property :kind, as: 'kind'
          property :last_modified_info, as: 'lastModifiedInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          property :lookback_configuration, as: 'lookbackConfiguration', class: Google::Apis::DfareportingV3_3::LookbackConfiguration, decorator: Google::Apis::DfareportingV3_3::LookbackConfiguration::Representation
      
          property :name, as: 'name'
          property :payment_approved, as: 'paymentApproved'
          property :payment_source, as: 'paymentSource'
          property :placement_group_id, :numeric_string => true, as: 'placementGroupId'
          property :placement_group_id_dimension_value, as: 'placementGroupIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :placement_strategy_id, :numeric_string => true, as: 'placementStrategyId'
          property :pricing_schedule, as: 'pricingSchedule', class: Google::Apis::DfareportingV3_3::PricingSchedule, decorator: Google::Apis::DfareportingV3_3::PricingSchedule::Representation
      
          property :primary, as: 'primary'
          property :publisher_update_info, as: 'publisherUpdateInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          property :site_id, :numeric_string => true, as: 'siteId'
          property :site_id_dimension_value, as: 'siteIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :size, as: 'size', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
          property :ssl_required, as: 'sslRequired'
          property :status, as: 'status'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          collection :tag_formats, as: 'tagFormats'
          property :tag_setting, as: 'tagSetting', class: Google::Apis::DfareportingV3_3::TagSetting, decorator: Google::Apis::DfareportingV3_3::TagSetting::Representation
      
          property :video_active_view_opt_out, as: 'videoActiveViewOptOut'
          property :video_settings, as: 'videoSettings', class: Google::Apis::DfareportingV3_3::VideoSettings, decorator: Google::Apis::DfareportingV3_3::VideoSettings::Representation
      
          property :vpaid_adapter_choice, as: 'vpaidAdapterChoice'
        end
      end
      
      class PlacementAssignment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :active, as: 'active'
          property :placement_id, :numeric_string => true, as: 'placementId'
          property :placement_id_dimension_value, as: 'placementIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :ssl_required, as: 'sslRequired'
        end
      end
      
      class PlacementGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :advertiser_id_dimension_value, as: 'advertiserIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :archived, as: 'archived'
          property :campaign_id, :numeric_string => true, as: 'campaignId'
          property :campaign_id_dimension_value, as: 'campaignIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          collection :child_placement_ids, as: 'childPlacementIds'
          property :comment, as: 'comment'
          property :content_category_id, :numeric_string => true, as: 'contentCategoryId'
          property :create_info, as: 'createInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          property :directory_site_id, :numeric_string => true, as: 'directorySiteId'
          property :directory_site_id_dimension_value, as: 'directorySiteIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :external_id, as: 'externalId'
          property :id, :numeric_string => true, as: 'id'
          property :id_dimension_value, as: 'idDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :kind, as: 'kind'
          property :last_modified_info, as: 'lastModifiedInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          property :name, as: 'name'
          property :placement_group_type, as: 'placementGroupType'
          property :placement_strategy_id, :numeric_string => true, as: 'placementStrategyId'
          property :pricing_schedule, as: 'pricingSchedule', class: Google::Apis::DfareportingV3_3::PricingSchedule, decorator: Google::Apis::DfareportingV3_3::PricingSchedule::Representation
      
          property :primary_placement_id, :numeric_string => true, as: 'primaryPlacementId'
          property :primary_placement_id_dimension_value, as: 'primaryPlacementIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :site_id, :numeric_string => true, as: 'siteId'
          property :site_id_dimension_value, as: 'siteIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
        end
      end
      
      class PlacementGroupsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :placement_groups, as: 'placementGroups', class: Google::Apis::DfareportingV3_3::PlacementGroup, decorator: Google::Apis::DfareportingV3_3::PlacementGroup::Representation
      
        end
      end
      
      class PlacementStrategiesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :placement_strategies, as: 'placementStrategies', class: Google::Apis::DfareportingV3_3::PlacementStrategy, decorator: Google::Apis::DfareportingV3_3::PlacementStrategy::Representation
      
        end
      end
      
      class PlacementStrategy
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class PlacementTag
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :placement_id, :numeric_string => true, as: 'placementId'
          collection :tag_datas, as: 'tagDatas', class: Google::Apis::DfareportingV3_3::TagData, decorator: Google::Apis::DfareportingV3_3::TagData::Representation
      
        end
      end
      
      class PlacementsGenerateTagsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :placement_tags, as: 'placementTags', class: Google::Apis::DfareportingV3_3::PlacementTag, decorator: Google::Apis::DfareportingV3_3::PlacementTag::Representation
      
        end
      end
      
      class PlacementsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :placements, as: 'placements', class: Google::Apis::DfareportingV3_3::Placement, decorator: Google::Apis::DfareportingV3_3::Placement::Representation
      
        end
      end
      
      class PlatformType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class PlatformTypesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :platform_types, as: 'platformTypes', class: Google::Apis::DfareportingV3_3::PlatformType, decorator: Google::Apis::DfareportingV3_3::PlatformType::Representation
      
        end
      end
      
      class PopupWindowProperties
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dimension, as: 'dimension', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
          property :offset, as: 'offset', class: Google::Apis::DfareportingV3_3::OffsetPosition, decorator: Google::Apis::DfareportingV3_3::OffsetPosition::Representation
      
          property :position_type, as: 'positionType'
          property :show_address_bar, as: 'showAddressBar'
          property :show_menu_bar, as: 'showMenuBar'
          property :show_scroll_bar, as: 'showScrollBar'
          property :show_status_bar, as: 'showStatusBar'
          property :show_tool_bar, as: 'showToolBar'
          property :title, as: 'title'
        end
      end
      
      class PostalCode
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :country_code, as: 'countryCode'
          property :country_dart_id, :numeric_string => true, as: 'countryDartId'
          property :id, as: 'id'
          property :kind, as: 'kind'
        end
      end
      
      class PostalCodesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :postal_codes, as: 'postalCodes', class: Google::Apis::DfareportingV3_3::PostalCode, decorator: Google::Apis::DfareportingV3_3::PostalCode::Representation
      
        end
      end
      
      class Pricing
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cap_cost_type, as: 'capCostType'
          property :end_date, as: 'endDate', type: Date
      
          collection :flights, as: 'flights', class: Google::Apis::DfareportingV3_3::Flight, decorator: Google::Apis::DfareportingV3_3::Flight::Representation
      
          property :group_type, as: 'groupType'
          property :pricing_type, as: 'pricingType'
          property :start_date, as: 'startDate', type: Date
      
        end
      end
      
      class PricingSchedule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cap_cost_option, as: 'capCostOption'
          property :disregard_overdelivery, as: 'disregardOverdelivery'
          property :end_date, as: 'endDate', type: Date
      
          property :flighted, as: 'flighted'
          property :floodlight_activity_id, :numeric_string => true, as: 'floodlightActivityId'
          collection :pricing_periods, as: 'pricingPeriods', class: Google::Apis::DfareportingV3_3::PricingSchedulePricingPeriod, decorator: Google::Apis::DfareportingV3_3::PricingSchedulePricingPeriod::Representation
      
          property :pricing_type, as: 'pricingType'
          property :start_date, as: 'startDate', type: Date
      
          property :testing_start_date, as: 'testingStartDate', type: Date
      
        end
      end
      
      class PricingSchedulePricingPeriod
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_date, as: 'endDate', type: Date
      
          property :pricing_comment, as: 'pricingComment'
          property :rate_or_cost_nanos, :numeric_string => true, as: 'rateOrCostNanos'
          property :start_date, as: 'startDate', type: Date
      
          property :units, :numeric_string => true, as: 'units'
        end
      end
      
      class Project
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :audience_age_group, as: 'audienceAgeGroup'
          property :audience_gender, as: 'audienceGender'
          property :budget, :numeric_string => true, as: 'budget'
          property :client_billing_code, as: 'clientBillingCode'
          property :client_name, as: 'clientName'
          property :end_date, as: 'endDate', type: Date
      
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :last_modified_info, as: 'lastModifiedInfo', class: Google::Apis::DfareportingV3_3::LastModifiedInfo, decorator: Google::Apis::DfareportingV3_3::LastModifiedInfo::Representation
      
          property :name, as: 'name'
          property :overview, as: 'overview'
          property :start_date, as: 'startDate', type: Date
      
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :target_clicks, :numeric_string => true, as: 'targetClicks'
          property :target_conversions, :numeric_string => true, as: 'targetConversions'
          property :target_cpa_nanos, :numeric_string => true, as: 'targetCpaNanos'
          property :target_cpc_nanos, :numeric_string => true, as: 'targetCpcNanos'
          property :target_cpm_active_view_nanos, :numeric_string => true, as: 'targetCpmActiveViewNanos'
          property :target_cpm_nanos, :numeric_string => true, as: 'targetCpmNanos'
          property :target_impressions, :numeric_string => true, as: 'targetImpressions'
        end
      end
      
      class ProjectsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :projects, as: 'projects', class: Google::Apis::DfareportingV3_3::Project, decorator: Google::Apis::DfareportingV3_3::Project::Representation
      
        end
      end
      
      class ReachReportCompatibleFields
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :dimension_filters, as: 'dimensionFilters', class: Google::Apis::DfareportingV3_3::Dimension, decorator: Google::Apis::DfareportingV3_3::Dimension::Representation
      
          collection :dimensions, as: 'dimensions', class: Google::Apis::DfareportingV3_3::Dimension, decorator: Google::Apis::DfareportingV3_3::Dimension::Representation
      
          property :kind, as: 'kind'
          collection :metrics, as: 'metrics', class: Google::Apis::DfareportingV3_3::Metric, decorator: Google::Apis::DfareportingV3_3::Metric::Representation
      
          collection :pivoted_activity_metrics, as: 'pivotedActivityMetrics', class: Google::Apis::DfareportingV3_3::Metric, decorator: Google::Apis::DfareportingV3_3::Metric::Representation
      
          collection :reach_by_frequency_metrics, as: 'reachByFrequencyMetrics', class: Google::Apis::DfareportingV3_3::Metric, decorator: Google::Apis::DfareportingV3_3::Metric::Representation
      
        end
      end
      
      class Recipient
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :delivery_type, as: 'deliveryType'
          property :email, as: 'email'
          property :kind, as: 'kind'
        end
      end
      
      class Region
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :country_code, as: 'countryCode'
          property :country_dart_id, :numeric_string => true, as: 'countryDartId'
          property :dart_id, :numeric_string => true, as: 'dartId'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :region_code, as: 'regionCode'
        end
      end
      
      class RegionsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :regions, as: 'regions', class: Google::Apis::DfareportingV3_3::Region, decorator: Google::Apis::DfareportingV3_3::Region::Representation
      
        end
      end
      
      class RemarketingList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :active, as: 'active'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :advertiser_id_dimension_value, as: 'advertiserIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :life_span, :numeric_string => true, as: 'lifeSpan'
          property :list_population_rule, as: 'listPopulationRule', class: Google::Apis::DfareportingV3_3::ListPopulationRule, decorator: Google::Apis::DfareportingV3_3::ListPopulationRule::Representation
      
          property :list_size, :numeric_string => true, as: 'listSize'
          property :list_source, as: 'listSource'
          property :name, as: 'name'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
        end
      end
      
      class RemarketingListShare
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :remarketing_list_id, :numeric_string => true, as: 'remarketingListId'
          collection :shared_account_ids, as: 'sharedAccountIds'
          collection :shared_advertiser_ids, as: 'sharedAdvertiserIds'
        end
      end
      
      class RemarketingListsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :remarketing_lists, as: 'remarketingLists', class: Google::Apis::DfareportingV3_3::RemarketingList, decorator: Google::Apis::DfareportingV3_3::RemarketingList::Representation
      
        end
      end
      
      class Report
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :criteria, as: 'criteria', class: Google::Apis::DfareportingV3_3::Report::Criteria, decorator: Google::Apis::DfareportingV3_3::Report::Criteria::Representation
      
          property :cross_dimension_reach_criteria, as: 'crossDimensionReachCriteria', class: Google::Apis::DfareportingV3_3::Report::CrossDimensionReachCriteria, decorator: Google::Apis::DfareportingV3_3::Report::CrossDimensionReachCriteria::Representation
      
          property :delivery, as: 'delivery', class: Google::Apis::DfareportingV3_3::Report::Delivery, decorator: Google::Apis::DfareportingV3_3::Report::Delivery::Representation
      
          property :etag, as: 'etag'
          property :file_name, as: 'fileName'
          property :floodlight_criteria, as: 'floodlightCriteria', class: Google::Apis::DfareportingV3_3::Report::FloodlightCriteria, decorator: Google::Apis::DfareportingV3_3::Report::FloodlightCriteria::Representation
      
          property :format, as: 'format'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :last_modified_time, :numeric_string => true, as: 'lastModifiedTime'
          property :name, as: 'name'
          property :owner_profile_id, :numeric_string => true, as: 'ownerProfileId'
          property :path_to_conversion_criteria, as: 'pathToConversionCriteria', class: Google::Apis::DfareportingV3_3::Report::PathToConversionCriteria, decorator: Google::Apis::DfareportingV3_3::Report::PathToConversionCriteria::Representation
      
          property :reach_criteria, as: 'reachCriteria', class: Google::Apis::DfareportingV3_3::Report::ReachCriteria, decorator: Google::Apis::DfareportingV3_3::Report::ReachCriteria::Representation
      
          property :schedule, as: 'schedule', class: Google::Apis::DfareportingV3_3::Report::Schedule, decorator: Google::Apis::DfareportingV3_3::Report::Schedule::Representation
      
          property :sub_account_id, :numeric_string => true, as: 'subAccountId'
          property :type, as: 'type'
        end
        
        class Criteria
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :activities, as: 'activities', class: Google::Apis::DfareportingV3_3::Activities, decorator: Google::Apis::DfareportingV3_3::Activities::Representation
        
            property :custom_rich_media_events, as: 'customRichMediaEvents', class: Google::Apis::DfareportingV3_3::CustomRichMediaEvents, decorator: Google::Apis::DfareportingV3_3::CustomRichMediaEvents::Representation
        
            property :date_range, as: 'dateRange', class: Google::Apis::DfareportingV3_3::DateRange, decorator: Google::Apis::DfareportingV3_3::DateRange::Representation
        
            collection :dimension_filters, as: 'dimensionFilters', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
        
            collection :dimensions, as: 'dimensions', class: Google::Apis::DfareportingV3_3::SortedDimension, decorator: Google::Apis::DfareportingV3_3::SortedDimension::Representation
        
            collection :metric_names, as: 'metricNames'
          end
        end
        
        class CrossDimensionReachCriteria
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :breakdown, as: 'breakdown', class: Google::Apis::DfareportingV3_3::SortedDimension, decorator: Google::Apis::DfareportingV3_3::SortedDimension::Representation
        
            property :date_range, as: 'dateRange', class: Google::Apis::DfareportingV3_3::DateRange, decorator: Google::Apis::DfareportingV3_3::DateRange::Representation
        
            property :dimension, as: 'dimension'
            collection :dimension_filters, as: 'dimensionFilters', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
        
            collection :metric_names, as: 'metricNames'
            collection :overlap_metric_names, as: 'overlapMetricNames'
            property :pivoted, as: 'pivoted'
          end
        end
        
        class Delivery
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :email_owner, as: 'emailOwner'
            property :email_owner_delivery_type, as: 'emailOwnerDeliveryType'
            property :message, as: 'message'
            collection :recipients, as: 'recipients', class: Google::Apis::DfareportingV3_3::Recipient, decorator: Google::Apis::DfareportingV3_3::Recipient::Representation
        
          end
        end
        
        class FloodlightCriteria
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :custom_rich_media_events, as: 'customRichMediaEvents', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
        
            property :date_range, as: 'dateRange', class: Google::Apis::DfareportingV3_3::DateRange, decorator: Google::Apis::DfareportingV3_3::DateRange::Representation
        
            collection :dimension_filters, as: 'dimensionFilters', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
        
            collection :dimensions, as: 'dimensions', class: Google::Apis::DfareportingV3_3::SortedDimension, decorator: Google::Apis::DfareportingV3_3::SortedDimension::Representation
        
            property :floodlight_config_id, as: 'floodlightConfigId', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
        
            collection :metric_names, as: 'metricNames'
            property :report_properties, as: 'reportProperties', class: Google::Apis::DfareportingV3_3::Report::FloodlightCriteria::ReportProperties, decorator: Google::Apis::DfareportingV3_3::Report::FloodlightCriteria::ReportProperties::Representation
        
          end
          
          class ReportProperties
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :include_attributed_ip_conversions, as: 'includeAttributedIPConversions'
              property :include_unattributed_cookie_conversions, as: 'includeUnattributedCookieConversions'
              property :include_unattributed_ip_conversions, as: 'includeUnattributedIPConversions'
            end
          end
        end
        
        class PathToConversionCriteria
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :activity_filters, as: 'activityFilters', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
        
            collection :conversion_dimensions, as: 'conversionDimensions', class: Google::Apis::DfareportingV3_3::SortedDimension, decorator: Google::Apis::DfareportingV3_3::SortedDimension::Representation
        
            collection :custom_floodlight_variables, as: 'customFloodlightVariables', class: Google::Apis::DfareportingV3_3::SortedDimension, decorator: Google::Apis::DfareportingV3_3::SortedDimension::Representation
        
            collection :custom_rich_media_events, as: 'customRichMediaEvents', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
        
            property :date_range, as: 'dateRange', class: Google::Apis::DfareportingV3_3::DateRange, decorator: Google::Apis::DfareportingV3_3::DateRange::Representation
        
            property :floodlight_config_id, as: 'floodlightConfigId', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
        
            collection :metric_names, as: 'metricNames'
            collection :per_interaction_dimensions, as: 'perInteractionDimensions', class: Google::Apis::DfareportingV3_3::SortedDimension, decorator: Google::Apis::DfareportingV3_3::SortedDimension::Representation
        
            property :report_properties, as: 'reportProperties', class: Google::Apis::DfareportingV3_3::Report::PathToConversionCriteria::ReportProperties, decorator: Google::Apis::DfareportingV3_3::Report::PathToConversionCriteria::ReportProperties::Representation
        
          end
          
          class ReportProperties
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :clicks_lookback_window, as: 'clicksLookbackWindow'
              property :impressions_lookback_window, as: 'impressionsLookbackWindow'
              property :include_attributed_ip_conversions, as: 'includeAttributedIPConversions'
              property :include_unattributed_cookie_conversions, as: 'includeUnattributedCookieConversions'
              property :include_unattributed_ip_conversions, as: 'includeUnattributedIPConversions'
              property :maximum_click_interactions, as: 'maximumClickInteractions'
              property :maximum_impression_interactions, as: 'maximumImpressionInteractions'
              property :maximum_interaction_gap, as: 'maximumInteractionGap'
              property :pivot_on_interaction_path, as: 'pivotOnInteractionPath'
            end
          end
        end
        
        class ReachCriteria
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :activities, as: 'activities', class: Google::Apis::DfareportingV3_3::Activities, decorator: Google::Apis::DfareportingV3_3::Activities::Representation
        
            property :custom_rich_media_events, as: 'customRichMediaEvents', class: Google::Apis::DfareportingV3_3::CustomRichMediaEvents, decorator: Google::Apis::DfareportingV3_3::CustomRichMediaEvents::Representation
        
            property :date_range, as: 'dateRange', class: Google::Apis::DfareportingV3_3::DateRange, decorator: Google::Apis::DfareportingV3_3::DateRange::Representation
        
            collection :dimension_filters, as: 'dimensionFilters', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
        
            collection :dimensions, as: 'dimensions', class: Google::Apis::DfareportingV3_3::SortedDimension, decorator: Google::Apis::DfareportingV3_3::SortedDimension::Representation
        
            property :enable_all_dimension_combinations, as: 'enableAllDimensionCombinations'
            collection :metric_names, as: 'metricNames'
            collection :reach_by_frequency_metric_names, as: 'reachByFrequencyMetricNames'
          end
        end
        
        class Schedule
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :active, as: 'active'
            property :every, as: 'every'
            property :expiration_date, as: 'expirationDate', type: Date
        
            property :repeats, as: 'repeats'
            collection :repeats_on_week_days, as: 'repeatsOnWeekDays'
            property :runs_on_day_of_month, as: 'runsOnDayOfMonth'
            property :start_date, as: 'startDate', type: Date
        
          end
        end
      end
      
      class ReportCompatibleFields
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :dimension_filters, as: 'dimensionFilters', class: Google::Apis::DfareportingV3_3::Dimension, decorator: Google::Apis::DfareportingV3_3::Dimension::Representation
      
          collection :dimensions, as: 'dimensions', class: Google::Apis::DfareportingV3_3::Dimension, decorator: Google::Apis::DfareportingV3_3::Dimension::Representation
      
          property :kind, as: 'kind'
          collection :metrics, as: 'metrics', class: Google::Apis::DfareportingV3_3::Metric, decorator: Google::Apis::DfareportingV3_3::Metric::Representation
      
          collection :pivoted_activity_metrics, as: 'pivotedActivityMetrics', class: Google::Apis::DfareportingV3_3::Metric, decorator: Google::Apis::DfareportingV3_3::Metric::Representation
      
        end
      end
      
      class ReportList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::DfareportingV3_3::Report, decorator: Google::Apis::DfareportingV3_3::Report::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ReportsConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :exposure_to_conversion_enabled, as: 'exposureToConversionEnabled'
          property :lookback_configuration, as: 'lookbackConfiguration', class: Google::Apis::DfareportingV3_3::LookbackConfiguration, decorator: Google::Apis::DfareportingV3_3::LookbackConfiguration::Representation
      
          property :report_generation_time_zone_id, :numeric_string => true, as: 'reportGenerationTimeZoneId'
        end
      end
      
      class RichMediaExitOverride
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :click_through_url, as: 'clickThroughUrl', class: Google::Apis::DfareportingV3_3::ClickThroughUrl, decorator: Google::Apis::DfareportingV3_3::ClickThroughUrl::Representation
      
          property :enabled, as: 'enabled'
          property :exit_id, :numeric_string => true, as: 'exitId'
        end
      end
      
      class Rule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :asset_id, :numeric_string => true, as: 'assetId'
          property :name, as: 'name'
          property :targeting_template_id, :numeric_string => true, as: 'targetingTemplateId'
        end
      end
      
      class Site
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :approved, as: 'approved'
          property :directory_site_id, :numeric_string => true, as: 'directorySiteId'
          property :directory_site_id_dimension_value, as: 'directorySiteIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :id_dimension_value, as: 'idDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :key_name, as: 'keyName'
          property :kind, as: 'kind'
          property :name, as: 'name'
          collection :site_contacts, as: 'siteContacts', class: Google::Apis::DfareportingV3_3::SiteContact, decorator: Google::Apis::DfareportingV3_3::SiteContact::Representation
      
          property :site_settings, as: 'siteSettings', class: Google::Apis::DfareportingV3_3::SiteSettings, decorator: Google::Apis::DfareportingV3_3::SiteSettings::Representation
      
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :video_settings, as: 'videoSettings', class: Google::Apis::DfareportingV3_3::SiteVideoSettings, decorator: Google::Apis::DfareportingV3_3::SiteVideoSettings::Representation
      
        end
      end
      
      class SiteCompanionSetting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :companions_disabled, as: 'companionsDisabled'
          collection :enabled_sizes, as: 'enabledSizes', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
          property :image_only, as: 'imageOnly'
          property :kind, as: 'kind'
        end
      end
      
      class SiteContact
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address'
          property :contact_type, as: 'contactType'
          property :email, as: 'email'
          property :first_name, as: 'firstName'
          property :id, :numeric_string => true, as: 'id'
          property :last_name, as: 'lastName'
          property :phone, as: 'phone'
          property :title, as: 'title'
        end
      end
      
      class SiteSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :active_view_opt_out, as: 'activeViewOptOut'
          property :ad_blocking_opt_out, as: 'adBlockingOptOut'
          property :disable_new_cookie, as: 'disableNewCookie'
          property :tag_setting, as: 'tagSetting', class: Google::Apis::DfareportingV3_3::TagSetting, decorator: Google::Apis::DfareportingV3_3::TagSetting::Representation
      
          property :video_active_view_opt_out_template, as: 'videoActiveViewOptOutTemplate'
          property :vpaid_adapter_choice_template, as: 'vpaidAdapterChoiceTemplate'
        end
      end
      
      class SiteSkippableSetting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :progress_offset, as: 'progressOffset', class: Google::Apis::DfareportingV3_3::VideoOffset, decorator: Google::Apis::DfareportingV3_3::VideoOffset::Representation
      
          property :skip_offset, as: 'skipOffset', class: Google::Apis::DfareportingV3_3::VideoOffset, decorator: Google::Apis::DfareportingV3_3::VideoOffset::Representation
      
          property :skippable, as: 'skippable'
        end
      end
      
      class SiteTranscodeSetting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :enabled_video_formats, as: 'enabledVideoFormats'
          property :kind, as: 'kind'
        end
      end
      
      class SiteVideoSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :companion_settings, as: 'companionSettings', class: Google::Apis::DfareportingV3_3::SiteCompanionSetting, decorator: Google::Apis::DfareportingV3_3::SiteCompanionSetting::Representation
      
          property :kind, as: 'kind'
          property :orientation, as: 'orientation'
          property :skippable_settings, as: 'skippableSettings', class: Google::Apis::DfareportingV3_3::SiteSkippableSetting, decorator: Google::Apis::DfareportingV3_3::SiteSkippableSetting::Representation
      
          property :transcode_settings, as: 'transcodeSettings', class: Google::Apis::DfareportingV3_3::SiteTranscodeSetting, decorator: Google::Apis::DfareportingV3_3::SiteTranscodeSetting::Representation
      
        end
      end
      
      class SitesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :sites, as: 'sites', class: Google::Apis::DfareportingV3_3::Site, decorator: Google::Apis::DfareportingV3_3::Site::Representation
      
        end
      end
      
      class Size
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :height, as: 'height'
          property :iab, as: 'iab'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :width, as: 'width'
        end
      end
      
      class SizesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :sizes, as: 'sizes', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
        end
      end
      
      class SkippableSetting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :progress_offset, as: 'progressOffset', class: Google::Apis::DfareportingV3_3::VideoOffset, decorator: Google::Apis::DfareportingV3_3::VideoOffset::Representation
      
          property :skip_offset, as: 'skipOffset', class: Google::Apis::DfareportingV3_3::VideoOffset, decorator: Google::Apis::DfareportingV3_3::VideoOffset::Representation
      
          property :skippable, as: 'skippable'
        end
      end
      
      class SortedDimension
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :sort_order, as: 'sortOrder'
        end
      end
      
      class Subaccount
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          collection :available_permission_ids, as: 'availablePermissionIds'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class SubaccountsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :subaccounts, as: 'subaccounts', class: Google::Apis::DfareportingV3_3::Subaccount, decorator: Google::Apis::DfareportingV3_3::Subaccount::Representation
      
        end
      end
      
      class TagData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ad_id, :numeric_string => true, as: 'adId'
          property :click_tag, as: 'clickTag'
          property :creative_id, :numeric_string => true, as: 'creativeId'
          property :format, as: 'format'
          property :impression_tag, as: 'impressionTag'
        end
      end
      
      class TagSetting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :additional_key_values, as: 'additionalKeyValues'
          property :include_click_through_urls, as: 'includeClickThroughUrls'
          property :include_click_tracking, as: 'includeClickTracking'
          property :keyword_option, as: 'keywordOption'
        end
      end
      
      class TagSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dynamic_tag_enabled, as: 'dynamicTagEnabled'
          property :image_tag_enabled, as: 'imageTagEnabled'
        end
      end
      
      class TargetWindow
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_html, as: 'customHtml'
          property :target_window_option, as: 'targetWindowOption'
        end
      end
      
      class TargetableRemarketingList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :active, as: 'active'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :advertiser_id_dimension_value, as: 'advertiserIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :description, as: 'description'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :life_span, :numeric_string => true, as: 'lifeSpan'
          property :list_size, :numeric_string => true, as: 'listSize'
          property :list_source, as: 'listSource'
          property :name, as: 'name'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
        end
      end
      
      class TargetableRemarketingListsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :targetable_remarketing_lists, as: 'targetableRemarketingLists', class: Google::Apis::DfareportingV3_3::TargetableRemarketingList, decorator: Google::Apis::DfareportingV3_3::TargetableRemarketingList::Representation
      
        end
      end
      
      class TargetingTemplate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :advertiser_id, :numeric_string => true, as: 'advertiserId'
          property :advertiser_id_dimension_value, as: 'advertiserIdDimensionValue', class: Google::Apis::DfareportingV3_3::DimensionValue, decorator: Google::Apis::DfareportingV3_3::DimensionValue::Representation
      
          property :day_part_targeting, as: 'dayPartTargeting', class: Google::Apis::DfareportingV3_3::DayPartTargeting, decorator: Google::Apis::DfareportingV3_3::DayPartTargeting::Representation
      
          property :geo_targeting, as: 'geoTargeting', class: Google::Apis::DfareportingV3_3::GeoTargeting, decorator: Google::Apis::DfareportingV3_3::GeoTargeting::Representation
      
          property :id, :numeric_string => true, as: 'id'
          property :key_value_targeting_expression, as: 'keyValueTargetingExpression', class: Google::Apis::DfareportingV3_3::KeyValueTargetingExpression, decorator: Google::Apis::DfareportingV3_3::KeyValueTargetingExpression::Representation
      
          property :kind, as: 'kind'
          property :language_targeting, as: 'languageTargeting', class: Google::Apis::DfareportingV3_3::LanguageTargeting, decorator: Google::Apis::DfareportingV3_3::LanguageTargeting::Representation
      
          property :list_targeting_expression, as: 'listTargetingExpression', class: Google::Apis::DfareportingV3_3::ListTargetingExpression, decorator: Google::Apis::DfareportingV3_3::ListTargetingExpression::Representation
      
          property :name, as: 'name'
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
          property :technology_targeting, as: 'technologyTargeting', class: Google::Apis::DfareportingV3_3::TechnologyTargeting, decorator: Google::Apis::DfareportingV3_3::TechnologyTargeting::Representation
      
        end
      end
      
      class TargetingTemplatesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :targeting_templates, as: 'targetingTemplates', class: Google::Apis::DfareportingV3_3::TargetingTemplate, decorator: Google::Apis::DfareportingV3_3::TargetingTemplate::Representation
      
        end
      end
      
      class TechnologyTargeting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :browsers, as: 'browsers', class: Google::Apis::DfareportingV3_3::Browser, decorator: Google::Apis::DfareportingV3_3::Browser::Representation
      
          collection :connection_types, as: 'connectionTypes', class: Google::Apis::DfareportingV3_3::ConnectionType, decorator: Google::Apis::DfareportingV3_3::ConnectionType::Representation
      
          collection :mobile_carriers, as: 'mobileCarriers', class: Google::Apis::DfareportingV3_3::MobileCarrier, decorator: Google::Apis::DfareportingV3_3::MobileCarrier::Representation
      
          collection :operating_system_versions, as: 'operatingSystemVersions', class: Google::Apis::DfareportingV3_3::OperatingSystemVersion, decorator: Google::Apis::DfareportingV3_3::OperatingSystemVersion::Representation
      
          collection :operating_systems, as: 'operatingSystems', class: Google::Apis::DfareportingV3_3::OperatingSystem, decorator: Google::Apis::DfareportingV3_3::OperatingSystem::Representation
      
          collection :platform_types, as: 'platformTypes', class: Google::Apis::DfareportingV3_3::PlatformType, decorator: Google::Apis::DfareportingV3_3::PlatformType::Representation
      
        end
      end
      
      class ThirdPartyAuthenticationToken
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :value, as: 'value'
        end
      end
      
      class ThirdPartyTrackingUrl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :third_party_url_type, as: 'thirdPartyUrlType'
          property :url, as: 'url'
        end
      end
      
      class TranscodeSetting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :enabled_video_formats, as: 'enabledVideoFormats'
          property :kind, as: 'kind'
        end
      end
      
      class UniversalAdId
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :registry, as: 'registry'
          property :value, as: 'value'
        end
      end
      
      class UserDefinedVariableConfiguration
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data_type, as: 'dataType'
          property :report_name, as: 'reportName'
          property :variable_type, as: 'variableType'
        end
      end
      
      class UserProfile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :account_name, as: 'accountName'
          property :etag, as: 'etag'
          property :kind, as: 'kind'
          property :profile_id, :numeric_string => true, as: 'profileId'
          property :sub_account_id, :numeric_string => true, as: 'subAccountId'
          property :sub_account_name, as: 'subAccountName'
          property :user_name, as: 'userName'
        end
      end
      
      class UserProfileList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::DfareportingV3_3::UserProfile, decorator: Google::Apis::DfareportingV3_3::UserProfile::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class UserRole
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :default_user_role, as: 'defaultUserRole'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :parent_user_role_id, :numeric_string => true, as: 'parentUserRoleId'
          collection :permissions, as: 'permissions', class: Google::Apis::DfareportingV3_3::UserRolePermission, decorator: Google::Apis::DfareportingV3_3::UserRolePermission::Representation
      
          property :subaccount_id, :numeric_string => true, as: 'subaccountId'
        end
      end
      
      class UserRolePermission
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :availability, as: 'availability'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :permission_group_id, :numeric_string => true, as: 'permissionGroupId'
        end
      end
      
      class UserRolePermissionGroup
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class UserRolePermissionGroupsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :user_role_permission_groups, as: 'userRolePermissionGroups', class: Google::Apis::DfareportingV3_3::UserRolePermissionGroup, decorator: Google::Apis::DfareportingV3_3::UserRolePermissionGroup::Representation
      
        end
      end
      
      class UserRolePermissionsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :user_role_permissions, as: 'userRolePermissions', class: Google::Apis::DfareportingV3_3::UserRolePermission, decorator: Google::Apis::DfareportingV3_3::UserRolePermission::Representation
      
        end
      end
      
      class UserRolesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :user_roles, as: 'userRoles', class: Google::Apis::DfareportingV3_3::UserRole, decorator: Google::Apis::DfareportingV3_3::UserRole::Representation
      
        end
      end
      
      class VideoFormat
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :file_type, as: 'fileType'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :resolution, as: 'resolution', class: Google::Apis::DfareportingV3_3::Size, decorator: Google::Apis::DfareportingV3_3::Size::Representation
      
          property :target_bit_rate, as: 'targetBitRate'
        end
      end
      
      class VideoFormatsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :video_formats, as: 'videoFormats', class: Google::Apis::DfareportingV3_3::VideoFormat, decorator: Google::Apis::DfareportingV3_3::VideoFormat::Representation
      
        end
      end
      
      class VideoOffset
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :offset_percentage, as: 'offsetPercentage'
          property :offset_seconds, as: 'offsetSeconds'
        end
      end
      
      class VideoSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :companion_settings, as: 'companionSettings', class: Google::Apis::DfareportingV3_3::CompanionSetting, decorator: Google::Apis::DfareportingV3_3::CompanionSetting::Representation
      
          property :kind, as: 'kind'
          property :orientation, as: 'orientation'
          property :skippable_settings, as: 'skippableSettings', class: Google::Apis::DfareportingV3_3::SkippableSetting, decorator: Google::Apis::DfareportingV3_3::SkippableSetting::Representation
      
          property :transcode_settings, as: 'transcodeSettings', class: Google::Apis::DfareportingV3_3::TranscodeSetting, decorator: Google::Apis::DfareportingV3_3::TranscodeSetting::Representation
      
        end
      end
    end
  end
end
