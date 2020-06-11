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
    module AdexchangebuyerV1_3
      
      class Account
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class BidderLocation
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AccountsList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BillingInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BillingInfoList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Budget
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Creative
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class AdTechnologyProviders
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Correction
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class DisapprovalReason
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class FilteringReasons
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Reason
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class NativeAd
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class AppIcon
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Image
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Logo
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativesList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DirectDeal
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DirectDealsList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PerformanceReport
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PerformanceReportList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PretargetingConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Dimension
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class ExcludedPlacement
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Placement
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PretargetingConfigList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Account
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bidder_location, as: 'bidderLocation', class: Google::Apis::AdexchangebuyerV1_3::Account::BidderLocation, decorator: Google::Apis::AdexchangebuyerV1_3::Account::BidderLocation::Representation
      
          property :cookie_matching_nid, as: 'cookieMatchingNid'
          property :cookie_matching_url, as: 'cookieMatchingUrl'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :maximum_active_creatives, as: 'maximumActiveCreatives'
          property :maximum_total_qps, as: 'maximumTotalQps'
          property :number_active_creatives, as: 'numberActiveCreatives'
        end
        
        class BidderLocation
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :maximum_qps, as: 'maximumQps'
            property :region, as: 'region'
            property :url, as: 'url'
          end
        end
      end
      
      class AccountsList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AdexchangebuyerV1_3::Account, decorator: Google::Apis::AdexchangebuyerV1_3::Account::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class BillingInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :account_name, as: 'accountName'
          collection :billing_id, as: 'billingId'
          property :kind, as: 'kind'
        end
      end
      
      class BillingInfoList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AdexchangebuyerV1_3::BillingInfo, decorator: Google::Apis::AdexchangebuyerV1_3::BillingInfo::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Budget
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, :numeric_string => true, as: 'accountId'
          property :billing_id, :numeric_string => true, as: 'billingId'
          property :budget_amount, :numeric_string => true, as: 'budgetAmount'
          property :currency_code, as: 'currencyCode'
          property :id, as: 'id'
          property :kind, as: 'kind'
        end
      end
      
      class Creative
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :html_snippet, as: 'HTMLSnippet'
          property :account_id, as: 'accountId'
          property :ad_technology_providers, as: 'adTechnologyProviders', class: Google::Apis::AdexchangebuyerV1_3::Creative::AdTechnologyProviders, decorator: Google::Apis::AdexchangebuyerV1_3::Creative::AdTechnologyProviders::Representation
      
          collection :advertiser_id, as: 'advertiserId'
          property :advertiser_name, as: 'advertiserName'
          property :agency_id, :numeric_string => true, as: 'agencyId'
          property :api_upload_timestamp, as: 'apiUploadTimestamp', type: DateTime
      
          collection :attribute, as: 'attribute'
          property :buyer_creative_id, as: 'buyerCreativeId'
          collection :click_through_url, as: 'clickThroughUrl'
          collection :corrections, as: 'corrections', class: Google::Apis::AdexchangebuyerV1_3::Creative::Correction, decorator: Google::Apis::AdexchangebuyerV1_3::Creative::Correction::Representation
      
          collection :disapproval_reasons, as: 'disapprovalReasons', class: Google::Apis::AdexchangebuyerV1_3::Creative::DisapprovalReason, decorator: Google::Apis::AdexchangebuyerV1_3::Creative::DisapprovalReason::Representation
      
          property :filtering_reasons, as: 'filteringReasons', class: Google::Apis::AdexchangebuyerV1_3::Creative::FilteringReasons, decorator: Google::Apis::AdexchangebuyerV1_3::Creative::FilteringReasons::Representation
      
          property :height, as: 'height'
          collection :impression_tracking_url, as: 'impressionTrackingUrl'
          property :kind, as: 'kind'
          property :native_ad, as: 'nativeAd', class: Google::Apis::AdexchangebuyerV1_3::Creative::NativeAd, decorator: Google::Apis::AdexchangebuyerV1_3::Creative::NativeAd::Representation
      
          collection :product_categories, as: 'productCategories'
          collection :restricted_categories, as: 'restrictedCategories'
          collection :sensitive_categories, as: 'sensitiveCategories'
          property :status, as: 'status'
          collection :vendor_type, as: 'vendorType'
          property :version, as: 'version'
          property :video_url, as: 'videoURL'
          property :width, as: 'width'
        end
        
        class AdTechnologyProviders
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :detected_provider_ids, as: 'detectedProviderIds'
            property :has_unidentified_provider, as: 'hasUnidentifiedProvider'
          end
        end
        
        class Correction
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :details, as: 'details'
            property :reason, as: 'reason'
          end
        end
        
        class DisapprovalReason
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :details, as: 'details'
            property :reason, as: 'reason'
          end
        end
        
        class FilteringReasons
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :date, as: 'date'
            collection :reasons, as: 'reasons', class: Google::Apis::AdexchangebuyerV1_3::Creative::FilteringReasons::Reason, decorator: Google::Apis::AdexchangebuyerV1_3::Creative::FilteringReasons::Reason::Representation
        
          end
          
          class Reason
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :filtering_count, :numeric_string => true, as: 'filteringCount'
              property :filtering_status, as: 'filteringStatus'
            end
          end
        end
        
        class NativeAd
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :advertiser, as: 'advertiser'
            property :app_icon, as: 'appIcon', class: Google::Apis::AdexchangebuyerV1_3::Creative::NativeAd::AppIcon, decorator: Google::Apis::AdexchangebuyerV1_3::Creative::NativeAd::AppIcon::Representation
        
            property :body, as: 'body'
            property :call_to_action, as: 'callToAction'
            property :click_tracking_url, as: 'clickTrackingUrl'
            property :headline, as: 'headline'
            property :image, as: 'image', class: Google::Apis::AdexchangebuyerV1_3::Creative::NativeAd::Image, decorator: Google::Apis::AdexchangebuyerV1_3::Creative::NativeAd::Image::Representation
        
            collection :impression_tracking_url, as: 'impressionTrackingUrl'
            property :logo, as: 'logo', class: Google::Apis::AdexchangebuyerV1_3::Creative::NativeAd::Logo, decorator: Google::Apis::AdexchangebuyerV1_3::Creative::NativeAd::Logo::Representation
        
            property :price, as: 'price'
            property :star_rating, as: 'starRating'
          end
          
          class AppIcon
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :height, as: 'height'
              property :url, as: 'url'
              property :width, as: 'width'
            end
          end
          
          class Image
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :height, as: 'height'
              property :url, as: 'url'
              property :width, as: 'width'
            end
          end
          
          class Logo
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :height, as: 'height'
              property :url, as: 'url'
              property :width, as: 'width'
            end
          end
        end
      end
      
      class CreativesList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AdexchangebuyerV1_3::Creative, decorator: Google::Apis::AdexchangebuyerV1_3::Creative::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class DirectDeal
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :advertiser, as: 'advertiser'
          property :allows_alcohol, as: 'allowsAlcohol'
          property :buyer_account_id, :numeric_string => true, as: 'buyerAccountId'
          property :currency_code, as: 'currencyCode'
          property :deal_tier, as: 'dealTier'
          property :end_time, :numeric_string => true, as: 'endTime'
          property :fixed_cpm, :numeric_string => true, as: 'fixedCpm'
          property :id, :numeric_string => true, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :private_exchange_min_cpm, :numeric_string => true, as: 'privateExchangeMinCpm'
          property :publisher_blocks_overriden, as: 'publisherBlocksOverriden'
          property :seller_network, as: 'sellerNetwork'
          property :start_time, :numeric_string => true, as: 'startTime'
        end
      end
      
      class DirectDealsList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :direct_deals, as: 'directDeals', class: Google::Apis::AdexchangebuyerV1_3::DirectDeal, decorator: Google::Apis::AdexchangebuyerV1_3::DirectDeal::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class PerformanceReport
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bid_rate, as: 'bidRate'
          property :bid_request_rate, as: 'bidRequestRate'
          collection :callout_status_rate, as: 'calloutStatusRate'
          collection :cookie_matcher_status_rate, as: 'cookieMatcherStatusRate'
          collection :creative_status_rate, as: 'creativeStatusRate'
          property :filtered_bid_rate, as: 'filteredBidRate'
          collection :hosted_match_status_rate, as: 'hostedMatchStatusRate'
          property :inventory_match_rate, as: 'inventoryMatchRate'
          property :kind, as: 'kind'
          property :latency_50th_percentile, as: 'latency50thPercentile'
          property :latency_85th_percentile, as: 'latency85thPercentile'
          property :latency_95th_percentile, as: 'latency95thPercentile'
          property :no_quota_in_region, as: 'noQuotaInRegion'
          property :out_of_quota, as: 'outOfQuota'
          property :pixel_match_requests, as: 'pixelMatchRequests'
          property :pixel_match_responses, as: 'pixelMatchResponses'
          property :quota_configured_limit, as: 'quotaConfiguredLimit'
          property :quota_throttled_limit, as: 'quotaThrottledLimit'
          property :region, as: 'region'
          property :successful_request_rate, as: 'successfulRequestRate'
          property :timestamp, :numeric_string => true, as: 'timestamp'
          property :unsuccessful_request_rate, as: 'unsuccessfulRequestRate'
        end
      end
      
      class PerformanceReportList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :performance_report, as: 'performanceReport', class: Google::Apis::AdexchangebuyerV1_3::PerformanceReport, decorator: Google::Apis::AdexchangebuyerV1_3::PerformanceReport::Representation
      
        end
      end
      
      class PretargetingConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :billing_id, :numeric_string => true, as: 'billingId'
          property :config_id, :numeric_string => true, as: 'configId'
          property :config_name, as: 'configName'
          collection :creative_type, as: 'creativeType'
          collection :dimensions, as: 'dimensions', class: Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Dimension, decorator: Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Dimension::Representation
      
          collection :excluded_content_labels, as: 'excludedContentLabels'
          collection :excluded_geo_criteria_ids, as: 'excludedGeoCriteriaIds'
          collection :excluded_placements, as: 'excludedPlacements', class: Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::ExcludedPlacement, decorator: Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::ExcludedPlacement::Representation
      
          collection :excluded_user_lists, as: 'excludedUserLists'
          collection :excluded_verticals, as: 'excludedVerticals'
          collection :geo_criteria_ids, as: 'geoCriteriaIds'
          property :is_active, as: 'isActive'
          property :kind, as: 'kind'
          collection :languages, as: 'languages'
          collection :mobile_carriers, as: 'mobileCarriers'
          collection :mobile_devices, as: 'mobileDevices'
          collection :mobile_operating_system_versions, as: 'mobileOperatingSystemVersions'
          collection :placements, as: 'placements', class: Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Placement, decorator: Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Placement::Representation
      
          collection :platforms, as: 'platforms'
          collection :supported_creative_attributes, as: 'supportedCreativeAttributes'
          collection :user_lists, as: 'userLists'
          collection :vendor_types, as: 'vendorTypes'
          collection :verticals, as: 'verticals'
        end
        
        class Dimension
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :height, :numeric_string => true, as: 'height'
            property :width, :numeric_string => true, as: 'width'
          end
        end
        
        class ExcludedPlacement
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :token, as: 'token'
            property :type, as: 'type'
          end
        end
        
        class Placement
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :token, as: 'token'
            property :type, as: 'type'
          end
        end
      end
      
      class PretargetingConfigList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AdexchangebuyerV1_3::PretargetingConfig, decorator: Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Representation
      
          property :kind, as: 'kind'
        end
      end
    end
  end
end
