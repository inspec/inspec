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
    module AdexchangebuyerV1_4
      
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
      
      class AddOrderDealsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AddOrderDealsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AddOrderNotesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AddOrderNotesResponse
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
      
      class Buyer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContactInformation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateOrdersRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateOrdersResponse
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
          
          class Context
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
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
        
        class ServingRestriction
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Context
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class DisapprovalReason
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativeDealIds
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class DealStatus
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativesList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DealServingMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DealServingMetadataDealPauseStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DealTerms
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DealTermsGuaranteedFixedPriceTerms
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DealTermsGuaranteedFixedPriceTermsBillingInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DealTermsNonGuaranteedAuctionTerms
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DealTermsNonGuaranteedFixedPriceTerms
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DealTermsRubiconNonGuaranteedTerms
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteOrderDealsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteOrderDealsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeliveryControl
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeliveryControlFrequencyCap
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Dimension
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DimensionDimensionValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EditAllOrderDealsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EditAllOrderDealsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetOffersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetOrderDealsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetOrderNotesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetOrdersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetPublisherProfilesByAccountIdResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MarketplaceDeal
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MarketplaceDealParty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MarketplaceLabel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MarketplaceNote
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
        
        class VideoPlayerSize
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PretargetingConfigList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Price
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PricePerBuyer
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PrivateData
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Product
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Proposal
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublisherProfileApiProto
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublisherProvidedForecast
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Seller
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SharedTargeting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetingValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetingValueCreativeSize
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetingValueDayPartTargeting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetingValueDayPartTargetingDayPart
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetingValueDemogAgeCriteria
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetingValueDemogGenderCriteria
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TargetingValueSize
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UpdatePrivateAuctionProposalRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Account
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :apply_pretargeting_to_non_guaranteed_deals, as: 'applyPretargetingToNonGuaranteedDeals'
          collection :bidder_location, as: 'bidderLocation', class: Google::Apis::AdexchangebuyerV1_4::Account::BidderLocation, decorator: Google::Apis::AdexchangebuyerV1_4::Account::BidderLocation::Representation
      
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
            property :bid_protocol, as: 'bidProtocol'
            property :maximum_qps, as: 'maximumQps'
            property :region, as: 'region'
            property :url, as: 'url'
          end
        end
      end
      
      class AccountsList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AdexchangebuyerV1_4::Account, decorator: Google::Apis::AdexchangebuyerV1_4::Account::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class AddOrderDealsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deals, as: 'deals', class: Google::Apis::AdexchangebuyerV1_4::MarketplaceDeal, decorator: Google::Apis::AdexchangebuyerV1_4::MarketplaceDeal::Representation
      
          property :proposal_revision_number, :numeric_string => true, as: 'proposalRevisionNumber'
          property :update_action, as: 'updateAction'
        end
      end
      
      class AddOrderDealsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deals, as: 'deals', class: Google::Apis::AdexchangebuyerV1_4::MarketplaceDeal, decorator: Google::Apis::AdexchangebuyerV1_4::MarketplaceDeal::Representation
      
          property :proposal_revision_number, :numeric_string => true, as: 'proposalRevisionNumber'
        end
      end
      
      class AddOrderNotesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :notes, as: 'notes', class: Google::Apis::AdexchangebuyerV1_4::MarketplaceNote, decorator: Google::Apis::AdexchangebuyerV1_4::MarketplaceNote::Representation
      
        end
      end
      
      class AddOrderNotesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :notes, as: 'notes', class: Google::Apis::AdexchangebuyerV1_4::MarketplaceNote, decorator: Google::Apis::AdexchangebuyerV1_4::MarketplaceNote::Representation
      
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
          collection :items, as: 'items', class: Google::Apis::AdexchangebuyerV1_4::BillingInfo, decorator: Google::Apis::AdexchangebuyerV1_4::BillingInfo::Representation
      
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
      
      class Buyer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
        end
      end
      
      class ContactInformation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :name, as: 'name'
        end
      end
      
      class CreateOrdersRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :proposals, as: 'proposals', class: Google::Apis::AdexchangebuyerV1_4::Proposal, decorator: Google::Apis::AdexchangebuyerV1_4::Proposal::Representation
      
          property :web_property_code, as: 'webPropertyCode'
        end
      end
      
      class CreateOrdersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :proposals, as: 'proposals', class: Google::Apis::AdexchangebuyerV1_4::Proposal, decorator: Google::Apis::AdexchangebuyerV1_4::Proposal::Representation
      
        end
      end
      
      class Creative
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :html_snippet, as: 'HTMLSnippet'
          property :account_id, as: 'accountId'
          property :ad_choices_destination_url, as: 'adChoicesDestinationUrl'
          property :ad_technology_providers, as: 'adTechnologyProviders', class: Google::Apis::AdexchangebuyerV1_4::Creative::AdTechnologyProviders, decorator: Google::Apis::AdexchangebuyerV1_4::Creative::AdTechnologyProviders::Representation
      
          collection :advertiser_id, as: 'advertiserId'
          property :advertiser_name, as: 'advertiserName'
          property :agency_id, :numeric_string => true, as: 'agencyId'
          property :api_upload_timestamp, as: 'apiUploadTimestamp', type: DateTime
      
          collection :attribute, as: 'attribute'
          property :buyer_creative_id, as: 'buyerCreativeId'
          collection :click_through_url, as: 'clickThroughUrl'
          collection :corrections, as: 'corrections', class: Google::Apis::AdexchangebuyerV1_4::Creative::Correction, decorator: Google::Apis::AdexchangebuyerV1_4::Creative::Correction::Representation
      
          property :creative_status_identity_type, as: 'creativeStatusIdentityType'
          property :deals_status, as: 'dealsStatus'
          collection :detected_domains, as: 'detectedDomains'
          property :filtering_reasons, as: 'filteringReasons', class: Google::Apis::AdexchangebuyerV1_4::Creative::FilteringReasons, decorator: Google::Apis::AdexchangebuyerV1_4::Creative::FilteringReasons::Representation
      
          property :height, as: 'height'
          collection :impression_tracking_url, as: 'impressionTrackingUrl'
          property :kind, as: 'kind'
          collection :languages, as: 'languages'
          property :native_ad, as: 'nativeAd', class: Google::Apis::AdexchangebuyerV1_4::Creative::NativeAd, decorator: Google::Apis::AdexchangebuyerV1_4::Creative::NativeAd::Representation
      
          property :open_auction_status, as: 'openAuctionStatus'
          collection :product_categories, as: 'productCategories'
          collection :restricted_categories, as: 'restrictedCategories'
          collection :sensitive_categories, as: 'sensitiveCategories'
          collection :serving_restrictions, as: 'servingRestrictions', class: Google::Apis::AdexchangebuyerV1_4::Creative::ServingRestriction, decorator: Google::Apis::AdexchangebuyerV1_4::Creative::ServingRestriction::Representation
      
          collection :vendor_type, as: 'vendorType'
          property :version, as: 'version'
          property :video_url, as: 'videoURL'
          property :video_vast_xml, as: 'videoVastXML'
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
            collection :contexts, as: 'contexts', class: Google::Apis::AdexchangebuyerV1_4::Creative::Correction::Context, decorator: Google::Apis::AdexchangebuyerV1_4::Creative::Correction::Context::Representation
        
            collection :details, as: 'details'
            property :reason, as: 'reason'
          end
          
          class Context
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              collection :auction_type, as: 'auctionType'
              property :context_type, as: 'contextType'
              collection :geo_criteria_id, as: 'geoCriteriaId'
              collection :platform, as: 'platform'
            end
          end
        end
        
        class FilteringReasons
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :date, as: 'date'
            collection :reasons, as: 'reasons', class: Google::Apis::AdexchangebuyerV1_4::Creative::FilteringReasons::Reason, decorator: Google::Apis::AdexchangebuyerV1_4::Creative::FilteringReasons::Reason::Representation
        
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
            property :app_icon, as: 'appIcon', class: Google::Apis::AdexchangebuyerV1_4::Creative::NativeAd::AppIcon, decorator: Google::Apis::AdexchangebuyerV1_4::Creative::NativeAd::AppIcon::Representation
        
            property :body, as: 'body'
            property :call_to_action, as: 'callToAction'
            property :click_link_url, as: 'clickLinkUrl'
            property :click_tracking_url, as: 'clickTrackingUrl'
            property :headline, as: 'headline'
            property :image, as: 'image', class: Google::Apis::AdexchangebuyerV1_4::Creative::NativeAd::Image, decorator: Google::Apis::AdexchangebuyerV1_4::Creative::NativeAd::Image::Representation
        
            collection :impression_tracking_url, as: 'impressionTrackingUrl'
            property :logo, as: 'logo', class: Google::Apis::AdexchangebuyerV1_4::Creative::NativeAd::Logo, decorator: Google::Apis::AdexchangebuyerV1_4::Creative::NativeAd::Logo::Representation
        
            property :price, as: 'price'
            property :star_rating, as: 'starRating'
            property :video_url, as: 'videoURL'
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
        
        class ServingRestriction
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :contexts, as: 'contexts', class: Google::Apis::AdexchangebuyerV1_4::Creative::ServingRestriction::Context, decorator: Google::Apis::AdexchangebuyerV1_4::Creative::ServingRestriction::Context::Representation
        
            collection :disapproval_reasons, as: 'disapprovalReasons', class: Google::Apis::AdexchangebuyerV1_4::Creative::ServingRestriction::DisapprovalReason, decorator: Google::Apis::AdexchangebuyerV1_4::Creative::ServingRestriction::DisapprovalReason::Representation
        
            property :reason, as: 'reason'
          end
          
          class Context
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              collection :auction_type, as: 'auctionType'
              property :context_type, as: 'contextType'
              collection :geo_criteria_id, as: 'geoCriteriaId'
              collection :platform, as: 'platform'
            end
          end
          
          class DisapprovalReason
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              collection :details, as: 'details'
              property :reason, as: 'reason'
            end
          end
        end
      end
      
      class CreativeDealIds
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deal_statuses, as: 'dealStatuses', class: Google::Apis::AdexchangebuyerV1_4::CreativeDealIds::DealStatus, decorator: Google::Apis::AdexchangebuyerV1_4::CreativeDealIds::DealStatus::Representation
      
          property :kind, as: 'kind'
        end
        
        class DealStatus
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :arc_status, as: 'arcStatus'
            property :deal_id, :numeric_string => true, as: 'dealId'
            property :web_property_id, as: 'webPropertyId'
          end
        end
      end
      
      class CreativesList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AdexchangebuyerV1_4::Creative, decorator: Google::Apis::AdexchangebuyerV1_4::Creative::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class DealServingMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alcohol_ads_allowed, as: 'alcoholAdsAllowed'
          property :deal_pause_status, as: 'dealPauseStatus', class: Google::Apis::AdexchangebuyerV1_4::DealServingMetadataDealPauseStatus, decorator: Google::Apis::AdexchangebuyerV1_4::DealServingMetadataDealPauseStatus::Representation
      
        end
      end
      
      class DealServingMetadataDealPauseStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :buyer_pause_reason, as: 'buyerPauseReason'
          property :first_paused_by, as: 'firstPausedBy'
          property :has_buyer_paused, as: 'hasBuyerPaused'
          property :has_seller_paused, as: 'hasSellerPaused'
          property :seller_pause_reason, as: 'sellerPauseReason'
        end
      end
      
      class DealTerms
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :branding_type, as: 'brandingType'
          property :cross_listed_external_deal_id_type, as: 'crossListedExternalDealIdType'
          property :description, as: 'description'
          property :estimated_gross_spend, as: 'estimatedGrossSpend', class: Google::Apis::AdexchangebuyerV1_4::Price, decorator: Google::Apis::AdexchangebuyerV1_4::Price::Representation
      
          property :estimated_impressions_per_day, :numeric_string => true, as: 'estimatedImpressionsPerDay'
          property :guaranteed_fixed_price_terms, as: 'guaranteedFixedPriceTerms', class: Google::Apis::AdexchangebuyerV1_4::DealTermsGuaranteedFixedPriceTerms, decorator: Google::Apis::AdexchangebuyerV1_4::DealTermsGuaranteedFixedPriceTerms::Representation
      
          property :non_guaranteed_auction_terms, as: 'nonGuaranteedAuctionTerms', class: Google::Apis::AdexchangebuyerV1_4::DealTermsNonGuaranteedAuctionTerms, decorator: Google::Apis::AdexchangebuyerV1_4::DealTermsNonGuaranteedAuctionTerms::Representation
      
          property :non_guaranteed_fixed_price_terms, as: 'nonGuaranteedFixedPriceTerms', class: Google::Apis::AdexchangebuyerV1_4::DealTermsNonGuaranteedFixedPriceTerms, decorator: Google::Apis::AdexchangebuyerV1_4::DealTermsNonGuaranteedFixedPriceTerms::Representation
      
          property :rubicon_non_guaranteed_terms, as: 'rubiconNonGuaranteedTerms', class: Google::Apis::AdexchangebuyerV1_4::DealTermsRubiconNonGuaranteedTerms, decorator: Google::Apis::AdexchangebuyerV1_4::DealTermsRubiconNonGuaranteedTerms::Representation
      
          property :seller_time_zone, as: 'sellerTimeZone'
        end
      end
      
      class DealTermsGuaranteedFixedPriceTerms
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :billing_info, as: 'billingInfo', class: Google::Apis::AdexchangebuyerV1_4::DealTermsGuaranteedFixedPriceTermsBillingInfo, decorator: Google::Apis::AdexchangebuyerV1_4::DealTermsGuaranteedFixedPriceTermsBillingInfo::Representation
      
          collection :fixed_prices, as: 'fixedPrices', class: Google::Apis::AdexchangebuyerV1_4::PricePerBuyer, decorator: Google::Apis::AdexchangebuyerV1_4::PricePerBuyer::Representation
      
          property :guaranteed_impressions, :numeric_string => true, as: 'guaranteedImpressions'
          property :guaranteed_looks, :numeric_string => true, as: 'guaranteedLooks'
          property :minimum_daily_looks, :numeric_string => true, as: 'minimumDailyLooks'
        end
      end
      
      class DealTermsGuaranteedFixedPriceTermsBillingInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :currency_conversion_time_ms, :numeric_string => true, as: 'currencyConversionTimeMs'
          property :dfp_line_item_id, :numeric_string => true, as: 'dfpLineItemId'
          property :original_contracted_quantity, :numeric_string => true, as: 'originalContractedQuantity'
          property :price, as: 'price', class: Google::Apis::AdexchangebuyerV1_4::Price, decorator: Google::Apis::AdexchangebuyerV1_4::Price::Representation
      
        end
      end
      
      class DealTermsNonGuaranteedAuctionTerms
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_optimize_private_auction, as: 'autoOptimizePrivateAuction'
          collection :reserve_price_per_buyers, as: 'reservePricePerBuyers', class: Google::Apis::AdexchangebuyerV1_4::PricePerBuyer, decorator: Google::Apis::AdexchangebuyerV1_4::PricePerBuyer::Representation
      
        end
      end
      
      class DealTermsNonGuaranteedFixedPriceTerms
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :fixed_prices, as: 'fixedPrices', class: Google::Apis::AdexchangebuyerV1_4::PricePerBuyer, decorator: Google::Apis::AdexchangebuyerV1_4::PricePerBuyer::Representation
      
        end
      end
      
      class DealTermsRubiconNonGuaranteedTerms
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :priority_price, as: 'priorityPrice', class: Google::Apis::AdexchangebuyerV1_4::Price, decorator: Google::Apis::AdexchangebuyerV1_4::Price::Representation
      
          property :standard_price, as: 'standardPrice', class: Google::Apis::AdexchangebuyerV1_4::Price, decorator: Google::Apis::AdexchangebuyerV1_4::Price::Representation
      
        end
      end
      
      class DeleteOrderDealsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deal_ids, as: 'dealIds'
          property :proposal_revision_number, :numeric_string => true, as: 'proposalRevisionNumber'
          property :update_action, as: 'updateAction'
        end
      end
      
      class DeleteOrderDealsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deals, as: 'deals', class: Google::Apis::AdexchangebuyerV1_4::MarketplaceDeal, decorator: Google::Apis::AdexchangebuyerV1_4::MarketplaceDeal::Representation
      
          property :proposal_revision_number, :numeric_string => true, as: 'proposalRevisionNumber'
        end
      end
      
      class DeliveryControl
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creative_blocking_level, as: 'creativeBlockingLevel'
          property :delivery_rate_type, as: 'deliveryRateType'
          collection :frequency_caps, as: 'frequencyCaps', class: Google::Apis::AdexchangebuyerV1_4::DeliveryControlFrequencyCap, decorator: Google::Apis::AdexchangebuyerV1_4::DeliveryControlFrequencyCap::Representation
      
        end
      end
      
      class DeliveryControlFrequencyCap
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_impressions, as: 'maxImpressions'
          property :num_time_units, as: 'numTimeUnits'
          property :time_unit_type, as: 'timeUnitType'
        end
      end
      
      class Dimension
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dimension_type, as: 'dimensionType'
          collection :dimension_values, as: 'dimensionValues', class: Google::Apis::AdexchangebuyerV1_4::DimensionDimensionValue, decorator: Google::Apis::AdexchangebuyerV1_4::DimensionDimensionValue::Representation
      
        end
      end
      
      class DimensionDimensionValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :name, as: 'name'
          property :percentage, as: 'percentage'
        end
      end
      
      class EditAllOrderDealsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deals, as: 'deals', class: Google::Apis::AdexchangebuyerV1_4::MarketplaceDeal, decorator: Google::Apis::AdexchangebuyerV1_4::MarketplaceDeal::Representation
      
          property :proposal, as: 'proposal', class: Google::Apis::AdexchangebuyerV1_4::Proposal, decorator: Google::Apis::AdexchangebuyerV1_4::Proposal::Representation
      
          property :proposal_revision_number, :numeric_string => true, as: 'proposalRevisionNumber'
          property :update_action, as: 'updateAction'
        end
      end
      
      class EditAllOrderDealsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deals, as: 'deals', class: Google::Apis::AdexchangebuyerV1_4::MarketplaceDeal, decorator: Google::Apis::AdexchangebuyerV1_4::MarketplaceDeal::Representation
      
          property :order_revision_number, :numeric_string => true, as: 'orderRevisionNumber'
        end
      end
      
      class GetOffersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :products, as: 'products', class: Google::Apis::AdexchangebuyerV1_4::Product, decorator: Google::Apis::AdexchangebuyerV1_4::Product::Representation
      
        end
      end
      
      class GetOrderDealsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deals, as: 'deals', class: Google::Apis::AdexchangebuyerV1_4::MarketplaceDeal, decorator: Google::Apis::AdexchangebuyerV1_4::MarketplaceDeal::Representation
      
        end
      end
      
      class GetOrderNotesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :notes, as: 'notes', class: Google::Apis::AdexchangebuyerV1_4::MarketplaceNote, decorator: Google::Apis::AdexchangebuyerV1_4::MarketplaceNote::Representation
      
        end
      end
      
      class GetOrdersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :proposals, as: 'proposals', class: Google::Apis::AdexchangebuyerV1_4::Proposal, decorator: Google::Apis::AdexchangebuyerV1_4::Proposal::Representation
      
        end
      end
      
      class GetPublisherProfilesByAccountIdResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :profiles, as: 'profiles', class: Google::Apis::AdexchangebuyerV1_4::PublisherProfileApiProto, decorator: Google::Apis::AdexchangebuyerV1_4::PublisherProfileApiProto::Representation
      
        end
      end
      
      class MarketplaceDeal
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :buyer_private_data, as: 'buyerPrivateData', class: Google::Apis::AdexchangebuyerV1_4::PrivateData, decorator: Google::Apis::AdexchangebuyerV1_4::PrivateData::Representation
      
          property :creation_time_ms, :numeric_string => true, as: 'creationTimeMs'
          property :creative_pre_approval_policy, as: 'creativePreApprovalPolicy'
          property :creative_safe_frame_compatibility, as: 'creativeSafeFrameCompatibility'
          property :deal_id, as: 'dealId'
          property :deal_serving_metadata, as: 'dealServingMetadata', class: Google::Apis::AdexchangebuyerV1_4::DealServingMetadata, decorator: Google::Apis::AdexchangebuyerV1_4::DealServingMetadata::Representation
      
          property :delivery_control, as: 'deliveryControl', class: Google::Apis::AdexchangebuyerV1_4::DeliveryControl, decorator: Google::Apis::AdexchangebuyerV1_4::DeliveryControl::Representation
      
          property :external_deal_id, as: 'externalDealId'
          property :flight_end_time_ms, :numeric_string => true, as: 'flightEndTimeMs'
          property :flight_start_time_ms, :numeric_string => true, as: 'flightStartTimeMs'
          property :inventory_description, as: 'inventoryDescription'
          property :is_rfp_template, as: 'isRfpTemplate'
          property :is_setup_complete, as: 'isSetupComplete'
          property :kind, as: 'kind'
          property :last_update_time_ms, :numeric_string => true, as: 'lastUpdateTimeMs'
          property :name, as: 'name'
          property :product_id, as: 'productId'
          property :product_revision_number, :numeric_string => true, as: 'productRevisionNumber'
          property :programmatic_creative_source, as: 'programmaticCreativeSource'
          property :proposal_id, as: 'proposalId'
          collection :seller_contacts, as: 'sellerContacts', class: Google::Apis::AdexchangebuyerV1_4::ContactInformation, decorator: Google::Apis::AdexchangebuyerV1_4::ContactInformation::Representation
      
          collection :shared_targetings, as: 'sharedTargetings', class: Google::Apis::AdexchangebuyerV1_4::SharedTargeting, decorator: Google::Apis::AdexchangebuyerV1_4::SharedTargeting::Representation
      
          property :syndication_product, as: 'syndicationProduct'
          property :terms, as: 'terms', class: Google::Apis::AdexchangebuyerV1_4::DealTerms, decorator: Google::Apis::AdexchangebuyerV1_4::DealTerms::Representation
      
          property :web_property_code, as: 'webPropertyCode'
        end
      end
      
      class MarketplaceDealParty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :buyer, as: 'buyer', class: Google::Apis::AdexchangebuyerV1_4::Buyer, decorator: Google::Apis::AdexchangebuyerV1_4::Buyer::Representation
      
          property :seller, as: 'seller', class: Google::Apis::AdexchangebuyerV1_4::Seller, decorator: Google::Apis::AdexchangebuyerV1_4::Seller::Representation
      
        end
      end
      
      class MarketplaceLabel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :create_time_ms, :numeric_string => true, as: 'createTimeMs'
          property :deprecated_marketplace_deal_party, as: 'deprecatedMarketplaceDealParty', class: Google::Apis::AdexchangebuyerV1_4::MarketplaceDealParty, decorator: Google::Apis::AdexchangebuyerV1_4::MarketplaceDealParty::Representation
      
          property :label, as: 'label'
        end
      end
      
      class MarketplaceNote
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creator_role, as: 'creatorRole'
          property :deal_id, as: 'dealId'
          property :kind, as: 'kind'
          property :note, as: 'note'
          property :note_id, as: 'noteId'
          property :proposal_id, as: 'proposalId'
          property :proposal_revision_number, :numeric_string => true, as: 'proposalRevisionNumber'
          property :timestamp_ms, :numeric_string => true, as: 'timestampMs'
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
          collection :performance_report, as: 'performanceReport', class: Google::Apis::AdexchangebuyerV1_4::PerformanceReport, decorator: Google::Apis::AdexchangebuyerV1_4::PerformanceReport::Representation
      
        end
      end
      
      class PretargetingConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :billing_id, :numeric_string => true, as: 'billingId'
          property :config_id, :numeric_string => true, as: 'configId'
          property :config_name, as: 'configName'
          collection :creative_type, as: 'creativeType'
          collection :dimensions, as: 'dimensions', class: Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::Dimension, decorator: Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::Dimension::Representation
      
          collection :excluded_content_labels, as: 'excludedContentLabels'
          collection :excluded_geo_criteria_ids, as: 'excludedGeoCriteriaIds'
          collection :excluded_placements, as: 'excludedPlacements', class: Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::ExcludedPlacement, decorator: Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::ExcludedPlacement::Representation
      
          collection :excluded_user_lists, as: 'excludedUserLists'
          collection :excluded_verticals, as: 'excludedVerticals'
          collection :geo_criteria_ids, as: 'geoCriteriaIds'
          property :is_active, as: 'isActive'
          property :kind, as: 'kind'
          collection :languages, as: 'languages'
          property :minimum_viewability_decile, as: 'minimumViewabilityDecile'
          collection :mobile_carriers, as: 'mobileCarriers'
          collection :mobile_devices, as: 'mobileDevices'
          collection :mobile_operating_system_versions, as: 'mobileOperatingSystemVersions'
          collection :placements, as: 'placements', class: Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::Placement, decorator: Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::Placement::Representation
      
          collection :platforms, as: 'platforms'
          collection :supported_creative_attributes, as: 'supportedCreativeAttributes'
          collection :user_identifier_data_required, as: 'userIdentifierDataRequired'
          collection :user_lists, as: 'userLists'
          collection :vendor_types, as: 'vendorTypes'
          collection :verticals, as: 'verticals'
          collection :video_player_sizes, as: 'videoPlayerSizes', class: Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::VideoPlayerSize, decorator: Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::VideoPlayerSize::Representation
      
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
        
        class VideoPlayerSize
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :aspect_ratio, as: 'aspectRatio'
            property :min_height, :numeric_string => true, as: 'minHeight'
            property :min_width, :numeric_string => true, as: 'minWidth'
          end
        end
      end
      
      class PretargetingConfigList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AdexchangebuyerV1_4::PretargetingConfig, decorator: Google::Apis::AdexchangebuyerV1_4::PretargetingConfig::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Price
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount_micros, as: 'amountMicros'
          property :currency_code, as: 'currencyCode'
          property :expected_cpm_micros, as: 'expectedCpmMicros'
          property :pricing_type, as: 'pricingType'
        end
      end
      
      class PricePerBuyer
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auction_tier, as: 'auctionTier'
          property :billed_buyer, as: 'billedBuyer', class: Google::Apis::AdexchangebuyerV1_4::Buyer, decorator: Google::Apis::AdexchangebuyerV1_4::Buyer::Representation
      
          property :buyer, as: 'buyer', class: Google::Apis::AdexchangebuyerV1_4::Buyer, decorator: Google::Apis::AdexchangebuyerV1_4::Buyer::Representation
      
          property :price, as: 'price', class: Google::Apis::AdexchangebuyerV1_4::Price, decorator: Google::Apis::AdexchangebuyerV1_4::Price::Representation
      
        end
      end
      
      class PrivateData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :reference_id, as: 'referenceId'
          property :reference_payload, :base64 => true, as: 'referencePayload'
        end
      end
      
      class Product
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :billed_buyer, as: 'billedBuyer', class: Google::Apis::AdexchangebuyerV1_4::Buyer, decorator: Google::Apis::AdexchangebuyerV1_4::Buyer::Representation
      
          property :buyer, as: 'buyer', class: Google::Apis::AdexchangebuyerV1_4::Buyer, decorator: Google::Apis::AdexchangebuyerV1_4::Buyer::Representation
      
          property :creation_time_ms, :numeric_string => true, as: 'creationTimeMs'
          collection :creator_contacts, as: 'creatorContacts', class: Google::Apis::AdexchangebuyerV1_4::ContactInformation, decorator: Google::Apis::AdexchangebuyerV1_4::ContactInformation::Representation
      
          property :creator_role, as: 'creatorRole'
          property :delivery_control, as: 'deliveryControl', class: Google::Apis::AdexchangebuyerV1_4::DeliveryControl, decorator: Google::Apis::AdexchangebuyerV1_4::DeliveryControl::Representation
      
          property :flight_end_time_ms, :numeric_string => true, as: 'flightEndTimeMs'
          property :flight_start_time_ms, :numeric_string => true, as: 'flightStartTimeMs'
          property :has_creator_signed_off, as: 'hasCreatorSignedOff'
          property :inventory_source, as: 'inventorySource'
          property :kind, as: 'kind'
          collection :labels, as: 'labels', class: Google::Apis::AdexchangebuyerV1_4::MarketplaceLabel, decorator: Google::Apis::AdexchangebuyerV1_4::MarketplaceLabel::Representation
      
          property :last_update_time_ms, :numeric_string => true, as: 'lastUpdateTimeMs'
          property :legacy_offer_id, as: 'legacyOfferId'
          property :marketplace_publisher_profile_id, as: 'marketplacePublisherProfileId'
          property :name, as: 'name'
          property :private_auction_id, as: 'privateAuctionId'
          property :product_id, as: 'productId'
          property :publisher_profile_id, as: 'publisherProfileId'
          property :publisher_provided_forecast, as: 'publisherProvidedForecast', class: Google::Apis::AdexchangebuyerV1_4::PublisherProvidedForecast, decorator: Google::Apis::AdexchangebuyerV1_4::PublisherProvidedForecast::Representation
      
          property :revision_number, :numeric_string => true, as: 'revisionNumber'
          property :seller, as: 'seller', class: Google::Apis::AdexchangebuyerV1_4::Seller, decorator: Google::Apis::AdexchangebuyerV1_4::Seller::Representation
      
          collection :shared_targetings, as: 'sharedTargetings', class: Google::Apis::AdexchangebuyerV1_4::SharedTargeting, decorator: Google::Apis::AdexchangebuyerV1_4::SharedTargeting::Representation
      
          property :state, as: 'state'
          property :syndication_product, as: 'syndicationProduct'
          property :terms, as: 'terms', class: Google::Apis::AdexchangebuyerV1_4::DealTerms, decorator: Google::Apis::AdexchangebuyerV1_4::DealTerms::Representation
      
          property :web_property_code, as: 'webPropertyCode'
        end
      end
      
      class Proposal
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :billed_buyer, as: 'billedBuyer', class: Google::Apis::AdexchangebuyerV1_4::Buyer, decorator: Google::Apis::AdexchangebuyerV1_4::Buyer::Representation
      
          property :buyer, as: 'buyer', class: Google::Apis::AdexchangebuyerV1_4::Buyer, decorator: Google::Apis::AdexchangebuyerV1_4::Buyer::Representation
      
          collection :buyer_contacts, as: 'buyerContacts', class: Google::Apis::AdexchangebuyerV1_4::ContactInformation, decorator: Google::Apis::AdexchangebuyerV1_4::ContactInformation::Representation
      
          property :buyer_private_data, as: 'buyerPrivateData', class: Google::Apis::AdexchangebuyerV1_4::PrivateData, decorator: Google::Apis::AdexchangebuyerV1_4::PrivateData::Representation
      
          collection :dbm_advertiser_ids, as: 'dbmAdvertiserIds'
          property :has_buyer_signed_off, as: 'hasBuyerSignedOff'
          property :has_seller_signed_off, as: 'hasSellerSignedOff'
          property :inventory_source, as: 'inventorySource'
          property :is_renegotiating, as: 'isRenegotiating'
          property :is_setup_complete, as: 'isSetupComplete'
          property :kind, as: 'kind'
          collection :labels, as: 'labels', class: Google::Apis::AdexchangebuyerV1_4::MarketplaceLabel, decorator: Google::Apis::AdexchangebuyerV1_4::MarketplaceLabel::Representation
      
          property :last_updater_or_commentor_role, as: 'lastUpdaterOrCommentorRole'
          property :name, as: 'name'
          property :negotiation_id, as: 'negotiationId'
          property :originator_role, as: 'originatorRole'
          property :private_auction_id, as: 'privateAuctionId'
          property :proposal_id, as: 'proposalId'
          property :proposal_state, as: 'proposalState'
          property :revision_number, :numeric_string => true, as: 'revisionNumber'
          property :revision_time_ms, :numeric_string => true, as: 'revisionTimeMs'
          property :seller, as: 'seller', class: Google::Apis::AdexchangebuyerV1_4::Seller, decorator: Google::Apis::AdexchangebuyerV1_4::Seller::Representation
      
          collection :seller_contacts, as: 'sellerContacts', class: Google::Apis::AdexchangebuyerV1_4::ContactInformation, decorator: Google::Apis::AdexchangebuyerV1_4::ContactInformation::Representation
      
        end
      end
      
      class PublisherProfileApiProto
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audience, as: 'audience'
          property :buyer_pitch_statement, as: 'buyerPitchStatement'
          property :direct_contact, as: 'directContact'
          property :exchange, as: 'exchange'
          property :google_plus_link, as: 'googlePlusLink'
          property :is_parent, as: 'isParent'
          property :is_published, as: 'isPublished'
          property :kind, as: 'kind'
          property :logo_url, as: 'logoUrl'
          property :media_kit_link, as: 'mediaKitLink'
          property :name, as: 'name'
          property :overview, as: 'overview'
          property :profile_id, as: 'profileId'
          property :programmatic_contact, as: 'programmaticContact'
          collection :publisher_domains, as: 'publisherDomains'
          property :publisher_profile_id, as: 'publisherProfileId'
          property :publisher_provided_forecast, as: 'publisherProvidedForecast', class: Google::Apis::AdexchangebuyerV1_4::PublisherProvidedForecast, decorator: Google::Apis::AdexchangebuyerV1_4::PublisherProvidedForecast::Representation
      
          property :rate_card_info_link, as: 'rateCardInfoLink'
          property :sample_page_link, as: 'samplePageLink'
          property :seller, as: 'seller', class: Google::Apis::AdexchangebuyerV1_4::Seller, decorator: Google::Apis::AdexchangebuyerV1_4::Seller::Representation
      
          property :state, as: 'state'
          collection :top_headlines, as: 'topHeadlines'
        end
      end
      
      class PublisherProvidedForecast
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :dimensions, as: 'dimensions', class: Google::Apis::AdexchangebuyerV1_4::Dimension, decorator: Google::Apis::AdexchangebuyerV1_4::Dimension::Representation
      
          property :weekly_impressions, :numeric_string => true, as: 'weeklyImpressions'
          property :weekly_uniques, :numeric_string => true, as: 'weeklyUniques'
        end
      end
      
      class Seller
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :sub_account_id, as: 'subAccountId'
        end
      end
      
      class SharedTargeting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :exclusions, as: 'exclusions', class: Google::Apis::AdexchangebuyerV1_4::TargetingValue, decorator: Google::Apis::AdexchangebuyerV1_4::TargetingValue::Representation
      
          collection :inclusions, as: 'inclusions', class: Google::Apis::AdexchangebuyerV1_4::TargetingValue, decorator: Google::Apis::AdexchangebuyerV1_4::TargetingValue::Representation
      
          property :key, as: 'key'
        end
      end
      
      class TargetingValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creative_size_value, as: 'creativeSizeValue', class: Google::Apis::AdexchangebuyerV1_4::TargetingValueCreativeSize, decorator: Google::Apis::AdexchangebuyerV1_4::TargetingValueCreativeSize::Representation
      
          property :day_part_targeting_value, as: 'dayPartTargetingValue', class: Google::Apis::AdexchangebuyerV1_4::TargetingValueDayPartTargeting, decorator: Google::Apis::AdexchangebuyerV1_4::TargetingValueDayPartTargeting::Representation
      
          property :demog_age_criteria_value, as: 'demogAgeCriteriaValue', class: Google::Apis::AdexchangebuyerV1_4::TargetingValueDemogAgeCriteria, decorator: Google::Apis::AdexchangebuyerV1_4::TargetingValueDemogAgeCriteria::Representation
      
          property :demog_gender_criteria_value, as: 'demogGenderCriteriaValue', class: Google::Apis::AdexchangebuyerV1_4::TargetingValueDemogGenderCriteria, decorator: Google::Apis::AdexchangebuyerV1_4::TargetingValueDemogGenderCriteria::Representation
      
          property :long_value, :numeric_string => true, as: 'longValue'
          property :string_value, as: 'stringValue'
        end
      end
      
      class TargetingValueCreativeSize
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :allowed_formats, as: 'allowedFormats'
          collection :companion_sizes, as: 'companionSizes', class: Google::Apis::AdexchangebuyerV1_4::TargetingValueSize, decorator: Google::Apis::AdexchangebuyerV1_4::TargetingValueSize::Representation
      
          property :creative_size_type, as: 'creativeSizeType'
          property :native_template, as: 'nativeTemplate'
          property :size, as: 'size', class: Google::Apis::AdexchangebuyerV1_4::TargetingValueSize, decorator: Google::Apis::AdexchangebuyerV1_4::TargetingValueSize::Representation
      
          property :skippable_ad_type, as: 'skippableAdType'
        end
      end
      
      class TargetingValueDayPartTargeting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :day_parts, as: 'dayParts', class: Google::Apis::AdexchangebuyerV1_4::TargetingValueDayPartTargetingDayPart, decorator: Google::Apis::AdexchangebuyerV1_4::TargetingValueDayPartTargetingDayPart::Representation
      
          property :time_zone_type, as: 'timeZoneType'
        end
      end
      
      class TargetingValueDayPartTargetingDayPart
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :day_of_week, as: 'dayOfWeek'
          property :end_hour, as: 'endHour'
          property :end_minute, as: 'endMinute'
          property :start_hour, as: 'startHour'
          property :start_minute, as: 'startMinute'
        end
      end
      
      class TargetingValueDemogAgeCriteria
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :demog_age_criteria_ids, as: 'demogAgeCriteriaIds'
        end
      end
      
      class TargetingValueDemogGenderCriteria
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :demog_gender_criteria_ids, as: 'demogGenderCriteriaIds'
        end
      end
      
      class TargetingValueSize
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :height, as: 'height'
          property :width, as: 'width'
        end
      end
      
      class UpdatePrivateAuctionProposalRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :external_deal_id, as: 'externalDealId'
          property :note, as: 'note', class: Google::Apis::AdexchangebuyerV1_4::MarketplaceNote, decorator: Google::Apis::AdexchangebuyerV1_4::MarketplaceNote::Representation
      
          property :proposal_revision_number, :numeric_string => true, as: 'proposalRevisionNumber'
          property :update_action, as: 'updateAction'
        end
      end
    end
  end
end
