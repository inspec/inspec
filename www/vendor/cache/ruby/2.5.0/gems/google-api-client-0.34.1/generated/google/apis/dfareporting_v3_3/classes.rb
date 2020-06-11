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
      
      # Contains properties of a Campaign Manager account.
      class Account
        include Google::Apis::Core::Hashable
      
        # Account permissions assigned to this account.
        # Corresponds to the JSON property `accountPermissionIds`
        # @return [Array<Fixnum>]
        attr_accessor :account_permission_ids
      
        # Profile for this account. This is a read-only field that can be left blank.
        # Corresponds to the JSON property `accountProfile`
        # @return [String]
        attr_accessor :account_profile
      
        # Whether this account is active.
        # Corresponds to the JSON property `active`
        # @return [Boolean]
        attr_accessor :active
        alias_method :active?, :active
      
        # Maximum number of active ads allowed for this account.
        # Corresponds to the JSON property `activeAdsLimitTier`
        # @return [String]
        attr_accessor :active_ads_limit_tier
      
        # Whether to serve creatives with Active View tags. If disabled, viewability
        # data will not be available for any impressions.
        # Corresponds to the JSON property `activeViewOptOut`
        # @return [Boolean]
        attr_accessor :active_view_opt_out
        alias_method :active_view_opt_out?, :active_view_opt_out
      
        # User role permissions available to the user roles of this account.
        # Corresponds to the JSON property `availablePermissionIds`
        # @return [Array<Fixnum>]
        attr_accessor :available_permission_ids
      
        # ID of the country associated with this account.
        # Corresponds to the JSON property `countryId`
        # @return [Fixnum]
        attr_accessor :country_id
      
        # ID of currency associated with this account. This is a required field.
        # Acceptable values are:
        # - "1" for USD
        # - "2" for GBP
        # - "3" for ESP
        # - "4" for SEK
        # - "5" for CAD
        # - "6" for JPY
        # - "7" for DEM
        # - "8" for AUD
        # - "9" for FRF
        # - "10" for ITL
        # - "11" for DKK
        # - "12" for NOK
        # - "13" for FIM
        # - "14" for ZAR
        # - "15" for IEP
        # - "16" for NLG
        # - "17" for EUR
        # - "18" for KRW
        # - "19" for TWD
        # - "20" for SGD
        # - "21" for CNY
        # - "22" for HKD
        # - "23" for NZD
        # - "24" for MYR
        # - "25" for BRL
        # - "26" for PTE
        # - "27" for MXP
        # - "28" for CLP
        # - "29" for TRY
        # - "30" for ARS
        # - "31" for PEN
        # - "32" for ILS
        # - "33" for CHF
        # - "34" for VEF
        # - "35" for COP
        # - "36" for GTQ
        # - "37" for PLN
        # - "39" for INR
        # - "40" for THB
        # - "41" for IDR
        # - "42" for CZK
        # - "43" for RON
        # - "44" for HUF
        # - "45" for RUB
        # - "46" for AED
        # - "47" for BGN
        # - "48" for HRK
        # - "49" for MXN
        # - "50" for NGN
        # Corresponds to the JSON property `currencyId`
        # @return [Fixnum]
        attr_accessor :currency_id
      
        # Default placement dimensions for this account.
        # Corresponds to the JSON property `defaultCreativeSizeId`
        # @return [Fixnum]
        attr_accessor :default_creative_size_id
      
        # Description of this account.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # ID of this account. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#account".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Locale of this account.
        # Acceptable values are:
        # - "cs" (Czech)
        # - "de" (German)
        # - "en" (English)
        # - "en-GB" (English United Kingdom)
        # - "es" (Spanish)
        # - "fr" (French)
        # - "it" (Italian)
        # - "ja" (Japanese)
        # - "ko" (Korean)
        # - "pl" (Polish)
        # - "pt-BR" (Portuguese Brazil)
        # - "ru" (Russian)
        # - "sv" (Swedish)
        # - "tr" (Turkish)
        # - "zh-CN" (Chinese Simplified)
        # - "zh-TW" (Chinese Traditional)
        # Corresponds to the JSON property `locale`
        # @return [String]
        attr_accessor :locale
      
        # Maximum image size allowed for this account, in kilobytes. Value must be
        # greater than or equal to 1.
        # Corresponds to the JSON property `maximumImageSize`
        # @return [Fixnum]
        attr_accessor :maximum_image_size
      
        # Name of this account. This is a required field, and must be less than 128
        # characters long and be globally unique.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Whether campaigns created in this account will be enabled for Nielsen OCR
        # reach ratings by default.
        # Corresponds to the JSON property `nielsenOcrEnabled`
        # @return [Boolean]
        attr_accessor :nielsen_ocr_enabled
        alias_method :nielsen_ocr_enabled?, :nielsen_ocr_enabled
      
        # Reporting Configuration
        # Corresponds to the JSON property `reportsConfiguration`
        # @return [Google::Apis::DfareportingV3_3::ReportsConfiguration]
        attr_accessor :reports_configuration
      
        # Share Path to Conversion reports with Twitter.
        # Corresponds to the JSON property `shareReportsWithTwitter`
        # @return [Boolean]
        attr_accessor :share_reports_with_twitter
        alias_method :share_reports_with_twitter?, :share_reports_with_twitter
      
        # File size limit in kilobytes of Rich Media teaser creatives. Acceptable values
        # are 1 to 10240, inclusive.
        # Corresponds to the JSON property `teaserSizeLimit`
        # @return [Fixnum]
        attr_accessor :teaser_size_limit
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_permission_ids = args[:account_permission_ids] if args.key?(:account_permission_ids)
          @account_profile = args[:account_profile] if args.key?(:account_profile)
          @active = args[:active] if args.key?(:active)
          @active_ads_limit_tier = args[:active_ads_limit_tier] if args.key?(:active_ads_limit_tier)
          @active_view_opt_out = args[:active_view_opt_out] if args.key?(:active_view_opt_out)
          @available_permission_ids = args[:available_permission_ids] if args.key?(:available_permission_ids)
          @country_id = args[:country_id] if args.key?(:country_id)
          @currency_id = args[:currency_id] if args.key?(:currency_id)
          @default_creative_size_id = args[:default_creative_size_id] if args.key?(:default_creative_size_id)
          @description = args[:description] if args.key?(:description)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @locale = args[:locale] if args.key?(:locale)
          @maximum_image_size = args[:maximum_image_size] if args.key?(:maximum_image_size)
          @name = args[:name] if args.key?(:name)
          @nielsen_ocr_enabled = args[:nielsen_ocr_enabled] if args.key?(:nielsen_ocr_enabled)
          @reports_configuration = args[:reports_configuration] if args.key?(:reports_configuration)
          @share_reports_with_twitter = args[:share_reports_with_twitter] if args.key?(:share_reports_with_twitter)
          @teaser_size_limit = args[:teaser_size_limit] if args.key?(:teaser_size_limit)
        end
      end
      
      # Gets a summary of active ads in an account.
      class AccountActiveAdSummary
        include Google::Apis::Core::Hashable
      
        # ID of the account.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Ads that have been activated for the account
        # Corresponds to the JSON property `activeAds`
        # @return [Fixnum]
        attr_accessor :active_ads
      
        # Maximum number of active ads allowed for the account.
        # Corresponds to the JSON property `activeAdsLimitTier`
        # @return [String]
        attr_accessor :active_ads_limit_tier
      
        # Ads that can be activated for the account.
        # Corresponds to the JSON property `availableAds`
        # @return [Fixnum]
        attr_accessor :available_ads
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#accountActiveAdSummary".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @active_ads = args[:active_ads] if args.key?(:active_ads)
          @active_ads_limit_tier = args[:active_ads_limit_tier] if args.key?(:active_ads_limit_tier)
          @available_ads = args[:available_ads] if args.key?(:available_ads)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # AccountPermissions contains information about a particular account permission.
      # Some features of Campaign Manager require an account permission to be present
      # in the account.
      class AccountPermission
        include Google::Apis::Core::Hashable
      
        # Account profiles associated with this account permission.
        # Possible values are:
        # - "ACCOUNT_PROFILE_BASIC"
        # - "ACCOUNT_PROFILE_STANDARD"
        # Corresponds to the JSON property `accountProfiles`
        # @return [Array<String>]
        attr_accessor :account_profiles
      
        # ID of this account permission.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#accountPermission".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Administrative level required to enable this account permission.
        # Corresponds to the JSON property `level`
        # @return [String]
        attr_accessor :level
      
        # Name of this account permission.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Permission group of this account permission.
        # Corresponds to the JSON property `permissionGroupId`
        # @return [Fixnum]
        attr_accessor :permission_group_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_profiles = args[:account_profiles] if args.key?(:account_profiles)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @level = args[:level] if args.key?(:level)
          @name = args[:name] if args.key?(:name)
          @permission_group_id = args[:permission_group_id] if args.key?(:permission_group_id)
        end
      end
      
      # AccountPermissionGroups contains a mapping of permission group IDs to names. A
      # permission group is a grouping of account permissions.
      class AccountPermissionGroup
        include Google::Apis::Core::Hashable
      
        # ID of this account permission group.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#accountPermissionGroup".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this account permission group.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Account Permission Group List Response
      class AccountPermissionGroupsListResponse
        include Google::Apis::Core::Hashable
      
        # Account permission group collection.
        # Corresponds to the JSON property `accountPermissionGroups`
        # @return [Array<Google::Apis::DfareportingV3_3::AccountPermissionGroup>]
        attr_accessor :account_permission_groups
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#accountPermissionGroupsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_permission_groups = args[:account_permission_groups] if args.key?(:account_permission_groups)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Account Permission List Response
      class AccountPermissionsListResponse
        include Google::Apis::Core::Hashable
      
        # Account permission collection.
        # Corresponds to the JSON property `accountPermissions`
        # @return [Array<Google::Apis::DfareportingV3_3::AccountPermission>]
        attr_accessor :account_permissions
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#accountPermissionsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_permissions = args[:account_permissions] if args.key?(:account_permissions)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # AccountUserProfiles contains properties of a Campaign Manager user profile.
      # This resource is specifically for managing user profiles, whereas UserProfiles
      # is for accessing the API.
      class AccountUserProfile
        include Google::Apis::Core::Hashable
      
        # Account ID of the user profile. This is a read-only field that can be left
        # blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Whether this user profile is active. This defaults to false, and must be set
        # true on insert for the user profile to be usable.
        # Corresponds to the JSON property `active`
        # @return [Boolean]
        attr_accessor :active
        alias_method :active?, :active
      
        # Object Filter.
        # Corresponds to the JSON property `advertiserFilter`
        # @return [Google::Apis::DfareportingV3_3::ObjectFilter]
        attr_accessor :advertiser_filter
      
        # Object Filter.
        # Corresponds to the JSON property `campaignFilter`
        # @return [Google::Apis::DfareportingV3_3::ObjectFilter]
        attr_accessor :campaign_filter
      
        # Comments for this user profile.
        # Corresponds to the JSON property `comments`
        # @return [String]
        attr_accessor :comments
      
        # Email of the user profile. The email addresss must be linked to a Google
        # Account. This field is required on insertion and is read-only after insertion.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # ID of the user profile. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#accountUserProfile".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Locale of the user profile. This is a required field.
        # Acceptable values are:
        # - "cs" (Czech)
        # - "de" (German)
        # - "en" (English)
        # - "en-GB" (English United Kingdom)
        # - "es" (Spanish)
        # - "fr" (French)
        # - "it" (Italian)
        # - "ja" (Japanese)
        # - "ko" (Korean)
        # - "pl" (Polish)
        # - "pt-BR" (Portuguese Brazil)
        # - "ru" (Russian)
        # - "sv" (Swedish)
        # - "tr" (Turkish)
        # - "zh-CN" (Chinese Simplified)
        # - "zh-TW" (Chinese Traditional)
        # Corresponds to the JSON property `locale`
        # @return [String]
        attr_accessor :locale
      
        # Name of the user profile. This is a required field. Must be less than 64
        # characters long, must be globally unique, and cannot contain whitespace or any
        # of the following characters: "&;"#%,".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Object Filter.
        # Corresponds to the JSON property `siteFilter`
        # @return [Google::Apis::DfareportingV3_3::ObjectFilter]
        attr_accessor :site_filter
      
        # Subaccount ID of the user profile. This is a read-only field that can be left
        # blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Trafficker type of this user profile. This is a read-only field.
        # Corresponds to the JSON property `traffickerType`
        # @return [String]
        attr_accessor :trafficker_type
      
        # User type of the user profile. This is a read-only field that can be left
        # blank.
        # Corresponds to the JSON property `userAccessType`
        # @return [String]
        attr_accessor :user_access_type
      
        # Object Filter.
        # Corresponds to the JSON property `userRoleFilter`
        # @return [Google::Apis::DfareportingV3_3::ObjectFilter]
        attr_accessor :user_role_filter
      
        # User role ID of the user profile. This is a required field.
        # Corresponds to the JSON property `userRoleId`
        # @return [Fixnum]
        attr_accessor :user_role_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @active = args[:active] if args.key?(:active)
          @advertiser_filter = args[:advertiser_filter] if args.key?(:advertiser_filter)
          @campaign_filter = args[:campaign_filter] if args.key?(:campaign_filter)
          @comments = args[:comments] if args.key?(:comments)
          @email = args[:email] if args.key?(:email)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @locale = args[:locale] if args.key?(:locale)
          @name = args[:name] if args.key?(:name)
          @site_filter = args[:site_filter] if args.key?(:site_filter)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @trafficker_type = args[:trafficker_type] if args.key?(:trafficker_type)
          @user_access_type = args[:user_access_type] if args.key?(:user_access_type)
          @user_role_filter = args[:user_role_filter] if args.key?(:user_role_filter)
          @user_role_id = args[:user_role_id] if args.key?(:user_role_id)
        end
      end
      
      # Account User Profile List Response
      class AccountUserProfilesListResponse
        include Google::Apis::Core::Hashable
      
        # Account user profile collection.
        # Corresponds to the JSON property `accountUserProfiles`
        # @return [Array<Google::Apis::DfareportingV3_3::AccountUserProfile>]
        attr_accessor :account_user_profiles
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#accountUserProfilesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_user_profiles = args[:account_user_profiles] if args.key?(:account_user_profiles)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Account List Response
      class AccountsListResponse
        include Google::Apis::Core::Hashable
      
        # Account collection.
        # Corresponds to the JSON property `accounts`
        # @return [Array<Google::Apis::DfareportingV3_3::Account>]
        attr_accessor :accounts
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#accountsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accounts = args[:accounts] if args.key?(:accounts)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Represents an activity group.
      class Activities
        include Google::Apis::Core::Hashable
      
        # List of activity filters. The dimension values need to be all either of type "
        # dfa:activity" or "dfa:activityGroup".
        # Corresponds to the JSON property `filters`
        # @return [Array<Google::Apis::DfareportingV3_3::DimensionValue>]
        attr_accessor :filters
      
        # The kind of resource this is, in this case dfareporting#activities.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # List of names of floodlight activity metrics.
        # Corresponds to the JSON property `metricNames`
        # @return [Array<String>]
        attr_accessor :metric_names
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filters = args[:filters] if args.key?(:filters)
          @kind = args[:kind] if args.key?(:kind)
          @metric_names = args[:metric_names] if args.key?(:metric_names)
        end
      end
      
      # Contains properties of a Campaign Manager ad.
      class Ad
        include Google::Apis::Core::Hashable
      
        # Account ID of this ad. This is a read-only field that can be left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Whether this ad is active. When true, archived must be false.
        # Corresponds to the JSON property `active`
        # @return [Boolean]
        attr_accessor :active
        alias_method :active?, :active
      
        # Advertiser ID of this ad. This is a required field on insertion.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `advertiserIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :advertiser_id_dimension_value
      
        # Whether this ad is archived. When true, active must be false.
        # Corresponds to the JSON property `archived`
        # @return [Boolean]
        attr_accessor :archived
        alias_method :archived?, :archived
      
        # Audience segment ID that is being targeted for this ad. Applicable when type
        # is AD_SERVING_STANDARD_AD.
        # Corresponds to the JSON property `audienceSegmentId`
        # @return [Fixnum]
        attr_accessor :audience_segment_id
      
        # Campaign ID of this ad. This is a required field on insertion.
        # Corresponds to the JSON property `campaignId`
        # @return [Fixnum]
        attr_accessor :campaign_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `campaignIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :campaign_id_dimension_value
      
        # Click-through URL
        # Corresponds to the JSON property `clickThroughUrl`
        # @return [Google::Apis::DfareportingV3_3::ClickThroughUrl]
        attr_accessor :click_through_url
      
        # Click Through URL Suffix settings.
        # Corresponds to the JSON property `clickThroughUrlSuffixProperties`
        # @return [Google::Apis::DfareportingV3_3::ClickThroughUrlSuffixProperties]
        attr_accessor :click_through_url_suffix_properties
      
        # Comments for this ad.
        # Corresponds to the JSON property `comments`
        # @return [String]
        attr_accessor :comments
      
        # Compatibility of this ad. Applicable when type is AD_SERVING_DEFAULT_AD.
        # DISPLAY and DISPLAY_INTERSTITIAL refer to either rendering on desktop or on
        # mobile devices or in mobile apps for regular or interstitial ads, respectively.
        # APP and APP_INTERSTITIAL are only used for existing default ads. New mobile
        # placements must be assigned DISPLAY or DISPLAY_INTERSTITIAL and default ads
        # created for those placements will be limited to those compatibility types.
        # IN_STREAM_VIDEO refers to rendering in-stream video ads developed with the
        # VAST standard.
        # Corresponds to the JSON property `compatibility`
        # @return [String]
        attr_accessor :compatibility
      
        # Modification timestamp.
        # Corresponds to the JSON property `createInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :create_info
      
        # Creative group assignments for this ad. Applicable when type is
        # AD_SERVING_CLICK_TRACKER. Only one assignment per creative group number is
        # allowed for a maximum of two assignments.
        # Corresponds to the JSON property `creativeGroupAssignments`
        # @return [Array<Google::Apis::DfareportingV3_3::CreativeGroupAssignment>]
        attr_accessor :creative_group_assignments
      
        # Creative Rotation.
        # Corresponds to the JSON property `creativeRotation`
        # @return [Google::Apis::DfareportingV3_3::CreativeRotation]
        attr_accessor :creative_rotation
      
        # Day Part Targeting.
        # Corresponds to the JSON property `dayPartTargeting`
        # @return [Google::Apis::DfareportingV3_3::DayPartTargeting]
        attr_accessor :day_part_targeting
      
        # Properties of inheriting and overriding the default click-through event tag. A
        # campaign may override the event tag defined at the advertiser level, and an ad
        # may also override the campaign's setting further.
        # Corresponds to the JSON property `defaultClickThroughEventTagProperties`
        # @return [Google::Apis::DfareportingV3_3::DefaultClickThroughEventTagProperties]
        attr_accessor :default_click_through_event_tag_properties
      
        # Delivery Schedule.
        # Corresponds to the JSON property `deliverySchedule`
        # @return [Google::Apis::DfareportingV3_3::DeliverySchedule]
        attr_accessor :delivery_schedule
      
        # Whether this ad is a dynamic click tracker. Applicable when type is
        # AD_SERVING_CLICK_TRACKER. This is a required field on insert, and is read-only
        # after insert.
        # Corresponds to the JSON property `dynamicClickTracker`
        # @return [Boolean]
        attr_accessor :dynamic_click_tracker
        alias_method :dynamic_click_tracker?, :dynamic_click_tracker
      
        # Date and time that this ad should stop serving. Must be later than the start
        # time. This is a required field on insertion.
        # Corresponds to the JSON property `endTime`
        # @return [DateTime]
        attr_accessor :end_time
      
        # Event tag overrides for this ad.
        # Corresponds to the JSON property `eventTagOverrides`
        # @return [Array<Google::Apis::DfareportingV3_3::EventTagOverride>]
        attr_accessor :event_tag_overrides
      
        # Geographical Targeting.
        # Corresponds to the JSON property `geoTargeting`
        # @return [Google::Apis::DfareportingV3_3::GeoTargeting]
        attr_accessor :geo_targeting
      
        # ID of this ad. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `idDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :id_dimension_value
      
        # Key Value Targeting Expression.
        # Corresponds to the JSON property `keyValueTargetingExpression`
        # @return [Google::Apis::DfareportingV3_3::KeyValueTargetingExpression]
        attr_accessor :key_value_targeting_expression
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#ad".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Language Targeting.
        # Corresponds to the JSON property `languageTargeting`
        # @return [Google::Apis::DfareportingV3_3::LanguageTargeting]
        attr_accessor :language_targeting
      
        # Modification timestamp.
        # Corresponds to the JSON property `lastModifiedInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :last_modified_info
      
        # Name of this ad. This is a required field and must be less than 256 characters
        # long.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Placement assignments for this ad.
        # Corresponds to the JSON property `placementAssignments`
        # @return [Array<Google::Apis::DfareportingV3_3::PlacementAssignment>]
        attr_accessor :placement_assignments
      
        # Remarketing List Targeting Expression.
        # Corresponds to the JSON property `remarketingListExpression`
        # @return [Google::Apis::DfareportingV3_3::ListTargetingExpression]
        attr_accessor :remarketing_list_expression
      
        # Represents the dimensions of ads, placements, creatives, or creative assets.
        # Corresponds to the JSON property `size`
        # @return [Google::Apis::DfareportingV3_3::Size]
        attr_accessor :size
      
        # Whether this ad is ssl compliant. This is a read-only field that is auto-
        # generated when the ad is inserted or updated.
        # Corresponds to the JSON property `sslCompliant`
        # @return [Boolean]
        attr_accessor :ssl_compliant
        alias_method :ssl_compliant?, :ssl_compliant
      
        # Whether this ad requires ssl. This is a read-only field that is auto-generated
        # when the ad is inserted or updated.
        # Corresponds to the JSON property `sslRequired`
        # @return [Boolean]
        attr_accessor :ssl_required
        alias_method :ssl_required?, :ssl_required
      
        # Date and time that this ad should start serving. If creating an ad, this field
        # must be a time in the future. This is a required field on insertion.
        # Corresponds to the JSON property `startTime`
        # @return [DateTime]
        attr_accessor :start_time
      
        # Subaccount ID of this ad. This is a read-only field that can be left blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Targeting template ID, used to apply preconfigured targeting information to
        # this ad. This cannot be set while any of dayPartTargeting, geoTargeting,
        # keyValueTargetingExpression, languageTargeting, remarketingListExpression, or
        # technologyTargeting are set. Applicable when type is AD_SERVING_STANDARD_AD.
        # Corresponds to the JSON property `targetingTemplateId`
        # @return [Fixnum]
        attr_accessor :targeting_template_id
      
        # Technology Targeting.
        # Corresponds to the JSON property `technologyTargeting`
        # @return [Google::Apis::DfareportingV3_3::TechnologyTargeting]
        attr_accessor :technology_targeting
      
        # Type of ad. This is a required field on insertion. Note that default ads (
        # AD_SERVING_DEFAULT_AD) cannot be created directly (see Creative resource).
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @active = args[:active] if args.key?(:active)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_id_dimension_value = args[:advertiser_id_dimension_value] if args.key?(:advertiser_id_dimension_value)
          @archived = args[:archived] if args.key?(:archived)
          @audience_segment_id = args[:audience_segment_id] if args.key?(:audience_segment_id)
          @campaign_id = args[:campaign_id] if args.key?(:campaign_id)
          @campaign_id_dimension_value = args[:campaign_id_dimension_value] if args.key?(:campaign_id_dimension_value)
          @click_through_url = args[:click_through_url] if args.key?(:click_through_url)
          @click_through_url_suffix_properties = args[:click_through_url_suffix_properties] if args.key?(:click_through_url_suffix_properties)
          @comments = args[:comments] if args.key?(:comments)
          @compatibility = args[:compatibility] if args.key?(:compatibility)
          @create_info = args[:create_info] if args.key?(:create_info)
          @creative_group_assignments = args[:creative_group_assignments] if args.key?(:creative_group_assignments)
          @creative_rotation = args[:creative_rotation] if args.key?(:creative_rotation)
          @day_part_targeting = args[:day_part_targeting] if args.key?(:day_part_targeting)
          @default_click_through_event_tag_properties = args[:default_click_through_event_tag_properties] if args.key?(:default_click_through_event_tag_properties)
          @delivery_schedule = args[:delivery_schedule] if args.key?(:delivery_schedule)
          @dynamic_click_tracker = args[:dynamic_click_tracker] if args.key?(:dynamic_click_tracker)
          @end_time = args[:end_time] if args.key?(:end_time)
          @event_tag_overrides = args[:event_tag_overrides] if args.key?(:event_tag_overrides)
          @geo_targeting = args[:geo_targeting] if args.key?(:geo_targeting)
          @id = args[:id] if args.key?(:id)
          @id_dimension_value = args[:id_dimension_value] if args.key?(:id_dimension_value)
          @key_value_targeting_expression = args[:key_value_targeting_expression] if args.key?(:key_value_targeting_expression)
          @kind = args[:kind] if args.key?(:kind)
          @language_targeting = args[:language_targeting] if args.key?(:language_targeting)
          @last_modified_info = args[:last_modified_info] if args.key?(:last_modified_info)
          @name = args[:name] if args.key?(:name)
          @placement_assignments = args[:placement_assignments] if args.key?(:placement_assignments)
          @remarketing_list_expression = args[:remarketing_list_expression] if args.key?(:remarketing_list_expression)
          @size = args[:size] if args.key?(:size)
          @ssl_compliant = args[:ssl_compliant] if args.key?(:ssl_compliant)
          @ssl_required = args[:ssl_required] if args.key?(:ssl_required)
          @start_time = args[:start_time] if args.key?(:start_time)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @targeting_template_id = args[:targeting_template_id] if args.key?(:targeting_template_id)
          @technology_targeting = args[:technology_targeting] if args.key?(:technology_targeting)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Campaign ad blocking settings.
      class AdBlockingConfiguration
        include Google::Apis::Core::Hashable
      
        # Click-through URL used by brand-neutral ads. This is a required field when
        # overrideClickThroughUrl is set to true.
        # Corresponds to the JSON property `clickThroughUrl`
        # @return [String]
        attr_accessor :click_through_url
      
        # ID of a creative bundle to use for this campaign. If set, brand-neutral ads
        # will select creatives from this bundle. Otherwise, a default transparent pixel
        # will be used.
        # Corresponds to the JSON property `creativeBundleId`
        # @return [Fixnum]
        attr_accessor :creative_bundle_id
      
        # Whether this campaign has enabled ad blocking. When true, ad blocking is
        # enabled for placements in the campaign, but this may be overridden by site and
        # placement settings. When false, ad blocking is disabled for all placements
        # under the campaign, regardless of site and placement settings.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # Whether the brand-neutral ad's click-through URL comes from the campaign's
        # creative bundle or the override URL. Must be set to true if ad blocking is
        # enabled and no creative bundle is configured.
        # Corresponds to the JSON property `overrideClickThroughUrl`
        # @return [Boolean]
        attr_accessor :override_click_through_url
        alias_method :override_click_through_url?, :override_click_through_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @click_through_url = args[:click_through_url] if args.key?(:click_through_url)
          @creative_bundle_id = args[:creative_bundle_id] if args.key?(:creative_bundle_id)
          @enabled = args[:enabled] if args.key?(:enabled)
          @override_click_through_url = args[:override_click_through_url] if args.key?(:override_click_through_url)
        end
      end
      
      # Ad Slot
      class AdSlot
        include Google::Apis::Core::Hashable
      
        # Comment for this ad slot.
        # Corresponds to the JSON property `comment`
        # @return [String]
        attr_accessor :comment
      
        # Ad slot compatibility. DISPLAY and DISPLAY_INTERSTITIAL refer to rendering
        # either on desktop, mobile devices or in mobile apps for regular or
        # interstitial ads respectively. APP and APP_INTERSTITIAL are for rendering in
        # mobile apps. IN_STREAM_VIDEO refers to rendering in in-stream video ads
        # developed with the VAST standard.
        # Corresponds to the JSON property `compatibility`
        # @return [String]
        attr_accessor :compatibility
      
        # Height of this ad slot.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # ID of the placement from an external platform that is linked to this ad slot.
        # Corresponds to the JSON property `linkedPlacementId`
        # @return [Fixnum]
        attr_accessor :linked_placement_id
      
        # Name of this ad slot.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Payment source type of this ad slot.
        # Corresponds to the JSON property `paymentSourceType`
        # @return [String]
        attr_accessor :payment_source_type
      
        # Primary ad slot of a roadblock inventory item.
        # Corresponds to the JSON property `primary`
        # @return [Boolean]
        attr_accessor :primary
        alias_method :primary?, :primary
      
        # Width of this ad slot.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @comment = args[:comment] if args.key?(:comment)
          @compatibility = args[:compatibility] if args.key?(:compatibility)
          @height = args[:height] if args.key?(:height)
          @linked_placement_id = args[:linked_placement_id] if args.key?(:linked_placement_id)
          @name = args[:name] if args.key?(:name)
          @payment_source_type = args[:payment_source_type] if args.key?(:payment_source_type)
          @primary = args[:primary] if args.key?(:primary)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Ad List Response
      class AdsListResponse
        include Google::Apis::Core::Hashable
      
        # Ad collection.
        # Corresponds to the JSON property `ads`
        # @return [Array<Google::Apis::DfareportingV3_3::Ad>]
        attr_accessor :ads
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#adsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ads = args[:ads] if args.key?(:ads)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Contains properties of a Campaign Manager advertiser.
      class Advertiser
        include Google::Apis::Core::Hashable
      
        # Account ID of this advertiser.This is a read-only field that can be left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # ID of the advertiser group this advertiser belongs to. You can group
        # advertisers for reporting purposes, allowing you to see aggregated information
        # for all advertisers in each group.
        # Corresponds to the JSON property `advertiserGroupId`
        # @return [Fixnum]
        attr_accessor :advertiser_group_id
      
        # Suffix added to click-through URL of ad creative associations under this
        # advertiser. Must be less than 129 characters long.
        # Corresponds to the JSON property `clickThroughUrlSuffix`
        # @return [String]
        attr_accessor :click_through_url_suffix
      
        # ID of the click-through event tag to apply by default to the landing pages of
        # this advertiser's campaigns.
        # Corresponds to the JSON property `defaultClickThroughEventTagId`
        # @return [Fixnum]
        attr_accessor :default_click_through_event_tag_id
      
        # Default email address used in sender field for tag emails.
        # Corresponds to the JSON property `defaultEmail`
        # @return [String]
        attr_accessor :default_email
      
        # Floodlight configuration ID of this advertiser. The floodlight configuration
        # ID will be created automatically, so on insert this field should be left blank.
        # This field can be set to another advertiser's floodlight configuration ID in
        # order to share that advertiser's floodlight configuration with this advertiser,
        # so long as:
        # - This advertiser's original floodlight configuration is not already
        # associated with floodlight activities or floodlight activity groups.
        # - This advertiser's original floodlight configuration is not already shared
        # with another advertiser.
        # Corresponds to the JSON property `floodlightConfigurationId`
        # @return [Fixnum]
        attr_accessor :floodlight_configuration_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `floodlightConfigurationIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :floodlight_configuration_id_dimension_value
      
        # ID of this advertiser. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `idDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :id_dimension_value
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#advertiser".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this advertiser. This is a required field and must be less than 256
        # characters long and unique among advertisers of the same account.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Original floodlight configuration before any sharing occurred. Set the
        # floodlightConfigurationId of this advertiser to
        # originalFloodlightConfigurationId to unshare the advertiser's current
        # floodlight configuration. You cannot unshare an advertiser's floodlight
        # configuration if the shared configuration has activities associated with any
        # campaign or placement.
        # Corresponds to the JSON property `originalFloodlightConfigurationId`
        # @return [Fixnum]
        attr_accessor :original_floodlight_configuration_id
      
        # Status of this advertiser.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # Subaccount ID of this advertiser.This is a read-only field that can be left
        # blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Suspension status of this advertiser.
        # Corresponds to the JSON property `suspended`
        # @return [Boolean]
        attr_accessor :suspended
        alias_method :suspended?, :suspended
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advertiser_group_id = args[:advertiser_group_id] if args.key?(:advertiser_group_id)
          @click_through_url_suffix = args[:click_through_url_suffix] if args.key?(:click_through_url_suffix)
          @default_click_through_event_tag_id = args[:default_click_through_event_tag_id] if args.key?(:default_click_through_event_tag_id)
          @default_email = args[:default_email] if args.key?(:default_email)
          @floodlight_configuration_id = args[:floodlight_configuration_id] if args.key?(:floodlight_configuration_id)
          @floodlight_configuration_id_dimension_value = args[:floodlight_configuration_id_dimension_value] if args.key?(:floodlight_configuration_id_dimension_value)
          @id = args[:id] if args.key?(:id)
          @id_dimension_value = args[:id_dimension_value] if args.key?(:id_dimension_value)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @original_floodlight_configuration_id = args[:original_floodlight_configuration_id] if args.key?(:original_floodlight_configuration_id)
          @status = args[:status] if args.key?(:status)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @suspended = args[:suspended] if args.key?(:suspended)
        end
      end
      
      # Groups advertisers together so that reports can be generated for the entire
      # group at once.
      class AdvertiserGroup
        include Google::Apis::Core::Hashable
      
        # Account ID of this advertiser group. This is a read-only field that can be
        # left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # ID of this advertiser group. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#advertiserGroup".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this advertiser group. This is a required field and must be less than
        # 256 characters long and unique among advertiser groups of the same account.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Advertiser Group List Response
      class AdvertiserGroupsListResponse
        include Google::Apis::Core::Hashable
      
        # Advertiser group collection.
        # Corresponds to the JSON property `advertiserGroups`
        # @return [Array<Google::Apis::DfareportingV3_3::AdvertiserGroup>]
        attr_accessor :advertiser_groups
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#advertiserGroupsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @advertiser_groups = args[:advertiser_groups] if args.key?(:advertiser_groups)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Landing Page List Response
      class AdvertiserLandingPagesListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#advertiserLandingPagesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Landing page collection
        # Corresponds to the JSON property `landingPages`
        # @return [Array<Google::Apis::DfareportingV3_3::LandingPage>]
        attr_accessor :landing_pages
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @landing_pages = args[:landing_pages] if args.key?(:landing_pages)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Advertiser List Response
      class AdvertisersListResponse
        include Google::Apis::Core::Hashable
      
        # Advertiser collection.
        # Corresponds to the JSON property `advertisers`
        # @return [Array<Google::Apis::DfareportingV3_3::Advertiser>]
        attr_accessor :advertisers
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#advertisersListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @advertisers = args[:advertisers] if args.key?(:advertisers)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Audience Segment.
      class AudienceSegment
        include Google::Apis::Core::Hashable
      
        # Weight allocated to this segment. The weight assigned will be understood in
        # proportion to the weights assigned to other segments in the same segment group.
        # Acceptable values are 1 to 1000, inclusive.
        # Corresponds to the JSON property `allocation`
        # @return [Fixnum]
        attr_accessor :allocation
      
        # ID of this audience segment. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Name of this audience segment. This is a required field and must be less than
        # 65 characters long.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allocation = args[:allocation] if args.key?(:allocation)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Audience Segment Group.
      class AudienceSegmentGroup
        include Google::Apis::Core::Hashable
      
        # Audience segments assigned to this group. The number of segments must be
        # between 2 and 100.
        # Corresponds to the JSON property `audienceSegments`
        # @return [Array<Google::Apis::DfareportingV3_3::AudienceSegment>]
        attr_accessor :audience_segments
      
        # ID of this audience segment group. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Name of this audience segment group. This is a required field and must be less
        # than 65 characters long.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audience_segments = args[:audience_segments] if args.key?(:audience_segments)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Contains information about a browser that can be targeted by ads.
      class Browser
        include Google::Apis::Core::Hashable
      
        # ID referring to this grouping of browser and version numbers. This is the ID
        # used for targeting.
        # Corresponds to the JSON property `browserVersionId`
        # @return [Fixnum]
        attr_accessor :browser_version_id
      
        # DART ID of this browser. This is the ID used when generating reports.
        # Corresponds to the JSON property `dartId`
        # @return [Fixnum]
        attr_accessor :dart_id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#browser".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Major version number (leftmost number) of this browser. For example, for
        # Chrome 5.0.376.86 beta, this field should be set to 5. An asterisk (*) may be
        # used to target any version number, and a question mark (?) may be used to
        # target cases where the version number cannot be identified. For example,
        # Chrome *.* targets any version of Chrome: 1.2, 2.5, 3.5, and so on. Chrome 3.*
        # targets Chrome 3.1, 3.5, but not 4.0. Firefox ?.? targets cases where the ad
        # server knows the browser is Firefox but can't tell which version it is.
        # Corresponds to the JSON property `majorVersion`
        # @return [String]
        attr_accessor :major_version
      
        # Minor version number (number after first dot on left) of this browser. For
        # example, for Chrome 5.0.375.86 beta, this field should be set to 0. An
        # asterisk (*) may be used to target any version number, and a question mark (?)
        # may be used to target cases where the version number cannot be identified. For
        # example, Chrome *.* targets any version of Chrome: 1.2, 2.5, 3.5, and so on.
        # Chrome 3.* targets Chrome 3.1, 3.5, but not 4.0. Firefox ?.? targets cases
        # where the ad server knows the browser is Firefox but can't tell which version
        # it is.
        # Corresponds to the JSON property `minorVersion`
        # @return [String]
        attr_accessor :minor_version
      
        # Name of this browser.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @browser_version_id = args[:browser_version_id] if args.key?(:browser_version_id)
          @dart_id = args[:dart_id] if args.key?(:dart_id)
          @kind = args[:kind] if args.key?(:kind)
          @major_version = args[:major_version] if args.key?(:major_version)
          @minor_version = args[:minor_version] if args.key?(:minor_version)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Browser List Response
      class BrowsersListResponse
        include Google::Apis::Core::Hashable
      
        # Browser collection.
        # Corresponds to the JSON property `browsers`
        # @return [Array<Google::Apis::DfareportingV3_3::Browser>]
        attr_accessor :browsers
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#browsersListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @browsers = args[:browsers] if args.key?(:browsers)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Contains properties of a Campaign Manager campaign.
      class Campaign
        include Google::Apis::Core::Hashable
      
        # Account ID of this campaign. This is a read-only field that can be left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Campaign ad blocking settings.
        # Corresponds to the JSON property `adBlockingConfiguration`
        # @return [Google::Apis::DfareportingV3_3::AdBlockingConfiguration]
        attr_accessor :ad_blocking_configuration
      
        # Additional creative optimization configurations for the campaign.
        # Corresponds to the JSON property `additionalCreativeOptimizationConfigurations`
        # @return [Array<Google::Apis::DfareportingV3_3::CreativeOptimizationConfiguration>]
        attr_accessor :additional_creative_optimization_configurations
      
        # Advertiser group ID of the associated advertiser.
        # Corresponds to the JSON property `advertiserGroupId`
        # @return [Fixnum]
        attr_accessor :advertiser_group_id
      
        # Advertiser ID of this campaign. This is a required field.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `advertiserIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :advertiser_id_dimension_value
      
        # Whether this campaign has been archived.
        # Corresponds to the JSON property `archived`
        # @return [Boolean]
        attr_accessor :archived
        alias_method :archived?, :archived
      
        # Audience segment groups assigned to this campaign. Cannot have more than 300
        # segment groups.
        # Corresponds to the JSON property `audienceSegmentGroups`
        # @return [Array<Google::Apis::DfareportingV3_3::AudienceSegmentGroup>]
        attr_accessor :audience_segment_groups
      
        # Billing invoice code included in the Campaign Manager client billing invoices
        # associated with the campaign.
        # Corresponds to the JSON property `billingInvoiceCode`
        # @return [String]
        attr_accessor :billing_invoice_code
      
        # Click Through URL Suffix settings.
        # Corresponds to the JSON property `clickThroughUrlSuffixProperties`
        # @return [Google::Apis::DfareportingV3_3::ClickThroughUrlSuffixProperties]
        attr_accessor :click_through_url_suffix_properties
      
        # Arbitrary comments about this campaign. Must be less than 256 characters long.
        # Corresponds to the JSON property `comment`
        # @return [String]
        attr_accessor :comment
      
        # Modification timestamp.
        # Corresponds to the JSON property `createInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :create_info
      
        # List of creative group IDs that are assigned to the campaign.
        # Corresponds to the JSON property `creativeGroupIds`
        # @return [Array<Fixnum>]
        attr_accessor :creative_group_ids
      
        # Creative optimization settings.
        # Corresponds to the JSON property `creativeOptimizationConfiguration`
        # @return [Google::Apis::DfareportingV3_3::CreativeOptimizationConfiguration]
        attr_accessor :creative_optimization_configuration
      
        # Properties of inheriting and overriding the default click-through event tag. A
        # campaign may override the event tag defined at the advertiser level, and an ad
        # may also override the campaign's setting further.
        # Corresponds to the JSON property `defaultClickThroughEventTagProperties`
        # @return [Google::Apis::DfareportingV3_3::DefaultClickThroughEventTagProperties]
        attr_accessor :default_click_through_event_tag_properties
      
        # The default landing page ID for this campaign.
        # Corresponds to the JSON property `defaultLandingPageId`
        # @return [Fixnum]
        attr_accessor :default_landing_page_id
      
        # Date on which the campaign will stop running. On insert, the end date must be
        # today or a future date. The end date must be later than or be the same as the
        # start date. If, for example, you set 6/25/2015 as both the start and end dates,
        # the effective campaign run date is just that day only, 6/25/2015. The hours,
        # minutes, and seconds of the end date should not be set, as doing so will
        # result in an error. This is a required field.
        # Corresponds to the JSON property `endDate`
        # @return [Date]
        attr_accessor :end_date
      
        # Overrides that can be used to activate or deactivate advertiser event tags.
        # Corresponds to the JSON property `eventTagOverrides`
        # @return [Array<Google::Apis::DfareportingV3_3::EventTagOverride>]
        attr_accessor :event_tag_overrides
      
        # External ID for this campaign.
        # Corresponds to the JSON property `externalId`
        # @return [String]
        attr_accessor :external_id
      
        # ID of this campaign. This is a read-only auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `idDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :id_dimension_value
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#campaign".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Modification timestamp.
        # Corresponds to the JSON property `lastModifiedInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :last_modified_info
      
        # Name of this campaign. This is a required field and must be less than 256
        # characters long and unique among campaigns of the same advertiser.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Whether Nielsen reports are enabled for this campaign.
        # Corresponds to the JSON property `nielsenOcrEnabled`
        # @return [Boolean]
        attr_accessor :nielsen_ocr_enabled
        alias_method :nielsen_ocr_enabled?, :nielsen_ocr_enabled
      
        # Date on which the campaign starts running. The start date can be any date. The
        # hours, minutes, and seconds of the start date should not be set, as doing so
        # will result in an error. This is a required field.
        # Corresponds to the JSON property `startDate`
        # @return [Date]
        attr_accessor :start_date
      
        # Subaccount ID of this campaign. This is a read-only field that can be left
        # blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Campaign trafficker contact emails.
        # Corresponds to the JSON property `traffickerEmails`
        # @return [Array<String>]
        attr_accessor :trafficker_emails
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @ad_blocking_configuration = args[:ad_blocking_configuration] if args.key?(:ad_blocking_configuration)
          @additional_creative_optimization_configurations = args[:additional_creative_optimization_configurations] if args.key?(:additional_creative_optimization_configurations)
          @advertiser_group_id = args[:advertiser_group_id] if args.key?(:advertiser_group_id)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_id_dimension_value = args[:advertiser_id_dimension_value] if args.key?(:advertiser_id_dimension_value)
          @archived = args[:archived] if args.key?(:archived)
          @audience_segment_groups = args[:audience_segment_groups] if args.key?(:audience_segment_groups)
          @billing_invoice_code = args[:billing_invoice_code] if args.key?(:billing_invoice_code)
          @click_through_url_suffix_properties = args[:click_through_url_suffix_properties] if args.key?(:click_through_url_suffix_properties)
          @comment = args[:comment] if args.key?(:comment)
          @create_info = args[:create_info] if args.key?(:create_info)
          @creative_group_ids = args[:creative_group_ids] if args.key?(:creative_group_ids)
          @creative_optimization_configuration = args[:creative_optimization_configuration] if args.key?(:creative_optimization_configuration)
          @default_click_through_event_tag_properties = args[:default_click_through_event_tag_properties] if args.key?(:default_click_through_event_tag_properties)
          @default_landing_page_id = args[:default_landing_page_id] if args.key?(:default_landing_page_id)
          @end_date = args[:end_date] if args.key?(:end_date)
          @event_tag_overrides = args[:event_tag_overrides] if args.key?(:event_tag_overrides)
          @external_id = args[:external_id] if args.key?(:external_id)
          @id = args[:id] if args.key?(:id)
          @id_dimension_value = args[:id_dimension_value] if args.key?(:id_dimension_value)
          @kind = args[:kind] if args.key?(:kind)
          @last_modified_info = args[:last_modified_info] if args.key?(:last_modified_info)
          @name = args[:name] if args.key?(:name)
          @nielsen_ocr_enabled = args[:nielsen_ocr_enabled] if args.key?(:nielsen_ocr_enabled)
          @start_date = args[:start_date] if args.key?(:start_date)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @trafficker_emails = args[:trafficker_emails] if args.key?(:trafficker_emails)
        end
      end
      
      # Identifies a creative which has been associated with a given campaign.
      class CampaignCreativeAssociation
        include Google::Apis::Core::Hashable
      
        # ID of the creative associated with the campaign. This is a required field.
        # Corresponds to the JSON property `creativeId`
        # @return [Fixnum]
        attr_accessor :creative_id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#campaignCreativeAssociation".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creative_id = args[:creative_id] if args.key?(:creative_id)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Campaign Creative Association List Response
      class CampaignCreativeAssociationsListResponse
        include Google::Apis::Core::Hashable
      
        # Campaign creative association collection
        # Corresponds to the JSON property `campaignCreativeAssociations`
        # @return [Array<Google::Apis::DfareportingV3_3::CampaignCreativeAssociation>]
        attr_accessor :campaign_creative_associations
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#campaignCreativeAssociationsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @campaign_creative_associations = args[:campaign_creative_associations] if args.key?(:campaign_creative_associations)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Campaign List Response
      class CampaignsListResponse
        include Google::Apis::Core::Hashable
      
        # Campaign collection.
        # Corresponds to the JSON property `campaigns`
        # @return [Array<Google::Apis::DfareportingV3_3::Campaign>]
        attr_accessor :campaigns
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#campaignsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @campaigns = args[:campaigns] if args.key?(:campaigns)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Describes a change that a user has made to a resource.
      class ChangeLog
        include Google::Apis::Core::Hashable
      
        # Account ID of the modified object.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Action which caused the change.
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # Time when the object was modified.
        # Corresponds to the JSON property `changeTime`
        # @return [DateTime]
        attr_accessor :change_time
      
        # Field name of the object which changed.
        # Corresponds to the JSON property `fieldName`
        # @return [String]
        attr_accessor :field_name
      
        # ID of this change log.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#changeLog".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # New value of the object field.
        # Corresponds to the JSON property `newValue`
        # @return [String]
        attr_accessor :new_value
      
        # ID of the object of this change log. The object could be a campaign, placement,
        # ad, or other type.
        # Corresponds to the JSON property `objectId`
        # @return [Fixnum]
        attr_accessor :object_id_prop
      
        # Object type of the change log.
        # Corresponds to the JSON property `objectType`
        # @return [String]
        attr_accessor :object_type
      
        # Old value of the object field.
        # Corresponds to the JSON property `oldValue`
        # @return [String]
        attr_accessor :old_value
      
        # Subaccount ID of the modified object.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Transaction ID of this change log. When a single API call results in many
        # changes, each change will have a separate ID in the change log but will share
        # the same transactionId.
        # Corresponds to the JSON property `transactionId`
        # @return [Fixnum]
        attr_accessor :transaction_id
      
        # ID of the user who modified the object.
        # Corresponds to the JSON property `userProfileId`
        # @return [Fixnum]
        attr_accessor :user_profile_id
      
        # User profile name of the user who modified the object.
        # Corresponds to the JSON property `userProfileName`
        # @return [String]
        attr_accessor :user_profile_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @action = args[:action] if args.key?(:action)
          @change_time = args[:change_time] if args.key?(:change_time)
          @field_name = args[:field_name] if args.key?(:field_name)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @new_value = args[:new_value] if args.key?(:new_value)
          @object_id_prop = args[:object_id_prop] if args.key?(:object_id_prop)
          @object_type = args[:object_type] if args.key?(:object_type)
          @old_value = args[:old_value] if args.key?(:old_value)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @transaction_id = args[:transaction_id] if args.key?(:transaction_id)
          @user_profile_id = args[:user_profile_id] if args.key?(:user_profile_id)
          @user_profile_name = args[:user_profile_name] if args.key?(:user_profile_name)
        end
      end
      
      # Change Log List Response
      class ChangeLogsListResponse
        include Google::Apis::Core::Hashable
      
        # Change log collection.
        # Corresponds to the JSON property `changeLogs`
        # @return [Array<Google::Apis::DfareportingV3_3::ChangeLog>]
        attr_accessor :change_logs
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#changeLogsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @change_logs = args[:change_logs] if args.key?(:change_logs)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # City List Response
      class CitiesListResponse
        include Google::Apis::Core::Hashable
      
        # City collection.
        # Corresponds to the JSON property `cities`
        # @return [Array<Google::Apis::DfareportingV3_3::City>]
        attr_accessor :cities
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#citiesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cities = args[:cities] if args.key?(:cities)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Contains information about a city that can be targeted by ads.
      class City
        include Google::Apis::Core::Hashable
      
        # Country code of the country to which this city belongs.
        # Corresponds to the JSON property `countryCode`
        # @return [String]
        attr_accessor :country_code
      
        # DART ID of the country to which this city belongs.
        # Corresponds to the JSON property `countryDartId`
        # @return [Fixnum]
        attr_accessor :country_dart_id
      
        # DART ID of this city. This is the ID used for targeting and generating reports.
        # Corresponds to the JSON property `dartId`
        # @return [Fixnum]
        attr_accessor :dart_id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#city".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Metro region code of the metro region (DMA) to which this city belongs.
        # Corresponds to the JSON property `metroCode`
        # @return [String]
        attr_accessor :metro_code
      
        # ID of the metro region (DMA) to which this city belongs.
        # Corresponds to the JSON property `metroDmaId`
        # @return [Fixnum]
        attr_accessor :metro_dma_id
      
        # Name of this city.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Region code of the region to which this city belongs.
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        # DART ID of the region to which this city belongs.
        # Corresponds to the JSON property `regionDartId`
        # @return [Fixnum]
        attr_accessor :region_dart_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @country_code = args[:country_code] if args.key?(:country_code)
          @country_dart_id = args[:country_dart_id] if args.key?(:country_dart_id)
          @dart_id = args[:dart_id] if args.key?(:dart_id)
          @kind = args[:kind] if args.key?(:kind)
          @metro_code = args[:metro_code] if args.key?(:metro_code)
          @metro_dma_id = args[:metro_dma_id] if args.key?(:metro_dma_id)
          @name = args[:name] if args.key?(:name)
          @region_code = args[:region_code] if args.key?(:region_code)
          @region_dart_id = args[:region_dart_id] if args.key?(:region_dart_id)
        end
      end
      
      # Creative Click Tag.
      class ClickTag
        include Google::Apis::Core::Hashable
      
        # Click-through URL
        # Corresponds to the JSON property `clickThroughUrl`
        # @return [Google::Apis::DfareportingV3_3::CreativeClickThroughUrl]
        attr_accessor :click_through_url
      
        # Advertiser event name associated with the click tag. This field is used by
        # DISPLAY_IMAGE_GALLERY and HTML5_BANNER creatives. Applicable to DISPLAY when
        # the primary asset type is not HTML_IMAGE.
        # Corresponds to the JSON property `eventName`
        # @return [String]
        attr_accessor :event_name
      
        # Parameter name for the specified click tag. For DISPLAY_IMAGE_GALLERY creative
        # assets, this field must match the value of the creative asset's
        # creativeAssetId.name field.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @click_through_url = args[:click_through_url] if args.key?(:click_through_url)
          @event_name = args[:event_name] if args.key?(:event_name)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Click-through URL
      class ClickThroughUrl
        include Google::Apis::Core::Hashable
      
        # Read-only convenience field representing the actual URL that will be used for
        # this click-through. The URL is computed as follows:
        # - If defaultLandingPage is enabled then the campaign's default landing page
        # URL is assigned to this field.
        # - If defaultLandingPage is not enabled and a landingPageId is specified then
        # that landing page's URL is assigned to this field.
        # - If neither of the above cases apply, then the customClickThroughUrl is
        # assigned to this field.
        # Corresponds to the JSON property `computedClickThroughUrl`
        # @return [String]
        attr_accessor :computed_click_through_url
      
        # Custom click-through URL. Applicable if the defaultLandingPage field is set to
        # false and the landingPageId field is left unset.
        # Corresponds to the JSON property `customClickThroughUrl`
        # @return [String]
        attr_accessor :custom_click_through_url
      
        # Whether the campaign default landing page is used.
        # Corresponds to the JSON property `defaultLandingPage`
        # @return [Boolean]
        attr_accessor :default_landing_page
        alias_method :default_landing_page?, :default_landing_page
      
        # ID of the landing page for the click-through URL. Applicable if the
        # defaultLandingPage field is set to false.
        # Corresponds to the JSON property `landingPageId`
        # @return [Fixnum]
        attr_accessor :landing_page_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @computed_click_through_url = args[:computed_click_through_url] if args.key?(:computed_click_through_url)
          @custom_click_through_url = args[:custom_click_through_url] if args.key?(:custom_click_through_url)
          @default_landing_page = args[:default_landing_page] if args.key?(:default_landing_page)
          @landing_page_id = args[:landing_page_id] if args.key?(:landing_page_id)
        end
      end
      
      # Click Through URL Suffix settings.
      class ClickThroughUrlSuffixProperties
        include Google::Apis::Core::Hashable
      
        # Click-through URL suffix to apply to all ads in this entity's scope. Must be
        # less than 128 characters long.
        # Corresponds to the JSON property `clickThroughUrlSuffix`
        # @return [String]
        attr_accessor :click_through_url_suffix
      
        # Whether this entity should override the inherited click-through URL suffix
        # with its own defined value.
        # Corresponds to the JSON property `overrideInheritedSuffix`
        # @return [Boolean]
        attr_accessor :override_inherited_suffix
        alias_method :override_inherited_suffix?, :override_inherited_suffix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @click_through_url_suffix = args[:click_through_url_suffix] if args.key?(:click_through_url_suffix)
          @override_inherited_suffix = args[:override_inherited_suffix] if args.key?(:override_inherited_suffix)
        end
      end
      
      # Companion Click-through override.
      class CompanionClickThroughOverride
        include Google::Apis::Core::Hashable
      
        # Click-through URL
        # Corresponds to the JSON property `clickThroughUrl`
        # @return [Google::Apis::DfareportingV3_3::ClickThroughUrl]
        attr_accessor :click_through_url
      
        # ID of the creative for this companion click-through override.
        # Corresponds to the JSON property `creativeId`
        # @return [Fixnum]
        attr_accessor :creative_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @click_through_url = args[:click_through_url] if args.key?(:click_through_url)
          @creative_id = args[:creative_id] if args.key?(:creative_id)
        end
      end
      
      # Companion Settings
      class CompanionSetting
        include Google::Apis::Core::Hashable
      
        # Whether companions are disabled for this placement.
        # Corresponds to the JSON property `companionsDisabled`
        # @return [Boolean]
        attr_accessor :companions_disabled
        alias_method :companions_disabled?, :companions_disabled
      
        # Whitelist of companion sizes to be served to this placement. Set this list to
        # null or empty to serve all companion sizes.
        # Corresponds to the JSON property `enabledSizes`
        # @return [Array<Google::Apis::DfareportingV3_3::Size>]
        attr_accessor :enabled_sizes
      
        # Whether to serve only static images as companions.
        # Corresponds to the JSON property `imageOnly`
        # @return [Boolean]
        attr_accessor :image_only
        alias_method :image_only?, :image_only
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#companionSetting".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @companions_disabled = args[:companions_disabled] if args.key?(:companions_disabled)
          @enabled_sizes = args[:enabled_sizes] if args.key?(:enabled_sizes)
          @image_only = args[:image_only] if args.key?(:image_only)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Represents a response to the queryCompatibleFields method.
      class CompatibleFields
        include Google::Apis::Core::Hashable
      
        # Represents fields that are compatible to be selected for a report of type "
        # CROSS_DIMENSION_REACH".
        # Corresponds to the JSON property `crossDimensionReachReportCompatibleFields`
        # @return [Google::Apis::DfareportingV3_3::CrossDimensionReachReportCompatibleFields]
        attr_accessor :cross_dimension_reach_report_compatible_fields
      
        # Represents fields that are compatible to be selected for a report of type "
        # FlOODLIGHT".
        # Corresponds to the JSON property `floodlightReportCompatibleFields`
        # @return [Google::Apis::DfareportingV3_3::FloodlightReportCompatibleFields]
        attr_accessor :floodlight_report_compatible_fields
      
        # The kind of resource this is, in this case dfareporting#compatibleFields.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Represents fields that are compatible to be selected for a report of type "
        # PATH_TO_CONVERSION".
        # Corresponds to the JSON property `pathToConversionReportCompatibleFields`
        # @return [Google::Apis::DfareportingV3_3::PathToConversionReportCompatibleFields]
        attr_accessor :path_to_conversion_report_compatible_fields
      
        # Represents fields that are compatible to be selected for a report of type "
        # REACH".
        # Corresponds to the JSON property `reachReportCompatibleFields`
        # @return [Google::Apis::DfareportingV3_3::ReachReportCompatibleFields]
        attr_accessor :reach_report_compatible_fields
      
        # Represents fields that are compatible to be selected for a report of type "
        # STANDARD".
        # Corresponds to the JSON property `reportCompatibleFields`
        # @return [Google::Apis::DfareportingV3_3::ReportCompatibleFields]
        attr_accessor :report_compatible_fields
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cross_dimension_reach_report_compatible_fields = args[:cross_dimension_reach_report_compatible_fields] if args.key?(:cross_dimension_reach_report_compatible_fields)
          @floodlight_report_compatible_fields = args[:floodlight_report_compatible_fields] if args.key?(:floodlight_report_compatible_fields)
          @kind = args[:kind] if args.key?(:kind)
          @path_to_conversion_report_compatible_fields = args[:path_to_conversion_report_compatible_fields] if args.key?(:path_to_conversion_report_compatible_fields)
          @reach_report_compatible_fields = args[:reach_report_compatible_fields] if args.key?(:reach_report_compatible_fields)
          @report_compatible_fields = args[:report_compatible_fields] if args.key?(:report_compatible_fields)
        end
      end
      
      # Contains information about an internet connection type that can be targeted by
      # ads. Clients can use the connection type to target mobile vs. broadband users.
      class ConnectionType
        include Google::Apis::Core::Hashable
      
        # ID of this connection type.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#connectionType".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this connection type.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Connection Type List Response
      class ConnectionTypesListResponse
        include Google::Apis::Core::Hashable
      
        # Collection of connection types such as broadband and mobile.
        # Corresponds to the JSON property `connectionTypes`
        # @return [Array<Google::Apis::DfareportingV3_3::ConnectionType>]
        attr_accessor :connection_types
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#connectionTypesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @connection_types = args[:connection_types] if args.key?(:connection_types)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Content Category List Response
      class ContentCategoriesListResponse
        include Google::Apis::Core::Hashable
      
        # Content category collection.
        # Corresponds to the JSON property `contentCategories`
        # @return [Array<Google::Apis::DfareportingV3_3::ContentCategory>]
        attr_accessor :content_categories
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#contentCategoriesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_categories = args[:content_categories] if args.key?(:content_categories)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Organizes placements according to the contents of their associated webpages.
      class ContentCategory
        include Google::Apis::Core::Hashable
      
        # Account ID of this content category. This is a read-only field that can be
        # left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # ID of this content category. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#contentCategory".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this content category. This is a required field and must be less than
        # 256 characters long and unique among content categories of the same account.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A Conversion represents when a user successfully performs a desired action
      # after seeing an ad.
      class Conversion
        include Google::Apis::Core::Hashable
      
        # Whether this particular request may come from a user under the age of 13,
        # under COPPA compliance.
        # Corresponds to the JSON property `childDirectedTreatment`
        # @return [Boolean]
        attr_accessor :child_directed_treatment
        alias_method :child_directed_treatment?, :child_directed_treatment
      
        # Custom floodlight variables.
        # Corresponds to the JSON property `customVariables`
        # @return [Array<Google::Apis::DfareportingV3_3::CustomFloodlightVariable>]
        attr_accessor :custom_variables
      
        # The alphanumeric encrypted user ID. When set, encryptionInfo should also be
        # specified. This field is mutually exclusive with encryptedUserIdCandidates[],
        # matchId, mobileDeviceId and gclid. This or encryptedUserIdCandidates[] or
        # matchId or mobileDeviceId or gclid is a required field.
        # Corresponds to the JSON property `encryptedUserId`
        # @return [String]
        attr_accessor :encrypted_user_id
      
        # A list of the alphanumeric encrypted user IDs. Any user ID with exposure prior
        # to the conversion timestamp will be used in the inserted conversion. If no
        # such user ID is found then the conversion will be rejected with
        # NO_COOKIE_MATCH_FOUND error. When set, encryptionInfo should also be specified.
        # This field may only be used when calling batchinsert; it is not supported by
        # batchupdate. This field is mutually exclusive with encryptedUserId, matchId,
        # mobileDeviceId and gclid. This or encryptedUserId or matchId or mobileDeviceId
        # or gclid is a required field.
        # Corresponds to the JSON property `encryptedUserIdCandidates`
        # @return [Array<String>]
        attr_accessor :encrypted_user_id_candidates
      
        # Floodlight Activity ID of this conversion. This is a required field.
        # Corresponds to the JSON property `floodlightActivityId`
        # @return [Fixnum]
        attr_accessor :floodlight_activity_id
      
        # Floodlight Configuration ID of this conversion. This is a required field.
        # Corresponds to the JSON property `floodlightConfigurationId`
        # @return [Fixnum]
        attr_accessor :floodlight_configuration_id
      
        # The Google click ID. This field is mutually exclusive with encryptedUserId,
        # encryptedUserIdCandidates[], matchId and mobileDeviceId. This or
        # encryptedUserId or encryptedUserIdCandidates[] or matchId or mobileDeviceId is
        # a required field.
        # Corresponds to the JSON property `gclid`
        # @return [String]
        attr_accessor :gclid
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#conversion".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Whether Limit Ad Tracking is enabled. When set to true, the conversion will be
        # used for reporting but not targeting. This will prevent remarketing.
        # Corresponds to the JSON property `limitAdTracking`
        # @return [Boolean]
        attr_accessor :limit_ad_tracking
        alias_method :limit_ad_tracking?, :limit_ad_tracking
      
        # The match ID field. A match ID is your own first-party identifier that has
        # been synced with Google using the match ID feature in Floodlight. This field
        # is mutually exclusive with encryptedUserId, encryptedUserIdCandidates[],
        # mobileDeviceId and gclid. This or encryptedUserId or encryptedUserIdCandidates[
        # ] or mobileDeviceId or gclid is a required field.
        # Corresponds to the JSON property `matchId`
        # @return [String]
        attr_accessor :match_id
      
        # The mobile device ID. This field is mutually exclusive with encryptedUserId,
        # encryptedUserIdCandidates[], matchId and gclid. This or encryptedUserId or
        # encryptedUserIdCandidates[] or matchId or gclid is a required field.
        # Corresponds to the JSON property `mobileDeviceId`
        # @return [String]
        attr_accessor :mobile_device_id
      
        # Whether the conversion was for a non personalized ad.
        # Corresponds to the JSON property `nonPersonalizedAd`
        # @return [Boolean]
        attr_accessor :non_personalized_ad
        alias_method :non_personalized_ad?, :non_personalized_ad
      
        # The ordinal of the conversion. Use this field to control how conversions of
        # the same user and day are de-duplicated. This is a required field.
        # Corresponds to the JSON property `ordinal`
        # @return [String]
        attr_accessor :ordinal
      
        # The quantity of the conversion.
        # Corresponds to the JSON property `quantity`
        # @return [Fixnum]
        attr_accessor :quantity
      
        # The timestamp of conversion, in Unix epoch micros. This is a required field.
        # Corresponds to the JSON property `timestampMicros`
        # @return [Fixnum]
        attr_accessor :timestamp_micros
      
        # Whether this particular request may come from a user under the age of 16 (may
        # differ by country), under compliance with the European Union's General Data
        # Protection Regulation (GDPR).
        # Corresponds to the JSON property `treatmentForUnderage`
        # @return [Boolean]
        attr_accessor :treatment_for_underage
        alias_method :treatment_for_underage?, :treatment_for_underage
      
        # The value of the conversion.
        # Corresponds to the JSON property `value`
        # @return [Float]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @child_directed_treatment = args[:child_directed_treatment] if args.key?(:child_directed_treatment)
          @custom_variables = args[:custom_variables] if args.key?(:custom_variables)
          @encrypted_user_id = args[:encrypted_user_id] if args.key?(:encrypted_user_id)
          @encrypted_user_id_candidates = args[:encrypted_user_id_candidates] if args.key?(:encrypted_user_id_candidates)
          @floodlight_activity_id = args[:floodlight_activity_id] if args.key?(:floodlight_activity_id)
          @floodlight_configuration_id = args[:floodlight_configuration_id] if args.key?(:floodlight_configuration_id)
          @gclid = args[:gclid] if args.key?(:gclid)
          @kind = args[:kind] if args.key?(:kind)
          @limit_ad_tracking = args[:limit_ad_tracking] if args.key?(:limit_ad_tracking)
          @match_id = args[:match_id] if args.key?(:match_id)
          @mobile_device_id = args[:mobile_device_id] if args.key?(:mobile_device_id)
          @non_personalized_ad = args[:non_personalized_ad] if args.key?(:non_personalized_ad)
          @ordinal = args[:ordinal] if args.key?(:ordinal)
          @quantity = args[:quantity] if args.key?(:quantity)
          @timestamp_micros = args[:timestamp_micros] if args.key?(:timestamp_micros)
          @treatment_for_underage = args[:treatment_for_underage] if args.key?(:treatment_for_underage)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # The error code and description for a conversion that failed to insert or
      # update.
      class ConversionError
        include Google::Apis::Core::Hashable
      
        # The error code.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#conversionError".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A description of the error.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @kind = args[:kind] if args.key?(:kind)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # The original conversion that was inserted or updated and whether there were
      # any errors.
      class ConversionStatus
        include Google::Apis::Core::Hashable
      
        # A Conversion represents when a user successfully performs a desired action
        # after seeing an ad.
        # Corresponds to the JSON property `conversion`
        # @return [Google::Apis::DfareportingV3_3::Conversion]
        attr_accessor :conversion
      
        # A list of errors related to this conversion.
        # Corresponds to the JSON property `errors`
        # @return [Array<Google::Apis::DfareportingV3_3::ConversionError>]
        attr_accessor :errors
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#conversionStatus".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conversion = args[:conversion] if args.key?(:conversion)
          @errors = args[:errors] if args.key?(:errors)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Insert Conversions Request.
      class ConversionsBatchInsertRequest
        include Google::Apis::Core::Hashable
      
        # The set of conversions to insert.
        # Corresponds to the JSON property `conversions`
        # @return [Array<Google::Apis::DfareportingV3_3::Conversion>]
        attr_accessor :conversions
      
        # A description of how user IDs are encrypted.
        # Corresponds to the JSON property `encryptionInfo`
        # @return [Google::Apis::DfareportingV3_3::EncryptionInfo]
        attr_accessor :encryption_info
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#conversionsBatchInsertRequest".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conversions = args[:conversions] if args.key?(:conversions)
          @encryption_info = args[:encryption_info] if args.key?(:encryption_info)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Insert Conversions Response.
      class ConversionsBatchInsertResponse
        include Google::Apis::Core::Hashable
      
        # Indicates that some or all conversions failed to insert.
        # Corresponds to the JSON property `hasFailures`
        # @return [Boolean]
        attr_accessor :has_failures
        alias_method :has_failures?, :has_failures
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#conversionsBatchInsertResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The insert status of each conversion. Statuses are returned in the same order
        # that conversions are inserted.
        # Corresponds to the JSON property `status`
        # @return [Array<Google::Apis::DfareportingV3_3::ConversionStatus>]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @has_failures = args[:has_failures] if args.key?(:has_failures)
          @kind = args[:kind] if args.key?(:kind)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Update Conversions Request.
      class ConversionsBatchUpdateRequest
        include Google::Apis::Core::Hashable
      
        # The set of conversions to update.
        # Corresponds to the JSON property `conversions`
        # @return [Array<Google::Apis::DfareportingV3_3::Conversion>]
        attr_accessor :conversions
      
        # A description of how user IDs are encrypted.
        # Corresponds to the JSON property `encryptionInfo`
        # @return [Google::Apis::DfareportingV3_3::EncryptionInfo]
        attr_accessor :encryption_info
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#conversionsBatchUpdateRequest".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conversions = args[:conversions] if args.key?(:conversions)
          @encryption_info = args[:encryption_info] if args.key?(:encryption_info)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Update Conversions Response.
      class ConversionsBatchUpdateResponse
        include Google::Apis::Core::Hashable
      
        # Indicates that some or all conversions failed to update.
        # Corresponds to the JSON property `hasFailures`
        # @return [Boolean]
        attr_accessor :has_failures
        alias_method :has_failures?, :has_failures
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#conversionsBatchUpdateResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The update status of each conversion. Statuses are returned in the same order
        # that conversions are updated.
        # Corresponds to the JSON property `status`
        # @return [Array<Google::Apis::DfareportingV3_3::ConversionStatus>]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @has_failures = args[:has_failures] if args.key?(:has_failures)
          @kind = args[:kind] if args.key?(:kind)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Country List Response
      class CountriesListResponse
        include Google::Apis::Core::Hashable
      
        # Country collection.
        # Corresponds to the JSON property `countries`
        # @return [Array<Google::Apis::DfareportingV3_3::Country>]
        attr_accessor :countries
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#countriesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @countries = args[:countries] if args.key?(:countries)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Contains information about a country that can be targeted by ads.
      class Country
        include Google::Apis::Core::Hashable
      
        # Country code.
        # Corresponds to the JSON property `countryCode`
        # @return [String]
        attr_accessor :country_code
      
        # DART ID of this country. This is the ID used for targeting and generating
        # reports.
        # Corresponds to the JSON property `dartId`
        # @return [Fixnum]
        attr_accessor :dart_id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#country".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this country.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Whether ad serving supports secure servers in this country.
        # Corresponds to the JSON property `sslEnabled`
        # @return [Boolean]
        attr_accessor :ssl_enabled
        alias_method :ssl_enabled?, :ssl_enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @country_code = args[:country_code] if args.key?(:country_code)
          @dart_id = args[:dart_id] if args.key?(:dart_id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @ssl_enabled = args[:ssl_enabled] if args.key?(:ssl_enabled)
        end
      end
      
      # Contains properties of a Creative.
      class Creative
        include Google::Apis::Core::Hashable
      
        # Account ID of this creative. This field, if left unset, will be auto-generated
        # for both insert and update operations. Applicable to all creative types.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Whether the creative is active. Applicable to all creative types.
        # Corresponds to the JSON property `active`
        # @return [Boolean]
        attr_accessor :active
        alias_method :active?, :active
      
        # Ad parameters user for VPAID creative. This is a read-only field. Applicable
        # to the following creative types: all VPAID.
        # Corresponds to the JSON property `adParameters`
        # @return [String]
        attr_accessor :ad_parameters
      
        # Keywords for a Rich Media creative. Keywords let you customize the creative
        # settings of a Rich Media ad running on your site without having to contact the
        # advertiser. You can use keywords to dynamically change the look or
        # functionality of a creative. Applicable to the following creative types: all
        # RICH_MEDIA, and all VPAID.
        # Corresponds to the JSON property `adTagKeys`
        # @return [Array<String>]
        attr_accessor :ad_tag_keys
      
        # Additional sizes associated with a responsive creative. When inserting or
        # updating a creative either the size ID field or size width and height fields
        # can be used. Applicable to DISPLAY creatives when the primary asset type is
        # HTML_IMAGE.
        # Corresponds to the JSON property `additionalSizes`
        # @return [Array<Google::Apis::DfareportingV3_3::Size>]
        attr_accessor :additional_sizes
      
        # Advertiser ID of this creative. This is a required field. Applicable to all
        # creative types.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Whether script access is allowed for this creative. This is a read-only and
        # deprecated field which will automatically be set to true on update. Applicable
        # to the following creative types: FLASH_INPAGE.
        # Corresponds to the JSON property `allowScriptAccess`
        # @return [Boolean]
        attr_accessor :allow_script_access
        alias_method :allow_script_access?, :allow_script_access
      
        # Whether the creative is archived. Applicable to all creative types.
        # Corresponds to the JSON property `archived`
        # @return [Boolean]
        attr_accessor :archived
        alias_method :archived?, :archived
      
        # Type of artwork used for the creative. This is a read-only field. Applicable
        # to the following creative types: all RICH_MEDIA, and all VPAID.
        # Corresponds to the JSON property `artworkType`
        # @return [String]
        attr_accessor :artwork_type
      
        # Source application where creative was authored. Presently, only DBM authored
        # creatives will have this field set. Applicable to all creative types.
        # Corresponds to the JSON property `authoringSource`
        # @return [String]
        attr_accessor :authoring_source
      
        # Authoring tool for HTML5 banner creatives. This is a read-only field.
        # Applicable to the following creative types: HTML5_BANNER.
        # Corresponds to the JSON property `authoringTool`
        # @return [String]
        attr_accessor :authoring_tool
      
        # Whether images are automatically advanced for image gallery creatives.
        # Applicable to the following creative types: DISPLAY_IMAGE_GALLERY.
        # Corresponds to the JSON property `autoAdvanceImages`
        # @return [Boolean]
        attr_accessor :auto_advance_images
        alias_method :auto_advance_images?, :auto_advance_images
      
        # The 6-character HTML color code, beginning with #, for the background of the
        # window area where the Flash file is displayed. Default is white. Applicable to
        # the following creative types: FLASH_INPAGE.
        # Corresponds to the JSON property `backgroundColor`
        # @return [String]
        attr_accessor :background_color
      
        # Click-through URL
        # Corresponds to the JSON property `backupImageClickThroughUrl`
        # @return [Google::Apis::DfareportingV3_3::CreativeClickThroughUrl]
        attr_accessor :backup_image_click_through_url
      
        # List of feature dependencies that will cause a backup image to be served if
        # the browser that serves the ad does not support them. Feature dependencies are
        # features that a browser must be able to support in order to render your HTML5
        # creative asset correctly. This field is initially auto-generated to contain
        # all features detected by Campaign Manager for all the assets of this creative
        # and can then be modified by the client. To reset this field, copy over all the
        # creativeAssets' detected features. Applicable to the following creative types:
        # HTML5_BANNER. Applicable to DISPLAY when the primary asset type is not
        # HTML_IMAGE.
        # Corresponds to the JSON property `backupImageFeatures`
        # @return [Array<String>]
        attr_accessor :backup_image_features
      
        # Reporting label used for HTML5 banner backup image. Applicable to the
        # following creative types: DISPLAY when the primary asset type is not
        # HTML_IMAGE.
        # Corresponds to the JSON property `backupImageReportingLabel`
        # @return [String]
        attr_accessor :backup_image_reporting_label
      
        # Target Window.
        # Corresponds to the JSON property `backupImageTargetWindow`
        # @return [Google::Apis::DfareportingV3_3::TargetWindow]
        attr_accessor :backup_image_target_window
      
        # Click tags of the creative. For DISPLAY, FLASH_INPAGE, and HTML5_BANNER
        # creatives, this is a subset of detected click tags for the assets associated
        # with this creative. After creating a flash asset, detected click tags will be
        # returned in the creativeAssetMetadata. When inserting the creative, populate
        # the creative clickTags field using the creativeAssetMetadata.clickTags field.
        # For DISPLAY_IMAGE_GALLERY creatives, there should be exactly one entry in this
        # list for each image creative asset. A click tag is matched with a
        # corresponding creative asset by matching the clickTag.name field with the
        # creativeAsset.assetIdentifier.name field. Applicable to the following creative
        # types: DISPLAY_IMAGE_GALLERY, FLASH_INPAGE, HTML5_BANNER. Applicable to
        # DISPLAY when the primary asset type is not HTML_IMAGE.
        # Corresponds to the JSON property `clickTags`
        # @return [Array<Google::Apis::DfareportingV3_3::ClickTag>]
        attr_accessor :click_tags
      
        # Industry standard ID assigned to creative for reach and frequency. Applicable
        # to INSTREAM_VIDEO_REDIRECT creatives.
        # Corresponds to the JSON property `commercialId`
        # @return [String]
        attr_accessor :commercial_id
      
        # List of companion creatives assigned to an in-Stream video creative.
        # Acceptable values include IDs of existing flash and image creatives.
        # Applicable to the following creative types: all VPAID, all INSTREAM_AUDIO and
        # all INSTREAM_VIDEO with dynamicAssetSelection set to false.
        # Corresponds to the JSON property `companionCreatives`
        # @return [Array<Fixnum>]
        attr_accessor :companion_creatives
      
        # Compatibilities associated with this creative. This is a read-only field.
        # DISPLAY and DISPLAY_INTERSTITIAL refer to rendering either on desktop or on
        # mobile devices or in mobile apps for regular or interstitial ads, respectively.
        # APP and APP_INTERSTITIAL are for rendering in mobile apps. Only pre-existing
        # creatives may have these compatibilities since new creatives will either be
        # assigned DISPLAY or DISPLAY_INTERSTITIAL instead. IN_STREAM_VIDEO refers to
        # rendering in in-stream video ads developed with the VAST standard.
        # IN_STREAM_AUDIO refers to rendering in in-stream audio ads developed with the
        # VAST standard. Applicable to all creative types.
        # Acceptable values are:
        # - "APP"
        # - "APP_INTERSTITIAL"
        # - "IN_STREAM_VIDEO"
        # - "IN_STREAM_AUDIO"
        # - "DISPLAY"
        # - "DISPLAY_INTERSTITIAL"
        # Corresponds to the JSON property `compatibility`
        # @return [Array<String>]
        attr_accessor :compatibility
      
        # Whether Flash assets associated with the creative need to be automatically
        # converted to HTML5. This flag is enabled by default and users can choose to
        # disable it if they don't want the system to generate and use HTML5 asset for
        # this creative. Applicable to the following creative type: FLASH_INPAGE.
        # Applicable to DISPLAY when the primary asset type is not HTML_IMAGE.
        # Corresponds to the JSON property `convertFlashToHtml5`
        # @return [Boolean]
        attr_accessor :convert_flash_to_html5
        alias_method :convert_flash_to_html5?, :convert_flash_to_html5
      
        # List of counter events configured for the creative. For DISPLAY_IMAGE_GALLERY
        # creatives, these are read-only and auto-generated from clickTags. Applicable
        # to the following creative types: DISPLAY_IMAGE_GALLERY, all RICH_MEDIA, and
        # all VPAID.
        # Corresponds to the JSON property `counterCustomEvents`
        # @return [Array<Google::Apis::DfareportingV3_3::CreativeCustomEvent>]
        attr_accessor :counter_custom_events
      
        # Encapsulates the list of rules for asset selection and a default asset in case
        # none of the rules match. Applicable to INSTREAM_VIDEO creatives.
        # Corresponds to the JSON property `creativeAssetSelection`
        # @return [Google::Apis::DfareportingV3_3::CreativeAssetSelection]
        attr_accessor :creative_asset_selection
      
        # Assets associated with a creative. Applicable to all but the following
        # creative types: INTERNAL_REDIRECT, INTERSTITIAL_INTERNAL_REDIRECT, and
        # REDIRECT
        # Corresponds to the JSON property `creativeAssets`
        # @return [Array<Google::Apis::DfareportingV3_3::CreativeAsset>]
        attr_accessor :creative_assets
      
        # Creative field assignments for this creative. Applicable to all creative types.
        # Corresponds to the JSON property `creativeFieldAssignments`
        # @return [Array<Google::Apis::DfareportingV3_3::CreativeFieldAssignment>]
        attr_accessor :creative_field_assignments
      
        # Custom key-values for a Rich Media creative. Key-values let you customize the
        # creative settings of a Rich Media ad running on your site without having to
        # contact the advertiser. You can use key-values to dynamically change the look
        # or functionality of a creative. Applicable to the following creative types:
        # all RICH_MEDIA, and all VPAID.
        # Corresponds to the JSON property `customKeyValues`
        # @return [Array<String>]
        attr_accessor :custom_key_values
      
        # Set this to true to enable the use of rules to target individual assets in
        # this creative. When set to true creativeAssetSelection must be set. This also
        # controls asset-level companions. When this is true, companion creatives should
        # be assigned to creative assets. Learn more. Applicable to INSTREAM_VIDEO
        # creatives.
        # Corresponds to the JSON property `dynamicAssetSelection`
        # @return [Boolean]
        attr_accessor :dynamic_asset_selection
        alias_method :dynamic_asset_selection?, :dynamic_asset_selection
      
        # List of exit events configured for the creative. For DISPLAY and
        # DISPLAY_IMAGE_GALLERY creatives, these are read-only and auto-generated from
        # clickTags, For DISPLAY, an event is also created from the
        # backupImageReportingLabel. Applicable to the following creative types:
        # DISPLAY_IMAGE_GALLERY, all RICH_MEDIA, and all VPAID. Applicable to DISPLAY
        # when the primary asset type is not HTML_IMAGE.
        # Corresponds to the JSON property `exitCustomEvents`
        # @return [Array<Google::Apis::DfareportingV3_3::CreativeCustomEvent>]
        attr_accessor :exit_custom_events
      
        # FsCommand.
        # Corresponds to the JSON property `fsCommand`
        # @return [Google::Apis::DfareportingV3_3::FsCommand]
        attr_accessor :fs_command
      
        # HTML code for the creative. This is a required field when applicable. This
        # field is ignored if htmlCodeLocked is true. Applicable to the following
        # creative types: all CUSTOM, FLASH_INPAGE, and HTML5_BANNER, and all RICH_MEDIA.
        # Corresponds to the JSON property `htmlCode`
        # @return [String]
        attr_accessor :html_code
      
        # Whether HTML code is generated by Campaign Manager or manually entered. Set to
        # true to ignore changes to htmlCode. Applicable to the following creative types:
        # FLASH_INPAGE and HTML5_BANNER.
        # Corresponds to the JSON property `htmlCodeLocked`
        # @return [Boolean]
        attr_accessor :html_code_locked
        alias_method :html_code_locked?, :html_code_locked
      
        # ID of this creative. This is a read-only, auto-generated field. Applicable to
        # all creative types.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `idDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :id_dimension_value
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#creative".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Modification timestamp.
        # Corresponds to the JSON property `lastModifiedInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :last_modified_info
      
        # Latest Studio trafficked creative ID associated with rich media and VPAID
        # creatives. This is a read-only field. Applicable to the following creative
        # types: all RICH_MEDIA, and all VPAID.
        # Corresponds to the JSON property `latestTraffickedCreativeId`
        # @return [Fixnum]
        attr_accessor :latest_trafficked_creative_id
      
        # Description of the audio or video ad. Applicable to the following creative
        # types: all INSTREAM_VIDEO, INSTREAM_AUDIO, and all VPAID.
        # Corresponds to the JSON property `mediaDescription`
        # @return [String]
        attr_accessor :media_description
      
        # Creative audio or video duration in seconds. This is a read-only field.
        # Applicable to the following creative types: INSTREAM_VIDEO, INSTREAM_AUDIO,
        # all RICH_MEDIA, and all VPAID.
        # Corresponds to the JSON property `mediaDuration`
        # @return [Float]
        attr_accessor :media_duration
      
        # Name of the creative. This is a required field and must be less than 256
        # characters long. Applicable to all creative types.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Override CSS value for rich media creatives. Applicable to the following
        # creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `overrideCss`
        # @return [String]
        attr_accessor :override_css
      
        # Video Offset
        # Corresponds to the JSON property `progressOffset`
        # @return [Google::Apis::DfareportingV3_3::VideoOffset]
        attr_accessor :progress_offset
      
        # URL of hosted image or hosted video or another ad tag. For
        # INSTREAM_VIDEO_REDIRECT creatives this is the in-stream video redirect URL.
        # The standard for a VAST (Video Ad Serving Template) ad response allows for a
        # redirect link to another VAST 2.0 or 3.0 call. This is a required field when
        # applicable. Applicable to the following creative types: DISPLAY_REDIRECT,
        # INTERNAL_REDIRECT, INTERSTITIAL_INTERNAL_REDIRECT, and INSTREAM_VIDEO_REDIRECT
        # Corresponds to the JSON property `redirectUrl`
        # @return [String]
        attr_accessor :redirect_url
      
        # ID of current rendering version. This is a read-only field. Applicable to all
        # creative types.
        # Corresponds to the JSON property `renderingId`
        # @return [Fixnum]
        attr_accessor :rendering_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `renderingIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :rendering_id_dimension_value
      
        # The minimum required Flash plugin version for this creative. For example, 11.2.
        # 202.235. This is a read-only field. Applicable to the following creative types:
        # all RICH_MEDIA, and all VPAID.
        # Corresponds to the JSON property `requiredFlashPluginVersion`
        # @return [String]
        attr_accessor :required_flash_plugin_version
      
        # The internal Flash version for this creative as calculated by Studio. This is
        # a read-only field. Applicable to the following creative types: FLASH_INPAGE
        # all RICH_MEDIA, and all VPAID. Applicable to DISPLAY when the primary asset
        # type is not HTML_IMAGE.
        # Corresponds to the JSON property `requiredFlashVersion`
        # @return [Fixnum]
        attr_accessor :required_flash_version
      
        # Represents the dimensions of ads, placements, creatives, or creative assets.
        # Corresponds to the JSON property `size`
        # @return [Google::Apis::DfareportingV3_3::Size]
        attr_accessor :size
      
        # Video Offset
        # Corresponds to the JSON property `skipOffset`
        # @return [Google::Apis::DfareportingV3_3::VideoOffset]
        attr_accessor :skip_offset
      
        # Whether the user can choose to skip the creative. Applicable to the following
        # creative types: all INSTREAM_VIDEO and all VPAID.
        # Corresponds to the JSON property `skippable`
        # @return [Boolean]
        attr_accessor :skippable
        alias_method :skippable?, :skippable
      
        # Whether the creative is SSL-compliant. This is a read-only field. Applicable
        # to all creative types.
        # Corresponds to the JSON property `sslCompliant`
        # @return [Boolean]
        attr_accessor :ssl_compliant
        alias_method :ssl_compliant?, :ssl_compliant
      
        # Whether creative should be treated as SSL compliant even if the system scan
        # shows it's not. Applicable to all creative types.
        # Corresponds to the JSON property `sslOverride`
        # @return [Boolean]
        attr_accessor :ssl_override
        alias_method :ssl_override?, :ssl_override
      
        # Studio advertiser ID associated with rich media and VPAID creatives. This is a
        # read-only field. Applicable to the following creative types: all RICH_MEDIA,
        # and all VPAID.
        # Corresponds to the JSON property `studioAdvertiserId`
        # @return [Fixnum]
        attr_accessor :studio_advertiser_id
      
        # Studio creative ID associated with rich media and VPAID creatives. This is a
        # read-only field. Applicable to the following creative types: all RICH_MEDIA,
        # and all VPAID.
        # Corresponds to the JSON property `studioCreativeId`
        # @return [Fixnum]
        attr_accessor :studio_creative_id
      
        # Studio trafficked creative ID associated with rich media and VPAID creatives.
        # This is a read-only field. Applicable to the following creative types: all
        # RICH_MEDIA, and all VPAID.
        # Corresponds to the JSON property `studioTraffickedCreativeId`
        # @return [Fixnum]
        attr_accessor :studio_trafficked_creative_id
      
        # Subaccount ID of this creative. This field, if left unset, will be auto-
        # generated for both insert and update operations. Applicable to all creative
        # types.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Third-party URL used to record backup image impressions. Applicable to the
        # following creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `thirdPartyBackupImageImpressionsUrl`
        # @return [String]
        attr_accessor :third_party_backup_image_impressions_url
      
        # Third-party URL used to record rich media impressions. Applicable to the
        # following creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `thirdPartyRichMediaImpressionsUrl`
        # @return [String]
        attr_accessor :third_party_rich_media_impressions_url
      
        # Third-party URLs for tracking in-stream creative events. Applicable to the
        # following creative types: all INSTREAM_VIDEO, all INSTREAM_AUDIO, and all
        # VPAID.
        # Corresponds to the JSON property `thirdPartyUrls`
        # @return [Array<Google::Apis::DfareportingV3_3::ThirdPartyTrackingUrl>]
        attr_accessor :third_party_urls
      
        # List of timer events configured for the creative. For DISPLAY_IMAGE_GALLERY
        # creatives, these are read-only and auto-generated from clickTags. Applicable
        # to the following creative types: DISPLAY_IMAGE_GALLERY, all RICH_MEDIA, and
        # all VPAID. Applicable to DISPLAY when the primary asset is not HTML_IMAGE.
        # Corresponds to the JSON property `timerCustomEvents`
        # @return [Array<Google::Apis::DfareportingV3_3::CreativeCustomEvent>]
        attr_accessor :timer_custom_events
      
        # Combined size of all creative assets. This is a read-only field. Applicable to
        # the following creative types: all RICH_MEDIA, and all VPAID.
        # Corresponds to the JSON property `totalFileSize`
        # @return [Fixnum]
        attr_accessor :total_file_size
      
        # Type of this creative. This is a required field. Applicable to all creative
        # types.
        # Note: FLASH_INPAGE, HTML5_BANNER, and IMAGE are only used for existing
        # creatives. New creatives should use DISPLAY as a replacement for these types.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # A Universal Ad ID as per the VAST 4.0 spec. Applicable to the following
        # creative types: INSTREAM_AUDIO, INSTREAM_VIDEO and VPAID.
        # Corresponds to the JSON property `universalAdId`
        # @return [Google::Apis::DfareportingV3_3::UniversalAdId]
        attr_accessor :universal_ad_id
      
        # The version number helps you keep track of multiple versions of your creative
        # in your reports. The version number will always be auto-generated during
        # insert operations to start at 1. For tracking creatives the version cannot be
        # incremented and will always remain at 1. For all other creative types the
        # version can be incremented only by 1 during update operations. In addition,
        # the version will be automatically incremented by 1 when undergoing Rich Media
        # creative merging. Applicable to all creative types.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @active = args[:active] if args.key?(:active)
          @ad_parameters = args[:ad_parameters] if args.key?(:ad_parameters)
          @ad_tag_keys = args[:ad_tag_keys] if args.key?(:ad_tag_keys)
          @additional_sizes = args[:additional_sizes] if args.key?(:additional_sizes)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @allow_script_access = args[:allow_script_access] if args.key?(:allow_script_access)
          @archived = args[:archived] if args.key?(:archived)
          @artwork_type = args[:artwork_type] if args.key?(:artwork_type)
          @authoring_source = args[:authoring_source] if args.key?(:authoring_source)
          @authoring_tool = args[:authoring_tool] if args.key?(:authoring_tool)
          @auto_advance_images = args[:auto_advance_images] if args.key?(:auto_advance_images)
          @background_color = args[:background_color] if args.key?(:background_color)
          @backup_image_click_through_url = args[:backup_image_click_through_url] if args.key?(:backup_image_click_through_url)
          @backup_image_features = args[:backup_image_features] if args.key?(:backup_image_features)
          @backup_image_reporting_label = args[:backup_image_reporting_label] if args.key?(:backup_image_reporting_label)
          @backup_image_target_window = args[:backup_image_target_window] if args.key?(:backup_image_target_window)
          @click_tags = args[:click_tags] if args.key?(:click_tags)
          @commercial_id = args[:commercial_id] if args.key?(:commercial_id)
          @companion_creatives = args[:companion_creatives] if args.key?(:companion_creatives)
          @compatibility = args[:compatibility] if args.key?(:compatibility)
          @convert_flash_to_html5 = args[:convert_flash_to_html5] if args.key?(:convert_flash_to_html5)
          @counter_custom_events = args[:counter_custom_events] if args.key?(:counter_custom_events)
          @creative_asset_selection = args[:creative_asset_selection] if args.key?(:creative_asset_selection)
          @creative_assets = args[:creative_assets] if args.key?(:creative_assets)
          @creative_field_assignments = args[:creative_field_assignments] if args.key?(:creative_field_assignments)
          @custom_key_values = args[:custom_key_values] if args.key?(:custom_key_values)
          @dynamic_asset_selection = args[:dynamic_asset_selection] if args.key?(:dynamic_asset_selection)
          @exit_custom_events = args[:exit_custom_events] if args.key?(:exit_custom_events)
          @fs_command = args[:fs_command] if args.key?(:fs_command)
          @html_code = args[:html_code] if args.key?(:html_code)
          @html_code_locked = args[:html_code_locked] if args.key?(:html_code_locked)
          @id = args[:id] if args.key?(:id)
          @id_dimension_value = args[:id_dimension_value] if args.key?(:id_dimension_value)
          @kind = args[:kind] if args.key?(:kind)
          @last_modified_info = args[:last_modified_info] if args.key?(:last_modified_info)
          @latest_trafficked_creative_id = args[:latest_trafficked_creative_id] if args.key?(:latest_trafficked_creative_id)
          @media_description = args[:media_description] if args.key?(:media_description)
          @media_duration = args[:media_duration] if args.key?(:media_duration)
          @name = args[:name] if args.key?(:name)
          @override_css = args[:override_css] if args.key?(:override_css)
          @progress_offset = args[:progress_offset] if args.key?(:progress_offset)
          @redirect_url = args[:redirect_url] if args.key?(:redirect_url)
          @rendering_id = args[:rendering_id] if args.key?(:rendering_id)
          @rendering_id_dimension_value = args[:rendering_id_dimension_value] if args.key?(:rendering_id_dimension_value)
          @required_flash_plugin_version = args[:required_flash_plugin_version] if args.key?(:required_flash_plugin_version)
          @required_flash_version = args[:required_flash_version] if args.key?(:required_flash_version)
          @size = args[:size] if args.key?(:size)
          @skip_offset = args[:skip_offset] if args.key?(:skip_offset)
          @skippable = args[:skippable] if args.key?(:skippable)
          @ssl_compliant = args[:ssl_compliant] if args.key?(:ssl_compliant)
          @ssl_override = args[:ssl_override] if args.key?(:ssl_override)
          @studio_advertiser_id = args[:studio_advertiser_id] if args.key?(:studio_advertiser_id)
          @studio_creative_id = args[:studio_creative_id] if args.key?(:studio_creative_id)
          @studio_trafficked_creative_id = args[:studio_trafficked_creative_id] if args.key?(:studio_trafficked_creative_id)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @third_party_backup_image_impressions_url = args[:third_party_backup_image_impressions_url] if args.key?(:third_party_backup_image_impressions_url)
          @third_party_rich_media_impressions_url = args[:third_party_rich_media_impressions_url] if args.key?(:third_party_rich_media_impressions_url)
          @third_party_urls = args[:third_party_urls] if args.key?(:third_party_urls)
          @timer_custom_events = args[:timer_custom_events] if args.key?(:timer_custom_events)
          @total_file_size = args[:total_file_size] if args.key?(:total_file_size)
          @type = args[:type] if args.key?(:type)
          @universal_ad_id = args[:universal_ad_id] if args.key?(:universal_ad_id)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Creative Asset.
      class CreativeAsset
        include Google::Apis::Core::Hashable
      
        # Whether ActionScript3 is enabled for the flash asset. This is a read-only
        # field. Applicable to the following creative type: FLASH_INPAGE. Applicable to
        # DISPLAY when the primary asset type is not HTML_IMAGE.
        # Corresponds to the JSON property `actionScript3`
        # @return [Boolean]
        attr_accessor :action_script3
        alias_method :action_script3?, :action_script3
      
        # Whether the video or audio asset is active. This is a read-only field for
        # VPAID_NON_LINEAR_VIDEO assets. Applicable to the following creative types:
        # INSTREAM_AUDIO, INSTREAM_VIDEO and all VPAID.
        # Corresponds to the JSON property `active`
        # @return [Boolean]
        attr_accessor :active
        alias_method :active?, :active
      
        # Additional sizes associated with this creative asset. HTML5 asset generated by
        # compatible software such as GWD will be able to support more sizes this
        # creative asset can render.
        # Corresponds to the JSON property `additionalSizes`
        # @return [Array<Google::Apis::DfareportingV3_3::Size>]
        attr_accessor :additional_sizes
      
        # Possible alignments for an asset. This is a read-only field. Applicable to the
        # following creative types: RICH_MEDIA_DISPLAY_MULTI_FLOATING_INTERSTITIAL.
        # Corresponds to the JSON property `alignment`
        # @return [String]
        attr_accessor :alignment
      
        # Artwork type of rich media creative. This is a read-only field. Applicable to
        # the following creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `artworkType`
        # @return [String]
        attr_accessor :artwork_type
      
        # Creative Asset ID.
        # Corresponds to the JSON property `assetIdentifier`
        # @return [Google::Apis::DfareportingV3_3::CreativeAssetId]
        attr_accessor :asset_identifier
      
        # Audio stream bit rate in kbps. This is a read-only field. Applicable to the
        # following creative types: INSTREAM_AUDIO, INSTREAM_VIDEO and all VPAID.
        # Corresponds to the JSON property `audioBitRate`
        # @return [Fixnum]
        attr_accessor :audio_bit_rate
      
        # Audio sample bit rate in hertz. This is a read-only field. Applicable to the
        # following creative types: INSTREAM_AUDIO, INSTREAM_VIDEO and all VPAID.
        # Corresponds to the JSON property `audioSampleRate`
        # @return [Fixnum]
        attr_accessor :audio_sample_rate
      
        # Creative Custom Event.
        # Corresponds to the JSON property `backupImageExit`
        # @return [Google::Apis::DfareportingV3_3::CreativeCustomEvent]
        attr_accessor :backup_image_exit
      
        # Detected bit-rate for audio or video asset. This is a read-only field.
        # Applicable to the following creative types: INSTREAM_AUDIO, INSTREAM_VIDEO and
        # all VPAID.
        # Corresponds to the JSON property `bitRate`
        # @return [Fixnum]
        attr_accessor :bit_rate
      
        # Rich media child asset type. This is a read-only field. Applicable to the
        # following creative types: all VPAID.
        # Corresponds to the JSON property `childAssetType`
        # @return [String]
        attr_accessor :child_asset_type
      
        # Represents the dimensions of ads, placements, creatives, or creative assets.
        # Corresponds to the JSON property `collapsedSize`
        # @return [Google::Apis::DfareportingV3_3::Size]
        attr_accessor :collapsed_size
      
        # List of companion creatives assigned to an in-stream video creative asset.
        # Acceptable values include IDs of existing flash and image creatives.
        # Applicable to INSTREAM_VIDEO creative type with dynamicAssetSelection set to
        # true.
        # Corresponds to the JSON property `companionCreativeIds`
        # @return [Array<Fixnum>]
        attr_accessor :companion_creative_ids
      
        # Custom start time in seconds for making the asset visible. Applicable to the
        # following creative types: all RICH_MEDIA. Value must be greater than or equal
        # to 0.
        # Corresponds to the JSON property `customStartTimeValue`
        # @return [Fixnum]
        attr_accessor :custom_start_time_value
      
        # List of feature dependencies for the creative asset that are detected by
        # Campaign Manager. Feature dependencies are features that a browser must be
        # able to support in order to render your HTML5 creative correctly. This is a
        # read-only, auto-generated field. Applicable to the following creative types:
        # HTML5_BANNER. Applicable to DISPLAY when the primary asset type is not
        # HTML_IMAGE.
        # Corresponds to the JSON property `detectedFeatures`
        # @return [Array<String>]
        attr_accessor :detected_features
      
        # Type of rich media asset. This is a read-only field. Applicable to the
        # following creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `displayType`
        # @return [String]
        attr_accessor :display_type
      
        # Duration in seconds for which an asset will be displayed. Applicable to the
        # following creative types: INSTREAM_AUDIO, INSTREAM_VIDEO and
        # VPAID_LINEAR_VIDEO. Value must be greater than or equal to 1.
        # Corresponds to the JSON property `duration`
        # @return [Fixnum]
        attr_accessor :duration
      
        # Duration type for which an asset will be displayed. Applicable to the
        # following creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `durationType`
        # @return [String]
        attr_accessor :duration_type
      
        # Represents the dimensions of ads, placements, creatives, or creative assets.
        # Corresponds to the JSON property `expandedDimension`
        # @return [Google::Apis::DfareportingV3_3::Size]
        attr_accessor :expanded_dimension
      
        # File size associated with this creative asset. This is a read-only field.
        # Applicable to all but the following creative types: all REDIRECT and
        # TRACKING_TEXT.
        # Corresponds to the JSON property `fileSize`
        # @return [Fixnum]
        attr_accessor :file_size
      
        # Flash version of the asset. This is a read-only field. Applicable to the
        # following creative types: FLASH_INPAGE, all RICH_MEDIA, and all VPAID.
        # Applicable to DISPLAY when the primary asset type is not HTML_IMAGE.
        # Corresponds to the JSON property `flashVersion`
        # @return [Fixnum]
        attr_accessor :flash_version
      
        # Video frame rate for video asset in frames per second. This is a read-only
        # field. Applicable to the following creative types: INSTREAM_VIDEO and all
        # VPAID.
        # Corresponds to the JSON property `frameRate`
        # @return [Float]
        attr_accessor :frame_rate
      
        # Whether to hide Flash objects flag for an asset. Applicable to the following
        # creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `hideFlashObjects`
        # @return [Boolean]
        attr_accessor :hide_flash_objects
        alias_method :hide_flash_objects?, :hide_flash_objects
      
        # Whether to hide selection boxes flag for an asset. Applicable to the following
        # creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `hideSelectionBoxes`
        # @return [Boolean]
        attr_accessor :hide_selection_boxes
        alias_method :hide_selection_boxes?, :hide_selection_boxes
      
        # Whether the asset is horizontally locked. This is a read-only field.
        # Applicable to the following creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `horizontallyLocked`
        # @return [Boolean]
        attr_accessor :horizontally_locked
        alias_method :horizontally_locked?, :horizontally_locked
      
        # Numeric ID of this creative asset. This is a required field and should not be
        # modified. Applicable to all but the following creative types: all REDIRECT and
        # TRACKING_TEXT.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `idDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :id_dimension_value
      
        # Detected duration for audio or video asset. This is a read-only field.
        # Applicable to the following creative types: INSTREAM_AUDIO, INSTREAM_VIDEO and
        # all VPAID.
        # Corresponds to the JSON property `mediaDuration`
        # @return [Float]
        attr_accessor :media_duration
      
        # Detected MIME type for audio or video asset. This is a read-only field.
        # Applicable to the following creative types: INSTREAM_AUDIO, INSTREAM_VIDEO and
        # all VPAID.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # Offset Position.
        # Corresponds to the JSON property `offset`
        # @return [Google::Apis::DfareportingV3_3::OffsetPosition]
        attr_accessor :offset
      
        # Orientation of video asset. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `orientation`
        # @return [String]
        attr_accessor :orientation
      
        # Whether the backup asset is original or changed by the user in Campaign
        # Manager. Applicable to the following creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `originalBackup`
        # @return [Boolean]
        attr_accessor :original_backup
        alias_method :original_backup?, :original_backup
      
        # Whether this asset is used as a polite load asset.
        # Corresponds to the JSON property `politeLoad`
        # @return [Boolean]
        attr_accessor :polite_load
        alias_method :polite_load?, :polite_load
      
        # Offset Position.
        # Corresponds to the JSON property `position`
        # @return [Google::Apis::DfareportingV3_3::OffsetPosition]
        attr_accessor :position
      
        # Offset left unit for an asset. This is a read-only field. Applicable to the
        # following creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `positionLeftUnit`
        # @return [String]
        attr_accessor :position_left_unit
      
        # Offset top unit for an asset. This is a read-only field if the asset
        # displayType is ASSET_DISPLAY_TYPE_OVERLAY. Applicable to the following
        # creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `positionTopUnit`
        # @return [String]
        attr_accessor :position_top_unit
      
        # Progressive URL for video asset. This is a read-only field. Applicable to the
        # following creative types: INSTREAM_VIDEO and all VPAID.
        # Corresponds to the JSON property `progressiveServingUrl`
        # @return [String]
        attr_accessor :progressive_serving_url
      
        # Whether the asset pushes down other content. Applicable to the following
        # creative types: all RICH_MEDIA. Additionally, only applicable when the asset
        # offsets are 0, the collapsedSize.width matches size.width, and the
        # collapsedSize.height is less than size.height.
        # Corresponds to the JSON property `pushdown`
        # @return [Boolean]
        attr_accessor :pushdown
        alias_method :pushdown?, :pushdown
      
        # Pushdown duration in seconds for an asset. Applicable to the following
        # creative types: all RICH_MEDIA.Additionally, only applicable when the asset
        # pushdown field is true, the offsets are 0, the collapsedSize.width matches
        # size.width, and the collapsedSize.height is less than size.height. Acceptable
        # values are 0 to 9.99, inclusive.
        # Corresponds to the JSON property `pushdownDuration`
        # @return [Float]
        attr_accessor :pushdown_duration
      
        # Role of the asset in relation to creative. Applicable to all but the following
        # creative types: all REDIRECT and TRACKING_TEXT. This is a required field.
        # PRIMARY applies to DISPLAY, FLASH_INPAGE, HTML5_BANNER, IMAGE,
        # DISPLAY_IMAGE_GALLERY, all RICH_MEDIA (which may contain multiple primary
        # assets), and all VPAID creatives.
        # BACKUP_IMAGE applies to FLASH_INPAGE, HTML5_BANNER, all RICH_MEDIA, and all
        # VPAID creatives. Applicable to DISPLAY when the primary asset type is not
        # HTML_IMAGE.
        # ADDITIONAL_IMAGE and ADDITIONAL_FLASH apply to FLASH_INPAGE creatives.
        # OTHER refers to assets from sources other than Campaign Manager, such as
        # Studio uploaded assets, applicable to all RICH_MEDIA and all VPAID creatives.
        # PARENT_VIDEO refers to videos uploaded by the user in Campaign Manager and is
        # applicable to INSTREAM_VIDEO and VPAID_LINEAR_VIDEO creatives.
        # TRANSCODED_VIDEO refers to videos transcoded by Campaign Manager from
        # PARENT_VIDEO assets and is applicable to INSTREAM_VIDEO and VPAID_LINEAR_VIDEO
        # creatives.
        # ALTERNATE_VIDEO refers to the Campaign Manager representation of child asset
        # videos from Studio, and is applicable to VPAID_LINEAR_VIDEO creatives. These
        # cannot be added or removed within Campaign Manager.
        # For VPAID_LINEAR_VIDEO creatives, PARENT_VIDEO, TRANSCODED_VIDEO and
        # ALTERNATE_VIDEO assets that are marked active serve as backup in case the
        # VPAID creative cannot be served. Only PARENT_VIDEO assets can be added or
        # removed for an INSTREAM_VIDEO or VPAID_LINEAR_VIDEO creative.
        # PARENT_AUDIO refers to audios uploaded by the user in Campaign Manager and is
        # applicable to INSTREAM_AUDIO creatives.
        # TRANSCODED_AUDIO refers to audios transcoded by Campaign Manager from
        # PARENT_AUDIO assets and is applicable to INSTREAM_AUDIO creatives.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        # Represents the dimensions of ads, placements, creatives, or creative assets.
        # Corresponds to the JSON property `size`
        # @return [Google::Apis::DfareportingV3_3::Size]
        attr_accessor :size
      
        # Whether the asset is SSL-compliant. This is a read-only field. Applicable to
        # all but the following creative types: all REDIRECT and TRACKING_TEXT.
        # Corresponds to the JSON property `sslCompliant`
        # @return [Boolean]
        attr_accessor :ssl_compliant
        alias_method :ssl_compliant?, :ssl_compliant
      
        # Initial wait time type before making the asset visible. Applicable to the
        # following creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `startTimeType`
        # @return [String]
        attr_accessor :start_time_type
      
        # Streaming URL for video asset. This is a read-only field. Applicable to the
        # following creative types: INSTREAM_VIDEO and all VPAID.
        # Corresponds to the JSON property `streamingServingUrl`
        # @return [String]
        attr_accessor :streaming_serving_url
      
        # Whether the asset is transparent. Applicable to the following creative types:
        # all RICH_MEDIA. Additionally, only applicable to HTML5 assets.
        # Corresponds to the JSON property `transparency`
        # @return [Boolean]
        attr_accessor :transparency
        alias_method :transparency?, :transparency
      
        # Whether the asset is vertically locked. This is a read-only field. Applicable
        # to the following creative types: all RICH_MEDIA.
        # Corresponds to the JSON property `verticallyLocked`
        # @return [Boolean]
        attr_accessor :vertically_locked
        alias_method :vertically_locked?, :vertically_locked
      
        # Window mode options for flash assets. Applicable to the following creative
        # types: FLASH_INPAGE, RICH_MEDIA_DISPLAY_EXPANDING, RICH_MEDIA_IM_EXPAND,
        # RICH_MEDIA_DISPLAY_BANNER, and RICH_MEDIA_INPAGE_FLOATING.
        # Corresponds to the JSON property `windowMode`
        # @return [String]
        attr_accessor :window_mode
      
        # zIndex value of an asset. Applicable to the following creative types: all
        # RICH_MEDIA.Additionally, only applicable to assets whose displayType is NOT
        # one of the following types: ASSET_DISPLAY_TYPE_INPAGE or
        # ASSET_DISPLAY_TYPE_OVERLAY. Acceptable values are -999999999 to 999999999,
        # inclusive.
        # Corresponds to the JSON property `zIndex`
        # @return [Fixnum]
        attr_accessor :z_index
      
        # File name of zip file. This is a read-only field. Applicable to the following
        # creative types: HTML5_BANNER.
        # Corresponds to the JSON property `zipFilename`
        # @return [String]
        attr_accessor :zip_filename
      
        # Size of zip file. This is a read-only field. Applicable to the following
        # creative types: HTML5_BANNER.
        # Corresponds to the JSON property `zipFilesize`
        # @return [String]
        attr_accessor :zip_filesize
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_script3 = args[:action_script3] if args.key?(:action_script3)
          @active = args[:active] if args.key?(:active)
          @additional_sizes = args[:additional_sizes] if args.key?(:additional_sizes)
          @alignment = args[:alignment] if args.key?(:alignment)
          @artwork_type = args[:artwork_type] if args.key?(:artwork_type)
          @asset_identifier = args[:asset_identifier] if args.key?(:asset_identifier)
          @audio_bit_rate = args[:audio_bit_rate] if args.key?(:audio_bit_rate)
          @audio_sample_rate = args[:audio_sample_rate] if args.key?(:audio_sample_rate)
          @backup_image_exit = args[:backup_image_exit] if args.key?(:backup_image_exit)
          @bit_rate = args[:bit_rate] if args.key?(:bit_rate)
          @child_asset_type = args[:child_asset_type] if args.key?(:child_asset_type)
          @collapsed_size = args[:collapsed_size] if args.key?(:collapsed_size)
          @companion_creative_ids = args[:companion_creative_ids] if args.key?(:companion_creative_ids)
          @custom_start_time_value = args[:custom_start_time_value] if args.key?(:custom_start_time_value)
          @detected_features = args[:detected_features] if args.key?(:detected_features)
          @display_type = args[:display_type] if args.key?(:display_type)
          @duration = args[:duration] if args.key?(:duration)
          @duration_type = args[:duration_type] if args.key?(:duration_type)
          @expanded_dimension = args[:expanded_dimension] if args.key?(:expanded_dimension)
          @file_size = args[:file_size] if args.key?(:file_size)
          @flash_version = args[:flash_version] if args.key?(:flash_version)
          @frame_rate = args[:frame_rate] if args.key?(:frame_rate)
          @hide_flash_objects = args[:hide_flash_objects] if args.key?(:hide_flash_objects)
          @hide_selection_boxes = args[:hide_selection_boxes] if args.key?(:hide_selection_boxes)
          @horizontally_locked = args[:horizontally_locked] if args.key?(:horizontally_locked)
          @id = args[:id] if args.key?(:id)
          @id_dimension_value = args[:id_dimension_value] if args.key?(:id_dimension_value)
          @media_duration = args[:media_duration] if args.key?(:media_duration)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @offset = args[:offset] if args.key?(:offset)
          @orientation = args[:orientation] if args.key?(:orientation)
          @original_backup = args[:original_backup] if args.key?(:original_backup)
          @polite_load = args[:polite_load] if args.key?(:polite_load)
          @position = args[:position] if args.key?(:position)
          @position_left_unit = args[:position_left_unit] if args.key?(:position_left_unit)
          @position_top_unit = args[:position_top_unit] if args.key?(:position_top_unit)
          @progressive_serving_url = args[:progressive_serving_url] if args.key?(:progressive_serving_url)
          @pushdown = args[:pushdown] if args.key?(:pushdown)
          @pushdown_duration = args[:pushdown_duration] if args.key?(:pushdown_duration)
          @role = args[:role] if args.key?(:role)
          @size = args[:size] if args.key?(:size)
          @ssl_compliant = args[:ssl_compliant] if args.key?(:ssl_compliant)
          @start_time_type = args[:start_time_type] if args.key?(:start_time_type)
          @streaming_serving_url = args[:streaming_serving_url] if args.key?(:streaming_serving_url)
          @transparency = args[:transparency] if args.key?(:transparency)
          @vertically_locked = args[:vertically_locked] if args.key?(:vertically_locked)
          @window_mode = args[:window_mode] if args.key?(:window_mode)
          @z_index = args[:z_index] if args.key?(:z_index)
          @zip_filename = args[:zip_filename] if args.key?(:zip_filename)
          @zip_filesize = args[:zip_filesize] if args.key?(:zip_filesize)
        end
      end
      
      # Creative Asset ID.
      class CreativeAssetId
        include Google::Apis::Core::Hashable
      
        # Name of the creative asset. This is a required field while inserting an asset.
        # After insertion, this assetIdentifier is used to identify the uploaded asset.
        # Characters in the name must be alphanumeric or one of the following: ".-_ ".
        # Spaces are allowed.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Type of asset to upload. This is a required field. FLASH and IMAGE are no
        # longer supported for new uploads. All image assets should use HTML_IMAGE.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # CreativeAssets contains properties of a creative asset file which will be
      # uploaded or has already been uploaded. Refer to the creative sample code for
      # how to upload assets and insert a creative.
      class CreativeAssetMetadata
        include Google::Apis::Core::Hashable
      
        # Creative Asset ID.
        # Corresponds to the JSON property `assetIdentifier`
        # @return [Google::Apis::DfareportingV3_3::CreativeAssetId]
        attr_accessor :asset_identifier
      
        # List of detected click tags for assets. This is a read-only auto-generated
        # field.
        # Corresponds to the JSON property `clickTags`
        # @return [Array<Google::Apis::DfareportingV3_3::ClickTag>]
        attr_accessor :click_tags
      
        # List of feature dependencies for the creative asset that are detected by
        # Campaign Manager. Feature dependencies are features that a browser must be
        # able to support in order to render your HTML5 creative correctly. This is a
        # read-only, auto-generated field.
        # Corresponds to the JSON property `detectedFeatures`
        # @return [Array<String>]
        attr_accessor :detected_features
      
        # Numeric ID of the asset. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `idDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :id_dimension_value
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#creativeAssetMetadata".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Rules validated during code generation that generated a warning. This is a
        # read-only, auto-generated field.
        # Possible values are:
        # - "ADMOB_REFERENCED"
        # - "ASSET_FORMAT_UNSUPPORTED_DCM"
        # - "ASSET_INVALID"
        # - "CLICK_TAG_HARD_CODED"
        # - "CLICK_TAG_INVALID"
        # - "CLICK_TAG_IN_GWD"
        # - "CLICK_TAG_MISSING"
        # - "CLICK_TAG_MORE_THAN_ONE"
        # - "CLICK_TAG_NON_TOP_LEVEL"
        # - "COMPONENT_UNSUPPORTED_DCM"
        # - "ENABLER_UNSUPPORTED_METHOD_DCM"
        # - "EXTERNAL_FILE_REFERENCED"
        # - "FILE_DETAIL_EMPTY"
        # - "FILE_TYPE_INVALID"
        # - "GWD_PROPERTIES_INVALID"
        # - "HTML5_FEATURE_UNSUPPORTED"
        # - "LINKED_FILE_NOT_FOUND"
        # - "MAX_FLASH_VERSION_11"
        # - "MRAID_REFERENCED"
        # - "NOT_SSL_COMPLIANT"
        # - "ORPHANED_ASSET"
        # - "PRIMARY_HTML_MISSING"
        # - "SVG_INVALID"
        # - "ZIP_INVALID"
        # Corresponds to the JSON property `warnedValidationRules`
        # @return [Array<String>]
        attr_accessor :warned_validation_rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @asset_identifier = args[:asset_identifier] if args.key?(:asset_identifier)
          @click_tags = args[:click_tags] if args.key?(:click_tags)
          @detected_features = args[:detected_features] if args.key?(:detected_features)
          @id = args[:id] if args.key?(:id)
          @id_dimension_value = args[:id_dimension_value] if args.key?(:id_dimension_value)
          @kind = args[:kind] if args.key?(:kind)
          @warned_validation_rules = args[:warned_validation_rules] if args.key?(:warned_validation_rules)
        end
      end
      
      # Encapsulates the list of rules for asset selection and a default asset in case
      # none of the rules match. Applicable to INSTREAM_VIDEO creatives.
      class CreativeAssetSelection
        include Google::Apis::Core::Hashable
      
        # A creativeAssets[].id. This should refer to one of the parent assets in this
        # creative, and will be served if none of the rules match. This is a required
        # field.
        # Corresponds to the JSON property `defaultAssetId`
        # @return [Fixnum]
        attr_accessor :default_asset_id
      
        # Rules determine which asset will be served to a viewer. Rules will be
        # evaluated in the order in which they are stored in this list. This list must
        # contain at least one rule. Applicable to INSTREAM_VIDEO creatives.
        # Corresponds to the JSON property `rules`
        # @return [Array<Google::Apis::DfareportingV3_3::Rule>]
        attr_accessor :rules
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_asset_id = args[:default_asset_id] if args.key?(:default_asset_id)
          @rules = args[:rules] if args.key?(:rules)
        end
      end
      
      # Creative Assignment.
      class CreativeAssignment
        include Google::Apis::Core::Hashable
      
        # Whether this creative assignment is active. When true, the creative will be
        # included in the ad's rotation.
        # Corresponds to the JSON property `active`
        # @return [Boolean]
        attr_accessor :active
        alias_method :active?, :active
      
        # Whether applicable event tags should fire when this creative assignment is
        # rendered. If this value is unset when the ad is inserted or updated, it will
        # default to true for all creative types EXCEPT for INTERNAL_REDIRECT,
        # INTERSTITIAL_INTERNAL_REDIRECT, and INSTREAM_VIDEO.
        # Corresponds to the JSON property `applyEventTags`
        # @return [Boolean]
        attr_accessor :apply_event_tags
        alias_method :apply_event_tags?, :apply_event_tags
      
        # Click-through URL
        # Corresponds to the JSON property `clickThroughUrl`
        # @return [Google::Apis::DfareportingV3_3::ClickThroughUrl]
        attr_accessor :click_through_url
      
        # Companion creative overrides for this creative assignment. Applicable to video
        # ads.
        # Corresponds to the JSON property `companionCreativeOverrides`
        # @return [Array<Google::Apis::DfareportingV3_3::CompanionClickThroughOverride>]
        attr_accessor :companion_creative_overrides
      
        # Creative group assignments for this creative assignment. Only one assignment
        # per creative group number is allowed for a maximum of two assignments.
        # Corresponds to the JSON property `creativeGroupAssignments`
        # @return [Array<Google::Apis::DfareportingV3_3::CreativeGroupAssignment>]
        attr_accessor :creative_group_assignments
      
        # ID of the creative to be assigned. This is a required field.
        # Corresponds to the JSON property `creativeId`
        # @return [Fixnum]
        attr_accessor :creative_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `creativeIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :creative_id_dimension_value
      
        # Date and time that the assigned creative should stop serving. Must be later
        # than the start time.
        # Corresponds to the JSON property `endTime`
        # @return [DateTime]
        attr_accessor :end_time
      
        # Rich media exit overrides for this creative assignment.
        # Applicable when the creative type is any of the following:
        # - DISPLAY
        # - RICH_MEDIA_INPAGE
        # - RICH_MEDIA_INPAGE_FLOATING
        # - RICH_MEDIA_IM_EXPAND
        # - RICH_MEDIA_EXPANDING
        # - RICH_MEDIA_INTERSTITIAL_FLOAT
        # - RICH_MEDIA_MOBILE_IN_APP
        # - RICH_MEDIA_MULTI_FLOATING
        # - RICH_MEDIA_PEEL_DOWN
        # - VPAID_LINEAR
        # - VPAID_NON_LINEAR
        # Corresponds to the JSON property `richMediaExitOverrides`
        # @return [Array<Google::Apis::DfareportingV3_3::RichMediaExitOverride>]
        attr_accessor :rich_media_exit_overrides
      
        # Sequence number of the creative assignment, applicable when the rotation type
        # is CREATIVE_ROTATION_TYPE_SEQUENTIAL. Acceptable values are 1 to 65535,
        # inclusive.
        # Corresponds to the JSON property `sequence`
        # @return [Fixnum]
        attr_accessor :sequence
      
        # Whether the creative to be assigned is SSL-compliant. This is a read-only
        # field that is auto-generated when the ad is inserted or updated.
        # Corresponds to the JSON property `sslCompliant`
        # @return [Boolean]
        attr_accessor :ssl_compliant
        alias_method :ssl_compliant?, :ssl_compliant
      
        # Date and time that the assigned creative should start serving.
        # Corresponds to the JSON property `startTime`
        # @return [DateTime]
        attr_accessor :start_time
      
        # Weight of the creative assignment, applicable when the rotation type is
        # CREATIVE_ROTATION_TYPE_RANDOM. Value must be greater than or equal to 1.
        # Corresponds to the JSON property `weight`
        # @return [Fixnum]
        attr_accessor :weight
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @active = args[:active] if args.key?(:active)
          @apply_event_tags = args[:apply_event_tags] if args.key?(:apply_event_tags)
          @click_through_url = args[:click_through_url] if args.key?(:click_through_url)
          @companion_creative_overrides = args[:companion_creative_overrides] if args.key?(:companion_creative_overrides)
          @creative_group_assignments = args[:creative_group_assignments] if args.key?(:creative_group_assignments)
          @creative_id = args[:creative_id] if args.key?(:creative_id)
          @creative_id_dimension_value = args[:creative_id_dimension_value] if args.key?(:creative_id_dimension_value)
          @end_time = args[:end_time] if args.key?(:end_time)
          @rich_media_exit_overrides = args[:rich_media_exit_overrides] if args.key?(:rich_media_exit_overrides)
          @sequence = args[:sequence] if args.key?(:sequence)
          @ssl_compliant = args[:ssl_compliant] if args.key?(:ssl_compliant)
          @start_time = args[:start_time] if args.key?(:start_time)
          @weight = args[:weight] if args.key?(:weight)
        end
      end
      
      # Click-through URL
      class CreativeClickThroughUrl
        include Google::Apis::Core::Hashable
      
        # Read-only convenience field representing the actual URL that will be used for
        # this click-through. The URL is computed as follows:
        # - If landingPageId is specified then that landing page's URL is assigned to
        # this field.
        # - Otherwise, the customClickThroughUrl is assigned to this field.
        # Corresponds to the JSON property `computedClickThroughUrl`
        # @return [String]
        attr_accessor :computed_click_through_url
      
        # Custom click-through URL. Applicable if the landingPageId field is left unset.
        # Corresponds to the JSON property `customClickThroughUrl`
        # @return [String]
        attr_accessor :custom_click_through_url
      
        # ID of the landing page for the click-through URL.
        # Corresponds to the JSON property `landingPageId`
        # @return [Fixnum]
        attr_accessor :landing_page_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @computed_click_through_url = args[:computed_click_through_url] if args.key?(:computed_click_through_url)
          @custom_click_through_url = args[:custom_click_through_url] if args.key?(:custom_click_through_url)
          @landing_page_id = args[:landing_page_id] if args.key?(:landing_page_id)
        end
      end
      
      # Creative Custom Event.
      class CreativeCustomEvent
        include Google::Apis::Core::Hashable
      
        # Unique ID of this event used by Reporting and Data Transfer. This is a read-
        # only field.
        # Corresponds to the JSON property `advertiserCustomEventId`
        # @return [Fixnum]
        attr_accessor :advertiser_custom_event_id
      
        # User-entered name for the event.
        # Corresponds to the JSON property `advertiserCustomEventName`
        # @return [String]
        attr_accessor :advertiser_custom_event_name
      
        # Type of the event. This is a read-only field.
        # Corresponds to the JSON property `advertiserCustomEventType`
        # @return [String]
        attr_accessor :advertiser_custom_event_type
      
        # Artwork label column, used to link events in Campaign Manager back to events
        # in Studio. This is a required field and should not be modified after insertion.
        # Corresponds to the JSON property `artworkLabel`
        # @return [String]
        attr_accessor :artwork_label
      
        # Artwork type used by the creative.This is a read-only field.
        # Corresponds to the JSON property `artworkType`
        # @return [String]
        attr_accessor :artwork_type
      
        # Click-through URL
        # Corresponds to the JSON property `exitClickThroughUrl`
        # @return [Google::Apis::DfareportingV3_3::CreativeClickThroughUrl]
        attr_accessor :exit_click_through_url
      
        # ID of this event. This is a required field and should not be modified after
        # insertion.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Popup Window Properties.
        # Corresponds to the JSON property `popupWindowProperties`
        # @return [Google::Apis::DfareportingV3_3::PopupWindowProperties]
        attr_accessor :popup_window_properties
      
        # Target type used by the event.
        # Corresponds to the JSON property `targetType`
        # @return [String]
        attr_accessor :target_type
      
        # Video reporting ID, used to differentiate multiple videos in a single creative.
        # This is a read-only field.
        # Corresponds to the JSON property `videoReportingId`
        # @return [String]
        attr_accessor :video_reporting_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @advertiser_custom_event_id = args[:advertiser_custom_event_id] if args.key?(:advertiser_custom_event_id)
          @advertiser_custom_event_name = args[:advertiser_custom_event_name] if args.key?(:advertiser_custom_event_name)
          @advertiser_custom_event_type = args[:advertiser_custom_event_type] if args.key?(:advertiser_custom_event_type)
          @artwork_label = args[:artwork_label] if args.key?(:artwork_label)
          @artwork_type = args[:artwork_type] if args.key?(:artwork_type)
          @exit_click_through_url = args[:exit_click_through_url] if args.key?(:exit_click_through_url)
          @id = args[:id] if args.key?(:id)
          @popup_window_properties = args[:popup_window_properties] if args.key?(:popup_window_properties)
          @target_type = args[:target_type] if args.key?(:target_type)
          @video_reporting_id = args[:video_reporting_id] if args.key?(:video_reporting_id)
        end
      end
      
      # Contains properties of a creative field.
      class CreativeField
        include Google::Apis::Core::Hashable
      
        # Account ID of this creative field. This is a read-only field that can be left
        # blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Advertiser ID of this creative field. This is a required field on insertion.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `advertiserIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :advertiser_id_dimension_value
      
        # ID of this creative field. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#creativeField".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this creative field. This is a required field and must be less than
        # 256 characters long and unique among creative fields of the same advertiser.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Subaccount ID of this creative field. This is a read-only field that can be
        # left blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_id_dimension_value = args[:advertiser_id_dimension_value] if args.key?(:advertiser_id_dimension_value)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
        end
      end
      
      # Creative Field Assignment.
      class CreativeFieldAssignment
        include Google::Apis::Core::Hashable
      
        # ID of the creative field.
        # Corresponds to the JSON property `creativeFieldId`
        # @return [Fixnum]
        attr_accessor :creative_field_id
      
        # ID of the creative field value.
        # Corresponds to the JSON property `creativeFieldValueId`
        # @return [Fixnum]
        attr_accessor :creative_field_value_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creative_field_id = args[:creative_field_id] if args.key?(:creative_field_id)
          @creative_field_value_id = args[:creative_field_value_id] if args.key?(:creative_field_value_id)
        end
      end
      
      # Contains properties of a creative field value.
      class CreativeFieldValue
        include Google::Apis::Core::Hashable
      
        # ID of this creative field value. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#creativeFieldValue".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Value of this creative field value. It needs to be less than 256 characters in
        # length and unique per creative field.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Creative Field Value List Response
      class CreativeFieldValuesListResponse
        include Google::Apis::Core::Hashable
      
        # Creative field value collection.
        # Corresponds to the JSON property `creativeFieldValues`
        # @return [Array<Google::Apis::DfareportingV3_3::CreativeFieldValue>]
        attr_accessor :creative_field_values
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#creativeFieldValuesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creative_field_values = args[:creative_field_values] if args.key?(:creative_field_values)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Creative Field List Response
      class CreativeFieldsListResponse
        include Google::Apis::Core::Hashable
      
        # Creative field collection.
        # Corresponds to the JSON property `creativeFields`
        # @return [Array<Google::Apis::DfareportingV3_3::CreativeField>]
        attr_accessor :creative_fields
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#creativeFieldsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creative_fields = args[:creative_fields] if args.key?(:creative_fields)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Contains properties of a creative group.
      class CreativeGroup
        include Google::Apis::Core::Hashable
      
        # Account ID of this creative group. This is a read-only field that can be left
        # blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Advertiser ID of this creative group. This is a required field on insertion.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `advertiserIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :advertiser_id_dimension_value
      
        # Subgroup of the creative group. Assign your creative groups to a subgroup in
        # order to filter or manage them more easily. This field is required on
        # insertion and is read-only after insertion. Acceptable values are 1 to 2,
        # inclusive.
        # Corresponds to the JSON property `groupNumber`
        # @return [Fixnum]
        attr_accessor :group_number
      
        # ID of this creative group. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#creativeGroup".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this creative group. This is a required field and must be less than
        # 256 characters long and unique among creative groups of the same advertiser.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Subaccount ID of this creative group. This is a read-only field that can be
        # left blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_id_dimension_value = args[:advertiser_id_dimension_value] if args.key?(:advertiser_id_dimension_value)
          @group_number = args[:group_number] if args.key?(:group_number)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
        end
      end
      
      # Creative Group Assignment.
      class CreativeGroupAssignment
        include Google::Apis::Core::Hashable
      
        # ID of the creative group to be assigned.
        # Corresponds to the JSON property `creativeGroupId`
        # @return [Fixnum]
        attr_accessor :creative_group_id
      
        # Creative group number of the creative group assignment.
        # Corresponds to the JSON property `creativeGroupNumber`
        # @return [String]
        attr_accessor :creative_group_number
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creative_group_id = args[:creative_group_id] if args.key?(:creative_group_id)
          @creative_group_number = args[:creative_group_number] if args.key?(:creative_group_number)
        end
      end
      
      # Creative Group List Response
      class CreativeGroupsListResponse
        include Google::Apis::Core::Hashable
      
        # Creative group collection.
        # Corresponds to the JSON property `creativeGroups`
        # @return [Array<Google::Apis::DfareportingV3_3::CreativeGroup>]
        attr_accessor :creative_groups
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#creativeGroupsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creative_groups = args[:creative_groups] if args.key?(:creative_groups)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Creative optimization settings.
      class CreativeOptimizationConfiguration
        include Google::Apis::Core::Hashable
      
        # ID of this creative optimization config. This field is auto-generated when the
        # campaign is inserted or updated. It can be null for existing campaigns.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Name of this creative optimization config. This is a required field and must
        # be less than 129 characters long.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # List of optimization activities associated with this configuration.
        # Corresponds to the JSON property `optimizationActivitys`
        # @return [Array<Google::Apis::DfareportingV3_3::OptimizationActivity>]
        attr_accessor :optimization_activitys
      
        # Optimization model for this configuration.
        # Corresponds to the JSON property `optimizationModel`
        # @return [String]
        attr_accessor :optimization_model
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @optimization_activitys = args[:optimization_activitys] if args.key?(:optimization_activitys)
          @optimization_model = args[:optimization_model] if args.key?(:optimization_model)
        end
      end
      
      # Creative Rotation.
      class CreativeRotation
        include Google::Apis::Core::Hashable
      
        # Creative assignments in this creative rotation.
        # Corresponds to the JSON property `creativeAssignments`
        # @return [Array<Google::Apis::DfareportingV3_3::CreativeAssignment>]
        attr_accessor :creative_assignments
      
        # Creative optimization configuration that is used by this ad. It should refer
        # to one of the existing optimization configurations in the ad's campaign. If it
        # is unset or set to 0, then the campaign's default optimization configuration
        # will be used for this ad.
        # Corresponds to the JSON property `creativeOptimizationConfigurationId`
        # @return [Fixnum]
        attr_accessor :creative_optimization_configuration_id
      
        # Type of creative rotation. Can be used to specify whether to use sequential or
        # random rotation.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Strategy for calculating weights. Used with CREATIVE_ROTATION_TYPE_RANDOM.
        # Corresponds to the JSON property `weightCalculationStrategy`
        # @return [String]
        attr_accessor :weight_calculation_strategy
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creative_assignments = args[:creative_assignments] if args.key?(:creative_assignments)
          @creative_optimization_configuration_id = args[:creative_optimization_configuration_id] if args.key?(:creative_optimization_configuration_id)
          @type = args[:type] if args.key?(:type)
          @weight_calculation_strategy = args[:weight_calculation_strategy] if args.key?(:weight_calculation_strategy)
        end
      end
      
      # Creative List Response
      class CreativesListResponse
        include Google::Apis::Core::Hashable
      
        # Creative collection.
        # Corresponds to the JSON property `creatives`
        # @return [Array<Google::Apis::DfareportingV3_3::Creative>]
        attr_accessor :creatives
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#creativesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creatives = args[:creatives] if args.key?(:creatives)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Represents fields that are compatible to be selected for a report of type "
      # CROSS_DIMENSION_REACH".
      class CrossDimensionReachReportCompatibleFields
        include Google::Apis::Core::Hashable
      
        # Dimensions which are compatible to be selected in the "breakdown" section of
        # the report.
        # Corresponds to the JSON property `breakdown`
        # @return [Array<Google::Apis::DfareportingV3_3::Dimension>]
        attr_accessor :breakdown
      
        # Dimensions which are compatible to be selected in the "dimensionFilters"
        # section of the report.
        # Corresponds to the JSON property `dimensionFilters`
        # @return [Array<Google::Apis::DfareportingV3_3::Dimension>]
        attr_accessor :dimension_filters
      
        # The kind of resource this is, in this case dfareporting#
        # crossDimensionReachReportCompatibleFields.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Metrics which are compatible to be selected in the "metricNames" section of
        # the report.
        # Corresponds to the JSON property `metrics`
        # @return [Array<Google::Apis::DfareportingV3_3::Metric>]
        attr_accessor :metrics
      
        # Metrics which are compatible to be selected in the "overlapMetricNames"
        # section of the report.
        # Corresponds to the JSON property `overlapMetrics`
        # @return [Array<Google::Apis::DfareportingV3_3::Metric>]
        attr_accessor :overlap_metrics
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @breakdown = args[:breakdown] if args.key?(:breakdown)
          @dimension_filters = args[:dimension_filters] if args.key?(:dimension_filters)
          @kind = args[:kind] if args.key?(:kind)
          @metrics = args[:metrics] if args.key?(:metrics)
          @overlap_metrics = args[:overlap_metrics] if args.key?(:overlap_metrics)
        end
      end
      
      # A custom floodlight variable.
      class CustomFloodlightVariable
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#customFloodlightVariable".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The type of custom floodlight variable to supply a value for. These map to the
        # "u[1-20]=" in the tags.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The value of the custom floodlight variable. The length of string must not
        # exceed 50 characters.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @type = args[:type] if args.key?(:type)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Represents a Custom Rich Media Events group.
      class CustomRichMediaEvents
        include Google::Apis::Core::Hashable
      
        # List of custom rich media event IDs. Dimension values must be all of type dfa:
        # richMediaEventTypeIdAndName.
        # Corresponds to the JSON property `filteredEventIds`
        # @return [Array<Google::Apis::DfareportingV3_3::DimensionValue>]
        attr_accessor :filtered_event_ids
      
        # The kind of resource this is, in this case dfareporting#customRichMediaEvents.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filtered_event_ids = args[:filtered_event_ids] if args.key?(:filtered_event_ids)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Custom Viewability Metric
      class CustomViewabilityMetric
        include Google::Apis::Core::Hashable
      
        # The attributes, like playtime and percent onscreen, that define the Custom
        # Viewability Metric.
        # Corresponds to the JSON property `configuration`
        # @return [Google::Apis::DfareportingV3_3::CustomViewabilityMetricConfiguration]
        attr_accessor :configuration
      
        # ID of the custom viewability metric.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Name of the custom viewability metric.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @configuration = args[:configuration] if args.key?(:configuration)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # The attributes, like playtime and percent onscreen, that define the Custom
      # Viewability Metric.
      class CustomViewabilityMetricConfiguration
        include Google::Apis::Core::Hashable
      
        # Whether the video must be audible to count an impression.
        # Corresponds to the JSON property `audible`
        # @return [Boolean]
        attr_accessor :audible
        alias_method :audible?, :audible
      
        # The time in milliseconds the video must play for the Custom Viewability Metric
        # to count an impression. If both this and timePercent are specified, the
        # earlier of the two will be used.
        # Corresponds to the JSON property `timeMillis`
        # @return [Fixnum]
        attr_accessor :time_millis
      
        # The percentage of video that must play for the Custom Viewability Metric to
        # count an impression. If both this and timeMillis are specified, the earlier of
        # the two will be used.
        # Corresponds to the JSON property `timePercent`
        # @return [Fixnum]
        attr_accessor :time_percent
      
        # The percentage of video that must be on screen for the Custom Viewability
        # Metric to count an impression.
        # Corresponds to the JSON property `viewabilityPercent`
        # @return [Fixnum]
        attr_accessor :viewability_percent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audible = args[:audible] if args.key?(:audible)
          @time_millis = args[:time_millis] if args.key?(:time_millis)
          @time_percent = args[:time_percent] if args.key?(:time_percent)
          @viewability_percent = args[:viewability_percent] if args.key?(:viewability_percent)
        end
      end
      
      # Represents a date range.
      class DateRange
        include Google::Apis::Core::Hashable
      
        # The end date of the date range, inclusive. A string of the format: "yyyy-MM-dd"
        # .
        # Corresponds to the JSON property `endDate`
        # @return [Date]
        attr_accessor :end_date
      
        # The kind of resource this is, in this case dfareporting#dateRange.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The date range relative to the date of when the report is run.
        # Corresponds to the JSON property `relativeDateRange`
        # @return [String]
        attr_accessor :relative_date_range
      
        # The start date of the date range, inclusive. A string of the format: "yyyy-MM-
        # dd".
        # Corresponds to the JSON property `startDate`
        # @return [Date]
        attr_accessor :start_date
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_date = args[:end_date] if args.key?(:end_date)
          @kind = args[:kind] if args.key?(:kind)
          @relative_date_range = args[:relative_date_range] if args.key?(:relative_date_range)
          @start_date = args[:start_date] if args.key?(:start_date)
        end
      end
      
      # Day Part Targeting.
      class DayPartTargeting
        include Google::Apis::Core::Hashable
      
        # Days of the week when the ad will serve.
        # Acceptable values are:
        # - "SUNDAY"
        # - "MONDAY"
        # - "TUESDAY"
        # - "WEDNESDAY"
        # - "THURSDAY"
        # - "FRIDAY"
        # - "SATURDAY"
        # Corresponds to the JSON property `daysOfWeek`
        # @return [Array<String>]
        attr_accessor :days_of_week
      
        # Hours of the day when the ad will serve, where 0 is midnight to 1 AM and 23 is
        # 11 PM to midnight. Can be specified with days of week, in which case the ad
        # would serve during these hours on the specified days. For example if Monday,
        # Wednesday, Friday are the days of week specified and 9-10am, 3-5pm (hours 9,
        # 15, and 16) is specified, the ad would serve Monday, Wednesdays, and Fridays
        # at 9-10am and 3-5pm. Acceptable values are 0 to 23, inclusive.
        # Corresponds to the JSON property `hoursOfDay`
        # @return [Array<Fixnum>]
        attr_accessor :hours_of_day
      
        # Whether or not to use the user's local time. If false, the America/New York
        # time zone applies.
        # Corresponds to the JSON property `userLocalTime`
        # @return [Boolean]
        attr_accessor :user_local_time
        alias_method :user_local_time?, :user_local_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @days_of_week = args[:days_of_week] if args.key?(:days_of_week)
          @hours_of_day = args[:hours_of_day] if args.key?(:hours_of_day)
          @user_local_time = args[:user_local_time] if args.key?(:user_local_time)
        end
      end
      
      # Contains information about a landing page deep link.
      class DeepLink
        include Google::Apis::Core::Hashable
      
        # The URL of the mobile app being linked to.
        # Corresponds to the JSON property `appUrl`
        # @return [String]
        attr_accessor :app_url
      
        # The fallback URL. This URL will be served to users who do not have the mobile
        # app installed.
        # Corresponds to the JSON property `fallbackUrl`
        # @return [String]
        attr_accessor :fallback_url
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#deepLink".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Contains information about a mobile app. Used as a landing page deep link.
        # Corresponds to the JSON property `mobileApp`
        # @return [Google::Apis::DfareportingV3_3::MobileApp]
        attr_accessor :mobile_app
      
        # Ads served to users on these remarketing lists will use this deep link.
        # Applicable when mobileApp.directory is APPLE_APP_STORE.
        # Corresponds to the JSON property `remarketingListIds`
        # @return [Array<Fixnum>]
        attr_accessor :remarketing_list_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_url = args[:app_url] if args.key?(:app_url)
          @fallback_url = args[:fallback_url] if args.key?(:fallback_url)
          @kind = args[:kind] if args.key?(:kind)
          @mobile_app = args[:mobile_app] if args.key?(:mobile_app)
          @remarketing_list_ids = args[:remarketing_list_ids] if args.key?(:remarketing_list_ids)
        end
      end
      
      # Properties of inheriting and overriding the default click-through event tag. A
      # campaign may override the event tag defined at the advertiser level, and an ad
      # may also override the campaign's setting further.
      class DefaultClickThroughEventTagProperties
        include Google::Apis::Core::Hashable
      
        # ID of the click-through event tag to apply to all ads in this entity's scope.
        # Corresponds to the JSON property `defaultClickThroughEventTagId`
        # @return [Fixnum]
        attr_accessor :default_click_through_event_tag_id
      
        # Whether this entity should override the inherited default click-through event
        # tag with its own defined value.
        # Corresponds to the JSON property `overrideInheritedEventTag`
        # @return [Boolean]
        attr_accessor :override_inherited_event_tag
        alias_method :override_inherited_event_tag?, :override_inherited_event_tag
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_click_through_event_tag_id = args[:default_click_through_event_tag_id] if args.key?(:default_click_through_event_tag_id)
          @override_inherited_event_tag = args[:override_inherited_event_tag] if args.key?(:override_inherited_event_tag)
        end
      end
      
      # Delivery Schedule.
      class DeliverySchedule
        include Google::Apis::Core::Hashable
      
        # Frequency Cap.
        # Corresponds to the JSON property `frequencyCap`
        # @return [Google::Apis::DfareportingV3_3::FrequencyCap]
        attr_accessor :frequency_cap
      
        # Whether or not hard cutoff is enabled. If true, the ad will not serve after
        # the end date and time. Otherwise the ad will continue to be served until it
        # has reached its delivery goals.
        # Corresponds to the JSON property `hardCutoff`
        # @return [Boolean]
        attr_accessor :hard_cutoff
        alias_method :hard_cutoff?, :hard_cutoff
      
        # Impression ratio for this ad. This ratio determines how often each ad is
        # served relative to the others. For example, if ad A has an impression ratio of
        # 1 and ad B has an impression ratio of 3, then Campaign Manager will serve ad B
        # three times as often as ad A. Acceptable values are 1 to 10, inclusive.
        # Corresponds to the JSON property `impressionRatio`
        # @return [Fixnum]
        attr_accessor :impression_ratio
      
        # Serving priority of an ad, with respect to other ads. The lower the priority
        # number, the greater the priority with which it is served.
        # Corresponds to the JSON property `priority`
        # @return [String]
        attr_accessor :priority
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @frequency_cap = args[:frequency_cap] if args.key?(:frequency_cap)
          @hard_cutoff = args[:hard_cutoff] if args.key?(:hard_cutoff)
          @impression_ratio = args[:impression_ratio] if args.key?(:impression_ratio)
          @priority = args[:priority] if args.key?(:priority)
        end
      end
      
      # Google Ad Manager Settings
      class DfpSettings
        include Google::Apis::Core::Hashable
      
        # Ad Manager network code for this directory site.
        # Corresponds to the JSON property `dfpNetworkCode`
        # @return [String]
        attr_accessor :dfp_network_code
      
        # Ad Manager network name for this directory site.
        # Corresponds to the JSON property `dfpNetworkName`
        # @return [String]
        attr_accessor :dfp_network_name
      
        # Whether this directory site accepts programmatic placements.
        # Corresponds to the JSON property `programmaticPlacementAccepted`
        # @return [Boolean]
        attr_accessor :programmatic_placement_accepted
        alias_method :programmatic_placement_accepted?, :programmatic_placement_accepted
      
        # Whether this directory site accepts publisher-paid tags.
        # Corresponds to the JSON property `pubPaidPlacementAccepted`
        # @return [Boolean]
        attr_accessor :pub_paid_placement_accepted
        alias_method :pub_paid_placement_accepted?, :pub_paid_placement_accepted
      
        # Whether this directory site is available only via Publisher Portal.
        # Corresponds to the JSON property `publisherPortalOnly`
        # @return [Boolean]
        attr_accessor :publisher_portal_only
        alias_method :publisher_portal_only?, :publisher_portal_only
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dfp_network_code = args[:dfp_network_code] if args.key?(:dfp_network_code)
          @dfp_network_name = args[:dfp_network_name] if args.key?(:dfp_network_name)
          @programmatic_placement_accepted = args[:programmatic_placement_accepted] if args.key?(:programmatic_placement_accepted)
          @pub_paid_placement_accepted = args[:pub_paid_placement_accepted] if args.key?(:pub_paid_placement_accepted)
          @publisher_portal_only = args[:publisher_portal_only] if args.key?(:publisher_portal_only)
        end
      end
      
      # Represents a dimension.
      class Dimension
        include Google::Apis::Core::Hashable
      
        # The kind of resource this is, in this case dfareporting#dimension.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The dimension name, e.g. dfa:advertiser
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Represents a dimension filter.
      class DimensionFilter
        include Google::Apis::Core::Hashable
      
        # The name of the dimension to filter.
        # Corresponds to the JSON property `dimensionName`
        # @return [String]
        attr_accessor :dimension_name
      
        # The kind of resource this is, in this case dfareporting#dimensionFilter.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The value of the dimension to filter.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dimension_name = args[:dimension_name] if args.key?(:dimension_name)
          @kind = args[:kind] if args.key?(:kind)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Represents a DimensionValue resource.
      class DimensionValue
        include Google::Apis::Core::Hashable
      
        # The name of the dimension.
        # Corresponds to the JSON property `dimensionName`
        # @return [String]
        attr_accessor :dimension_name
      
        # The eTag of this response for caching purposes.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The ID associated with the value if available.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The kind of resource this is, in this case dfareporting#dimensionValue.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Determines how the 'value' field is matched when filtering. If not specified,
        # defaults to EXACT. If set to WILDCARD_EXPRESSION, '*' is allowed as a
        # placeholder for variable length character sequences, and it can be escaped
        # with a backslash. Note, only paid search dimensions ('dfa:paidSearch*') allow
        # a matchType other than EXACT.
        # Corresponds to the JSON property `matchType`
        # @return [String]
        attr_accessor :match_type
      
        # The value of the dimension.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dimension_name = args[:dimension_name] if args.key?(:dimension_name)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @match_type = args[:match_type] if args.key?(:match_type)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Represents the list of DimensionValue resources.
      class DimensionValueList
        include Google::Apis::Core::Hashable
      
        # The eTag of this response for caching purposes.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The dimension values returned in this response.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::DfareportingV3_3::DimensionValue>]
        attr_accessor :items
      
        # The kind of list this is, in this case dfareporting#dimensionValueList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Continuation token used to page through dimension values. To retrieve the next
        # page of results, set the next request's "pageToken" to the value of this field.
        # The page token is only valid for a limited amount of time and should not be
        # persisted.
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
      
      # Represents a DimensionValuesRequest.
      class DimensionValueRequest
        include Google::Apis::Core::Hashable
      
        # The name of the dimension for which values should be requested.
        # Corresponds to the JSON property `dimensionName`
        # @return [String]
        attr_accessor :dimension_name
      
        # The end date of the date range for which to retrieve dimension values. A
        # string of the format "yyyy-MM-dd".
        # Corresponds to the JSON property `endDate`
        # @return [Date]
        attr_accessor :end_date
      
        # The list of filters by which to filter values. The filters are ANDed.
        # Corresponds to the JSON property `filters`
        # @return [Array<Google::Apis::DfareportingV3_3::DimensionFilter>]
        attr_accessor :filters
      
        # The kind of request this is, in this case dfareporting#dimensionValueRequest.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The start date of the date range for which to retrieve dimension values. A
        # string of the format "yyyy-MM-dd".
        # Corresponds to the JSON property `startDate`
        # @return [Date]
        attr_accessor :start_date
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dimension_name = args[:dimension_name] if args.key?(:dimension_name)
          @end_date = args[:end_date] if args.key?(:end_date)
          @filters = args[:filters] if args.key?(:filters)
          @kind = args[:kind] if args.key?(:kind)
          @start_date = args[:start_date] if args.key?(:start_date)
        end
      end
      
      # DirectorySites contains properties of a website from the Site Directory. Sites
      # need to be added to an account via the Sites resource before they can be
      # assigned to a placement.
      class DirectorySite
        include Google::Apis::Core::Hashable
      
        # Whether this directory site is active.
        # Corresponds to the JSON property `active`
        # @return [Boolean]
        attr_accessor :active
        alias_method :active?, :active
      
        # ID of this directory site. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `idDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :id_dimension_value
      
        # Tag types for regular placements.
        # Acceptable values are:
        # - "STANDARD"
        # - "IFRAME_JAVASCRIPT_INPAGE"
        # - "INTERNAL_REDIRECT_INPAGE"
        # - "JAVASCRIPT_INPAGE"
        # Corresponds to the JSON property `inpageTagFormats`
        # @return [Array<String>]
        attr_accessor :inpage_tag_formats
      
        # Tag types for interstitial placements.
        # Acceptable values are:
        # - "IFRAME_JAVASCRIPT_INTERSTITIAL"
        # - "INTERNAL_REDIRECT_INTERSTITIAL"
        # - "JAVASCRIPT_INTERSTITIAL"
        # Corresponds to the JSON property `interstitialTagFormats`
        # @return [Array<String>]
        attr_accessor :interstitial_tag_formats
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#directorySite".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this directory site.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Directory Site Settings
        # Corresponds to the JSON property `settings`
        # @return [Google::Apis::DfareportingV3_3::DirectorySiteSettings]
        attr_accessor :settings
      
        # URL of this directory site.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @active = args[:active] if args.key?(:active)
          @id = args[:id] if args.key?(:id)
          @id_dimension_value = args[:id_dimension_value] if args.key?(:id_dimension_value)
          @inpage_tag_formats = args[:inpage_tag_formats] if args.key?(:inpage_tag_formats)
          @interstitial_tag_formats = args[:interstitial_tag_formats] if args.key?(:interstitial_tag_formats)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @settings = args[:settings] if args.key?(:settings)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Directory Site Settings
      class DirectorySiteSettings
        include Google::Apis::Core::Hashable
      
        # Whether this directory site has disabled active view creatives.
        # Corresponds to the JSON property `activeViewOptOut`
        # @return [Boolean]
        attr_accessor :active_view_opt_out
        alias_method :active_view_opt_out?, :active_view_opt_out
      
        # Google Ad Manager Settings
        # Corresponds to the JSON property `dfpSettings`
        # @return [Google::Apis::DfareportingV3_3::DfpSettings]
        attr_accessor :dfp_settings
      
        # Whether this site accepts in-stream video ads.
        # Corresponds to the JSON property `instreamVideoPlacementAccepted`
        # @return [Boolean]
        attr_accessor :instream_video_placement_accepted
        alias_method :instream_video_placement_accepted?, :instream_video_placement_accepted
      
        # Whether this site accepts interstitial ads.
        # Corresponds to the JSON property `interstitialPlacementAccepted`
        # @return [Boolean]
        attr_accessor :interstitial_placement_accepted
        alias_method :interstitial_placement_accepted?, :interstitial_placement_accepted
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @active_view_opt_out = args[:active_view_opt_out] if args.key?(:active_view_opt_out)
          @dfp_settings = args[:dfp_settings] if args.key?(:dfp_settings)
          @instream_video_placement_accepted = args[:instream_video_placement_accepted] if args.key?(:instream_video_placement_accepted)
          @interstitial_placement_accepted = args[:interstitial_placement_accepted] if args.key?(:interstitial_placement_accepted)
        end
      end
      
      # Directory Site List Response
      class DirectorySitesListResponse
        include Google::Apis::Core::Hashable
      
        # Directory site collection.
        # Corresponds to the JSON property `directorySites`
        # @return [Array<Google::Apis::DfareportingV3_3::DirectorySite>]
        attr_accessor :directory_sites
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#directorySitesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @directory_sites = args[:directory_sites] if args.key?(:directory_sites)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Contains properties of a dynamic targeting key. Dynamic targeting keys are
      # unique, user-friendly labels, created at the advertiser level in DCM, that can
      # be assigned to ads, creatives, and placements and used for targeting with
      # Studio dynamic creatives. Use these labels instead of numeric Campaign Manager
      # IDs (such as placement IDs) to save time and avoid errors in your dynamic
      # feeds.
      class DynamicTargetingKey
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#dynamicTargetingKey".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this dynamic targeting key. This is a required field. Must be less
        # than 256 characters long and cannot contain commas. All characters are
        # converted to lowercase.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # ID of the object of this dynamic targeting key. This is a required field.
        # Corresponds to the JSON property `objectId`
        # @return [Fixnum]
        attr_accessor :object_id_prop
      
        # Type of the object of this dynamic targeting key. This is a required field.
        # Corresponds to the JSON property `objectType`
        # @return [String]
        attr_accessor :object_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @object_id_prop = args[:object_id_prop] if args.key?(:object_id_prop)
          @object_type = args[:object_type] if args.key?(:object_type)
        end
      end
      
      # Dynamic Targeting Key List Response
      class DynamicTargetingKeysListResponse
        include Google::Apis::Core::Hashable
      
        # Dynamic targeting key collection.
        # Corresponds to the JSON property `dynamicTargetingKeys`
        # @return [Array<Google::Apis::DfareportingV3_3::DynamicTargetingKey>]
        attr_accessor :dynamic_targeting_keys
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#dynamicTargetingKeysListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dynamic_targeting_keys = args[:dynamic_targeting_keys] if args.key?(:dynamic_targeting_keys)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # A description of how user IDs are encrypted.
      class EncryptionInfo
        include Google::Apis::Core::Hashable
      
        # The encryption entity ID. This should match the encryption configuration for
        # ad serving or Data Transfer.
        # Corresponds to the JSON property `encryptionEntityId`
        # @return [Fixnum]
        attr_accessor :encryption_entity_id
      
        # The encryption entity type. This should match the encryption configuration for
        # ad serving or Data Transfer.
        # Corresponds to the JSON property `encryptionEntityType`
        # @return [String]
        attr_accessor :encryption_entity_type
      
        # Describes whether the encrypted cookie was received from ad serving (the %m
        # macro) or from Data Transfer.
        # Corresponds to the JSON property `encryptionSource`
        # @return [String]
        attr_accessor :encryption_source
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#encryptionInfo".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @encryption_entity_id = args[:encryption_entity_id] if args.key?(:encryption_entity_id)
          @encryption_entity_type = args[:encryption_entity_type] if args.key?(:encryption_entity_type)
          @encryption_source = args[:encryption_source] if args.key?(:encryption_source)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Contains properties of an event tag.
      class EventTag
        include Google::Apis::Core::Hashable
      
        # Account ID of this event tag. This is a read-only field that can be left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Advertiser ID of this event tag. This field or the campaignId field is
        # required on insertion.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `advertiserIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :advertiser_id_dimension_value
      
        # Campaign ID of this event tag. This field or the advertiserId field is
        # required on insertion.
        # Corresponds to the JSON property `campaignId`
        # @return [Fixnum]
        attr_accessor :campaign_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `campaignIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :campaign_id_dimension_value
      
        # Whether this event tag should be automatically enabled for all of the
        # advertiser's campaigns and ads.
        # Corresponds to the JSON property `enabledByDefault`
        # @return [Boolean]
        attr_accessor :enabled_by_default
        alias_method :enabled_by_default?, :enabled_by_default
      
        # Whether to remove this event tag from ads that are trafficked through Display &
        # Video 360 to Ad Exchange. This may be useful if the event tag uses a pixel
        # that is unapproved for Ad Exchange bids on one or more networks, such as the
        # Google Display Network.
        # Corresponds to the JSON property `excludeFromAdxRequests`
        # @return [Boolean]
        attr_accessor :exclude_from_adx_requests
        alias_method :exclude_from_adx_requests?, :exclude_from_adx_requests
      
        # ID of this event tag. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#eventTag".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this event tag. This is a required field and must be less than 256
        # characters long.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Site filter type for this event tag. If no type is specified then the event
        # tag will be applied to all sites.
        # Corresponds to the JSON property `siteFilterType`
        # @return [String]
        attr_accessor :site_filter_type
      
        # Filter list of site IDs associated with this event tag. The siteFilterType
        # determines whether this is a whitelist or blacklist filter.
        # Corresponds to the JSON property `siteIds`
        # @return [Array<Fixnum>]
        attr_accessor :site_ids
      
        # Whether this tag is SSL-compliant or not. This is a read-only field.
        # Corresponds to the JSON property `sslCompliant`
        # @return [Boolean]
        attr_accessor :ssl_compliant
        alias_method :ssl_compliant?, :ssl_compliant
      
        # Status of this event tag. Must be ENABLED for this event tag to fire. This is
        # a required field.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # Subaccount ID of this event tag. This is a read-only field that can be left
        # blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Event tag type. Can be used to specify whether to use a third-party pixel, a
        # third-party JavaScript URL, or a third-party click-through URL for either
        # impression or click tracking. This is a required field.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Payload URL for this event tag. The URL on a click-through event tag should
        # have a landing page URL appended to the end of it. This field is required on
        # insertion.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        # Number of times the landing page URL should be URL-escaped before being
        # appended to the click-through event tag URL. Only applies to click-through
        # event tags as specified by the event tag type.
        # Corresponds to the JSON property `urlEscapeLevels`
        # @return [Fixnum]
        attr_accessor :url_escape_levels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_id_dimension_value = args[:advertiser_id_dimension_value] if args.key?(:advertiser_id_dimension_value)
          @campaign_id = args[:campaign_id] if args.key?(:campaign_id)
          @campaign_id_dimension_value = args[:campaign_id_dimension_value] if args.key?(:campaign_id_dimension_value)
          @enabled_by_default = args[:enabled_by_default] if args.key?(:enabled_by_default)
          @exclude_from_adx_requests = args[:exclude_from_adx_requests] if args.key?(:exclude_from_adx_requests)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @site_filter_type = args[:site_filter_type] if args.key?(:site_filter_type)
          @site_ids = args[:site_ids] if args.key?(:site_ids)
          @ssl_compliant = args[:ssl_compliant] if args.key?(:ssl_compliant)
          @status = args[:status] if args.key?(:status)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @type = args[:type] if args.key?(:type)
          @url = args[:url] if args.key?(:url)
          @url_escape_levels = args[:url_escape_levels] if args.key?(:url_escape_levels)
        end
      end
      
      # Event tag override information.
      class EventTagOverride
        include Google::Apis::Core::Hashable
      
        # Whether this override is enabled.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # ID of this event tag override. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled = args[:enabled] if args.key?(:enabled)
          @id = args[:id] if args.key?(:id)
        end
      end
      
      # Event Tag List Response
      class EventTagsListResponse
        include Google::Apis::Core::Hashable
      
        # Event tag collection.
        # Corresponds to the JSON property `eventTags`
        # @return [Array<Google::Apis::DfareportingV3_3::EventTag>]
        attr_accessor :event_tags
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#eventTagsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @event_tags = args[:event_tags] if args.key?(:event_tags)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Represents a File resource. A file contains the metadata for a report run. It
      # shows the status of the run and holds the URLs to the generated report data if
      # the run is finished and the status is "REPORT_AVAILABLE".
      class File
        include Google::Apis::Core::Hashable
      
        # Represents a date range.
        # Corresponds to the JSON property `dateRange`
        # @return [Google::Apis::DfareportingV3_3::DateRange]
        attr_accessor :date_range
      
        # The eTag of this response for caching purposes.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The filename of the file.
        # Corresponds to the JSON property `fileName`
        # @return [String]
        attr_accessor :file_name
      
        # The output format of the report. Only available once the file is available.
        # Corresponds to the JSON property `format`
        # @return [String]
        attr_accessor :format
      
        # The unique ID of this report file.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # The kind of resource this is, in this case dfareporting#file.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The timestamp in milliseconds since epoch when this file was last modified.
        # Corresponds to the JSON property `lastModifiedTime`
        # @return [Fixnum]
        attr_accessor :last_modified_time
      
        # The ID of the report this file was generated from.
        # Corresponds to the JSON property `reportId`
        # @return [Fixnum]
        attr_accessor :report_id
      
        # The status of the report file.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # The URLs where the completed report file can be downloaded.
        # Corresponds to the JSON property `urls`
        # @return [Google::Apis::DfareportingV3_3::File::Urls]
        attr_accessor :urls
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @date_range = args[:date_range] if args.key?(:date_range)
          @etag = args[:etag] if args.key?(:etag)
          @file_name = args[:file_name] if args.key?(:file_name)
          @format = args[:format] if args.key?(:format)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @last_modified_time = args[:last_modified_time] if args.key?(:last_modified_time)
          @report_id = args[:report_id] if args.key?(:report_id)
          @status = args[:status] if args.key?(:status)
          @urls = args[:urls] if args.key?(:urls)
        end
        
        # The URLs where the completed report file can be downloaded.
        class Urls
          include Google::Apis::Core::Hashable
        
          # The URL for downloading the report data through the API.
          # Corresponds to the JSON property `apiUrl`
          # @return [String]
          attr_accessor :api_url
        
          # The URL for downloading the report data through a browser.
          # Corresponds to the JSON property `browserUrl`
          # @return [String]
          attr_accessor :browser_url
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @api_url = args[:api_url] if args.key?(:api_url)
            @browser_url = args[:browser_url] if args.key?(:browser_url)
          end
        end
      end
      
      # Represents the list of File resources.
      class FileList
        include Google::Apis::Core::Hashable
      
        # The eTag of this response for caching purposes.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The files returned in this response.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::DfareportingV3_3::File>]
        attr_accessor :items
      
        # The kind of list this is, in this case dfareporting#fileList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Continuation token used to page through files. To retrieve the next page of
        # results, set the next request's "pageToken" to the value of this field. The
        # page token is only valid for a limited amount of time and should not be
        # persisted.
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
      
      # Flight
      class Flight
        include Google::Apis::Core::Hashable
      
        # Inventory item flight end date.
        # Corresponds to the JSON property `endDate`
        # @return [Date]
        attr_accessor :end_date
      
        # Rate or cost of this flight.
        # Corresponds to the JSON property `rateOrCost`
        # @return [Fixnum]
        attr_accessor :rate_or_cost
      
        # Inventory item flight start date.
        # Corresponds to the JSON property `startDate`
        # @return [Date]
        attr_accessor :start_date
      
        # Units of this flight.
        # Corresponds to the JSON property `units`
        # @return [Fixnum]
        attr_accessor :units
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_date = args[:end_date] if args.key?(:end_date)
          @rate_or_cost = args[:rate_or_cost] if args.key?(:rate_or_cost)
          @start_date = args[:start_date] if args.key?(:start_date)
          @units = args[:units] if args.key?(:units)
        end
      end
      
      # Floodlight Activity GenerateTag Response
      class FloodlightActivitiesGenerateTagResponse
        include Google::Apis::Core::Hashable
      
        # Generated tag for this Floodlight activity. For global site tags, this is the
        # event snippet.
        # Corresponds to the JSON property `floodlightActivityTag`
        # @return [String]
        attr_accessor :floodlight_activity_tag
      
        # The global snippet section of a global site tag. The global site tag sets new
        # cookies on your domain, which will store a unique identifier for a user or the
        # ad click that brought the user to your site. Learn more.
        # Corresponds to the JSON property `globalSiteTagGlobalSnippet`
        # @return [String]
        attr_accessor :global_site_tag_global_snippet
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#floodlightActivitiesGenerateTagResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @floodlight_activity_tag = args[:floodlight_activity_tag] if args.key?(:floodlight_activity_tag)
          @global_site_tag_global_snippet = args[:global_site_tag_global_snippet] if args.key?(:global_site_tag_global_snippet)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Floodlight Activity List Response
      class FloodlightActivitiesListResponse
        include Google::Apis::Core::Hashable
      
        # Floodlight activity collection.
        # Corresponds to the JSON property `floodlightActivities`
        # @return [Array<Google::Apis::DfareportingV3_3::FloodlightActivity>]
        attr_accessor :floodlight_activities
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#floodlightActivitiesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @floodlight_activities = args[:floodlight_activities] if args.key?(:floodlight_activities)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Contains properties of a Floodlight activity.
      class FloodlightActivity
        include Google::Apis::Core::Hashable
      
        # Account ID of this floodlight activity. This is a read-only field that can be
        # left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Advertiser ID of this floodlight activity. If this field is left blank, the
        # value will be copied over either from the activity group's advertiser or the
        # existing activity's advertiser.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `advertiserIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :advertiser_id_dimension_value
      
        # Code type used for cache busting in the generated tag. Applicable only when
        # floodlightActivityGroupType is COUNTER and countingMethod is STANDARD_COUNTING
        # or UNIQUE_COUNTING.
        # Corresponds to the JSON property `cacheBustingType`
        # @return [String]
        attr_accessor :cache_busting_type
      
        # Counting method for conversions for this floodlight activity. This is a
        # required field.
        # Corresponds to the JSON property `countingMethod`
        # @return [String]
        attr_accessor :counting_method
      
        # Dynamic floodlight tags.
        # Corresponds to the JSON property `defaultTags`
        # @return [Array<Google::Apis::DfareportingV3_3::FloodlightActivityDynamicTag>]
        attr_accessor :default_tags
      
        # URL where this tag will be deployed. If specified, must be less than 256
        # characters long.
        # Corresponds to the JSON property `expectedUrl`
        # @return [String]
        attr_accessor :expected_url
      
        # Floodlight activity group ID of this floodlight activity. This is a required
        # field.
        # Corresponds to the JSON property `floodlightActivityGroupId`
        # @return [Fixnum]
        attr_accessor :floodlight_activity_group_id
      
        # Name of the associated floodlight activity group. This is a read-only field.
        # Corresponds to the JSON property `floodlightActivityGroupName`
        # @return [String]
        attr_accessor :floodlight_activity_group_name
      
        # Tag string of the associated floodlight activity group. This is a read-only
        # field.
        # Corresponds to the JSON property `floodlightActivityGroupTagString`
        # @return [String]
        attr_accessor :floodlight_activity_group_tag_string
      
        # Type of the associated floodlight activity group. This is a read-only field.
        # Corresponds to the JSON property `floodlightActivityGroupType`
        # @return [String]
        attr_accessor :floodlight_activity_group_type
      
        # Floodlight configuration ID of this floodlight activity. If this field is left
        # blank, the value will be copied over either from the activity group's
        # floodlight configuration or from the existing activity's floodlight
        # configuration.
        # Corresponds to the JSON property `floodlightConfigurationId`
        # @return [Fixnum]
        attr_accessor :floodlight_configuration_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `floodlightConfigurationIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :floodlight_configuration_id_dimension_value
      
        # The type of Floodlight tag this activity will generate. This is a required
        # field.
        # Corresponds to the JSON property `floodlightTagType`
        # @return [String]
        attr_accessor :floodlight_tag_type
      
        # Whether this activity is archived.
        # Corresponds to the JSON property `hidden`
        # @return [Boolean]
        attr_accessor :hidden
        alias_method :hidden?, :hidden
      
        # ID of this floodlight activity. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `idDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :id_dimension_value
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#floodlightActivity".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this floodlight activity. This is a required field. Must be less than
        # 129 characters long and cannot contain quotes.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # General notes or implementation instructions for the tag.
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # Publisher dynamic floodlight tags.
        # Corresponds to the JSON property `publisherTags`
        # @return [Array<Google::Apis::DfareportingV3_3::FloodlightActivityPublisherDynamicTag>]
        attr_accessor :publisher_tags
      
        # Whether this tag should use SSL.
        # Corresponds to the JSON property `secure`
        # @return [Boolean]
        attr_accessor :secure
        alias_method :secure?, :secure
      
        # Whether the floodlight activity is SSL-compliant. This is a read-only field,
        # its value detected by the system from the floodlight tags.
        # Corresponds to the JSON property `sslCompliant`
        # @return [Boolean]
        attr_accessor :ssl_compliant
        alias_method :ssl_compliant?, :ssl_compliant
      
        # Whether this floodlight activity must be SSL-compliant.
        # Corresponds to the JSON property `sslRequired`
        # @return [Boolean]
        attr_accessor :ssl_required
        alias_method :ssl_required?, :ssl_required
      
        # Subaccount ID of this floodlight activity. This is a read-only field that can
        # be left blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Tag format type for the floodlight activity. If left blank, the tag format
        # will default to HTML.
        # Corresponds to the JSON property `tagFormat`
        # @return [String]
        attr_accessor :tag_format
      
        # Value of the cat= parameter in the floodlight tag, which the ad servers use to
        # identify the activity. This is optional: if empty, a new tag string will be
        # generated for you. This string must be 1 to 8 characters long, with valid
        # characters being [a-z][A-Z][0-9][-][ _ ]. This tag string must also be unique
        # among activities of the same activity group. This field is read-only after
        # insertion.
        # Corresponds to the JSON property `tagString`
        # @return [String]
        attr_accessor :tag_string
      
        # List of the user-defined variables used by this conversion tag. These map to
        # the "u[1-100]=" in the tags. Each of these can have a user defined type.
        # Acceptable values are U1 to U100, inclusive.
        # Corresponds to the JSON property `userDefinedVariableTypes`
        # @return [Array<String>]
        attr_accessor :user_defined_variable_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_id_dimension_value = args[:advertiser_id_dimension_value] if args.key?(:advertiser_id_dimension_value)
          @cache_busting_type = args[:cache_busting_type] if args.key?(:cache_busting_type)
          @counting_method = args[:counting_method] if args.key?(:counting_method)
          @default_tags = args[:default_tags] if args.key?(:default_tags)
          @expected_url = args[:expected_url] if args.key?(:expected_url)
          @floodlight_activity_group_id = args[:floodlight_activity_group_id] if args.key?(:floodlight_activity_group_id)
          @floodlight_activity_group_name = args[:floodlight_activity_group_name] if args.key?(:floodlight_activity_group_name)
          @floodlight_activity_group_tag_string = args[:floodlight_activity_group_tag_string] if args.key?(:floodlight_activity_group_tag_string)
          @floodlight_activity_group_type = args[:floodlight_activity_group_type] if args.key?(:floodlight_activity_group_type)
          @floodlight_configuration_id = args[:floodlight_configuration_id] if args.key?(:floodlight_configuration_id)
          @floodlight_configuration_id_dimension_value = args[:floodlight_configuration_id_dimension_value] if args.key?(:floodlight_configuration_id_dimension_value)
          @floodlight_tag_type = args[:floodlight_tag_type] if args.key?(:floodlight_tag_type)
          @hidden = args[:hidden] if args.key?(:hidden)
          @id = args[:id] if args.key?(:id)
          @id_dimension_value = args[:id_dimension_value] if args.key?(:id_dimension_value)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @publisher_tags = args[:publisher_tags] if args.key?(:publisher_tags)
          @secure = args[:secure] if args.key?(:secure)
          @ssl_compliant = args[:ssl_compliant] if args.key?(:ssl_compliant)
          @ssl_required = args[:ssl_required] if args.key?(:ssl_required)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @tag_format = args[:tag_format] if args.key?(:tag_format)
          @tag_string = args[:tag_string] if args.key?(:tag_string)
          @user_defined_variable_types = args[:user_defined_variable_types] if args.key?(:user_defined_variable_types)
        end
      end
      
      # Dynamic Tag
      class FloodlightActivityDynamicTag
        include Google::Apis::Core::Hashable
      
        # ID of this dynamic tag. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Name of this tag.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Tag code.
        # Corresponds to the JSON property `tag`
        # @return [String]
        attr_accessor :tag
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @tag = args[:tag] if args.key?(:tag)
        end
      end
      
      # Contains properties of a Floodlight activity group.
      class FloodlightActivityGroup
        include Google::Apis::Core::Hashable
      
        # Account ID of this floodlight activity group. This is a read-only field that
        # can be left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Advertiser ID of this floodlight activity group. If this field is left blank,
        # the value will be copied over either from the floodlight configuration's
        # advertiser or from the existing activity group's advertiser.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `advertiserIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :advertiser_id_dimension_value
      
        # Floodlight configuration ID of this floodlight activity group. This is a
        # required field.
        # Corresponds to the JSON property `floodlightConfigurationId`
        # @return [Fixnum]
        attr_accessor :floodlight_configuration_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `floodlightConfigurationIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :floodlight_configuration_id_dimension_value
      
        # ID of this floodlight activity group. This is a read-only, auto-generated
        # field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `idDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :id_dimension_value
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#floodlightActivityGroup".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this floodlight activity group. This is a required field. Must be less
        # than 65 characters long and cannot contain quotes.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Subaccount ID of this floodlight activity group. This is a read-only field
        # that can be left blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Value of the type= parameter in the floodlight tag, which the ad servers use
        # to identify the activity group that the activity belongs to. This is optional:
        # if empty, a new tag string will be generated for you. This string must be 1 to
        # 8 characters long, with valid characters being [a-z][A-Z][0-9][-][ _ ]. This
        # tag string must also be unique among activity groups of the same floodlight
        # configuration. This field is read-only after insertion.
        # Corresponds to the JSON property `tagString`
        # @return [String]
        attr_accessor :tag_string
      
        # Type of the floodlight activity group. This is a required field that is read-
        # only after insertion.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_id_dimension_value = args[:advertiser_id_dimension_value] if args.key?(:advertiser_id_dimension_value)
          @floodlight_configuration_id = args[:floodlight_configuration_id] if args.key?(:floodlight_configuration_id)
          @floodlight_configuration_id_dimension_value = args[:floodlight_configuration_id_dimension_value] if args.key?(:floodlight_configuration_id_dimension_value)
          @id = args[:id] if args.key?(:id)
          @id_dimension_value = args[:id_dimension_value] if args.key?(:id_dimension_value)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @tag_string = args[:tag_string] if args.key?(:tag_string)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Floodlight Activity Group List Response
      class FloodlightActivityGroupsListResponse
        include Google::Apis::Core::Hashable
      
        # Floodlight activity group collection.
        # Corresponds to the JSON property `floodlightActivityGroups`
        # @return [Array<Google::Apis::DfareportingV3_3::FloodlightActivityGroup>]
        attr_accessor :floodlight_activity_groups
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#floodlightActivityGroupsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @floodlight_activity_groups = args[:floodlight_activity_groups] if args.key?(:floodlight_activity_groups)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Publisher Dynamic Tag
      class FloodlightActivityPublisherDynamicTag
        include Google::Apis::Core::Hashable
      
        # Whether this tag is applicable only for click-throughs.
        # Corresponds to the JSON property `clickThrough`
        # @return [Boolean]
        attr_accessor :click_through
        alias_method :click_through?, :click_through
      
        # Directory site ID of this dynamic tag. This is a write-only field that can be
        # used as an alternative to the siteId field. When this resource is retrieved,
        # only the siteId field will be populated.
        # Corresponds to the JSON property `directorySiteId`
        # @return [Fixnum]
        attr_accessor :directory_site_id
      
        # Dynamic Tag
        # Corresponds to the JSON property `dynamicTag`
        # @return [Google::Apis::DfareportingV3_3::FloodlightActivityDynamicTag]
        attr_accessor :dynamic_tag
      
        # Site ID of this dynamic tag.
        # Corresponds to the JSON property `siteId`
        # @return [Fixnum]
        attr_accessor :site_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `siteIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :site_id_dimension_value
      
        # Whether this tag is applicable only for view-throughs.
        # Corresponds to the JSON property `viewThrough`
        # @return [Boolean]
        attr_accessor :view_through
        alias_method :view_through?, :view_through
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @click_through = args[:click_through] if args.key?(:click_through)
          @directory_site_id = args[:directory_site_id] if args.key?(:directory_site_id)
          @dynamic_tag = args[:dynamic_tag] if args.key?(:dynamic_tag)
          @site_id = args[:site_id] if args.key?(:site_id)
          @site_id_dimension_value = args[:site_id_dimension_value] if args.key?(:site_id_dimension_value)
          @view_through = args[:view_through] if args.key?(:view_through)
        end
      end
      
      # Contains properties of a Floodlight configuration.
      class FloodlightConfiguration
        include Google::Apis::Core::Hashable
      
        # Account ID of this floodlight configuration. This is a read-only field that
        # can be left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Advertiser ID of the parent advertiser of this floodlight configuration.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `advertiserIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :advertiser_id_dimension_value
      
        # Whether advertiser data is shared with Google Analytics.
        # Corresponds to the JSON property `analyticsDataSharingEnabled`
        # @return [Boolean]
        attr_accessor :analytics_data_sharing_enabled
        alias_method :analytics_data_sharing_enabled?, :analytics_data_sharing_enabled
      
        # Custom Viewability Metric
        # Corresponds to the JSON property `customViewabilityMetric`
        # @return [Google::Apis::DfareportingV3_3::CustomViewabilityMetric]
        attr_accessor :custom_viewability_metric
      
        # Whether the exposure-to-conversion report is enabled. This report shows
        # detailed pathway information on up to 10 of the most recent ad exposures seen
        # by a user before converting.
        # Corresponds to the JSON property `exposureToConversionEnabled`
        # @return [Boolean]
        attr_accessor :exposure_to_conversion_enabled
        alias_method :exposure_to_conversion_enabled?, :exposure_to_conversion_enabled
      
        # Day that will be counted as the first day of the week in reports. This is a
        # required field.
        # Corresponds to the JSON property `firstDayOfWeek`
        # @return [String]
        attr_accessor :first_day_of_week
      
        # ID of this floodlight configuration. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `idDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :id_dimension_value
      
        # Whether in-app attribution tracking is enabled.
        # Corresponds to the JSON property `inAppAttributionTrackingEnabled`
        # @return [Boolean]
        attr_accessor :in_app_attribution_tracking_enabled
        alias_method :in_app_attribution_tracking_enabled?, :in_app_attribution_tracking_enabled
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#floodlightConfiguration".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Lookback configuration settings.
        # Corresponds to the JSON property `lookbackConfiguration`
        # @return [Google::Apis::DfareportingV3_3::LookbackConfiguration]
        attr_accessor :lookback_configuration
      
        # Types of attribution options for natural search conversions.
        # Corresponds to the JSON property `naturalSearchConversionAttributionOption`
        # @return [String]
        attr_accessor :natural_search_conversion_attribution_option
      
        # Omniture Integration Settings.
        # Corresponds to the JSON property `omnitureSettings`
        # @return [Google::Apis::DfareportingV3_3::OmnitureSettings]
        attr_accessor :omniture_settings
      
        # Subaccount ID of this floodlight configuration. This is a read-only field that
        # can be left blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Dynamic and Image Tag Settings.
        # Corresponds to the JSON property `tagSettings`
        # @return [Google::Apis::DfareportingV3_3::TagSettings]
        attr_accessor :tag_settings
      
        # List of third-party authentication tokens enabled for this configuration.
        # Corresponds to the JSON property `thirdPartyAuthenticationTokens`
        # @return [Array<Google::Apis::DfareportingV3_3::ThirdPartyAuthenticationToken>]
        attr_accessor :third_party_authentication_tokens
      
        # List of user defined variables enabled for this configuration.
        # Corresponds to the JSON property `userDefinedVariableConfigurations`
        # @return [Array<Google::Apis::DfareportingV3_3::UserDefinedVariableConfiguration>]
        attr_accessor :user_defined_variable_configurations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_id_dimension_value = args[:advertiser_id_dimension_value] if args.key?(:advertiser_id_dimension_value)
          @analytics_data_sharing_enabled = args[:analytics_data_sharing_enabled] if args.key?(:analytics_data_sharing_enabled)
          @custom_viewability_metric = args[:custom_viewability_metric] if args.key?(:custom_viewability_metric)
          @exposure_to_conversion_enabled = args[:exposure_to_conversion_enabled] if args.key?(:exposure_to_conversion_enabled)
          @first_day_of_week = args[:first_day_of_week] if args.key?(:first_day_of_week)
          @id = args[:id] if args.key?(:id)
          @id_dimension_value = args[:id_dimension_value] if args.key?(:id_dimension_value)
          @in_app_attribution_tracking_enabled = args[:in_app_attribution_tracking_enabled] if args.key?(:in_app_attribution_tracking_enabled)
          @kind = args[:kind] if args.key?(:kind)
          @lookback_configuration = args[:lookback_configuration] if args.key?(:lookback_configuration)
          @natural_search_conversion_attribution_option = args[:natural_search_conversion_attribution_option] if args.key?(:natural_search_conversion_attribution_option)
          @omniture_settings = args[:omniture_settings] if args.key?(:omniture_settings)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @tag_settings = args[:tag_settings] if args.key?(:tag_settings)
          @third_party_authentication_tokens = args[:third_party_authentication_tokens] if args.key?(:third_party_authentication_tokens)
          @user_defined_variable_configurations = args[:user_defined_variable_configurations] if args.key?(:user_defined_variable_configurations)
        end
      end
      
      # Floodlight Configuration List Response
      class FloodlightConfigurationsListResponse
        include Google::Apis::Core::Hashable
      
        # Floodlight configuration collection.
        # Corresponds to the JSON property `floodlightConfigurations`
        # @return [Array<Google::Apis::DfareportingV3_3::FloodlightConfiguration>]
        attr_accessor :floodlight_configurations
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#floodlightConfigurationsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @floodlight_configurations = args[:floodlight_configurations] if args.key?(:floodlight_configurations)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Represents fields that are compatible to be selected for a report of type "
      # FlOODLIGHT".
      class FloodlightReportCompatibleFields
        include Google::Apis::Core::Hashable
      
        # Dimensions which are compatible to be selected in the "dimensionFilters"
        # section of the report.
        # Corresponds to the JSON property `dimensionFilters`
        # @return [Array<Google::Apis::DfareportingV3_3::Dimension>]
        attr_accessor :dimension_filters
      
        # Dimensions which are compatible to be selected in the "dimensions" section of
        # the report.
        # Corresponds to the JSON property `dimensions`
        # @return [Array<Google::Apis::DfareportingV3_3::Dimension>]
        attr_accessor :dimensions
      
        # The kind of resource this is, in this case dfareporting#
        # floodlightReportCompatibleFields.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Metrics which are compatible to be selected in the "metricNames" section of
        # the report.
        # Corresponds to the JSON property `metrics`
        # @return [Array<Google::Apis::DfareportingV3_3::Metric>]
        attr_accessor :metrics
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dimension_filters = args[:dimension_filters] if args.key?(:dimension_filters)
          @dimensions = args[:dimensions] if args.key?(:dimensions)
          @kind = args[:kind] if args.key?(:kind)
          @metrics = args[:metrics] if args.key?(:metrics)
        end
      end
      
      # Frequency Cap.
      class FrequencyCap
        include Google::Apis::Core::Hashable
      
        # Duration of time, in seconds, for this frequency cap. The maximum duration is
        # 90 days. Acceptable values are 1 to 7776000, inclusive.
        # Corresponds to the JSON property `duration`
        # @return [Fixnum]
        attr_accessor :duration
      
        # Number of times an individual user can be served the ad within the specified
        # duration. Acceptable values are 1 to 15, inclusive.
        # Corresponds to the JSON property `impressions`
        # @return [Fixnum]
        attr_accessor :impressions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @duration = args[:duration] if args.key?(:duration)
          @impressions = args[:impressions] if args.key?(:impressions)
        end
      end
      
      # FsCommand.
      class FsCommand
        include Google::Apis::Core::Hashable
      
        # Distance from the left of the browser.Applicable when positionOption is
        # DISTANCE_FROM_TOP_LEFT_CORNER.
        # Corresponds to the JSON property `left`
        # @return [Fixnum]
        attr_accessor :left
      
        # Position in the browser where the window will open.
        # Corresponds to the JSON property `positionOption`
        # @return [String]
        attr_accessor :position_option
      
        # Distance from the top of the browser. Applicable when positionOption is
        # DISTANCE_FROM_TOP_LEFT_CORNER.
        # Corresponds to the JSON property `top`
        # @return [Fixnum]
        attr_accessor :top
      
        # Height of the window.
        # Corresponds to the JSON property `windowHeight`
        # @return [Fixnum]
        attr_accessor :window_height
      
        # Width of the window.
        # Corresponds to the JSON property `windowWidth`
        # @return [Fixnum]
        attr_accessor :window_width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @left = args[:left] if args.key?(:left)
          @position_option = args[:position_option] if args.key?(:position_option)
          @top = args[:top] if args.key?(:top)
          @window_height = args[:window_height] if args.key?(:window_height)
          @window_width = args[:window_width] if args.key?(:window_width)
        end
      end
      
      # Geographical Targeting.
      class GeoTargeting
        include Google::Apis::Core::Hashable
      
        # Cities to be targeted. For each city only dartId is required. The other fields
        # are populated automatically when the ad is inserted or updated. If targeting a
        # city, do not target or exclude the country of the city, and do not target the
        # metro or region of the city.
        # Corresponds to the JSON property `cities`
        # @return [Array<Google::Apis::DfareportingV3_3::City>]
        attr_accessor :cities
      
        # Countries to be targeted or excluded from targeting, depending on the setting
        # of the excludeCountries field. For each country only dartId is required. The
        # other fields are populated automatically when the ad is inserted or updated.
        # If targeting or excluding a country, do not target regions, cities, metros, or
        # postal codes in the same country.
        # Corresponds to the JSON property `countries`
        # @return [Array<Google::Apis::DfareportingV3_3::Country>]
        attr_accessor :countries
      
        # Whether or not to exclude the countries in the countries field from targeting.
        # If false, the countries field refers to countries which will be targeted by
        # the ad.
        # Corresponds to the JSON property `excludeCountries`
        # @return [Boolean]
        attr_accessor :exclude_countries
        alias_method :exclude_countries?, :exclude_countries
      
        # Metros to be targeted. For each metro only dmaId is required. The other fields
        # are populated automatically when the ad is inserted or updated. If targeting a
        # metro, do not target or exclude the country of the metro.
        # Corresponds to the JSON property `metros`
        # @return [Array<Google::Apis::DfareportingV3_3::Metro>]
        attr_accessor :metros
      
        # Postal codes to be targeted. For each postal code only id is required. The
        # other fields are populated automatically when the ad is inserted or updated.
        # If targeting a postal code, do not target or exclude the country of the postal
        # code.
        # Corresponds to the JSON property `postalCodes`
        # @return [Array<Google::Apis::DfareportingV3_3::PostalCode>]
        attr_accessor :postal_codes
      
        # Regions to be targeted. For each region only dartId is required. The other
        # fields are populated automatically when the ad is inserted or updated. If
        # targeting a region, do not target or exclude the country of the region.
        # Corresponds to the JSON property `regions`
        # @return [Array<Google::Apis::DfareportingV3_3::Region>]
        attr_accessor :regions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cities = args[:cities] if args.key?(:cities)
          @countries = args[:countries] if args.key?(:countries)
          @exclude_countries = args[:exclude_countries] if args.key?(:exclude_countries)
          @metros = args[:metros] if args.key?(:metros)
          @postal_codes = args[:postal_codes] if args.key?(:postal_codes)
          @regions = args[:regions] if args.key?(:regions)
        end
      end
      
      # Represents a buy from the Planning inventory store.
      class InventoryItem
        include Google::Apis::Core::Hashable
      
        # Account ID of this inventory item.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Ad slots of this inventory item. If this inventory item represents a
        # standalone placement, there will be exactly one ad slot. If this inventory
        # item represents a placement group, there will be more than one ad slot, each
        # representing one child placement in that placement group.
        # Corresponds to the JSON property `adSlots`
        # @return [Array<Google::Apis::DfareportingV3_3::AdSlot>]
        attr_accessor :ad_slots
      
        # Advertiser ID of this inventory item.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Content category ID of this inventory item.
        # Corresponds to the JSON property `contentCategoryId`
        # @return [Fixnum]
        attr_accessor :content_category_id
      
        # Estimated click-through rate of this inventory item.
        # Corresponds to the JSON property `estimatedClickThroughRate`
        # @return [Fixnum]
        attr_accessor :estimated_click_through_rate
      
        # Estimated conversion rate of this inventory item.
        # Corresponds to the JSON property `estimatedConversionRate`
        # @return [Fixnum]
        attr_accessor :estimated_conversion_rate
      
        # ID of this inventory item.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Whether this inventory item is in plan.
        # Corresponds to the JSON property `inPlan`
        # @return [Boolean]
        attr_accessor :in_plan
        alias_method :in_plan?, :in_plan
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#inventoryItem".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Modification timestamp.
        # Corresponds to the JSON property `lastModifiedInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :last_modified_info
      
        # Name of this inventory item. For standalone inventory items, this is the same
        # name as that of its only ad slot. For group inventory items, this can differ
        # from the name of any of its ad slots.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Negotiation channel ID of this inventory item.
        # Corresponds to the JSON property `negotiationChannelId`
        # @return [Fixnum]
        attr_accessor :negotiation_channel_id
      
        # Order ID of this inventory item.
        # Corresponds to the JSON property `orderId`
        # @return [Fixnum]
        attr_accessor :order_id
      
        # Placement strategy ID of this inventory item.
        # Corresponds to the JSON property `placementStrategyId`
        # @return [Fixnum]
        attr_accessor :placement_strategy_id
      
        # Pricing Information
        # Corresponds to the JSON property `pricing`
        # @return [Google::Apis::DfareportingV3_3::Pricing]
        attr_accessor :pricing
      
        # Project ID of this inventory item.
        # Corresponds to the JSON property `projectId`
        # @return [Fixnum]
        attr_accessor :project_id
      
        # RFP ID of this inventory item.
        # Corresponds to the JSON property `rfpId`
        # @return [Fixnum]
        attr_accessor :rfp_id
      
        # ID of the site this inventory item is associated with.
        # Corresponds to the JSON property `siteId`
        # @return [Fixnum]
        attr_accessor :site_id
      
        # Subaccount ID of this inventory item.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Type of inventory item.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @ad_slots = args[:ad_slots] if args.key?(:ad_slots)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @content_category_id = args[:content_category_id] if args.key?(:content_category_id)
          @estimated_click_through_rate = args[:estimated_click_through_rate] if args.key?(:estimated_click_through_rate)
          @estimated_conversion_rate = args[:estimated_conversion_rate] if args.key?(:estimated_conversion_rate)
          @id = args[:id] if args.key?(:id)
          @in_plan = args[:in_plan] if args.key?(:in_plan)
          @kind = args[:kind] if args.key?(:kind)
          @last_modified_info = args[:last_modified_info] if args.key?(:last_modified_info)
          @name = args[:name] if args.key?(:name)
          @negotiation_channel_id = args[:negotiation_channel_id] if args.key?(:negotiation_channel_id)
          @order_id = args[:order_id] if args.key?(:order_id)
          @placement_strategy_id = args[:placement_strategy_id] if args.key?(:placement_strategy_id)
          @pricing = args[:pricing] if args.key?(:pricing)
          @project_id = args[:project_id] if args.key?(:project_id)
          @rfp_id = args[:rfp_id] if args.key?(:rfp_id)
          @site_id = args[:site_id] if args.key?(:site_id)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Inventory item List Response
      class InventoryItemsListResponse
        include Google::Apis::Core::Hashable
      
        # Inventory item collection
        # Corresponds to the JSON property `inventoryItems`
        # @return [Array<Google::Apis::DfareportingV3_3::InventoryItem>]
        attr_accessor :inventory_items
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#inventoryItemsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @inventory_items = args[:inventory_items] if args.key?(:inventory_items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Key Value Targeting Expression.
      class KeyValueTargetingExpression
        include Google::Apis::Core::Hashable
      
        # Keyword expression being targeted by the ad.
        # Corresponds to the JSON property `expression`
        # @return [String]
        attr_accessor :expression
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expression = args[:expression] if args.key?(:expression)
        end
      end
      
      # Contains information about where a user's browser is taken after the user
      # clicks an ad.
      class LandingPage
        include Google::Apis::Core::Hashable
      
        # Advertiser ID of this landing page. This is a required field.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Whether this landing page has been archived.
        # Corresponds to the JSON property `archived`
        # @return [Boolean]
        attr_accessor :archived
        alias_method :archived?, :archived
      
        # Links that will direct the user to a mobile app, if installed.
        # Corresponds to the JSON property `deepLinks`
        # @return [Array<Google::Apis::DfareportingV3_3::DeepLink>]
        attr_accessor :deep_links
      
        # ID of this landing page. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#landingPage".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this landing page. This is a required field. It must be less than 256
        # characters long.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # URL of this landing page. This is a required field.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @archived = args[:archived] if args.key?(:archived)
          @deep_links = args[:deep_links] if args.key?(:deep_links)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Contains information about a language that can be targeted by ads.
      class Language
        include Google::Apis::Core::Hashable
      
        # Language ID of this language. This is the ID used for targeting and generating
        # reports.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#language".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Format of language code is an ISO 639 two-letter language code optionally
        # followed by an underscore followed by an ISO 3166 code. Examples are "en" for
        # English or "zh_CN" for Simplified Chinese.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        # Name of this language.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @language_code = args[:language_code] if args.key?(:language_code)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Language Targeting.
      class LanguageTargeting
        include Google::Apis::Core::Hashable
      
        # Languages that this ad targets. For each language only languageId is required.
        # The other fields are populated automatically when the ad is inserted or
        # updated.
        # Corresponds to the JSON property `languages`
        # @return [Array<Google::Apis::DfareportingV3_3::Language>]
        attr_accessor :languages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @languages = args[:languages] if args.key?(:languages)
        end
      end
      
      # Language List Response
      class LanguagesListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#languagesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Language collection.
        # Corresponds to the JSON property `languages`
        # @return [Array<Google::Apis::DfareportingV3_3::Language>]
        attr_accessor :languages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @languages = args[:languages] if args.key?(:languages)
        end
      end
      
      # Modification timestamp.
      class LastModifiedInfo
        include Google::Apis::Core::Hashable
      
        # Timestamp of the last change in milliseconds since epoch.
        # Corresponds to the JSON property `time`
        # @return [Fixnum]
        attr_accessor :time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @time = args[:time] if args.key?(:time)
        end
      end
      
      # A group clause made up of list population terms representing constraints
      # joined by ORs.
      class ListPopulationClause
        include Google::Apis::Core::Hashable
      
        # Terms of this list population clause. Each clause is made up of list
        # population terms representing constraints and are joined by ORs.
        # Corresponds to the JSON property `terms`
        # @return [Array<Google::Apis::DfareportingV3_3::ListPopulationTerm>]
        attr_accessor :terms
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @terms = args[:terms] if args.key?(:terms)
        end
      end
      
      # Remarketing List Population Rule.
      class ListPopulationRule
        include Google::Apis::Core::Hashable
      
        # Floodlight activity ID associated with this rule. This field can be left blank.
        # Corresponds to the JSON property `floodlightActivityId`
        # @return [Fixnum]
        attr_accessor :floodlight_activity_id
      
        # Name of floodlight activity associated with this rule. This is a read-only,
        # auto-generated field.
        # Corresponds to the JSON property `floodlightActivityName`
        # @return [String]
        attr_accessor :floodlight_activity_name
      
        # Clauses that make up this list population rule. Clauses are joined by ANDs,
        # and the clauses themselves are made up of list population terms which are
        # joined by ORs.
        # Corresponds to the JSON property `listPopulationClauses`
        # @return [Array<Google::Apis::DfareportingV3_3::ListPopulationClause>]
        attr_accessor :list_population_clauses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @floodlight_activity_id = args[:floodlight_activity_id] if args.key?(:floodlight_activity_id)
          @floodlight_activity_name = args[:floodlight_activity_name] if args.key?(:floodlight_activity_name)
          @list_population_clauses = args[:list_population_clauses] if args.key?(:list_population_clauses)
        end
      end
      
      # Remarketing List Population Rule Term.
      class ListPopulationTerm
        include Google::Apis::Core::Hashable
      
        # Will be true if the term should check if the user is in the list and false if
        # the term should check if the user is not in the list. This field is only
        # relevant when type is set to LIST_MEMBERSHIP_TERM. False by default.
        # Corresponds to the JSON property `contains`
        # @return [Boolean]
        attr_accessor :contains
        alias_method :contains?, :contains
      
        # Whether to negate the comparison result of this term during rule evaluation.
        # This field is only relevant when type is left unset or set to
        # CUSTOM_VARIABLE_TERM or REFERRER_TERM.
        # Corresponds to the JSON property `negation`
        # @return [Boolean]
        attr_accessor :negation
        alias_method :negation?, :negation
      
        # Comparison operator of this term. This field is only relevant when type is
        # left unset or set to CUSTOM_VARIABLE_TERM or REFERRER_TERM.
        # Corresponds to the JSON property `operator`
        # @return [String]
        attr_accessor :operator
      
        # ID of the list in question. This field is only relevant when type is set to
        # LIST_MEMBERSHIP_TERM.
        # Corresponds to the JSON property `remarketingListId`
        # @return [Fixnum]
        attr_accessor :remarketing_list_id
      
        # List population term type determines the applicable fields in this object. If
        # left unset or set to CUSTOM_VARIABLE_TERM, then variableName,
        # variableFriendlyName, operator, value, and negation are applicable. If set to
        # LIST_MEMBERSHIP_TERM then remarketingListId and contains are applicable. If
        # set to REFERRER_TERM then operator, value, and negation are applicable.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Literal to compare the variable to. This field is only relevant when type is
        # left unset or set to CUSTOM_VARIABLE_TERM or REFERRER_TERM.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        # Friendly name of this term's variable. This is a read-only, auto-generated
        # field. This field is only relevant when type is left unset or set to
        # CUSTOM_VARIABLE_TERM.
        # Corresponds to the JSON property `variableFriendlyName`
        # @return [String]
        attr_accessor :variable_friendly_name
      
        # Name of the variable (U1, U2, etc.) being compared in this term. This field is
        # only relevant when type is set to null, CUSTOM_VARIABLE_TERM or REFERRER_TERM.
        # Corresponds to the JSON property `variableName`
        # @return [String]
        attr_accessor :variable_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @contains = args[:contains] if args.key?(:contains)
          @negation = args[:negation] if args.key?(:negation)
          @operator = args[:operator] if args.key?(:operator)
          @remarketing_list_id = args[:remarketing_list_id] if args.key?(:remarketing_list_id)
          @type = args[:type] if args.key?(:type)
          @value = args[:value] if args.key?(:value)
          @variable_friendly_name = args[:variable_friendly_name] if args.key?(:variable_friendly_name)
          @variable_name = args[:variable_name] if args.key?(:variable_name)
        end
      end
      
      # Remarketing List Targeting Expression.
      class ListTargetingExpression
        include Google::Apis::Core::Hashable
      
        # Expression describing which lists are being targeted by the ad.
        # Corresponds to the JSON property `expression`
        # @return [String]
        attr_accessor :expression
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expression = args[:expression] if args.key?(:expression)
        end
      end
      
      # Lookback configuration settings.
      class LookbackConfiguration
        include Google::Apis::Core::Hashable
      
        # Lookback window, in days, from the last time a given user clicked on one of
        # your ads. If you enter 0, clicks will not be considered as triggering events
        # for floodlight tracking. If you leave this field blank, the default value for
        # your account will be used. Acceptable values are 0 to 90, inclusive.
        # Corresponds to the JSON property `clickDuration`
        # @return [Fixnum]
        attr_accessor :click_duration
      
        # Lookback window, in days, from the last time a given user viewed one of your
        # ads. If you enter 0, impressions will not be considered as triggering events
        # for floodlight tracking. If you leave this field blank, the default value for
        # your account will be used. Acceptable values are 0 to 90, inclusive.
        # Corresponds to the JSON property `postImpressionActivitiesDuration`
        # @return [Fixnum]
        attr_accessor :post_impression_activities_duration
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @click_duration = args[:click_duration] if args.key?(:click_duration)
          @post_impression_activities_duration = args[:post_impression_activities_duration] if args.key?(:post_impression_activities_duration)
        end
      end
      
      # Represents a metric.
      class Metric
        include Google::Apis::Core::Hashable
      
        # The kind of resource this is, in this case dfareporting#metric.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The metric name, e.g. dfa:impressions
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Contains information about a metro region that can be targeted by ads.
      class Metro
        include Google::Apis::Core::Hashable
      
        # Country code of the country to which this metro region belongs.
        # Corresponds to the JSON property `countryCode`
        # @return [String]
        attr_accessor :country_code
      
        # DART ID of the country to which this metro region belongs.
        # Corresponds to the JSON property `countryDartId`
        # @return [Fixnum]
        attr_accessor :country_dart_id
      
        # DART ID of this metro region.
        # Corresponds to the JSON property `dartId`
        # @return [Fixnum]
        attr_accessor :dart_id
      
        # DMA ID of this metro region. This is the ID used for targeting and generating
        # reports, and is equivalent to metro_code.
        # Corresponds to the JSON property `dmaId`
        # @return [Fixnum]
        attr_accessor :dma_id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#metro".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Metro code of this metro region. This is equivalent to dma_id.
        # Corresponds to the JSON property `metroCode`
        # @return [String]
        attr_accessor :metro_code
      
        # Name of this metro region.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @country_code = args[:country_code] if args.key?(:country_code)
          @country_dart_id = args[:country_dart_id] if args.key?(:country_dart_id)
          @dart_id = args[:dart_id] if args.key?(:dart_id)
          @dma_id = args[:dma_id] if args.key?(:dma_id)
          @kind = args[:kind] if args.key?(:kind)
          @metro_code = args[:metro_code] if args.key?(:metro_code)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Metro List Response
      class MetrosListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#metrosListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Metro collection.
        # Corresponds to the JSON property `metros`
        # @return [Array<Google::Apis::DfareportingV3_3::Metro>]
        attr_accessor :metros
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @metros = args[:metros] if args.key?(:metros)
        end
      end
      
      # Contains information about a mobile app. Used as a landing page deep link.
      class MobileApp
        include Google::Apis::Core::Hashable
      
        # Mobile app directory.
        # Corresponds to the JSON property `directory`
        # @return [String]
        attr_accessor :directory
      
        # ID of this mobile app.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#mobileApp".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Publisher name.
        # Corresponds to the JSON property `publisherName`
        # @return [String]
        attr_accessor :publisher_name
      
        # Title of this mobile app.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @directory = args[:directory] if args.key?(:directory)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @publisher_name = args[:publisher_name] if args.key?(:publisher_name)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Mobile app List Response
      class MobileAppsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#mobileAppsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Mobile apps collection.
        # Corresponds to the JSON property `mobileApps`
        # @return [Array<Google::Apis::DfareportingV3_3::MobileApp>]
        attr_accessor :mobile_apps
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @mobile_apps = args[:mobile_apps] if args.key?(:mobile_apps)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Contains information about a mobile carrier that can be targeted by ads.
      class MobileCarrier
        include Google::Apis::Core::Hashable
      
        # Country code of the country to which this mobile carrier belongs.
        # Corresponds to the JSON property `countryCode`
        # @return [String]
        attr_accessor :country_code
      
        # DART ID of the country to which this mobile carrier belongs.
        # Corresponds to the JSON property `countryDartId`
        # @return [Fixnum]
        attr_accessor :country_dart_id
      
        # ID of this mobile carrier.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#mobileCarrier".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this mobile carrier.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @country_code = args[:country_code] if args.key?(:country_code)
          @country_dart_id = args[:country_dart_id] if args.key?(:country_dart_id)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Mobile Carrier List Response
      class MobileCarriersListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#mobileCarriersListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Mobile carrier collection.
        # Corresponds to the JSON property `mobileCarriers`
        # @return [Array<Google::Apis::DfareportingV3_3::MobileCarrier>]
        attr_accessor :mobile_carriers
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @mobile_carriers = args[:mobile_carriers] if args.key?(:mobile_carriers)
        end
      end
      
      # Object Filter.
      class ObjectFilter
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#objectFilter".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Applicable when status is ASSIGNED. The user has access to objects with these
        # object IDs.
        # Corresponds to the JSON property `objectIds`
        # @return [Array<Fixnum>]
        attr_accessor :object_ids
      
        # Status of the filter. NONE means the user has access to none of the objects.
        # ALL means the user has access to all objects. ASSIGNED means the user has
        # access to the objects with IDs in the objectIds list.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @object_ids = args[:object_ids] if args.key?(:object_ids)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Offset Position.
      class OffsetPosition
        include Google::Apis::Core::Hashable
      
        # Offset distance from left side of an asset or a window.
        # Corresponds to the JSON property `left`
        # @return [Fixnum]
        attr_accessor :left
      
        # Offset distance from top side of an asset or a window.
        # Corresponds to the JSON property `top`
        # @return [Fixnum]
        attr_accessor :top
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @left = args[:left] if args.key?(:left)
          @top = args[:top] if args.key?(:top)
        end
      end
      
      # Omniture Integration Settings.
      class OmnitureSettings
        include Google::Apis::Core::Hashable
      
        # Whether placement cost data will be sent to Omniture. This property can be
        # enabled only if omnitureIntegrationEnabled is true.
        # Corresponds to the JSON property `omnitureCostDataEnabled`
        # @return [Boolean]
        attr_accessor :omniture_cost_data_enabled
        alias_method :omniture_cost_data_enabled?, :omniture_cost_data_enabled
      
        # Whether Omniture integration is enabled. This property can be enabled only
        # when the "Advanced Ad Serving" account setting is enabled.
        # Corresponds to the JSON property `omnitureIntegrationEnabled`
        # @return [Boolean]
        attr_accessor :omniture_integration_enabled
        alias_method :omniture_integration_enabled?, :omniture_integration_enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @omniture_cost_data_enabled = args[:omniture_cost_data_enabled] if args.key?(:omniture_cost_data_enabled)
          @omniture_integration_enabled = args[:omniture_integration_enabled] if args.key?(:omniture_integration_enabled)
        end
      end
      
      # Contains information about an operating system that can be targeted by ads.
      class OperatingSystem
        include Google::Apis::Core::Hashable
      
        # DART ID of this operating system. This is the ID used for targeting.
        # Corresponds to the JSON property `dartId`
        # @return [Fixnum]
        attr_accessor :dart_id
      
        # Whether this operating system is for desktop.
        # Corresponds to the JSON property `desktop`
        # @return [Boolean]
        attr_accessor :desktop
        alias_method :desktop?, :desktop
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#operatingSystem".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Whether this operating system is for mobile.
        # Corresponds to the JSON property `mobile`
        # @return [Boolean]
        attr_accessor :mobile
        alias_method :mobile?, :mobile
      
        # Name of this operating system.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dart_id = args[:dart_id] if args.key?(:dart_id)
          @desktop = args[:desktop] if args.key?(:desktop)
          @kind = args[:kind] if args.key?(:kind)
          @mobile = args[:mobile] if args.key?(:mobile)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Contains information about a particular version of an operating system that
      # can be targeted by ads.
      class OperatingSystemVersion
        include Google::Apis::Core::Hashable
      
        # ID of this operating system version.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#operatingSystemVersion".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Major version (leftmost number) of this operating system version.
        # Corresponds to the JSON property `majorVersion`
        # @return [String]
        attr_accessor :major_version
      
        # Minor version (number after the first dot) of this operating system version.
        # Corresponds to the JSON property `minorVersion`
        # @return [String]
        attr_accessor :minor_version
      
        # Name of this operating system version.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Contains information about an operating system that can be targeted by ads.
        # Corresponds to the JSON property `operatingSystem`
        # @return [Google::Apis::DfareportingV3_3::OperatingSystem]
        attr_accessor :operating_system
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @major_version = args[:major_version] if args.key?(:major_version)
          @minor_version = args[:minor_version] if args.key?(:minor_version)
          @name = args[:name] if args.key?(:name)
          @operating_system = args[:operating_system] if args.key?(:operating_system)
        end
      end
      
      # Operating System Version List Response
      class OperatingSystemVersionsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#operatingSystemVersionsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Operating system version collection.
        # Corresponds to the JSON property `operatingSystemVersions`
        # @return [Array<Google::Apis::DfareportingV3_3::OperatingSystemVersion>]
        attr_accessor :operating_system_versions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @operating_system_versions = args[:operating_system_versions] if args.key?(:operating_system_versions)
        end
      end
      
      # Operating System List Response
      class OperatingSystemsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#operatingSystemsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Operating system collection.
        # Corresponds to the JSON property `operatingSystems`
        # @return [Array<Google::Apis::DfareportingV3_3::OperatingSystem>]
        attr_accessor :operating_systems
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @operating_systems = args[:operating_systems] if args.key?(:operating_systems)
        end
      end
      
      # Creative optimization activity.
      class OptimizationActivity
        include Google::Apis::Core::Hashable
      
        # Floodlight activity ID of this optimization activity. This is a required field.
        # Corresponds to the JSON property `floodlightActivityId`
        # @return [Fixnum]
        attr_accessor :floodlight_activity_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `floodlightActivityIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :floodlight_activity_id_dimension_value
      
        # Weight associated with this optimization. The weight assigned will be
        # understood in proportion to the weights assigned to the other optimization
        # activities. Value must be greater than or equal to 1.
        # Corresponds to the JSON property `weight`
        # @return [Fixnum]
        attr_accessor :weight
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @floodlight_activity_id = args[:floodlight_activity_id] if args.key?(:floodlight_activity_id)
          @floodlight_activity_id_dimension_value = args[:floodlight_activity_id_dimension_value] if args.key?(:floodlight_activity_id_dimension_value)
          @weight = args[:weight] if args.key?(:weight)
        end
      end
      
      # Describes properties of a Planning order.
      class Order
        include Google::Apis::Core::Hashable
      
        # Account ID of this order.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Advertiser ID of this order.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # IDs for users that have to approve documents created for this order.
        # Corresponds to the JSON property `approverUserProfileIds`
        # @return [Array<Fixnum>]
        attr_accessor :approver_user_profile_ids
      
        # Buyer invoice ID associated with this order.
        # Corresponds to the JSON property `buyerInvoiceId`
        # @return [String]
        attr_accessor :buyer_invoice_id
      
        # Name of the buyer organization.
        # Corresponds to the JSON property `buyerOrganizationName`
        # @return [String]
        attr_accessor :buyer_organization_name
      
        # Comments in this order.
        # Corresponds to the JSON property `comments`
        # @return [String]
        attr_accessor :comments
      
        # Contacts for this order.
        # Corresponds to the JSON property `contacts`
        # @return [Array<Google::Apis::DfareportingV3_3::OrderContact>]
        attr_accessor :contacts
      
        # ID of this order. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#order".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Modification timestamp.
        # Corresponds to the JSON property `lastModifiedInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :last_modified_info
      
        # Name of this order.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Notes of this order.
        # Corresponds to the JSON property `notes`
        # @return [String]
        attr_accessor :notes
      
        # ID of the terms and conditions template used in this order.
        # Corresponds to the JSON property `planningTermId`
        # @return [Fixnum]
        attr_accessor :planning_term_id
      
        # Project ID of this order.
        # Corresponds to the JSON property `projectId`
        # @return [Fixnum]
        attr_accessor :project_id
      
        # Seller order ID associated with this order.
        # Corresponds to the JSON property `sellerOrderId`
        # @return [String]
        attr_accessor :seller_order_id
      
        # Name of the seller organization.
        # Corresponds to the JSON property `sellerOrganizationName`
        # @return [String]
        attr_accessor :seller_organization_name
      
        # Site IDs this order is associated with.
        # Corresponds to the JSON property `siteId`
        # @return [Array<Fixnum>]
        attr_accessor :site_id
      
        # Free-form site names this order is associated with.
        # Corresponds to the JSON property `siteNames`
        # @return [Array<String>]
        attr_accessor :site_names
      
        # Subaccount ID of this order.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Terms and conditions of this order.
        # Corresponds to the JSON property `termsAndConditions`
        # @return [String]
        attr_accessor :terms_and_conditions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @approver_user_profile_ids = args[:approver_user_profile_ids] if args.key?(:approver_user_profile_ids)
          @buyer_invoice_id = args[:buyer_invoice_id] if args.key?(:buyer_invoice_id)
          @buyer_organization_name = args[:buyer_organization_name] if args.key?(:buyer_organization_name)
          @comments = args[:comments] if args.key?(:comments)
          @contacts = args[:contacts] if args.key?(:contacts)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @last_modified_info = args[:last_modified_info] if args.key?(:last_modified_info)
          @name = args[:name] if args.key?(:name)
          @notes = args[:notes] if args.key?(:notes)
          @planning_term_id = args[:planning_term_id] if args.key?(:planning_term_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @seller_order_id = args[:seller_order_id] if args.key?(:seller_order_id)
          @seller_organization_name = args[:seller_organization_name] if args.key?(:seller_organization_name)
          @site_id = args[:site_id] if args.key?(:site_id)
          @site_names = args[:site_names] if args.key?(:site_names)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @terms_and_conditions = args[:terms_and_conditions] if args.key?(:terms_and_conditions)
        end
      end
      
      # Contact of an order.
      class OrderContact
        include Google::Apis::Core::Hashable
      
        # Free-form information about this contact. It could be any information related
        # to this contact in addition to type, title, name, and signature user profile
        # ID.
        # Corresponds to the JSON property `contactInfo`
        # @return [String]
        attr_accessor :contact_info
      
        # Name of this contact.
        # Corresponds to the JSON property `contactName`
        # @return [String]
        attr_accessor :contact_name
      
        # Title of this contact.
        # Corresponds to the JSON property `contactTitle`
        # @return [String]
        attr_accessor :contact_title
      
        # Type of this contact.
        # Corresponds to the JSON property `contactType`
        # @return [String]
        attr_accessor :contact_type
      
        # ID of the user profile containing the signature that will be embedded into
        # order documents.
        # Corresponds to the JSON property `signatureUserProfileId`
        # @return [Fixnum]
        attr_accessor :signature_user_profile_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @contact_info = args[:contact_info] if args.key?(:contact_info)
          @contact_name = args[:contact_name] if args.key?(:contact_name)
          @contact_title = args[:contact_title] if args.key?(:contact_title)
          @contact_type = args[:contact_type] if args.key?(:contact_type)
          @signature_user_profile_id = args[:signature_user_profile_id] if args.key?(:signature_user_profile_id)
        end
      end
      
      # Contains properties of a Planning order document.
      class OrderDocument
        include Google::Apis::Core::Hashable
      
        # Account ID of this order document.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Advertiser ID of this order document.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # The amended order document ID of this order document. An order document can be
        # created by optionally amending another order document so that the change
        # history can be preserved.
        # Corresponds to the JSON property `amendedOrderDocumentId`
        # @return [Fixnum]
        attr_accessor :amended_order_document_id
      
        # IDs of users who have approved this order document.
        # Corresponds to the JSON property `approvedByUserProfileIds`
        # @return [Array<Fixnum>]
        attr_accessor :approved_by_user_profile_ids
      
        # Whether this order document is cancelled.
        # Corresponds to the JSON property `cancelled`
        # @return [Boolean]
        attr_accessor :cancelled
        alias_method :cancelled?, :cancelled
      
        # Modification timestamp.
        # Corresponds to the JSON property `createdInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :created_info
      
        # Effective date of this order document.
        # Corresponds to the JSON property `effectiveDate`
        # @return [Date]
        attr_accessor :effective_date
      
        # ID of this order document.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#orderDocument".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # List of email addresses that received the last sent document.
        # Corresponds to the JSON property `lastSentRecipients`
        # @return [Array<String>]
        attr_accessor :last_sent_recipients
      
        # Timestamp of the last email sent with this order document.
        # Corresponds to the JSON property `lastSentTime`
        # @return [DateTime]
        attr_accessor :last_sent_time
      
        # ID of the order from which this order document is created.
        # Corresponds to the JSON property `orderId`
        # @return [Fixnum]
        attr_accessor :order_id
      
        # Project ID of this order document.
        # Corresponds to the JSON property `projectId`
        # @return [Fixnum]
        attr_accessor :project_id
      
        # Whether this order document has been signed.
        # Corresponds to the JSON property `signed`
        # @return [Boolean]
        attr_accessor :signed
        alias_method :signed?, :signed
      
        # Subaccount ID of this order document.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Title of this order document.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Type of this order document
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @amended_order_document_id = args[:amended_order_document_id] if args.key?(:amended_order_document_id)
          @approved_by_user_profile_ids = args[:approved_by_user_profile_ids] if args.key?(:approved_by_user_profile_ids)
          @cancelled = args[:cancelled] if args.key?(:cancelled)
          @created_info = args[:created_info] if args.key?(:created_info)
          @effective_date = args[:effective_date] if args.key?(:effective_date)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @last_sent_recipients = args[:last_sent_recipients] if args.key?(:last_sent_recipients)
          @last_sent_time = args[:last_sent_time] if args.key?(:last_sent_time)
          @order_id = args[:order_id] if args.key?(:order_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @signed = args[:signed] if args.key?(:signed)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @title = args[:title] if args.key?(:title)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Order document List Response
      class OrderDocumentsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#orderDocumentsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Order document collection
        # Corresponds to the JSON property `orderDocuments`
        # @return [Array<Google::Apis::DfareportingV3_3::OrderDocument>]
        attr_accessor :order_documents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @order_documents = args[:order_documents] if args.key?(:order_documents)
        end
      end
      
      # Order List Response
      class OrdersListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#ordersListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Order collection.
        # Corresponds to the JSON property `orders`
        # @return [Array<Google::Apis::DfareportingV3_3::Order>]
        attr_accessor :orders
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @orders = args[:orders] if args.key?(:orders)
        end
      end
      
      # Represents fields that are compatible to be selected for a report of type "
      # PATH_TO_CONVERSION".
      class PathToConversionReportCompatibleFields
        include Google::Apis::Core::Hashable
      
        # Conversion dimensions which are compatible to be selected in the "
        # conversionDimensions" section of the report.
        # Corresponds to the JSON property `conversionDimensions`
        # @return [Array<Google::Apis::DfareportingV3_3::Dimension>]
        attr_accessor :conversion_dimensions
      
        # Custom floodlight variables which are compatible to be selected in the "
        # customFloodlightVariables" section of the report.
        # Corresponds to the JSON property `customFloodlightVariables`
        # @return [Array<Google::Apis::DfareportingV3_3::Dimension>]
        attr_accessor :custom_floodlight_variables
      
        # The kind of resource this is, in this case dfareporting#
        # pathToConversionReportCompatibleFields.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Metrics which are compatible to be selected in the "metricNames" section of
        # the report.
        # Corresponds to the JSON property `metrics`
        # @return [Array<Google::Apis::DfareportingV3_3::Metric>]
        attr_accessor :metrics
      
        # Per-interaction dimensions which are compatible to be selected in the "
        # perInteractionDimensions" section of the report.
        # Corresponds to the JSON property `perInteractionDimensions`
        # @return [Array<Google::Apis::DfareportingV3_3::Dimension>]
        attr_accessor :per_interaction_dimensions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @conversion_dimensions = args[:conversion_dimensions] if args.key?(:conversion_dimensions)
          @custom_floodlight_variables = args[:custom_floodlight_variables] if args.key?(:custom_floodlight_variables)
          @kind = args[:kind] if args.key?(:kind)
          @metrics = args[:metrics] if args.key?(:metrics)
          @per_interaction_dimensions = args[:per_interaction_dimensions] if args.key?(:per_interaction_dimensions)
        end
      end
      
      # Contains properties of a placement.
      class Placement
        include Google::Apis::Core::Hashable
      
        # Account ID of this placement. This field can be left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Whether this placement opts out of ad blocking. When true, ad blocking is
        # disabled for this placement. When false, the campaign and site settings take
        # effect.
        # Corresponds to the JSON property `adBlockingOptOut`
        # @return [Boolean]
        attr_accessor :ad_blocking_opt_out
        alias_method :ad_blocking_opt_out?, :ad_blocking_opt_out
      
        # Additional sizes associated with this placement. When inserting or updating a
        # placement, only the size ID field is used.
        # Corresponds to the JSON property `additionalSizes`
        # @return [Array<Google::Apis::DfareportingV3_3::Size>]
        attr_accessor :additional_sizes
      
        # Advertiser ID of this placement. This field can be left blank.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `advertiserIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :advertiser_id_dimension_value
      
        # Whether this placement is archived.
        # Corresponds to the JSON property `archived`
        # @return [Boolean]
        attr_accessor :archived
        alias_method :archived?, :archived
      
        # Campaign ID of this placement. This field is a required field on insertion.
        # Corresponds to the JSON property `campaignId`
        # @return [Fixnum]
        attr_accessor :campaign_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `campaignIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :campaign_id_dimension_value
      
        # Comments for this placement.
        # Corresponds to the JSON property `comment`
        # @return [String]
        attr_accessor :comment
      
        # Placement compatibility. DISPLAY and DISPLAY_INTERSTITIAL refer to rendering
        # on desktop, on mobile devices or in mobile apps for regular or interstitial
        # ads respectively. APP and APP_INTERSTITIAL are no longer allowed for new
        # placement insertions. Instead, use DISPLAY or DISPLAY_INTERSTITIAL.
        # IN_STREAM_VIDEO refers to rendering in in-stream video ads developed with the
        # VAST standard. This field is required on insertion.
        # Corresponds to the JSON property `compatibility`
        # @return [String]
        attr_accessor :compatibility
      
        # ID of the content category assigned to this placement.
        # Corresponds to the JSON property `contentCategoryId`
        # @return [Fixnum]
        attr_accessor :content_category_id
      
        # Modification timestamp.
        # Corresponds to the JSON property `createInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :create_info
      
        # Directory site ID of this placement. On insert, you must set either this field
        # or the siteId field to specify the site associated with this placement. This
        # is a required field that is read-only after insertion.
        # Corresponds to the JSON property `directorySiteId`
        # @return [Fixnum]
        attr_accessor :directory_site_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `directorySiteIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :directory_site_id_dimension_value
      
        # External ID for this placement.
        # Corresponds to the JSON property `externalId`
        # @return [String]
        attr_accessor :external_id
      
        # ID of this placement. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `idDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :id_dimension_value
      
        # Key name of this placement. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `keyName`
        # @return [String]
        attr_accessor :key_name
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#placement".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Modification timestamp.
        # Corresponds to the JSON property `lastModifiedInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :last_modified_info
      
        # Lookback configuration settings.
        # Corresponds to the JSON property `lookbackConfiguration`
        # @return [Google::Apis::DfareportingV3_3::LookbackConfiguration]
        attr_accessor :lookback_configuration
      
        # Name of this placement.This is a required field and must be less than 256
        # characters long.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Whether payment was approved for this placement. This is a read-only field
        # relevant only to publisher-paid placements.
        # Corresponds to the JSON property `paymentApproved`
        # @return [Boolean]
        attr_accessor :payment_approved
        alias_method :payment_approved?, :payment_approved
      
        # Payment source for this placement. This is a required field that is read-only
        # after insertion.
        # Corresponds to the JSON property `paymentSource`
        # @return [String]
        attr_accessor :payment_source
      
        # ID of this placement's group, if applicable.
        # Corresponds to the JSON property `placementGroupId`
        # @return [Fixnum]
        attr_accessor :placement_group_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `placementGroupIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :placement_group_id_dimension_value
      
        # ID of the placement strategy assigned to this placement.
        # Corresponds to the JSON property `placementStrategyId`
        # @return [Fixnum]
        attr_accessor :placement_strategy_id
      
        # Pricing Schedule
        # Corresponds to the JSON property `pricingSchedule`
        # @return [Google::Apis::DfareportingV3_3::PricingSchedule]
        attr_accessor :pricing_schedule
      
        # Whether this placement is the primary placement of a roadblock (placement
        # group). You cannot change this field from true to false. Setting this field to
        # true will automatically set the primary field on the original primary
        # placement of the roadblock to false, and it will automatically set the
        # roadblock's primaryPlacementId field to the ID of this placement.
        # Corresponds to the JSON property `primary`
        # @return [Boolean]
        attr_accessor :primary
        alias_method :primary?, :primary
      
        # Modification timestamp.
        # Corresponds to the JSON property `publisherUpdateInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :publisher_update_info
      
        # Site ID associated with this placement. On insert, you must set either this
        # field or the directorySiteId field to specify the site associated with this
        # placement. This is a required field that is read-only after insertion.
        # Corresponds to the JSON property `siteId`
        # @return [Fixnum]
        attr_accessor :site_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `siteIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :site_id_dimension_value
      
        # Represents the dimensions of ads, placements, creatives, or creative assets.
        # Corresponds to the JSON property `size`
        # @return [Google::Apis::DfareportingV3_3::Size]
        attr_accessor :size
      
        # Whether creatives assigned to this placement must be SSL-compliant.
        # Corresponds to the JSON property `sslRequired`
        # @return [Boolean]
        attr_accessor :ssl_required
        alias_method :ssl_required?, :ssl_required
      
        # Third-party placement status.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # Subaccount ID of this placement. This field can be left blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Tag formats to generate for this placement. This field is required on
        # insertion.
        # Acceptable values are:
        # - "PLACEMENT_TAG_STANDARD"
        # - "PLACEMENT_TAG_IFRAME_JAVASCRIPT"
        # - "PLACEMENT_TAG_IFRAME_ILAYER"
        # - "PLACEMENT_TAG_INTERNAL_REDIRECT"
        # - "PLACEMENT_TAG_JAVASCRIPT"
        # - "PLACEMENT_TAG_INTERSTITIAL_IFRAME_JAVASCRIPT"
        # - "PLACEMENT_TAG_INTERSTITIAL_INTERNAL_REDIRECT"
        # - "PLACEMENT_TAG_INTERSTITIAL_JAVASCRIPT"
        # - "PLACEMENT_TAG_CLICK_COMMANDS"
        # - "PLACEMENT_TAG_INSTREAM_VIDEO_PREFETCH"
        # - "PLACEMENT_TAG_INSTREAM_VIDEO_PREFETCH_VAST_3"
        # - "PLACEMENT_TAG_INSTREAM_VIDEO_PREFETCH_VAST_4"
        # - "PLACEMENT_TAG_TRACKING"
        # - "PLACEMENT_TAG_TRACKING_IFRAME"
        # - "PLACEMENT_TAG_TRACKING_JAVASCRIPT"
        # Corresponds to the JSON property `tagFormats`
        # @return [Array<String>]
        attr_accessor :tag_formats
      
        # Tag Settings
        # Corresponds to the JSON property `tagSetting`
        # @return [Google::Apis::DfareportingV3_3::TagSetting]
        attr_accessor :tag_setting
      
        # Whether Verification and ActiveView are disabled for in-stream video creatives
        # for this placement. The same setting videoActiveViewOptOut exists on the site
        # level -- the opt out occurs if either of these settings are true. These
        # settings are distinct from DirectorySites.settings.activeViewOptOut or Sites.
        # siteSettings.activeViewOptOut which only apply to display ads. However,
        # Accounts.activeViewOptOut opts out both video traffic, as well as display ads,
        # from Verification and ActiveView.
        # Corresponds to the JSON property `videoActiveViewOptOut`
        # @return [Boolean]
        attr_accessor :video_active_view_opt_out
        alias_method :video_active_view_opt_out?, :video_active_view_opt_out
      
        # Video Settings
        # Corresponds to the JSON property `videoSettings`
        # @return [Google::Apis::DfareportingV3_3::VideoSettings]
        attr_accessor :video_settings
      
        # VPAID adapter setting for this placement. Controls which VPAID format the
        # measurement adapter will use for in-stream video creatives assigned to this
        # placement.
        # Note: Flash is no longer supported. This field now defaults to HTML5 when the
        # following values are provided: FLASH, BOTH.
        # Corresponds to the JSON property `vpaidAdapterChoice`
        # @return [String]
        attr_accessor :vpaid_adapter_choice
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @ad_blocking_opt_out = args[:ad_blocking_opt_out] if args.key?(:ad_blocking_opt_out)
          @additional_sizes = args[:additional_sizes] if args.key?(:additional_sizes)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_id_dimension_value = args[:advertiser_id_dimension_value] if args.key?(:advertiser_id_dimension_value)
          @archived = args[:archived] if args.key?(:archived)
          @campaign_id = args[:campaign_id] if args.key?(:campaign_id)
          @campaign_id_dimension_value = args[:campaign_id_dimension_value] if args.key?(:campaign_id_dimension_value)
          @comment = args[:comment] if args.key?(:comment)
          @compatibility = args[:compatibility] if args.key?(:compatibility)
          @content_category_id = args[:content_category_id] if args.key?(:content_category_id)
          @create_info = args[:create_info] if args.key?(:create_info)
          @directory_site_id = args[:directory_site_id] if args.key?(:directory_site_id)
          @directory_site_id_dimension_value = args[:directory_site_id_dimension_value] if args.key?(:directory_site_id_dimension_value)
          @external_id = args[:external_id] if args.key?(:external_id)
          @id = args[:id] if args.key?(:id)
          @id_dimension_value = args[:id_dimension_value] if args.key?(:id_dimension_value)
          @key_name = args[:key_name] if args.key?(:key_name)
          @kind = args[:kind] if args.key?(:kind)
          @last_modified_info = args[:last_modified_info] if args.key?(:last_modified_info)
          @lookback_configuration = args[:lookback_configuration] if args.key?(:lookback_configuration)
          @name = args[:name] if args.key?(:name)
          @payment_approved = args[:payment_approved] if args.key?(:payment_approved)
          @payment_source = args[:payment_source] if args.key?(:payment_source)
          @placement_group_id = args[:placement_group_id] if args.key?(:placement_group_id)
          @placement_group_id_dimension_value = args[:placement_group_id_dimension_value] if args.key?(:placement_group_id_dimension_value)
          @placement_strategy_id = args[:placement_strategy_id] if args.key?(:placement_strategy_id)
          @pricing_schedule = args[:pricing_schedule] if args.key?(:pricing_schedule)
          @primary = args[:primary] if args.key?(:primary)
          @publisher_update_info = args[:publisher_update_info] if args.key?(:publisher_update_info)
          @site_id = args[:site_id] if args.key?(:site_id)
          @site_id_dimension_value = args[:site_id_dimension_value] if args.key?(:site_id_dimension_value)
          @size = args[:size] if args.key?(:size)
          @ssl_required = args[:ssl_required] if args.key?(:ssl_required)
          @status = args[:status] if args.key?(:status)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @tag_formats = args[:tag_formats] if args.key?(:tag_formats)
          @tag_setting = args[:tag_setting] if args.key?(:tag_setting)
          @video_active_view_opt_out = args[:video_active_view_opt_out] if args.key?(:video_active_view_opt_out)
          @video_settings = args[:video_settings] if args.key?(:video_settings)
          @vpaid_adapter_choice = args[:vpaid_adapter_choice] if args.key?(:vpaid_adapter_choice)
        end
      end
      
      # Placement Assignment.
      class PlacementAssignment
        include Google::Apis::Core::Hashable
      
        # Whether this placement assignment is active. When true, the placement will be
        # included in the ad's rotation.
        # Corresponds to the JSON property `active`
        # @return [Boolean]
        attr_accessor :active
        alias_method :active?, :active
      
        # ID of the placement to be assigned. This is a required field.
        # Corresponds to the JSON property `placementId`
        # @return [Fixnum]
        attr_accessor :placement_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `placementIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :placement_id_dimension_value
      
        # Whether the placement to be assigned requires SSL. This is a read-only field
        # that is auto-generated when the ad is inserted or updated.
        # Corresponds to the JSON property `sslRequired`
        # @return [Boolean]
        attr_accessor :ssl_required
        alias_method :ssl_required?, :ssl_required
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @active = args[:active] if args.key?(:active)
          @placement_id = args[:placement_id] if args.key?(:placement_id)
          @placement_id_dimension_value = args[:placement_id_dimension_value] if args.key?(:placement_id_dimension_value)
          @ssl_required = args[:ssl_required] if args.key?(:ssl_required)
        end
      end
      
      # Contains properties of a package or roadblock.
      class PlacementGroup
        include Google::Apis::Core::Hashable
      
        # Account ID of this placement group. This is a read-only field that can be left
        # blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Advertiser ID of this placement group. This is a required field on insertion.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `advertiserIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :advertiser_id_dimension_value
      
        # Whether this placement group is archived.
        # Corresponds to the JSON property `archived`
        # @return [Boolean]
        attr_accessor :archived
        alias_method :archived?, :archived
      
        # Campaign ID of this placement group. This field is required on insertion.
        # Corresponds to the JSON property `campaignId`
        # @return [Fixnum]
        attr_accessor :campaign_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `campaignIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :campaign_id_dimension_value
      
        # IDs of placements which are assigned to this placement group. This is a read-
        # only, auto-generated field.
        # Corresponds to the JSON property `childPlacementIds`
        # @return [Array<Fixnum>]
        attr_accessor :child_placement_ids
      
        # Comments for this placement group.
        # Corresponds to the JSON property `comment`
        # @return [String]
        attr_accessor :comment
      
        # ID of the content category assigned to this placement group.
        # Corresponds to the JSON property `contentCategoryId`
        # @return [Fixnum]
        attr_accessor :content_category_id
      
        # Modification timestamp.
        # Corresponds to the JSON property `createInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :create_info
      
        # Directory site ID associated with this placement group. On insert, you must
        # set either this field or the site_id field to specify the site associated with
        # this placement group. This is a required field that is read-only after
        # insertion.
        # Corresponds to the JSON property `directorySiteId`
        # @return [Fixnum]
        attr_accessor :directory_site_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `directorySiteIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :directory_site_id_dimension_value
      
        # External ID for this placement.
        # Corresponds to the JSON property `externalId`
        # @return [String]
        attr_accessor :external_id
      
        # ID of this placement group. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `idDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :id_dimension_value
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#placementGroup".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Modification timestamp.
        # Corresponds to the JSON property `lastModifiedInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :last_modified_info
      
        # Name of this placement group. This is a required field and must be less than
        # 256 characters long.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Type of this placement group. A package is a simple group of placements that
        # acts as a single pricing point for a group of tags. A roadblock is a group of
        # placements that not only acts as a single pricing point, but also assumes that
        # all the tags in it will be served at the same time. A roadblock requires one
        # of its assigned placements to be marked as primary for reporting. This field
        # is required on insertion.
        # Corresponds to the JSON property `placementGroupType`
        # @return [String]
        attr_accessor :placement_group_type
      
        # ID of the placement strategy assigned to this placement group.
        # Corresponds to the JSON property `placementStrategyId`
        # @return [Fixnum]
        attr_accessor :placement_strategy_id
      
        # Pricing Schedule
        # Corresponds to the JSON property `pricingSchedule`
        # @return [Google::Apis::DfareportingV3_3::PricingSchedule]
        attr_accessor :pricing_schedule
      
        # ID of the primary placement, used to calculate the media cost of a roadblock (
        # placement group). Modifying this field will automatically modify the primary
        # field on all affected roadblock child placements.
        # Corresponds to the JSON property `primaryPlacementId`
        # @return [Fixnum]
        attr_accessor :primary_placement_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `primaryPlacementIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :primary_placement_id_dimension_value
      
        # Site ID associated with this placement group. On insert, you must set either
        # this field or the directorySiteId field to specify the site associated with
        # this placement group. This is a required field that is read-only after
        # insertion.
        # Corresponds to the JSON property `siteId`
        # @return [Fixnum]
        attr_accessor :site_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `siteIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :site_id_dimension_value
      
        # Subaccount ID of this placement group. This is a read-only field that can be
        # left blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_id_dimension_value = args[:advertiser_id_dimension_value] if args.key?(:advertiser_id_dimension_value)
          @archived = args[:archived] if args.key?(:archived)
          @campaign_id = args[:campaign_id] if args.key?(:campaign_id)
          @campaign_id_dimension_value = args[:campaign_id_dimension_value] if args.key?(:campaign_id_dimension_value)
          @child_placement_ids = args[:child_placement_ids] if args.key?(:child_placement_ids)
          @comment = args[:comment] if args.key?(:comment)
          @content_category_id = args[:content_category_id] if args.key?(:content_category_id)
          @create_info = args[:create_info] if args.key?(:create_info)
          @directory_site_id = args[:directory_site_id] if args.key?(:directory_site_id)
          @directory_site_id_dimension_value = args[:directory_site_id_dimension_value] if args.key?(:directory_site_id_dimension_value)
          @external_id = args[:external_id] if args.key?(:external_id)
          @id = args[:id] if args.key?(:id)
          @id_dimension_value = args[:id_dimension_value] if args.key?(:id_dimension_value)
          @kind = args[:kind] if args.key?(:kind)
          @last_modified_info = args[:last_modified_info] if args.key?(:last_modified_info)
          @name = args[:name] if args.key?(:name)
          @placement_group_type = args[:placement_group_type] if args.key?(:placement_group_type)
          @placement_strategy_id = args[:placement_strategy_id] if args.key?(:placement_strategy_id)
          @pricing_schedule = args[:pricing_schedule] if args.key?(:pricing_schedule)
          @primary_placement_id = args[:primary_placement_id] if args.key?(:primary_placement_id)
          @primary_placement_id_dimension_value = args[:primary_placement_id_dimension_value] if args.key?(:primary_placement_id_dimension_value)
          @site_id = args[:site_id] if args.key?(:site_id)
          @site_id_dimension_value = args[:site_id_dimension_value] if args.key?(:site_id_dimension_value)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
        end
      end
      
      # Placement Group List Response
      class PlacementGroupsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#placementGroupsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Placement group collection.
        # Corresponds to the JSON property `placementGroups`
        # @return [Array<Google::Apis::DfareportingV3_3::PlacementGroup>]
        attr_accessor :placement_groups
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @placement_groups = args[:placement_groups] if args.key?(:placement_groups)
        end
      end
      
      # Placement Strategy List Response
      class PlacementStrategiesListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#placementStrategiesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Placement strategy collection.
        # Corresponds to the JSON property `placementStrategies`
        # @return [Array<Google::Apis::DfareportingV3_3::PlacementStrategy>]
        attr_accessor :placement_strategies
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @placement_strategies = args[:placement_strategies] if args.key?(:placement_strategies)
        end
      end
      
      # Contains properties of a placement strategy.
      class PlacementStrategy
        include Google::Apis::Core::Hashable
      
        # Account ID of this placement strategy.This is a read-only field that can be
        # left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # ID of this placement strategy. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#placementStrategy".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this placement strategy. This is a required field. It must be less
        # than 256 characters long and unique among placement strategies of the same
        # account.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Placement Tag
      class PlacementTag
        include Google::Apis::Core::Hashable
      
        # Placement ID
        # Corresponds to the JSON property `placementId`
        # @return [Fixnum]
        attr_accessor :placement_id
      
        # Tags generated for this placement.
        # Corresponds to the JSON property `tagDatas`
        # @return [Array<Google::Apis::DfareportingV3_3::TagData>]
        attr_accessor :tag_datas
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @placement_id = args[:placement_id] if args.key?(:placement_id)
          @tag_datas = args[:tag_datas] if args.key?(:tag_datas)
        end
      end
      
      # Placement GenerateTags Response
      class PlacementsGenerateTagsResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#placementsGenerateTagsResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Set of generated tags for the specified placements.
        # Corresponds to the JSON property `placementTags`
        # @return [Array<Google::Apis::DfareportingV3_3::PlacementTag>]
        attr_accessor :placement_tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @placement_tags = args[:placement_tags] if args.key?(:placement_tags)
        end
      end
      
      # Placement List Response
      class PlacementsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#placementsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Placement collection.
        # Corresponds to the JSON property `placements`
        # @return [Array<Google::Apis::DfareportingV3_3::Placement>]
        attr_accessor :placements
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @placements = args[:placements] if args.key?(:placements)
        end
      end
      
      # Contains information about a platform type that can be targeted by ads.
      class PlatformType
        include Google::Apis::Core::Hashable
      
        # ID of this platform type.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#platformType".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this platform type.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Platform Type List Response
      class PlatformTypesListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#platformTypesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Platform type collection.
        # Corresponds to the JSON property `platformTypes`
        # @return [Array<Google::Apis::DfareportingV3_3::PlatformType>]
        attr_accessor :platform_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @platform_types = args[:platform_types] if args.key?(:platform_types)
        end
      end
      
      # Popup Window Properties.
      class PopupWindowProperties
        include Google::Apis::Core::Hashable
      
        # Represents the dimensions of ads, placements, creatives, or creative assets.
        # Corresponds to the JSON property `dimension`
        # @return [Google::Apis::DfareportingV3_3::Size]
        attr_accessor :dimension
      
        # Offset Position.
        # Corresponds to the JSON property `offset`
        # @return [Google::Apis::DfareportingV3_3::OffsetPosition]
        attr_accessor :offset
      
        # Popup window position either centered or at specific coordinate.
        # Corresponds to the JSON property `positionType`
        # @return [String]
        attr_accessor :position_type
      
        # Whether to display the browser address bar.
        # Corresponds to the JSON property `showAddressBar`
        # @return [Boolean]
        attr_accessor :show_address_bar
        alias_method :show_address_bar?, :show_address_bar
      
        # Whether to display the browser menu bar.
        # Corresponds to the JSON property `showMenuBar`
        # @return [Boolean]
        attr_accessor :show_menu_bar
        alias_method :show_menu_bar?, :show_menu_bar
      
        # Whether to display the browser scroll bar.
        # Corresponds to the JSON property `showScrollBar`
        # @return [Boolean]
        attr_accessor :show_scroll_bar
        alias_method :show_scroll_bar?, :show_scroll_bar
      
        # Whether to display the browser status bar.
        # Corresponds to the JSON property `showStatusBar`
        # @return [Boolean]
        attr_accessor :show_status_bar
        alias_method :show_status_bar?, :show_status_bar
      
        # Whether to display the browser tool bar.
        # Corresponds to the JSON property `showToolBar`
        # @return [Boolean]
        attr_accessor :show_tool_bar
        alias_method :show_tool_bar?, :show_tool_bar
      
        # Title of popup window.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dimension = args[:dimension] if args.key?(:dimension)
          @offset = args[:offset] if args.key?(:offset)
          @position_type = args[:position_type] if args.key?(:position_type)
          @show_address_bar = args[:show_address_bar] if args.key?(:show_address_bar)
          @show_menu_bar = args[:show_menu_bar] if args.key?(:show_menu_bar)
          @show_scroll_bar = args[:show_scroll_bar] if args.key?(:show_scroll_bar)
          @show_status_bar = args[:show_status_bar] if args.key?(:show_status_bar)
          @show_tool_bar = args[:show_tool_bar] if args.key?(:show_tool_bar)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Contains information about a postal code that can be targeted by ads.
      class PostalCode
        include Google::Apis::Core::Hashable
      
        # Postal code. This is equivalent to the id field.
        # Corresponds to the JSON property `code`
        # @return [String]
        attr_accessor :code
      
        # Country code of the country to which this postal code belongs.
        # Corresponds to the JSON property `countryCode`
        # @return [String]
        attr_accessor :country_code
      
        # DART ID of the country to which this postal code belongs.
        # Corresponds to the JSON property `countryDartId`
        # @return [Fixnum]
        attr_accessor :country_dart_id
      
        # ID of this postal code.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#postalCode".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @country_code = args[:country_code] if args.key?(:country_code)
          @country_dart_id = args[:country_dart_id] if args.key?(:country_dart_id)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Postal Code List Response
      class PostalCodesListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#postalCodesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Postal code collection.
        # Corresponds to the JSON property `postalCodes`
        # @return [Array<Google::Apis::DfareportingV3_3::PostalCode>]
        attr_accessor :postal_codes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @postal_codes = args[:postal_codes] if args.key?(:postal_codes)
        end
      end
      
      # Pricing Information
      class Pricing
        include Google::Apis::Core::Hashable
      
        # Cap cost type of this inventory item.
        # Corresponds to the JSON property `capCostType`
        # @return [String]
        attr_accessor :cap_cost_type
      
        # End date of this inventory item.
        # Corresponds to the JSON property `endDate`
        # @return [Date]
        attr_accessor :end_date
      
        # Flights of this inventory item. A flight (a.k.a. pricing period) represents
        # the inventory item pricing information for a specific period of time.
        # Corresponds to the JSON property `flights`
        # @return [Array<Google::Apis::DfareportingV3_3::Flight>]
        attr_accessor :flights
      
        # Group type of this inventory item if it represents a placement group. Is null
        # otherwise. There are two type of placement groups:
        # PLANNING_PLACEMENT_GROUP_TYPE_PACKAGE is a simple group of inventory items
        # that acts as a single pricing point for a group of tags.
        # PLANNING_PLACEMENT_GROUP_TYPE_ROADBLOCK is a group of inventory items that not
        # only acts as a single pricing point, but also assumes that all the tags in it
        # will be served at the same time. A roadblock requires one of its assigned
        # inventory items to be marked as primary.
        # Corresponds to the JSON property `groupType`
        # @return [String]
        attr_accessor :group_type
      
        # Pricing type of this inventory item.
        # Corresponds to the JSON property `pricingType`
        # @return [String]
        attr_accessor :pricing_type
      
        # Start date of this inventory item.
        # Corresponds to the JSON property `startDate`
        # @return [Date]
        attr_accessor :start_date
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cap_cost_type = args[:cap_cost_type] if args.key?(:cap_cost_type)
          @end_date = args[:end_date] if args.key?(:end_date)
          @flights = args[:flights] if args.key?(:flights)
          @group_type = args[:group_type] if args.key?(:group_type)
          @pricing_type = args[:pricing_type] if args.key?(:pricing_type)
          @start_date = args[:start_date] if args.key?(:start_date)
        end
      end
      
      # Pricing Schedule
      class PricingSchedule
        include Google::Apis::Core::Hashable
      
        # Placement cap cost option.
        # Corresponds to the JSON property `capCostOption`
        # @return [String]
        attr_accessor :cap_cost_option
      
        # Whether cap costs are ignored by ad serving.
        # Corresponds to the JSON property `disregardOverdelivery`
        # @return [Boolean]
        attr_accessor :disregard_overdelivery
        alias_method :disregard_overdelivery?, :disregard_overdelivery
      
        # Placement end date. This date must be later than, or the same day as, the
        # placement start date, but not later than the campaign end date. If, for
        # example, you set 6/25/2015 as both the start and end dates, the effective
        # placement date is just that day only, 6/25/2015. The hours, minutes, and
        # seconds of the end date should not be set, as doing so will result in an error.
        # This field is required on insertion.
        # Corresponds to the JSON property `endDate`
        # @return [Date]
        attr_accessor :end_date
      
        # Whether this placement is flighted. If true, pricing periods will be computed
        # automatically.
        # Corresponds to the JSON property `flighted`
        # @return [Boolean]
        attr_accessor :flighted
        alias_method :flighted?, :flighted
      
        # Floodlight activity ID associated with this placement. This field should be
        # set when placement pricing type is set to PRICING_TYPE_CPA.
        # Corresponds to the JSON property `floodlightActivityId`
        # @return [Fixnum]
        attr_accessor :floodlight_activity_id
      
        # Pricing periods for this placement.
        # Corresponds to the JSON property `pricingPeriods`
        # @return [Array<Google::Apis::DfareportingV3_3::PricingSchedulePricingPeriod>]
        attr_accessor :pricing_periods
      
        # Placement pricing type. This field is required on insertion.
        # Corresponds to the JSON property `pricingType`
        # @return [String]
        attr_accessor :pricing_type
      
        # Placement start date. This date must be later than, or the same day as, the
        # campaign start date. The hours, minutes, and seconds of the start date should
        # not be set, as doing so will result in an error. This field is required on
        # insertion.
        # Corresponds to the JSON property `startDate`
        # @return [Date]
        attr_accessor :start_date
      
        # Testing start date of this placement. The hours, minutes, and seconds of the
        # start date should not be set, as doing so will result in an error.
        # Corresponds to the JSON property `testingStartDate`
        # @return [Date]
        attr_accessor :testing_start_date
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cap_cost_option = args[:cap_cost_option] if args.key?(:cap_cost_option)
          @disregard_overdelivery = args[:disregard_overdelivery] if args.key?(:disregard_overdelivery)
          @end_date = args[:end_date] if args.key?(:end_date)
          @flighted = args[:flighted] if args.key?(:flighted)
          @floodlight_activity_id = args[:floodlight_activity_id] if args.key?(:floodlight_activity_id)
          @pricing_periods = args[:pricing_periods] if args.key?(:pricing_periods)
          @pricing_type = args[:pricing_type] if args.key?(:pricing_type)
          @start_date = args[:start_date] if args.key?(:start_date)
          @testing_start_date = args[:testing_start_date] if args.key?(:testing_start_date)
        end
      end
      
      # Pricing Period
      class PricingSchedulePricingPeriod
        include Google::Apis::Core::Hashable
      
        # Pricing period end date. This date must be later than, or the same day as, the
        # pricing period start date, but not later than the placement end date. The
        # period end date can be the same date as the period start date. If, for example,
        # you set 6/25/2015 as both the start and end dates, the effective pricing
        # period date is just that day only, 6/25/2015. The hours, minutes, and seconds
        # of the end date should not be set, as doing so will result in an error.
        # Corresponds to the JSON property `endDate`
        # @return [Date]
        attr_accessor :end_date
      
        # Comments for this pricing period.
        # Corresponds to the JSON property `pricingComment`
        # @return [String]
        attr_accessor :pricing_comment
      
        # Rate or cost of this pricing period in nanos (i.e., multipled by 1000000000).
        # Acceptable values are 0 to 1000000000000000000, inclusive.
        # Corresponds to the JSON property `rateOrCostNanos`
        # @return [Fixnum]
        attr_accessor :rate_or_cost_nanos
      
        # Pricing period start date. This date must be later than, or the same day as,
        # the placement start date. The hours, minutes, and seconds of the start date
        # should not be set, as doing so will result in an error.
        # Corresponds to the JSON property `startDate`
        # @return [Date]
        attr_accessor :start_date
      
        # Units of this pricing period. Acceptable values are 0 to 10000000000,
        # inclusive.
        # Corresponds to the JSON property `units`
        # @return [Fixnum]
        attr_accessor :units
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_date = args[:end_date] if args.key?(:end_date)
          @pricing_comment = args[:pricing_comment] if args.key?(:pricing_comment)
          @rate_or_cost_nanos = args[:rate_or_cost_nanos] if args.key?(:rate_or_cost_nanos)
          @start_date = args[:start_date] if args.key?(:start_date)
          @units = args[:units] if args.key?(:units)
        end
      end
      
      # Contains properties of a Planning project.
      class Project
        include Google::Apis::Core::Hashable
      
        # Account ID of this project.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Advertiser ID of this project.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Audience age group of this project.
        # Corresponds to the JSON property `audienceAgeGroup`
        # @return [String]
        attr_accessor :audience_age_group
      
        # Audience gender of this project.
        # Corresponds to the JSON property `audienceGender`
        # @return [String]
        attr_accessor :audience_gender
      
        # Budget of this project in the currency specified by the current account. The
        # value stored in this field represents only the non-fractional amount. For
        # example, for USD, the smallest value that can be represented by this field is
        # 1 US dollar.
        # Corresponds to the JSON property `budget`
        # @return [Fixnum]
        attr_accessor :budget
      
        # Client billing code of this project.
        # Corresponds to the JSON property `clientBillingCode`
        # @return [String]
        attr_accessor :client_billing_code
      
        # Name of the project client.
        # Corresponds to the JSON property `clientName`
        # @return [String]
        attr_accessor :client_name
      
        # End date of the project.
        # Corresponds to the JSON property `endDate`
        # @return [Date]
        attr_accessor :end_date
      
        # ID of this project. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#project".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Modification timestamp.
        # Corresponds to the JSON property `lastModifiedInfo`
        # @return [Google::Apis::DfareportingV3_3::LastModifiedInfo]
        attr_accessor :last_modified_info
      
        # Name of this project.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Overview of this project.
        # Corresponds to the JSON property `overview`
        # @return [String]
        attr_accessor :overview
      
        # Start date of the project.
        # Corresponds to the JSON property `startDate`
        # @return [Date]
        attr_accessor :start_date
      
        # Subaccount ID of this project.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Number of clicks that the advertiser is targeting.
        # Corresponds to the JSON property `targetClicks`
        # @return [Fixnum]
        attr_accessor :target_clicks
      
        # Number of conversions that the advertiser is targeting.
        # Corresponds to the JSON property `targetConversions`
        # @return [Fixnum]
        attr_accessor :target_conversions
      
        # CPA that the advertiser is targeting.
        # Corresponds to the JSON property `targetCpaNanos`
        # @return [Fixnum]
        attr_accessor :target_cpa_nanos
      
        # CPC that the advertiser is targeting.
        # Corresponds to the JSON property `targetCpcNanos`
        # @return [Fixnum]
        attr_accessor :target_cpc_nanos
      
        # vCPM from Active View that the advertiser is targeting.
        # Corresponds to the JSON property `targetCpmActiveViewNanos`
        # @return [Fixnum]
        attr_accessor :target_cpm_active_view_nanos
      
        # CPM that the advertiser is targeting.
        # Corresponds to the JSON property `targetCpmNanos`
        # @return [Fixnum]
        attr_accessor :target_cpm_nanos
      
        # Number of impressions that the advertiser is targeting.
        # Corresponds to the JSON property `targetImpressions`
        # @return [Fixnum]
        attr_accessor :target_impressions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @audience_age_group = args[:audience_age_group] if args.key?(:audience_age_group)
          @audience_gender = args[:audience_gender] if args.key?(:audience_gender)
          @budget = args[:budget] if args.key?(:budget)
          @client_billing_code = args[:client_billing_code] if args.key?(:client_billing_code)
          @client_name = args[:client_name] if args.key?(:client_name)
          @end_date = args[:end_date] if args.key?(:end_date)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @last_modified_info = args[:last_modified_info] if args.key?(:last_modified_info)
          @name = args[:name] if args.key?(:name)
          @overview = args[:overview] if args.key?(:overview)
          @start_date = args[:start_date] if args.key?(:start_date)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @target_clicks = args[:target_clicks] if args.key?(:target_clicks)
          @target_conversions = args[:target_conversions] if args.key?(:target_conversions)
          @target_cpa_nanos = args[:target_cpa_nanos] if args.key?(:target_cpa_nanos)
          @target_cpc_nanos = args[:target_cpc_nanos] if args.key?(:target_cpc_nanos)
          @target_cpm_active_view_nanos = args[:target_cpm_active_view_nanos] if args.key?(:target_cpm_active_view_nanos)
          @target_cpm_nanos = args[:target_cpm_nanos] if args.key?(:target_cpm_nanos)
          @target_impressions = args[:target_impressions] if args.key?(:target_impressions)
        end
      end
      
      # Project List Response
      class ProjectsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#projectsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Project collection.
        # Corresponds to the JSON property `projects`
        # @return [Array<Google::Apis::DfareportingV3_3::Project>]
        attr_accessor :projects
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @projects = args[:projects] if args.key?(:projects)
        end
      end
      
      # Represents fields that are compatible to be selected for a report of type "
      # REACH".
      class ReachReportCompatibleFields
        include Google::Apis::Core::Hashable
      
        # Dimensions which are compatible to be selected in the "dimensionFilters"
        # section of the report.
        # Corresponds to the JSON property `dimensionFilters`
        # @return [Array<Google::Apis::DfareportingV3_3::Dimension>]
        attr_accessor :dimension_filters
      
        # Dimensions which are compatible to be selected in the "dimensions" section of
        # the report.
        # Corresponds to the JSON property `dimensions`
        # @return [Array<Google::Apis::DfareportingV3_3::Dimension>]
        attr_accessor :dimensions
      
        # The kind of resource this is, in this case dfareporting#
        # reachReportCompatibleFields.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Metrics which are compatible to be selected in the "metricNames" section of
        # the report.
        # Corresponds to the JSON property `metrics`
        # @return [Array<Google::Apis::DfareportingV3_3::Metric>]
        attr_accessor :metrics
      
        # Metrics which are compatible to be selected as activity metrics to pivot on in
        # the "activities" section of the report.
        # Corresponds to the JSON property `pivotedActivityMetrics`
        # @return [Array<Google::Apis::DfareportingV3_3::Metric>]
        attr_accessor :pivoted_activity_metrics
      
        # Metrics which are compatible to be selected in the "
        # reachByFrequencyMetricNames" section of the report.
        # Corresponds to the JSON property `reachByFrequencyMetrics`
        # @return [Array<Google::Apis::DfareportingV3_3::Metric>]
        attr_accessor :reach_by_frequency_metrics
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dimension_filters = args[:dimension_filters] if args.key?(:dimension_filters)
          @dimensions = args[:dimensions] if args.key?(:dimensions)
          @kind = args[:kind] if args.key?(:kind)
          @metrics = args[:metrics] if args.key?(:metrics)
          @pivoted_activity_metrics = args[:pivoted_activity_metrics] if args.key?(:pivoted_activity_metrics)
          @reach_by_frequency_metrics = args[:reach_by_frequency_metrics] if args.key?(:reach_by_frequency_metrics)
        end
      end
      
      # Represents a recipient.
      class Recipient
        include Google::Apis::Core::Hashable
      
        # The delivery type for the recipient.
        # Corresponds to the JSON property `deliveryType`
        # @return [String]
        attr_accessor :delivery_type
      
        # The email address of the recipient.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # The kind of resource this is, in this case dfareporting#recipient.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @delivery_type = args[:delivery_type] if args.key?(:delivery_type)
          @email = args[:email] if args.key?(:email)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Contains information about a region that can be targeted by ads.
      class Region
        include Google::Apis::Core::Hashable
      
        # Country code of the country to which this region belongs.
        # Corresponds to the JSON property `countryCode`
        # @return [String]
        attr_accessor :country_code
      
        # DART ID of the country to which this region belongs.
        # Corresponds to the JSON property `countryDartId`
        # @return [Fixnum]
        attr_accessor :country_dart_id
      
        # DART ID of this region.
        # Corresponds to the JSON property `dartId`
        # @return [Fixnum]
        attr_accessor :dart_id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#region".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this region.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Region code.
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @country_code = args[:country_code] if args.key?(:country_code)
          @country_dart_id = args[:country_dart_id] if args.key?(:country_dart_id)
          @dart_id = args[:dart_id] if args.key?(:dart_id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @region_code = args[:region_code] if args.key?(:region_code)
        end
      end
      
      # Region List Response
      class RegionsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#regionsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Region collection.
        # Corresponds to the JSON property `regions`
        # @return [Array<Google::Apis::DfareportingV3_3::Region>]
        attr_accessor :regions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @regions = args[:regions] if args.key?(:regions)
        end
      end
      
      # Contains properties of a remarketing list. Remarketing enables you to create
      # lists of users who have performed specific actions on a site, then target ads
      # to members of those lists. This resource can be used to manage remarketing
      # lists that are owned by your advertisers. To see all remarketing lists that
      # are visible to your advertisers, including those that are shared to your
      # advertiser or account, use the TargetableRemarketingLists resource.
      class RemarketingList
        include Google::Apis::Core::Hashable
      
        # Account ID of this remarketing list. This is a read-only, auto-generated field
        # that is only returned in GET requests.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Whether this remarketing list is active.
        # Corresponds to the JSON property `active`
        # @return [Boolean]
        attr_accessor :active
        alias_method :active?, :active
      
        # Dimension value for the advertiser ID that owns this remarketing list. This is
        # a required field.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `advertiserIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :advertiser_id_dimension_value
      
        # Remarketing list description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Remarketing list ID. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#remarketingList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Number of days that a user should remain in the remarketing list without an
        # impression. Acceptable values are 1 to 540, inclusive.
        # Corresponds to the JSON property `lifeSpan`
        # @return [Fixnum]
        attr_accessor :life_span
      
        # Remarketing List Population Rule.
        # Corresponds to the JSON property `listPopulationRule`
        # @return [Google::Apis::DfareportingV3_3::ListPopulationRule]
        attr_accessor :list_population_rule
      
        # Number of users currently in the list. This is a read-only field.
        # Corresponds to the JSON property `listSize`
        # @return [Fixnum]
        attr_accessor :list_size
      
        # Product from which this remarketing list was originated.
        # Corresponds to the JSON property `listSource`
        # @return [String]
        attr_accessor :list_source
      
        # Name of the remarketing list. This is a required field. Must be no greater
        # than 128 characters long.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Subaccount ID of this remarketing list. This is a read-only, auto-generated
        # field that is only returned in GET requests.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @active = args[:active] if args.key?(:active)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_id_dimension_value = args[:advertiser_id_dimension_value] if args.key?(:advertiser_id_dimension_value)
          @description = args[:description] if args.key?(:description)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @life_span = args[:life_span] if args.key?(:life_span)
          @list_population_rule = args[:list_population_rule] if args.key?(:list_population_rule)
          @list_size = args[:list_size] if args.key?(:list_size)
          @list_source = args[:list_source] if args.key?(:list_source)
          @name = args[:name] if args.key?(:name)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
        end
      end
      
      # Contains properties of a remarketing list's sharing information. Sharing
      # allows other accounts or advertisers to target to your remarketing lists. This
      # resource can be used to manage remarketing list sharing to other accounts and
      # advertisers.
      class RemarketingListShare
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#remarketingListShare".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Remarketing list ID. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `remarketingListId`
        # @return [Fixnum]
        attr_accessor :remarketing_list_id
      
        # Accounts that the remarketing list is shared with.
        # Corresponds to the JSON property `sharedAccountIds`
        # @return [Array<Fixnum>]
        attr_accessor :shared_account_ids
      
        # Advertisers that the remarketing list is shared with.
        # Corresponds to the JSON property `sharedAdvertiserIds`
        # @return [Array<Fixnum>]
        attr_accessor :shared_advertiser_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @remarketing_list_id = args[:remarketing_list_id] if args.key?(:remarketing_list_id)
          @shared_account_ids = args[:shared_account_ids] if args.key?(:shared_account_ids)
          @shared_advertiser_ids = args[:shared_advertiser_ids] if args.key?(:shared_advertiser_ids)
        end
      end
      
      # Remarketing list response
      class RemarketingListsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#remarketingListsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Remarketing list collection.
        # Corresponds to the JSON property `remarketingLists`
        # @return [Array<Google::Apis::DfareportingV3_3::RemarketingList>]
        attr_accessor :remarketing_lists
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @remarketing_lists = args[:remarketing_lists] if args.key?(:remarketing_lists)
        end
      end
      
      # Represents a Report resource.
      class Report
        include Google::Apis::Core::Hashable
      
        # The account ID to which this report belongs.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # The report criteria for a report of type "STANDARD".
        # Corresponds to the JSON property `criteria`
        # @return [Google::Apis::DfareportingV3_3::Report::Criteria]
        attr_accessor :criteria
      
        # The report criteria for a report of type "CROSS_DIMENSION_REACH".
        # Corresponds to the JSON property `crossDimensionReachCriteria`
        # @return [Google::Apis::DfareportingV3_3::Report::CrossDimensionReachCriteria]
        attr_accessor :cross_dimension_reach_criteria
      
        # The report's email delivery settings.
        # Corresponds to the JSON property `delivery`
        # @return [Google::Apis::DfareportingV3_3::Report::Delivery]
        attr_accessor :delivery
      
        # The eTag of this response for caching purposes.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The filename used when generating report files for this report.
        # Corresponds to the JSON property `fileName`
        # @return [String]
        attr_accessor :file_name
      
        # The report criteria for a report of type "FLOODLIGHT".
        # Corresponds to the JSON property `floodlightCriteria`
        # @return [Google::Apis::DfareportingV3_3::Report::FloodlightCriteria]
        attr_accessor :floodlight_criteria
      
        # The output format of the report. If not specified, default format is "CSV".
        # Note that the actual format in the completed report file might differ if for
        # instance the report's size exceeds the format's capabilities. "CSV" will then
        # be the fallback format.
        # Corresponds to the JSON property `format`
        # @return [String]
        attr_accessor :format
      
        # The unique ID identifying this report resource.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # The kind of resource this is, in this case dfareporting#report.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The timestamp (in milliseconds since epoch) of when this report was last
        # modified.
        # Corresponds to the JSON property `lastModifiedTime`
        # @return [Fixnum]
        attr_accessor :last_modified_time
      
        # The name of the report.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The user profile id of the owner of this report.
        # Corresponds to the JSON property `ownerProfileId`
        # @return [Fixnum]
        attr_accessor :owner_profile_id
      
        # The report criteria for a report of type "PATH_TO_CONVERSION".
        # Corresponds to the JSON property `pathToConversionCriteria`
        # @return [Google::Apis::DfareportingV3_3::Report::PathToConversionCriteria]
        attr_accessor :path_to_conversion_criteria
      
        # The report criteria for a report of type "REACH".
        # Corresponds to the JSON property `reachCriteria`
        # @return [Google::Apis::DfareportingV3_3::Report::ReachCriteria]
        attr_accessor :reach_criteria
      
        # The report's schedule. Can only be set if the report's 'dateRange' is a
        # relative date range and the relative date range is not "TODAY".
        # Corresponds to the JSON property `schedule`
        # @return [Google::Apis::DfareportingV3_3::Report::Schedule]
        attr_accessor :schedule
      
        # The subaccount ID to which this report belongs if applicable.
        # Corresponds to the JSON property `subAccountId`
        # @return [Fixnum]
        attr_accessor :sub_account_id
      
        # The type of the report.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @criteria = args[:criteria] if args.key?(:criteria)
          @cross_dimension_reach_criteria = args[:cross_dimension_reach_criteria] if args.key?(:cross_dimension_reach_criteria)
          @delivery = args[:delivery] if args.key?(:delivery)
          @etag = args[:etag] if args.key?(:etag)
          @file_name = args[:file_name] if args.key?(:file_name)
          @floodlight_criteria = args[:floodlight_criteria] if args.key?(:floodlight_criteria)
          @format = args[:format] if args.key?(:format)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @last_modified_time = args[:last_modified_time] if args.key?(:last_modified_time)
          @name = args[:name] if args.key?(:name)
          @owner_profile_id = args[:owner_profile_id] if args.key?(:owner_profile_id)
          @path_to_conversion_criteria = args[:path_to_conversion_criteria] if args.key?(:path_to_conversion_criteria)
          @reach_criteria = args[:reach_criteria] if args.key?(:reach_criteria)
          @schedule = args[:schedule] if args.key?(:schedule)
          @sub_account_id = args[:sub_account_id] if args.key?(:sub_account_id)
          @type = args[:type] if args.key?(:type)
        end
        
        # The report criteria for a report of type "STANDARD".
        class Criteria
          include Google::Apis::Core::Hashable
        
          # Represents an activity group.
          # Corresponds to the JSON property `activities`
          # @return [Google::Apis::DfareportingV3_3::Activities]
          attr_accessor :activities
        
          # Represents a Custom Rich Media Events group.
          # Corresponds to the JSON property `customRichMediaEvents`
          # @return [Google::Apis::DfareportingV3_3::CustomRichMediaEvents]
          attr_accessor :custom_rich_media_events
        
          # Represents a date range.
          # Corresponds to the JSON property `dateRange`
          # @return [Google::Apis::DfareportingV3_3::DateRange]
          attr_accessor :date_range
        
          # The list of filters on which dimensions are filtered.
          # Filters for different dimensions are ANDed, filters for the same dimension are
          # grouped together and ORed.
          # Corresponds to the JSON property `dimensionFilters`
          # @return [Array<Google::Apis::DfareportingV3_3::DimensionValue>]
          attr_accessor :dimension_filters
        
          # The list of standard dimensions the report should include.
          # Corresponds to the JSON property `dimensions`
          # @return [Array<Google::Apis::DfareportingV3_3::SortedDimension>]
          attr_accessor :dimensions
        
          # The list of names of metrics the report should include.
          # Corresponds to the JSON property `metricNames`
          # @return [Array<String>]
          attr_accessor :metric_names
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @activities = args[:activities] if args.key?(:activities)
            @custom_rich_media_events = args[:custom_rich_media_events] if args.key?(:custom_rich_media_events)
            @date_range = args[:date_range] if args.key?(:date_range)
            @dimension_filters = args[:dimension_filters] if args.key?(:dimension_filters)
            @dimensions = args[:dimensions] if args.key?(:dimensions)
            @metric_names = args[:metric_names] if args.key?(:metric_names)
          end
        end
        
        # The report criteria for a report of type "CROSS_DIMENSION_REACH".
        class CrossDimensionReachCriteria
          include Google::Apis::Core::Hashable
        
          # The list of dimensions the report should include.
          # Corresponds to the JSON property `breakdown`
          # @return [Array<Google::Apis::DfareportingV3_3::SortedDimension>]
          attr_accessor :breakdown
        
          # Represents a date range.
          # Corresponds to the JSON property `dateRange`
          # @return [Google::Apis::DfareportingV3_3::DateRange]
          attr_accessor :date_range
        
          # The dimension option.
          # Corresponds to the JSON property `dimension`
          # @return [String]
          attr_accessor :dimension
        
          # The list of filters on which dimensions are filtered.
          # Corresponds to the JSON property `dimensionFilters`
          # @return [Array<Google::Apis::DfareportingV3_3::DimensionValue>]
          attr_accessor :dimension_filters
        
          # The list of names of metrics the report should include.
          # Corresponds to the JSON property `metricNames`
          # @return [Array<String>]
          attr_accessor :metric_names
        
          # The list of names of overlap metrics the report should include.
          # Corresponds to the JSON property `overlapMetricNames`
          # @return [Array<String>]
          attr_accessor :overlap_metric_names
        
          # Whether the report is pivoted or not. Defaults to true.
          # Corresponds to the JSON property `pivoted`
          # @return [Boolean]
          attr_accessor :pivoted
          alias_method :pivoted?, :pivoted
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @breakdown = args[:breakdown] if args.key?(:breakdown)
            @date_range = args[:date_range] if args.key?(:date_range)
            @dimension = args[:dimension] if args.key?(:dimension)
            @dimension_filters = args[:dimension_filters] if args.key?(:dimension_filters)
            @metric_names = args[:metric_names] if args.key?(:metric_names)
            @overlap_metric_names = args[:overlap_metric_names] if args.key?(:overlap_metric_names)
            @pivoted = args[:pivoted] if args.key?(:pivoted)
          end
        end
        
        # The report's email delivery settings.
        class Delivery
          include Google::Apis::Core::Hashable
        
          # Whether the report should be emailed to the report owner.
          # Corresponds to the JSON property `emailOwner`
          # @return [Boolean]
          attr_accessor :email_owner
          alias_method :email_owner?, :email_owner
        
          # The type of delivery for the owner to receive, if enabled.
          # Corresponds to the JSON property `emailOwnerDeliveryType`
          # @return [String]
          attr_accessor :email_owner_delivery_type
        
          # The message to be sent with each email.
          # Corresponds to the JSON property `message`
          # @return [String]
          attr_accessor :message
        
          # The list of recipients to which to email the report.
          # Corresponds to the JSON property `recipients`
          # @return [Array<Google::Apis::DfareportingV3_3::Recipient>]
          attr_accessor :recipients
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @email_owner = args[:email_owner] if args.key?(:email_owner)
            @email_owner_delivery_type = args[:email_owner_delivery_type] if args.key?(:email_owner_delivery_type)
            @message = args[:message] if args.key?(:message)
            @recipients = args[:recipients] if args.key?(:recipients)
          end
        end
        
        # The report criteria for a report of type "FLOODLIGHT".
        class FloodlightCriteria
          include Google::Apis::Core::Hashable
        
          # The list of custom rich media events to include.
          # Corresponds to the JSON property `customRichMediaEvents`
          # @return [Array<Google::Apis::DfareportingV3_3::DimensionValue>]
          attr_accessor :custom_rich_media_events
        
          # Represents a date range.
          # Corresponds to the JSON property `dateRange`
          # @return [Google::Apis::DfareportingV3_3::DateRange]
          attr_accessor :date_range
        
          # The list of filters on which dimensions are filtered.
          # Filters for different dimensions are ANDed, filters for the same dimension are
          # grouped together and ORed.
          # Corresponds to the JSON property `dimensionFilters`
          # @return [Array<Google::Apis::DfareportingV3_3::DimensionValue>]
          attr_accessor :dimension_filters
        
          # The list of dimensions the report should include.
          # Corresponds to the JSON property `dimensions`
          # @return [Array<Google::Apis::DfareportingV3_3::SortedDimension>]
          attr_accessor :dimensions
        
          # Represents a DimensionValue resource.
          # Corresponds to the JSON property `floodlightConfigId`
          # @return [Google::Apis::DfareportingV3_3::DimensionValue]
          attr_accessor :floodlight_config_id
        
          # The list of names of metrics the report should include.
          # Corresponds to the JSON property `metricNames`
          # @return [Array<String>]
          attr_accessor :metric_names
        
          # The properties of the report.
          # Corresponds to the JSON property `reportProperties`
          # @return [Google::Apis::DfareportingV3_3::Report::FloodlightCriteria::ReportProperties]
          attr_accessor :report_properties
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @custom_rich_media_events = args[:custom_rich_media_events] if args.key?(:custom_rich_media_events)
            @date_range = args[:date_range] if args.key?(:date_range)
            @dimension_filters = args[:dimension_filters] if args.key?(:dimension_filters)
            @dimensions = args[:dimensions] if args.key?(:dimensions)
            @floodlight_config_id = args[:floodlight_config_id] if args.key?(:floodlight_config_id)
            @metric_names = args[:metric_names] if args.key?(:metric_names)
            @report_properties = args[:report_properties] if args.key?(:report_properties)
          end
          
          # The properties of the report.
          class ReportProperties
            include Google::Apis::Core::Hashable
          
            # Include conversions that have no cookie, but do have an exposure path.
            # Corresponds to the JSON property `includeAttributedIPConversions`
            # @return [Boolean]
            attr_accessor :include_attributed_ip_conversions
            alias_method :include_attributed_ip_conversions?, :include_attributed_ip_conversions
          
            # Include conversions of users with a DoubleClick cookie but without an exposure.
            # That means the user did not click or see an ad from the advertiser within the
            # Floodlight group, or that the interaction happened outside the lookback window.
            # Corresponds to the JSON property `includeUnattributedCookieConversions`
            # @return [Boolean]
            attr_accessor :include_unattributed_cookie_conversions
            alias_method :include_unattributed_cookie_conversions?, :include_unattributed_cookie_conversions
          
            # Include conversions that have no associated cookies and no exposures. It’s
            # therefore impossible to know how the user was exposed to your ads during the
            # lookback window prior to a conversion.
            # Corresponds to the JSON property `includeUnattributedIPConversions`
            # @return [Boolean]
            attr_accessor :include_unattributed_ip_conversions
            alias_method :include_unattributed_ip_conversions?, :include_unattributed_ip_conversions
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @include_attributed_ip_conversions = args[:include_attributed_ip_conversions] if args.key?(:include_attributed_ip_conversions)
              @include_unattributed_cookie_conversions = args[:include_unattributed_cookie_conversions] if args.key?(:include_unattributed_cookie_conversions)
              @include_unattributed_ip_conversions = args[:include_unattributed_ip_conversions] if args.key?(:include_unattributed_ip_conversions)
            end
          end
        end
        
        # The report criteria for a report of type "PATH_TO_CONVERSION".
        class PathToConversionCriteria
          include Google::Apis::Core::Hashable
        
          # The list of 'dfa:activity' values to filter on.
          # Corresponds to the JSON property `activityFilters`
          # @return [Array<Google::Apis::DfareportingV3_3::DimensionValue>]
          attr_accessor :activity_filters
        
          # The list of conversion dimensions the report should include.
          # Corresponds to the JSON property `conversionDimensions`
          # @return [Array<Google::Apis::DfareportingV3_3::SortedDimension>]
          attr_accessor :conversion_dimensions
        
          # The list of custom floodlight variables the report should include.
          # Corresponds to the JSON property `customFloodlightVariables`
          # @return [Array<Google::Apis::DfareportingV3_3::SortedDimension>]
          attr_accessor :custom_floodlight_variables
        
          # The list of custom rich media events to include.
          # Corresponds to the JSON property `customRichMediaEvents`
          # @return [Array<Google::Apis::DfareportingV3_3::DimensionValue>]
          attr_accessor :custom_rich_media_events
        
          # Represents a date range.
          # Corresponds to the JSON property `dateRange`
          # @return [Google::Apis::DfareportingV3_3::DateRange]
          attr_accessor :date_range
        
          # Represents a DimensionValue resource.
          # Corresponds to the JSON property `floodlightConfigId`
          # @return [Google::Apis::DfareportingV3_3::DimensionValue]
          attr_accessor :floodlight_config_id
        
          # The list of names of metrics the report should include.
          # Corresponds to the JSON property `metricNames`
          # @return [Array<String>]
          attr_accessor :metric_names
        
          # The list of per interaction dimensions the report should include.
          # Corresponds to the JSON property `perInteractionDimensions`
          # @return [Array<Google::Apis::DfareportingV3_3::SortedDimension>]
          attr_accessor :per_interaction_dimensions
        
          # The properties of the report.
          # Corresponds to the JSON property `reportProperties`
          # @return [Google::Apis::DfareportingV3_3::Report::PathToConversionCriteria::ReportProperties]
          attr_accessor :report_properties
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @activity_filters = args[:activity_filters] if args.key?(:activity_filters)
            @conversion_dimensions = args[:conversion_dimensions] if args.key?(:conversion_dimensions)
            @custom_floodlight_variables = args[:custom_floodlight_variables] if args.key?(:custom_floodlight_variables)
            @custom_rich_media_events = args[:custom_rich_media_events] if args.key?(:custom_rich_media_events)
            @date_range = args[:date_range] if args.key?(:date_range)
            @floodlight_config_id = args[:floodlight_config_id] if args.key?(:floodlight_config_id)
            @metric_names = args[:metric_names] if args.key?(:metric_names)
            @per_interaction_dimensions = args[:per_interaction_dimensions] if args.key?(:per_interaction_dimensions)
            @report_properties = args[:report_properties] if args.key?(:report_properties)
          end
          
          # The properties of the report.
          class ReportProperties
            include Google::Apis::Core::Hashable
          
            # DFA checks to see if a click interaction occurred within the specified period
            # of time before a conversion. By default the value is pulled from Floodlight or
            # you can manually enter a custom value. Valid values: 1-90.
            # Corresponds to the JSON property `clicksLookbackWindow`
            # @return [Fixnum]
            attr_accessor :clicks_lookback_window
          
            # DFA checks to see if an impression interaction occurred within the specified
            # period of time before a conversion. By default the value is pulled from
            # Floodlight or you can manually enter a custom value. Valid values: 1-90.
            # Corresponds to the JSON property `impressionsLookbackWindow`
            # @return [Fixnum]
            attr_accessor :impressions_lookback_window
          
            # Deprecated: has no effect.
            # Corresponds to the JSON property `includeAttributedIPConversions`
            # @return [Boolean]
            attr_accessor :include_attributed_ip_conversions
            alias_method :include_attributed_ip_conversions?, :include_attributed_ip_conversions
          
            # Include conversions of users with a DoubleClick cookie but without an exposure.
            # That means the user did not click or see an ad from the advertiser within the
            # Floodlight group, or that the interaction happened outside the lookback window.
            # Corresponds to the JSON property `includeUnattributedCookieConversions`
            # @return [Boolean]
            attr_accessor :include_unattributed_cookie_conversions
            alias_method :include_unattributed_cookie_conversions?, :include_unattributed_cookie_conversions
          
            # Include conversions that have no associated cookies and no exposures. It’s
            # therefore impossible to know how the user was exposed to your ads during the
            # lookback window prior to a conversion.
            # Corresponds to the JSON property `includeUnattributedIPConversions`
            # @return [Boolean]
            attr_accessor :include_unattributed_ip_conversions
            alias_method :include_unattributed_ip_conversions?, :include_unattributed_ip_conversions
          
            # The maximum number of click interactions to include in the report. Advertisers
            # currently paying for E2C reports get up to 200 (100 clicks, 100 impressions).
            # If another advertiser in your network is paying for E2C, you can have up to 5
            # total exposures per report.
            # Corresponds to the JSON property `maximumClickInteractions`
            # @return [Fixnum]
            attr_accessor :maximum_click_interactions
          
            # The maximum number of click interactions to include in the report. Advertisers
            # currently paying for E2C reports get up to 200 (100 clicks, 100 impressions).
            # If another advertiser in your network is paying for E2C, you can have up to 5
            # total exposures per report.
            # Corresponds to the JSON property `maximumImpressionInteractions`
            # @return [Fixnum]
            attr_accessor :maximum_impression_interactions
          
            # The maximum amount of time that can take place between interactions (clicks or
            # impressions) by the same user. Valid values: 1-90.
            # Corresponds to the JSON property `maximumInteractionGap`
            # @return [Fixnum]
            attr_accessor :maximum_interaction_gap
          
            # Enable pivoting on interaction path.
            # Corresponds to the JSON property `pivotOnInteractionPath`
            # @return [Boolean]
            attr_accessor :pivot_on_interaction_path
            alias_method :pivot_on_interaction_path?, :pivot_on_interaction_path
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @clicks_lookback_window = args[:clicks_lookback_window] if args.key?(:clicks_lookback_window)
              @impressions_lookback_window = args[:impressions_lookback_window] if args.key?(:impressions_lookback_window)
              @include_attributed_ip_conversions = args[:include_attributed_ip_conversions] if args.key?(:include_attributed_ip_conversions)
              @include_unattributed_cookie_conversions = args[:include_unattributed_cookie_conversions] if args.key?(:include_unattributed_cookie_conversions)
              @include_unattributed_ip_conversions = args[:include_unattributed_ip_conversions] if args.key?(:include_unattributed_ip_conversions)
              @maximum_click_interactions = args[:maximum_click_interactions] if args.key?(:maximum_click_interactions)
              @maximum_impression_interactions = args[:maximum_impression_interactions] if args.key?(:maximum_impression_interactions)
              @maximum_interaction_gap = args[:maximum_interaction_gap] if args.key?(:maximum_interaction_gap)
              @pivot_on_interaction_path = args[:pivot_on_interaction_path] if args.key?(:pivot_on_interaction_path)
            end
          end
        end
        
        # The report criteria for a report of type "REACH".
        class ReachCriteria
          include Google::Apis::Core::Hashable
        
          # Represents an activity group.
          # Corresponds to the JSON property `activities`
          # @return [Google::Apis::DfareportingV3_3::Activities]
          attr_accessor :activities
        
          # Represents a Custom Rich Media Events group.
          # Corresponds to the JSON property `customRichMediaEvents`
          # @return [Google::Apis::DfareportingV3_3::CustomRichMediaEvents]
          attr_accessor :custom_rich_media_events
        
          # Represents a date range.
          # Corresponds to the JSON property `dateRange`
          # @return [Google::Apis::DfareportingV3_3::DateRange]
          attr_accessor :date_range
        
          # The list of filters on which dimensions are filtered.
          # Filters for different dimensions are ANDed, filters for the same dimension are
          # grouped together and ORed.
          # Corresponds to the JSON property `dimensionFilters`
          # @return [Array<Google::Apis::DfareportingV3_3::DimensionValue>]
          attr_accessor :dimension_filters
        
          # The list of dimensions the report should include.
          # Corresponds to the JSON property `dimensions`
          # @return [Array<Google::Apis::DfareportingV3_3::SortedDimension>]
          attr_accessor :dimensions
        
          # Whether to enable all reach dimension combinations in the report. Defaults to
          # false. If enabled, the date range of the report should be within the last 42
          # days.
          # Corresponds to the JSON property `enableAllDimensionCombinations`
          # @return [Boolean]
          attr_accessor :enable_all_dimension_combinations
          alias_method :enable_all_dimension_combinations?, :enable_all_dimension_combinations
        
          # The list of names of metrics the report should include.
          # Corresponds to the JSON property `metricNames`
          # @return [Array<String>]
          attr_accessor :metric_names
        
          # The list of names of  Reach By Frequency metrics the report should include.
          # Corresponds to the JSON property `reachByFrequencyMetricNames`
          # @return [Array<String>]
          attr_accessor :reach_by_frequency_metric_names
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @activities = args[:activities] if args.key?(:activities)
            @custom_rich_media_events = args[:custom_rich_media_events] if args.key?(:custom_rich_media_events)
            @date_range = args[:date_range] if args.key?(:date_range)
            @dimension_filters = args[:dimension_filters] if args.key?(:dimension_filters)
            @dimensions = args[:dimensions] if args.key?(:dimensions)
            @enable_all_dimension_combinations = args[:enable_all_dimension_combinations] if args.key?(:enable_all_dimension_combinations)
            @metric_names = args[:metric_names] if args.key?(:metric_names)
            @reach_by_frequency_metric_names = args[:reach_by_frequency_metric_names] if args.key?(:reach_by_frequency_metric_names)
          end
        end
        
        # The report's schedule. Can only be set if the report's 'dateRange' is a
        # relative date range and the relative date range is not "TODAY".
        class Schedule
          include Google::Apis::Core::Hashable
        
          # Whether the schedule is active or not. Must be set to either true or false.
          # Corresponds to the JSON property `active`
          # @return [Boolean]
          attr_accessor :active
          alias_method :active?, :active
        
          # Defines every how many days, weeks or months the report should be run. Needs
          # to be set when "repeats" is either "DAILY", "WEEKLY" or "MONTHLY".
          # Corresponds to the JSON property `every`
          # @return [Fixnum]
          attr_accessor :every
        
          # The expiration date when the scheduled report stops running.
          # Corresponds to the JSON property `expirationDate`
          # @return [Date]
          attr_accessor :expiration_date
        
          # The interval for which the report is repeated. Note:
          # - "DAILY" also requires field "every" to be set.
          # - "WEEKLY" also requires fields "every" and "repeatsOnWeekDays" to be set.
          # - "MONTHLY" also requires fields "every" and "runsOnDayOfMonth" to be set.
          # Corresponds to the JSON property `repeats`
          # @return [String]
          attr_accessor :repeats
        
          # List of week days "WEEKLY" on which scheduled reports should run.
          # Corresponds to the JSON property `repeatsOnWeekDays`
          # @return [Array<String>]
          attr_accessor :repeats_on_week_days
        
          # Enum to define for "MONTHLY" scheduled reports whether reports should be
          # repeated on the same day of the month as "startDate" or the same day of the
          # week of the month.
          # Example: If 'startDate' is Monday, April 2nd 2012 (2012-04-02), "DAY_OF_MONTH"
          # would run subsequent reports on the 2nd of every Month, and "WEEK_OF_MONTH"
          # would run subsequent reports on the first Monday of the month.
          # Corresponds to the JSON property `runsOnDayOfMonth`
          # @return [String]
          attr_accessor :runs_on_day_of_month
        
          # Start date of date range for which scheduled reports should be run.
          # Corresponds to the JSON property `startDate`
          # @return [Date]
          attr_accessor :start_date
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @active = args[:active] if args.key?(:active)
            @every = args[:every] if args.key?(:every)
            @expiration_date = args[:expiration_date] if args.key?(:expiration_date)
            @repeats = args[:repeats] if args.key?(:repeats)
            @repeats_on_week_days = args[:repeats_on_week_days] if args.key?(:repeats_on_week_days)
            @runs_on_day_of_month = args[:runs_on_day_of_month] if args.key?(:runs_on_day_of_month)
            @start_date = args[:start_date] if args.key?(:start_date)
          end
        end
      end
      
      # Represents fields that are compatible to be selected for a report of type "
      # STANDARD".
      class ReportCompatibleFields
        include Google::Apis::Core::Hashable
      
        # Dimensions which are compatible to be selected in the "dimensionFilters"
        # section of the report.
        # Corresponds to the JSON property `dimensionFilters`
        # @return [Array<Google::Apis::DfareportingV3_3::Dimension>]
        attr_accessor :dimension_filters
      
        # Dimensions which are compatible to be selected in the "dimensions" section of
        # the report.
        # Corresponds to the JSON property `dimensions`
        # @return [Array<Google::Apis::DfareportingV3_3::Dimension>]
        attr_accessor :dimensions
      
        # The kind of resource this is, in this case dfareporting#reportCompatibleFields.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Metrics which are compatible to be selected in the "metricNames" section of
        # the report.
        # Corresponds to the JSON property `metrics`
        # @return [Array<Google::Apis::DfareportingV3_3::Metric>]
        attr_accessor :metrics
      
        # Metrics which are compatible to be selected as activity metrics to pivot on in
        # the "activities" section of the report.
        # Corresponds to the JSON property `pivotedActivityMetrics`
        # @return [Array<Google::Apis::DfareportingV3_3::Metric>]
        attr_accessor :pivoted_activity_metrics
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dimension_filters = args[:dimension_filters] if args.key?(:dimension_filters)
          @dimensions = args[:dimensions] if args.key?(:dimensions)
          @kind = args[:kind] if args.key?(:kind)
          @metrics = args[:metrics] if args.key?(:metrics)
          @pivoted_activity_metrics = args[:pivoted_activity_metrics] if args.key?(:pivoted_activity_metrics)
        end
      end
      
      # Represents the list of reports.
      class ReportList
        include Google::Apis::Core::Hashable
      
        # The eTag of this response for caching purposes.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The reports returned in this response.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::DfareportingV3_3::Report>]
        attr_accessor :items
      
        # The kind of list this is, in this case dfareporting#reportList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Continuation token used to page through reports. To retrieve the next page of
        # results, set the next request's "pageToken" to the value of this field. The
        # page token is only valid for a limited amount of time and should not be
        # persisted.
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
      
      # Reporting Configuration
      class ReportsConfiguration
        include Google::Apis::Core::Hashable
      
        # Whether the exposure to conversion report is enabled. This report shows
        # detailed pathway information on up to 10 of the most recent ad exposures seen
        # by a user before converting.
        # Corresponds to the JSON property `exposureToConversionEnabled`
        # @return [Boolean]
        attr_accessor :exposure_to_conversion_enabled
        alias_method :exposure_to_conversion_enabled?, :exposure_to_conversion_enabled
      
        # Lookback configuration settings.
        # Corresponds to the JSON property `lookbackConfiguration`
        # @return [Google::Apis::DfareportingV3_3::LookbackConfiguration]
        attr_accessor :lookback_configuration
      
        # Report generation time zone ID of this account. This is a required field that
        # can only be changed by a superuser.
        # Acceptable values are:
        # - "1" for "America/New_York"
        # - "2" for "Europe/London"
        # - "3" for "Europe/Paris"
        # - "4" for "Africa/Johannesburg"
        # - "5" for "Asia/Jerusalem"
        # - "6" for "Asia/Shanghai"
        # - "7" for "Asia/Hong_Kong"
        # - "8" for "Asia/Tokyo"
        # - "9" for "Australia/Sydney"
        # - "10" for "Asia/Dubai"
        # - "11" for "America/Los_Angeles"
        # - "12" for "Pacific/Auckland"
        # - "13" for "America/Sao_Paulo"
        # Corresponds to the JSON property `reportGenerationTimeZoneId`
        # @return [Fixnum]
        attr_accessor :report_generation_time_zone_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exposure_to_conversion_enabled = args[:exposure_to_conversion_enabled] if args.key?(:exposure_to_conversion_enabled)
          @lookback_configuration = args[:lookback_configuration] if args.key?(:lookback_configuration)
          @report_generation_time_zone_id = args[:report_generation_time_zone_id] if args.key?(:report_generation_time_zone_id)
        end
      end
      
      # Rich Media Exit Override.
      class RichMediaExitOverride
        include Google::Apis::Core::Hashable
      
        # Click-through URL
        # Corresponds to the JSON property `clickThroughUrl`
        # @return [Google::Apis::DfareportingV3_3::ClickThroughUrl]
        attr_accessor :click_through_url
      
        # Whether to use the clickThroughUrl. If false, the creative-level exit will be
        # used.
        # Corresponds to the JSON property `enabled`
        # @return [Boolean]
        attr_accessor :enabled
        alias_method :enabled?, :enabled
      
        # ID for the override to refer to a specific exit in the creative.
        # Corresponds to the JSON property `exitId`
        # @return [Fixnum]
        attr_accessor :exit_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @click_through_url = args[:click_through_url] if args.key?(:click_through_url)
          @enabled = args[:enabled] if args.key?(:enabled)
          @exit_id = args[:exit_id] if args.key?(:exit_id)
        end
      end
      
      # A rule associates an asset with a targeting template for asset-level targeting.
      # Applicable to INSTREAM_VIDEO creatives.
      class Rule
        include Google::Apis::Core::Hashable
      
        # A creativeAssets[].id. This should refer to one of the parent assets in this
        # creative. This is a required field.
        # Corresponds to the JSON property `assetId`
        # @return [Fixnum]
        attr_accessor :asset_id
      
        # A user-friendly name for this rule. This is a required field.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A targeting template ID. The targeting from the targeting template will be
        # used to determine whether this asset should be served. This is a required
        # field.
        # Corresponds to the JSON property `targetingTemplateId`
        # @return [Fixnum]
        attr_accessor :targeting_template_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @asset_id = args[:asset_id] if args.key?(:asset_id)
          @name = args[:name] if args.key?(:name)
          @targeting_template_id = args[:targeting_template_id] if args.key?(:targeting_template_id)
        end
      end
      
      # Contains properties of a site.
      class Site
        include Google::Apis::Core::Hashable
      
        # Account ID of this site. This is a read-only field that can be left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Whether this site is approved.
        # Corresponds to the JSON property `approved`
        # @return [Boolean]
        attr_accessor :approved
        alias_method :approved?, :approved
      
        # Directory site associated with this site. This is a required field that is
        # read-only after insertion.
        # Corresponds to the JSON property `directorySiteId`
        # @return [Fixnum]
        attr_accessor :directory_site_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `directorySiteIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :directory_site_id_dimension_value
      
        # ID of this site. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `idDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :id_dimension_value
      
        # Key name of this site. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `keyName`
        # @return [String]
        attr_accessor :key_name
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#site".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this site.This is a required field. Must be less than 128 characters
        # long. If this site is under a subaccount, the name must be unique among sites
        # of the same subaccount. Otherwise, this site is a top-level site, and the name
        # must be unique among top-level sites of the same account.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Site contacts.
        # Corresponds to the JSON property `siteContacts`
        # @return [Array<Google::Apis::DfareportingV3_3::SiteContact>]
        attr_accessor :site_contacts
      
        # Site Settings
        # Corresponds to the JSON property `siteSettings`
        # @return [Google::Apis::DfareportingV3_3::SiteSettings]
        attr_accessor :site_settings
      
        # Subaccount ID of this site. This is a read-only field that can be left blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Video Settings
        # Corresponds to the JSON property `videoSettings`
        # @return [Google::Apis::DfareportingV3_3::SiteVideoSettings]
        attr_accessor :video_settings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @approved = args[:approved] if args.key?(:approved)
          @directory_site_id = args[:directory_site_id] if args.key?(:directory_site_id)
          @directory_site_id_dimension_value = args[:directory_site_id_dimension_value] if args.key?(:directory_site_id_dimension_value)
          @id = args[:id] if args.key?(:id)
          @id_dimension_value = args[:id_dimension_value] if args.key?(:id_dimension_value)
          @key_name = args[:key_name] if args.key?(:key_name)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @site_contacts = args[:site_contacts] if args.key?(:site_contacts)
          @site_settings = args[:site_settings] if args.key?(:site_settings)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @video_settings = args[:video_settings] if args.key?(:video_settings)
        end
      end
      
      # Companion Settings
      class SiteCompanionSetting
        include Google::Apis::Core::Hashable
      
        # Whether companions are disabled for this site template.
        # Corresponds to the JSON property `companionsDisabled`
        # @return [Boolean]
        attr_accessor :companions_disabled
        alias_method :companions_disabled?, :companions_disabled
      
        # Whitelist of companion sizes to be served via this site template. Set this
        # list to null or empty to serve all companion sizes.
        # Corresponds to the JSON property `enabledSizes`
        # @return [Array<Google::Apis::DfareportingV3_3::Size>]
        attr_accessor :enabled_sizes
      
        # Whether to serve only static images as companions.
        # Corresponds to the JSON property `imageOnly`
        # @return [Boolean]
        attr_accessor :image_only
        alias_method :image_only?, :image_only
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#siteCompanionSetting".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @companions_disabled = args[:companions_disabled] if args.key?(:companions_disabled)
          @enabled_sizes = args[:enabled_sizes] if args.key?(:enabled_sizes)
          @image_only = args[:image_only] if args.key?(:image_only)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Site Contact
      class SiteContact
        include Google::Apis::Core::Hashable
      
        # Address of this site contact.
        # Corresponds to the JSON property `address`
        # @return [String]
        attr_accessor :address
      
        # Site contact type.
        # Corresponds to the JSON property `contactType`
        # @return [String]
        attr_accessor :contact_type
      
        # Email address of this site contact. This is a required field.
        # Corresponds to the JSON property `email`
        # @return [String]
        attr_accessor :email
      
        # First name of this site contact.
        # Corresponds to the JSON property `firstName`
        # @return [String]
        attr_accessor :first_name
      
        # ID of this site contact. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Last name of this site contact.
        # Corresponds to the JSON property `lastName`
        # @return [String]
        attr_accessor :last_name
      
        # Primary phone number of this site contact.
        # Corresponds to the JSON property `phone`
        # @return [String]
        attr_accessor :phone
      
        # Title or designation of this site contact.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @address = args[:address] if args.key?(:address)
          @contact_type = args[:contact_type] if args.key?(:contact_type)
          @email = args[:email] if args.key?(:email)
          @first_name = args[:first_name] if args.key?(:first_name)
          @id = args[:id] if args.key?(:id)
          @last_name = args[:last_name] if args.key?(:last_name)
          @phone = args[:phone] if args.key?(:phone)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Site Settings
      class SiteSettings
        include Google::Apis::Core::Hashable
      
        # Whether active view creatives are disabled for this site.
        # Corresponds to the JSON property `activeViewOptOut`
        # @return [Boolean]
        attr_accessor :active_view_opt_out
        alias_method :active_view_opt_out?, :active_view_opt_out
      
        # Whether this site opts out of ad blocking. When true, ad blocking is disabled
        # for all placements under the site, regardless of the individual placement
        # settings. When false, the campaign and placement settings take effect.
        # Corresponds to the JSON property `adBlockingOptOut`
        # @return [Boolean]
        attr_accessor :ad_blocking_opt_out
        alias_method :ad_blocking_opt_out?, :ad_blocking_opt_out
      
        # Whether new cookies are disabled for this site.
        # Corresponds to the JSON property `disableNewCookie`
        # @return [Boolean]
        attr_accessor :disable_new_cookie
        alias_method :disable_new_cookie?, :disable_new_cookie
      
        # Tag Settings
        # Corresponds to the JSON property `tagSetting`
        # @return [Google::Apis::DfareportingV3_3::TagSetting]
        attr_accessor :tag_setting
      
        # Whether Verification and ActiveView for in-stream video creatives are disabled
        # by default for new placements created under this site. This value will be used
        # to populate the placement.videoActiveViewOptOut field, when no value is
        # specified for the new placement.
        # Corresponds to the JSON property `videoActiveViewOptOutTemplate`
        # @return [Boolean]
        attr_accessor :video_active_view_opt_out_template
        alias_method :video_active_view_opt_out_template?, :video_active_view_opt_out_template
      
        # Default VPAID adapter setting for new placements created under this site. This
        # value will be used to populate the placements.vpaidAdapterChoice field, when
        # no value is specified for the new placement. Controls which VPAID format the
        # measurement adapter will use for in-stream video creatives assigned to the
        # placement. The publisher's specifications will typically determine this
        # setting. For VPAID creatives, the adapter format will match the VPAID format (
        # HTML5 VPAID creatives use the HTML5 adapter).
        # Note: Flash is no longer supported. This field now defaults to HTML5 when the
        # following values are provided: FLASH, BOTH.
        # Corresponds to the JSON property `vpaidAdapterChoiceTemplate`
        # @return [String]
        attr_accessor :vpaid_adapter_choice_template
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @active_view_opt_out = args[:active_view_opt_out] if args.key?(:active_view_opt_out)
          @ad_blocking_opt_out = args[:ad_blocking_opt_out] if args.key?(:ad_blocking_opt_out)
          @disable_new_cookie = args[:disable_new_cookie] if args.key?(:disable_new_cookie)
          @tag_setting = args[:tag_setting] if args.key?(:tag_setting)
          @video_active_view_opt_out_template = args[:video_active_view_opt_out_template] if args.key?(:video_active_view_opt_out_template)
          @vpaid_adapter_choice_template = args[:vpaid_adapter_choice_template] if args.key?(:vpaid_adapter_choice_template)
        end
      end
      
      # Skippable Settings
      class SiteSkippableSetting
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#siteSkippableSetting".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Video Offset
        # Corresponds to the JSON property `progressOffset`
        # @return [Google::Apis::DfareportingV3_3::VideoOffset]
        attr_accessor :progress_offset
      
        # Video Offset
        # Corresponds to the JSON property `skipOffset`
        # @return [Google::Apis::DfareportingV3_3::VideoOffset]
        attr_accessor :skip_offset
      
        # Whether the user can skip creatives served to this site. This will act as
        # default for new placements created under this site.
        # Corresponds to the JSON property `skippable`
        # @return [Boolean]
        attr_accessor :skippable
        alias_method :skippable?, :skippable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @progress_offset = args[:progress_offset] if args.key?(:progress_offset)
          @skip_offset = args[:skip_offset] if args.key?(:skip_offset)
          @skippable = args[:skippable] if args.key?(:skippable)
        end
      end
      
      # Transcode Settings
      class SiteTranscodeSetting
        include Google::Apis::Core::Hashable
      
        # Whitelist of video formats to be served to this site template. Set this list
        # to null or empty to serve all video formats.
        # Corresponds to the JSON property `enabledVideoFormats`
        # @return [Array<Fixnum>]
        attr_accessor :enabled_video_formats
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#siteTranscodeSetting".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled_video_formats = args[:enabled_video_formats] if args.key?(:enabled_video_formats)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Video Settings
      class SiteVideoSettings
        include Google::Apis::Core::Hashable
      
        # Companion Settings
        # Corresponds to the JSON property `companionSettings`
        # @return [Google::Apis::DfareportingV3_3::SiteCompanionSetting]
        attr_accessor :companion_settings
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#siteVideoSettings".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Orientation of a site template used for video. This will act as default for
        # new placements created under this site.
        # Corresponds to the JSON property `orientation`
        # @return [String]
        attr_accessor :orientation
      
        # Skippable Settings
        # Corresponds to the JSON property `skippableSettings`
        # @return [Google::Apis::DfareportingV3_3::SiteSkippableSetting]
        attr_accessor :skippable_settings
      
        # Transcode Settings
        # Corresponds to the JSON property `transcodeSettings`
        # @return [Google::Apis::DfareportingV3_3::SiteTranscodeSetting]
        attr_accessor :transcode_settings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @companion_settings = args[:companion_settings] if args.key?(:companion_settings)
          @kind = args[:kind] if args.key?(:kind)
          @orientation = args[:orientation] if args.key?(:orientation)
          @skippable_settings = args[:skippable_settings] if args.key?(:skippable_settings)
          @transcode_settings = args[:transcode_settings] if args.key?(:transcode_settings)
        end
      end
      
      # Site List Response
      class SitesListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#sitesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Site collection.
        # Corresponds to the JSON property `sites`
        # @return [Array<Google::Apis::DfareportingV3_3::Site>]
        attr_accessor :sites
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @sites = args[:sites] if args.key?(:sites)
        end
      end
      
      # Represents the dimensions of ads, placements, creatives, or creative assets.
      class Size
        include Google::Apis::Core::Hashable
      
        # Height of this size. Acceptable values are 0 to 32767, inclusive.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # IAB standard size. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `iab`
        # @return [Boolean]
        attr_accessor :iab
        alias_method :iab?, :iab
      
        # ID of this size. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#size".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Width of this size. Acceptable values are 0 to 32767, inclusive.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @height = args[:height] if args.key?(:height)
          @iab = args[:iab] if args.key?(:iab)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Size List Response
      class SizesListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#sizesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Size collection.
        # Corresponds to the JSON property `sizes`
        # @return [Array<Google::Apis::DfareportingV3_3::Size>]
        attr_accessor :sizes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @sizes = args[:sizes] if args.key?(:sizes)
        end
      end
      
      # Skippable Settings
      class SkippableSetting
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#skippableSetting".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Video Offset
        # Corresponds to the JSON property `progressOffset`
        # @return [Google::Apis::DfareportingV3_3::VideoOffset]
        attr_accessor :progress_offset
      
        # Video Offset
        # Corresponds to the JSON property `skipOffset`
        # @return [Google::Apis::DfareportingV3_3::VideoOffset]
        attr_accessor :skip_offset
      
        # Whether the user can skip creatives served to this placement.
        # Corresponds to the JSON property `skippable`
        # @return [Boolean]
        attr_accessor :skippable
        alias_method :skippable?, :skippable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @progress_offset = args[:progress_offset] if args.key?(:progress_offset)
          @skip_offset = args[:skip_offset] if args.key?(:skip_offset)
          @skippable = args[:skippable] if args.key?(:skippable)
        end
      end
      
      # Represents a sorted dimension.
      class SortedDimension
        include Google::Apis::Core::Hashable
      
        # The kind of resource this is, in this case dfareporting#sortedDimension.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The name of the dimension.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # An optional sort order for the dimension column.
        # Corresponds to the JSON property `sortOrder`
        # @return [String]
        attr_accessor :sort_order
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @sort_order = args[:sort_order] if args.key?(:sort_order)
        end
      end
      
      # Contains properties of a Campaign Manager subaccount.
      class Subaccount
        include Google::Apis::Core::Hashable
      
        # ID of the account that contains this subaccount. This is a read-only field
        # that can be left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # IDs of the available user role permissions for this subaccount.
        # Corresponds to the JSON property `availablePermissionIds`
        # @return [Array<Fixnum>]
        attr_accessor :available_permission_ids
      
        # ID of this subaccount. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#subaccount".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this subaccount. This is a required field. Must be less than 128
        # characters long and be unique among subaccounts of the same account.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @available_permission_ids = args[:available_permission_ids] if args.key?(:available_permission_ids)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Subaccount List Response
      class SubaccountsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#subaccountsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Subaccount collection.
        # Corresponds to the JSON property `subaccounts`
        # @return [Array<Google::Apis::DfareportingV3_3::Subaccount>]
        attr_accessor :subaccounts
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @subaccounts = args[:subaccounts] if args.key?(:subaccounts)
        end
      end
      
      # Placement Tag Data
      class TagData
        include Google::Apis::Core::Hashable
      
        # Ad associated with this placement tag. Applicable only when format is
        # PLACEMENT_TAG_TRACKING.
        # Corresponds to the JSON property `adId`
        # @return [Fixnum]
        attr_accessor :ad_id
      
        # Tag string to record a click.
        # Corresponds to the JSON property `clickTag`
        # @return [String]
        attr_accessor :click_tag
      
        # Creative associated with this placement tag. Applicable only when format is
        # PLACEMENT_TAG_TRACKING.
        # Corresponds to the JSON property `creativeId`
        # @return [Fixnum]
        attr_accessor :creative_id
      
        # TagData tag format of this tag.
        # Corresponds to the JSON property `format`
        # @return [String]
        attr_accessor :format
      
        # Tag string for serving an ad.
        # Corresponds to the JSON property `impressionTag`
        # @return [String]
        attr_accessor :impression_tag
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ad_id = args[:ad_id] if args.key?(:ad_id)
          @click_tag = args[:click_tag] if args.key?(:click_tag)
          @creative_id = args[:creative_id] if args.key?(:creative_id)
          @format = args[:format] if args.key?(:format)
          @impression_tag = args[:impression_tag] if args.key?(:impression_tag)
        end
      end
      
      # Tag Settings
      class TagSetting
        include Google::Apis::Core::Hashable
      
        # Additional key-values to be included in tags. Each key-value pair must be of
        # the form key=value, and pairs must be separated by a semicolon (;). Keys and
        # values must not contain commas. For example, id=2;color=red is a valid value
        # for this field.
        # Corresponds to the JSON property `additionalKeyValues`
        # @return [String]
        attr_accessor :additional_key_values
      
        # Whether static landing page URLs should be included in the tags. This setting
        # applies only to placements.
        # Corresponds to the JSON property `includeClickThroughUrls`
        # @return [Boolean]
        attr_accessor :include_click_through_urls
        alias_method :include_click_through_urls?, :include_click_through_urls
      
        # Whether click-tracking string should be included in the tags.
        # Corresponds to the JSON property `includeClickTracking`
        # @return [Boolean]
        attr_accessor :include_click_tracking
        alias_method :include_click_tracking?, :include_click_tracking
      
        # Option specifying how keywords are embedded in ad tags. This setting can be
        # used to specify whether keyword placeholders are inserted in placement tags
        # for this site. Publishers can then add keywords to those placeholders.
        # Corresponds to the JSON property `keywordOption`
        # @return [String]
        attr_accessor :keyword_option
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @additional_key_values = args[:additional_key_values] if args.key?(:additional_key_values)
          @include_click_through_urls = args[:include_click_through_urls] if args.key?(:include_click_through_urls)
          @include_click_tracking = args[:include_click_tracking] if args.key?(:include_click_tracking)
          @keyword_option = args[:keyword_option] if args.key?(:keyword_option)
        end
      end
      
      # Dynamic and Image Tag Settings.
      class TagSettings
        include Google::Apis::Core::Hashable
      
        # Whether dynamic floodlight tags are enabled.
        # Corresponds to the JSON property `dynamicTagEnabled`
        # @return [Boolean]
        attr_accessor :dynamic_tag_enabled
        alias_method :dynamic_tag_enabled?, :dynamic_tag_enabled
      
        # Whether image tags are enabled.
        # Corresponds to the JSON property `imageTagEnabled`
        # @return [Boolean]
        attr_accessor :image_tag_enabled
        alias_method :image_tag_enabled?, :image_tag_enabled
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dynamic_tag_enabled = args[:dynamic_tag_enabled] if args.key?(:dynamic_tag_enabled)
          @image_tag_enabled = args[:image_tag_enabled] if args.key?(:image_tag_enabled)
        end
      end
      
      # Target Window.
      class TargetWindow
        include Google::Apis::Core::Hashable
      
        # User-entered value.
        # Corresponds to the JSON property `customHtml`
        # @return [String]
        attr_accessor :custom_html
      
        # Type of browser window for which the backup image of the flash creative can be
        # displayed.
        # Corresponds to the JSON property `targetWindowOption`
        # @return [String]
        attr_accessor :target_window_option
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @custom_html = args[:custom_html] if args.key?(:custom_html)
          @target_window_option = args[:target_window_option] if args.key?(:target_window_option)
        end
      end
      
      # Contains properties of a targetable remarketing list. Remarketing enables you
      # to create lists of users who have performed specific actions on a site, then
      # target ads to members of those lists. This resource is a read-only view of a
      # remarketing list to be used to faciliate targeting ads to specific lists.
      # Remarketing lists that are owned by your advertisers and those that are shared
      # to your advertisers or account are accessible via this resource. To manage
      # remarketing lists that are owned by your advertisers, use the RemarketingLists
      # resource.
      class TargetableRemarketingList
        include Google::Apis::Core::Hashable
      
        # Account ID of this remarketing list. This is a read-only, auto-generated field
        # that is only returned in GET requests.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Whether this targetable remarketing list is active.
        # Corresponds to the JSON property `active`
        # @return [Boolean]
        attr_accessor :active
        alias_method :active?, :active
      
        # Dimension value for the advertiser ID that owns this targetable remarketing
        # list.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `advertiserIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :advertiser_id_dimension_value
      
        # Targetable remarketing list description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Targetable remarketing list ID.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#targetableRemarketingList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Number of days that a user should remain in the targetable remarketing list
        # without an impression.
        # Corresponds to the JSON property `lifeSpan`
        # @return [Fixnum]
        attr_accessor :life_span
      
        # Number of users currently in the list. This is a read-only field.
        # Corresponds to the JSON property `listSize`
        # @return [Fixnum]
        attr_accessor :list_size
      
        # Product from which this targetable remarketing list was originated.
        # Corresponds to the JSON property `listSource`
        # @return [String]
        attr_accessor :list_source
      
        # Name of the targetable remarketing list. Is no greater than 128 characters
        # long.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Subaccount ID of this remarketing list. This is a read-only, auto-generated
        # field that is only returned in GET requests.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @active = args[:active] if args.key?(:active)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_id_dimension_value = args[:advertiser_id_dimension_value] if args.key?(:advertiser_id_dimension_value)
          @description = args[:description] if args.key?(:description)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @life_span = args[:life_span] if args.key?(:life_span)
          @list_size = args[:list_size] if args.key?(:list_size)
          @list_source = args[:list_source] if args.key?(:list_source)
          @name = args[:name] if args.key?(:name)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
        end
      end
      
      # Targetable remarketing list response
      class TargetableRemarketingListsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#targetableRemarketingListsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Targetable remarketing list collection.
        # Corresponds to the JSON property `targetableRemarketingLists`
        # @return [Array<Google::Apis::DfareportingV3_3::TargetableRemarketingList>]
        attr_accessor :targetable_remarketing_lists
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @targetable_remarketing_lists = args[:targetable_remarketing_lists] if args.key?(:targetable_remarketing_lists)
        end
      end
      
      # Contains properties of a targeting template. A targeting template encapsulates
      # targeting information which can be reused across multiple ads.
      class TargetingTemplate
        include Google::Apis::Core::Hashable
      
        # Account ID of this targeting template. This field, if left unset, will be auto-
        # generated on insert and is read-only after insert.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Advertiser ID of this targeting template. This is a required field on insert
        # and is read-only after insert.
        # Corresponds to the JSON property `advertiserId`
        # @return [Fixnum]
        attr_accessor :advertiser_id
      
        # Represents a DimensionValue resource.
        # Corresponds to the JSON property `advertiserIdDimensionValue`
        # @return [Google::Apis::DfareportingV3_3::DimensionValue]
        attr_accessor :advertiser_id_dimension_value
      
        # Day Part Targeting.
        # Corresponds to the JSON property `dayPartTargeting`
        # @return [Google::Apis::DfareportingV3_3::DayPartTargeting]
        attr_accessor :day_part_targeting
      
        # Geographical Targeting.
        # Corresponds to the JSON property `geoTargeting`
        # @return [Google::Apis::DfareportingV3_3::GeoTargeting]
        attr_accessor :geo_targeting
      
        # ID of this targeting template. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Key Value Targeting Expression.
        # Corresponds to the JSON property `keyValueTargetingExpression`
        # @return [Google::Apis::DfareportingV3_3::KeyValueTargetingExpression]
        attr_accessor :key_value_targeting_expression
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#targetingTemplate".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Language Targeting.
        # Corresponds to the JSON property `languageTargeting`
        # @return [Google::Apis::DfareportingV3_3::LanguageTargeting]
        attr_accessor :language_targeting
      
        # Remarketing List Targeting Expression.
        # Corresponds to the JSON property `listTargetingExpression`
        # @return [Google::Apis::DfareportingV3_3::ListTargetingExpression]
        attr_accessor :list_targeting_expression
      
        # Name of this targeting template. This field is required. It must be less than
        # 256 characters long and unique within an advertiser.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Subaccount ID of this targeting template. This field, if left unset, will be
        # auto-generated on insert and is read-only after insert.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        # Technology Targeting.
        # Corresponds to the JSON property `technologyTargeting`
        # @return [Google::Apis::DfareportingV3_3::TechnologyTargeting]
        attr_accessor :technology_targeting
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_id_dimension_value = args[:advertiser_id_dimension_value] if args.key?(:advertiser_id_dimension_value)
          @day_part_targeting = args[:day_part_targeting] if args.key?(:day_part_targeting)
          @geo_targeting = args[:geo_targeting] if args.key?(:geo_targeting)
          @id = args[:id] if args.key?(:id)
          @key_value_targeting_expression = args[:key_value_targeting_expression] if args.key?(:key_value_targeting_expression)
          @kind = args[:kind] if args.key?(:kind)
          @language_targeting = args[:language_targeting] if args.key?(:language_targeting)
          @list_targeting_expression = args[:list_targeting_expression] if args.key?(:list_targeting_expression)
          @name = args[:name] if args.key?(:name)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
          @technology_targeting = args[:technology_targeting] if args.key?(:technology_targeting)
        end
      end
      
      # Targeting Template List Response
      class TargetingTemplatesListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#targetingTemplatesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Targeting template collection.
        # Corresponds to the JSON property `targetingTemplates`
        # @return [Array<Google::Apis::DfareportingV3_3::TargetingTemplate>]
        attr_accessor :targeting_templates
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @targeting_templates = args[:targeting_templates] if args.key?(:targeting_templates)
        end
      end
      
      # Technology Targeting.
      class TechnologyTargeting
        include Google::Apis::Core::Hashable
      
        # Browsers that this ad targets. For each browser either set browserVersionId or
        # dartId along with the version numbers. If both are specified, only
        # browserVersionId will be used. The other fields are populated automatically
        # when the ad is inserted or updated.
        # Corresponds to the JSON property `browsers`
        # @return [Array<Google::Apis::DfareportingV3_3::Browser>]
        attr_accessor :browsers
      
        # Connection types that this ad targets. For each connection type only id is
        # required. The other fields are populated automatically when the ad is inserted
        # or updated.
        # Corresponds to the JSON property `connectionTypes`
        # @return [Array<Google::Apis::DfareportingV3_3::ConnectionType>]
        attr_accessor :connection_types
      
        # Mobile carriers that this ad targets. For each mobile carrier only id is
        # required, and the other fields are populated automatically when the ad is
        # inserted or updated. If targeting a mobile carrier, do not set targeting for
        # any zip codes.
        # Corresponds to the JSON property `mobileCarriers`
        # @return [Array<Google::Apis::DfareportingV3_3::MobileCarrier>]
        attr_accessor :mobile_carriers
      
        # Operating system versions that this ad targets. To target all versions, use
        # operatingSystems. For each operating system version, only id is required. The
        # other fields are populated automatically when the ad is inserted or updated.
        # If targeting an operating system version, do not set targeting for the
        # corresponding operating system in operatingSystems.
        # Corresponds to the JSON property `operatingSystemVersions`
        # @return [Array<Google::Apis::DfareportingV3_3::OperatingSystemVersion>]
        attr_accessor :operating_system_versions
      
        # Operating systems that this ad targets. To target specific versions, use
        # operatingSystemVersions. For each operating system only dartId is required.
        # The other fields are populated automatically when the ad is inserted or
        # updated. If targeting an operating system, do not set targeting for operating
        # system versions for the same operating system.
        # Corresponds to the JSON property `operatingSystems`
        # @return [Array<Google::Apis::DfareportingV3_3::OperatingSystem>]
        attr_accessor :operating_systems
      
        # Platform types that this ad targets. For example, desktop, mobile, or tablet.
        # For each platform type, only id is required, and the other fields are
        # populated automatically when the ad is inserted or updated.
        # Corresponds to the JSON property `platformTypes`
        # @return [Array<Google::Apis::DfareportingV3_3::PlatformType>]
        attr_accessor :platform_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @browsers = args[:browsers] if args.key?(:browsers)
          @connection_types = args[:connection_types] if args.key?(:connection_types)
          @mobile_carriers = args[:mobile_carriers] if args.key?(:mobile_carriers)
          @operating_system_versions = args[:operating_system_versions] if args.key?(:operating_system_versions)
          @operating_systems = args[:operating_systems] if args.key?(:operating_systems)
          @platform_types = args[:platform_types] if args.key?(:platform_types)
        end
      end
      
      # Third Party Authentication Token
      class ThirdPartyAuthenticationToken
        include Google::Apis::Core::Hashable
      
        # Name of the third-party authentication token.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Value of the third-party authentication token. This is a read-only, auto-
        # generated field.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Third-party Tracking URL.
      class ThirdPartyTrackingUrl
        include Google::Apis::Core::Hashable
      
        # Third-party URL type for in-stream video and in-stream audio creatives.
        # Corresponds to the JSON property `thirdPartyUrlType`
        # @return [String]
        attr_accessor :third_party_url_type
      
        # URL for the specified third-party URL type.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @third_party_url_type = args[:third_party_url_type] if args.key?(:third_party_url_type)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Transcode Settings
      class TranscodeSetting
        include Google::Apis::Core::Hashable
      
        # Whitelist of video formats to be served to this placement. Set this list to
        # null or empty to serve all video formats.
        # Corresponds to the JSON property `enabledVideoFormats`
        # @return [Array<Fixnum>]
        attr_accessor :enabled_video_formats
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#transcodeSetting".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enabled_video_formats = args[:enabled_video_formats] if args.key?(:enabled_video_formats)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # A Universal Ad ID as per the VAST 4.0 spec. Applicable to the following
      # creative types: INSTREAM_AUDIO, INSTREAM_VIDEO and VPAID.
      class UniversalAdId
        include Google::Apis::Core::Hashable
      
        # Registry used for the Ad ID value.
        # Corresponds to the JSON property `registry`
        # @return [String]
        attr_accessor :registry
      
        # ID value for this creative. Only alphanumeric characters and the following
        # symbols are valid: "_/\-". Maximum length is 64 characters. Read only when
        # registry is DCM.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @registry = args[:registry] if args.key?(:registry)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # User Defined Variable configuration.
      class UserDefinedVariableConfiguration
        include Google::Apis::Core::Hashable
      
        # Data type for the variable. This is a required field.
        # Corresponds to the JSON property `dataType`
        # @return [String]
        attr_accessor :data_type
      
        # User-friendly name for the variable which will appear in reports. This is a
        # required field, must be less than 64 characters long, and cannot contain the
        # following characters: ""<>".
        # Corresponds to the JSON property `reportName`
        # @return [String]
        attr_accessor :report_name
      
        # Variable name in the tag. This is a required field.
        # Corresponds to the JSON property `variableType`
        # @return [String]
        attr_accessor :variable_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data_type = args[:data_type] if args.key?(:data_type)
          @report_name = args[:report_name] if args.key?(:report_name)
          @variable_type = args[:variable_type] if args.key?(:variable_type)
        end
      end
      
      # Represents a UserProfile resource.
      class UserProfile
        include Google::Apis::Core::Hashable
      
        # The account ID to which this profile belongs.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # The account name this profile belongs to.
        # Corresponds to the JSON property `accountName`
        # @return [String]
        attr_accessor :account_name
      
        # The eTag of this response for caching purposes.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The kind of resource this is, in this case dfareporting#userProfile.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The unique ID of the user profile.
        # Corresponds to the JSON property `profileId`
        # @return [Fixnum]
        attr_accessor :profile_id
      
        # The sub account ID this profile belongs to if applicable.
        # Corresponds to the JSON property `subAccountId`
        # @return [Fixnum]
        attr_accessor :sub_account_id
      
        # The sub account name this profile belongs to if applicable.
        # Corresponds to the JSON property `subAccountName`
        # @return [String]
        attr_accessor :sub_account_name
      
        # The user name.
        # Corresponds to the JSON property `userName`
        # @return [String]
        attr_accessor :user_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @account_name = args[:account_name] if args.key?(:account_name)
          @etag = args[:etag] if args.key?(:etag)
          @kind = args[:kind] if args.key?(:kind)
          @profile_id = args[:profile_id] if args.key?(:profile_id)
          @sub_account_id = args[:sub_account_id] if args.key?(:sub_account_id)
          @sub_account_name = args[:sub_account_name] if args.key?(:sub_account_name)
          @user_name = args[:user_name] if args.key?(:user_name)
        end
      end
      
      # Represents the list of user profiles.
      class UserProfileList
        include Google::Apis::Core::Hashable
      
        # The eTag of this response for caching purposes.
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # The user profiles returned in this response.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::DfareportingV3_3::UserProfile>]
        attr_accessor :items
      
        # The kind of list this is, in this case dfareporting#userProfileList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @etag = args[:etag] if args.key?(:etag)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # Contains properties of auser role, which is used to manage user access.
      class UserRole
        include Google::Apis::Core::Hashable
      
        # Account ID of this user role. This is a read-only field that can be left blank.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Whether this is a default user role. Default user roles are created by the
        # system for the account/subaccount and cannot be modified or deleted. Each
        # default user role comes with a basic set of preassigned permissions.
        # Corresponds to the JSON property `defaultUserRole`
        # @return [Boolean]
        attr_accessor :default_user_role
        alias_method :default_user_role?, :default_user_role
      
        # ID of this user role. This is a read-only, auto-generated field.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#userRole".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this user role. This is a required field. Must be less than 256
        # characters long. If this user role is under a subaccount, the name must be
        # unique among sites of the same subaccount. Otherwise, this user role is a top-
        # level user role, and the name must be unique among top-level user roles of the
        # same account.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # ID of the user role that this user role is based on or copied from. This is a
        # required field.
        # Corresponds to the JSON property `parentUserRoleId`
        # @return [Fixnum]
        attr_accessor :parent_user_role_id
      
        # List of permissions associated with this user role.
        # Corresponds to the JSON property `permissions`
        # @return [Array<Google::Apis::DfareportingV3_3::UserRolePermission>]
        attr_accessor :permissions
      
        # Subaccount ID of this user role. This is a read-only field that can be left
        # blank.
        # Corresponds to the JSON property `subaccountId`
        # @return [Fixnum]
        attr_accessor :subaccount_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @default_user_role = args[:default_user_role] if args.key?(:default_user_role)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @parent_user_role_id = args[:parent_user_role_id] if args.key?(:parent_user_role_id)
          @permissions = args[:permissions] if args.key?(:permissions)
          @subaccount_id = args[:subaccount_id] if args.key?(:subaccount_id)
        end
      end
      
      # Contains properties of a user role permission.
      class UserRolePermission
        include Google::Apis::Core::Hashable
      
        # Levels of availability for a user role permission.
        # Corresponds to the JSON property `availability`
        # @return [String]
        attr_accessor :availability
      
        # ID of this user role permission.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#userRolePermission".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this user role permission.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # ID of the permission group that this user role permission belongs to.
        # Corresponds to the JSON property `permissionGroupId`
        # @return [Fixnum]
        attr_accessor :permission_group_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @availability = args[:availability] if args.key?(:availability)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @permission_group_id = args[:permission_group_id] if args.key?(:permission_group_id)
        end
      end
      
      # Represents a grouping of related user role permissions.
      class UserRolePermissionGroup
        include Google::Apis::Core::Hashable
      
        # ID of this user role permission.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#userRolePermissionGroup".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name of this user role permission group.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # User Role Permission Group List Response
      class UserRolePermissionGroupsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#userRolePermissionGroupsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # User role permission group collection.
        # Corresponds to the JSON property `userRolePermissionGroups`
        # @return [Array<Google::Apis::DfareportingV3_3::UserRolePermissionGroup>]
        attr_accessor :user_role_permission_groups
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @user_role_permission_groups = args[:user_role_permission_groups] if args.key?(:user_role_permission_groups)
        end
      end
      
      # User Role Permission List Response
      class UserRolePermissionsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#userRolePermissionsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # User role permission collection.
        # Corresponds to the JSON property `userRolePermissions`
        # @return [Array<Google::Apis::DfareportingV3_3::UserRolePermission>]
        attr_accessor :user_role_permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @user_role_permissions = args[:user_role_permissions] if args.key?(:user_role_permissions)
        end
      end
      
      # User Role List Response
      class UserRolesListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#userRolesListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Pagination token to be used for the next list operation.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # User role collection.
        # Corresponds to the JSON property `userRoles`
        # @return [Array<Google::Apis::DfareportingV3_3::UserRole>]
        attr_accessor :user_roles
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @user_roles = args[:user_roles] if args.key?(:user_roles)
        end
      end
      
      # Contains information about supported video formats.
      class VideoFormat
        include Google::Apis::Core::Hashable
      
        # File type of the video format.
        # Corresponds to the JSON property `fileType`
        # @return [String]
        attr_accessor :file_type
      
        # ID of the video format.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#videoFormat".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Represents the dimensions of ads, placements, creatives, or creative assets.
        # Corresponds to the JSON property `resolution`
        # @return [Google::Apis::DfareportingV3_3::Size]
        attr_accessor :resolution
      
        # The target bit rate of this video format.
        # Corresponds to the JSON property `targetBitRate`
        # @return [Fixnum]
        attr_accessor :target_bit_rate
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file_type = args[:file_type] if args.key?(:file_type)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @resolution = args[:resolution] if args.key?(:resolution)
          @target_bit_rate = args[:target_bit_rate] if args.key?(:target_bit_rate)
        end
      end
      
      # Video Format List Response
      class VideoFormatsListResponse
        include Google::Apis::Core::Hashable
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#videoFormatsListResponse".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Video format collection.
        # Corresponds to the JSON property `videoFormats`
        # @return [Array<Google::Apis::DfareportingV3_3::VideoFormat>]
        attr_accessor :video_formats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @video_formats = args[:video_formats] if args.key?(:video_formats)
        end
      end
      
      # Video Offset
      class VideoOffset
        include Google::Apis::Core::Hashable
      
        # Duration, as a percentage of video duration. Do not set when offsetSeconds is
        # set. Acceptable values are 0 to 100, inclusive.
        # Corresponds to the JSON property `offsetPercentage`
        # @return [Fixnum]
        attr_accessor :offset_percentage
      
        # Duration, in seconds. Do not set when offsetPercentage is set. Acceptable
        # values are 0 to 86399, inclusive.
        # Corresponds to the JSON property `offsetSeconds`
        # @return [Fixnum]
        attr_accessor :offset_seconds
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @offset_percentage = args[:offset_percentage] if args.key?(:offset_percentage)
          @offset_seconds = args[:offset_seconds] if args.key?(:offset_seconds)
        end
      end
      
      # Video Settings
      class VideoSettings
        include Google::Apis::Core::Hashable
      
        # Companion Settings
        # Corresponds to the JSON property `companionSettings`
        # @return [Google::Apis::DfareportingV3_3::CompanionSetting]
        attr_accessor :companion_settings
      
        # Identifies what kind of resource this is. Value: the fixed string "
        # dfareporting#videoSettings".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Orientation of a video placement. If this value is set, placement will return
        # assets matching the specified orientation.
        # Corresponds to the JSON property `orientation`
        # @return [String]
        attr_accessor :orientation
      
        # Skippable Settings
        # Corresponds to the JSON property `skippableSettings`
        # @return [Google::Apis::DfareportingV3_3::SkippableSetting]
        attr_accessor :skippable_settings
      
        # Transcode Settings
        # Corresponds to the JSON property `transcodeSettings`
        # @return [Google::Apis::DfareportingV3_3::TranscodeSetting]
        attr_accessor :transcode_settings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @companion_settings = args[:companion_settings] if args.key?(:companion_settings)
          @kind = args[:kind] if args.key?(:kind)
          @orientation = args[:orientation] if args.key?(:orientation)
          @skippable_settings = args[:skippable_settings] if args.key?(:skippable_settings)
          @transcode_settings = args[:transcode_settings] if args.key?(:transcode_settings)
        end
      end
    end
  end
end
