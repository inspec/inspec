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
      
      # Configuration data for an Ad Exchange buyer account.
      class Account
        include Google::Apis::Core::Hashable
      
        # Your bidder locations that have distinct URLs.
        # Corresponds to the JSON property `bidderLocation`
        # @return [Array<Google::Apis::AdexchangebuyerV1_3::Account::BidderLocation>]
        attr_accessor :bidder_location
      
        # The nid parameter value used in cookie match requests. Please contact your
        # technical account manager if you need to change this.
        # Corresponds to the JSON property `cookieMatchingNid`
        # @return [String]
        attr_accessor :cookie_matching_nid
      
        # The base URL used in cookie match requests.
        # Corresponds to the JSON property `cookieMatchingUrl`
        # @return [String]
        attr_accessor :cookie_matching_url
      
        # Account id.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The maximum number of active creatives that an account can have, where a
        # creative is active if it was inserted or bid with in the last 30 days. Please
        # contact your technical account manager if you need to change this.
        # Corresponds to the JSON property `maximumActiveCreatives`
        # @return [Fixnum]
        attr_accessor :maximum_active_creatives
      
        # The sum of all bidderLocation.maximumQps values cannot exceed this. Please
        # contact your technical account manager if you need to change this.
        # Corresponds to the JSON property `maximumTotalQps`
        # @return [Fixnum]
        attr_accessor :maximum_total_qps
      
        # The number of creatives that this account inserted or bid with in the last 30
        # days.
        # Corresponds to the JSON property `numberActiveCreatives`
        # @return [Fixnum]
        attr_accessor :number_active_creatives
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bidder_location = args[:bidder_location] if args.key?(:bidder_location)
          @cookie_matching_nid = args[:cookie_matching_nid] if args.key?(:cookie_matching_nid)
          @cookie_matching_url = args[:cookie_matching_url] if args.key?(:cookie_matching_url)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @maximum_active_creatives = args[:maximum_active_creatives] if args.key?(:maximum_active_creatives)
          @maximum_total_qps = args[:maximum_total_qps] if args.key?(:maximum_total_qps)
          @number_active_creatives = args[:number_active_creatives] if args.key?(:number_active_creatives)
        end
        
        # 
        class BidderLocation
          include Google::Apis::Core::Hashable
        
          # The maximum queries per second the Ad Exchange will send.
          # Corresponds to the JSON property `maximumQps`
          # @return [Fixnum]
          attr_accessor :maximum_qps
        
          # The geographical region the Ad Exchange should send requests from. Only used
          # by some quota systems, but always setting the value is recommended. Allowed
          # values:
          # - ASIA
          # - EUROPE
          # - US_EAST
          # - US_WEST
          # Corresponds to the JSON property `region`
          # @return [String]
          attr_accessor :region
        
          # The URL to which the Ad Exchange will send bid requests.
          # Corresponds to the JSON property `url`
          # @return [String]
          attr_accessor :url
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @maximum_qps = args[:maximum_qps] if args.key?(:maximum_qps)
            @region = args[:region] if args.key?(:region)
            @url = args[:url] if args.key?(:url)
          end
        end
      end
      
      # An account feed lists Ad Exchange buyer accounts that the user has access to.
      # Each entry in the feed corresponds to a single buyer account.
      class AccountsList
        include Google::Apis::Core::Hashable
      
        # A list of accounts.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AdexchangebuyerV1_3::Account>]
        attr_accessor :items
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # The configuration data for an Ad Exchange billing info.
      class BillingInfo
        include Google::Apis::Core::Hashable
      
        # Account id.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # Account name.
        # Corresponds to the JSON property `accountName`
        # @return [String]
        attr_accessor :account_name
      
        # A list of adgroup IDs associated with this particular account. These IDs may
        # show up as part of a realtime bidding BidRequest, which indicates a bid
        # request for this account.
        # Corresponds to the JSON property `billingId`
        # @return [Array<String>]
        attr_accessor :billing_id
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @account_name = args[:account_name] if args.key?(:account_name)
          @billing_id = args[:billing_id] if args.key?(:billing_id)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # A billing info feed lists Billing Info the Ad Exchange buyer account has
      # access to. Each entry in the feed corresponds to a single billing info.
      class BillingInfoList
        include Google::Apis::Core::Hashable
      
        # A list of billing info relevant for your account.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AdexchangebuyerV1_3::BillingInfo>]
        attr_accessor :items
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # The configuration data for Ad Exchange RTB - Budget API.
      class Budget
        include Google::Apis::Core::Hashable
      
        # The id of the account. This is required for get and update requests.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # The billing id to determine which adgroup to provide budget information for.
        # This is required for get and update requests.
        # Corresponds to the JSON property `billingId`
        # @return [Fixnum]
        attr_accessor :billing_id
      
        # The daily budget amount in unit amount of the account currency to apply for
        # the billingId provided. This is required for update requests.
        # Corresponds to the JSON property `budgetAmount`
        # @return [Fixnum]
        attr_accessor :budget_amount
      
        # The currency code for the buyer. This cannot be altered here.
        # Corresponds to the JSON property `currencyCode`
        # @return [String]
        attr_accessor :currency_code
      
        # The unique id that describes this item.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The kind of the resource, i.e. "adexchangebuyer#budget".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @billing_id = args[:billing_id] if args.key?(:billing_id)
          @budget_amount = args[:budget_amount] if args.key?(:budget_amount)
          @currency_code = args[:currency_code] if args.key?(:currency_code)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # A creative and its classification data.
      class Creative
        include Google::Apis::Core::Hashable
      
        # The HTML snippet that displays the ad when inserted in the web page. If set,
        # videoURL should not be set.
        # Corresponds to the JSON property `HTMLSnippet`
        # @return [String]
        attr_accessor :html_snippet
      
        # Account id.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # 
        # Corresponds to the JSON property `adTechnologyProviders`
        # @return [Google::Apis::AdexchangebuyerV1_3::Creative::AdTechnologyProviders]
        attr_accessor :ad_technology_providers
      
        # Detected advertiser id, if any. Read-only. This field should not be set in
        # requests.
        # Corresponds to the JSON property `advertiserId`
        # @return [Array<Fixnum>]
        attr_accessor :advertiser_id
      
        # The name of the company being advertised in the creative.
        # Corresponds to the JSON property `advertiserName`
        # @return [String]
        attr_accessor :advertiser_name
      
        # The agency id for this creative.
        # Corresponds to the JSON property `agencyId`
        # @return [Fixnum]
        attr_accessor :agency_id
      
        # The last upload timestamp of this creative if it was uploaded via API. Read-
        # only. The value of this field is generated, and will be ignored for uploads. (
        # formatted RFC 3339 timestamp).
        # Corresponds to the JSON property `apiUploadTimestamp`
        # @return [DateTime]
        attr_accessor :api_upload_timestamp
      
        # All attributes for the ads that may be shown from this snippet.
        # Corresponds to the JSON property `attribute`
        # @return [Array<Fixnum>]
        attr_accessor :attribute
      
        # A buyer-specific id identifying the creative in this ad.
        # Corresponds to the JSON property `buyerCreativeId`
        # @return [String]
        attr_accessor :buyer_creative_id
      
        # The set of destination urls for the snippet.
        # Corresponds to the JSON property `clickThroughUrl`
        # @return [Array<String>]
        attr_accessor :click_through_url
      
        # Shows any corrections that were applied to this creative. Read-only. This
        # field should not be set in requests.
        # Corresponds to the JSON property `corrections`
        # @return [Array<Google::Apis::AdexchangebuyerV1_3::Creative::Correction>]
        attr_accessor :corrections
      
        # The reasons for disapproval, if any. Note that not all disapproval reasons may
        # be categorized, so it is possible for the creative to have a status of
        # DISAPPROVED with an empty list for disapproval_reasons. In this case, please
        # reach out to your TAM to help debug the issue. Read-only. This field should
        # not be set in requests.
        # Corresponds to the JSON property `disapprovalReasons`
        # @return [Array<Google::Apis::AdexchangebuyerV1_3::Creative::DisapprovalReason>]
        attr_accessor :disapproval_reasons
      
        # The filtering reasons for the creative. Read-only. This field should not be
        # set in requests.
        # Corresponds to the JSON property `filteringReasons`
        # @return [Google::Apis::AdexchangebuyerV1_3::Creative::FilteringReasons]
        attr_accessor :filtering_reasons
      
        # Ad height.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # The set of urls to be called to record an impression.
        # Corresponds to the JSON property `impressionTrackingUrl`
        # @return [Array<String>]
        attr_accessor :impression_tracking_url
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # If nativeAd is set, HTMLSnippet and videoURL should not be set.
        # Corresponds to the JSON property `nativeAd`
        # @return [Google::Apis::AdexchangebuyerV1_3::Creative::NativeAd]
        attr_accessor :native_ad
      
        # Detected product categories, if any. Read-only. This field should not be set
        # in requests.
        # Corresponds to the JSON property `productCategories`
        # @return [Array<Fixnum>]
        attr_accessor :product_categories
      
        # All restricted categories for the ads that may be shown from this snippet.
        # Corresponds to the JSON property `restrictedCategories`
        # @return [Array<Fixnum>]
        attr_accessor :restricted_categories
      
        # Detected sensitive categories, if any. Read-only. This field should not be set
        # in requests.
        # Corresponds to the JSON property `sensitiveCategories`
        # @return [Array<Fixnum>]
        attr_accessor :sensitive_categories
      
        # Creative serving status. Read-only. This field should not be set in requests.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # All vendor types for the ads that may be shown from this snippet.
        # Corresponds to the JSON property `vendorType`
        # @return [Array<Fixnum>]
        attr_accessor :vendor_type
      
        # The version for this creative. Read-only. This field should not be set in
        # requests.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        # The URL to fetch a video ad. If set, HTMLSnippet and the nativeAd should not
        # be set.
        # Corresponds to the JSON property `videoURL`
        # @return [String]
        attr_accessor :video_url
      
        # Ad width.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @html_snippet = args[:html_snippet] if args.key?(:html_snippet)
          @account_id = args[:account_id] if args.key?(:account_id)
          @ad_technology_providers = args[:ad_technology_providers] if args.key?(:ad_technology_providers)
          @advertiser_id = args[:advertiser_id] if args.key?(:advertiser_id)
          @advertiser_name = args[:advertiser_name] if args.key?(:advertiser_name)
          @agency_id = args[:agency_id] if args.key?(:agency_id)
          @api_upload_timestamp = args[:api_upload_timestamp] if args.key?(:api_upload_timestamp)
          @attribute = args[:attribute] if args.key?(:attribute)
          @buyer_creative_id = args[:buyer_creative_id] if args.key?(:buyer_creative_id)
          @click_through_url = args[:click_through_url] if args.key?(:click_through_url)
          @corrections = args[:corrections] if args.key?(:corrections)
          @disapproval_reasons = args[:disapproval_reasons] if args.key?(:disapproval_reasons)
          @filtering_reasons = args[:filtering_reasons] if args.key?(:filtering_reasons)
          @height = args[:height] if args.key?(:height)
          @impression_tracking_url = args[:impression_tracking_url] if args.key?(:impression_tracking_url)
          @kind = args[:kind] if args.key?(:kind)
          @native_ad = args[:native_ad] if args.key?(:native_ad)
          @product_categories = args[:product_categories] if args.key?(:product_categories)
          @restricted_categories = args[:restricted_categories] if args.key?(:restricted_categories)
          @sensitive_categories = args[:sensitive_categories] if args.key?(:sensitive_categories)
          @status = args[:status] if args.key?(:status)
          @vendor_type = args[:vendor_type] if args.key?(:vendor_type)
          @version = args[:version] if args.key?(:version)
          @video_url = args[:video_url] if args.key?(:video_url)
          @width = args[:width] if args.key?(:width)
        end
        
        # 
        class AdTechnologyProviders
          include Google::Apis::Core::Hashable
        
          # The detected ad technology provider IDs for this creative. See https://storage.
          # googleapis.com/adx-rtb-dictionaries/providers.csv for mapping of provider ID
          # to provided name, a privacy policy URL, and a list of domains which can be
          # attributed to the provider. If this creative contains provider IDs that are
          # outside of those listed in the `BidRequest.adslot.consented_providers_settings.
          # consented_providers` field on the  Authorized Buyers Real-Time Bidding
          # protocol or the `BidRequest.user.ext.consented_providers_settings.
          # consented_providers` field on the OpenRTB protocol, a bid submitted for a
          # European Economic Area (EEA) user with this creative is not compliant with the
          # GDPR policies as mentioned in the "Third-party Ad Technology Vendors" section
          # of Authorized Buyers Program Guidelines.
          # Corresponds to the JSON property `detectedProviderIds`
          # @return [Array<Fixnum>]
          attr_accessor :detected_provider_ids
        
          # Whether the creative contains an unidentified ad technology provider. If true,
          # a bid submitted for a European Economic Area (EEA) user with this creative is
          # not compliant with the GDPR policies as mentioned in the "Third-party Ad
          # Technology Vendors" section of Authorized Buyers Program Guidelines.
          # Corresponds to the JSON property `hasUnidentifiedProvider`
          # @return [Boolean]
          attr_accessor :has_unidentified_provider
          alias_method :has_unidentified_provider?, :has_unidentified_provider
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @detected_provider_ids = args[:detected_provider_ids] if args.key?(:detected_provider_ids)
            @has_unidentified_provider = args[:has_unidentified_provider] if args.key?(:has_unidentified_provider)
          end
        end
        
        # 
        class Correction
          include Google::Apis::Core::Hashable
        
          # Additional details about the correction.
          # Corresponds to the JSON property `details`
          # @return [Array<String>]
          attr_accessor :details
        
          # The type of correction that was applied to the creative.
          # Corresponds to the JSON property `reason`
          # @return [String]
          attr_accessor :reason
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @details = args[:details] if args.key?(:details)
            @reason = args[:reason] if args.key?(:reason)
          end
        end
        
        # 
        class DisapprovalReason
          include Google::Apis::Core::Hashable
        
          # Additional details about the reason for disapproval.
          # Corresponds to the JSON property `details`
          # @return [Array<String>]
          attr_accessor :details
        
          # The categorized reason for disapproval.
          # Corresponds to the JSON property `reason`
          # @return [String]
          attr_accessor :reason
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @details = args[:details] if args.key?(:details)
            @reason = args[:reason] if args.key?(:reason)
          end
        end
        
        # The filtering reasons for the creative. Read-only. This field should not be
        # set in requests.
        class FilteringReasons
          include Google::Apis::Core::Hashable
        
          # The date in ISO 8601 format for the data. The data is collected from 00:00:00
          # to 23:59:59 in PST.
          # Corresponds to the JSON property `date`
          # @return [String]
          attr_accessor :date
        
          # The filtering reasons.
          # Corresponds to the JSON property `reasons`
          # @return [Array<Google::Apis::AdexchangebuyerV1_3::Creative::FilteringReasons::Reason>]
          attr_accessor :reasons
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @date = args[:date] if args.key?(:date)
            @reasons = args[:reasons] if args.key?(:reasons)
          end
          
          # 
          class Reason
            include Google::Apis::Core::Hashable
          
            # The number of times the creative was filtered for the status. The count is
            # aggregated across all publishers on the exchange.
            # Corresponds to the JSON property `filteringCount`
            # @return [Fixnum]
            attr_accessor :filtering_count
          
            # The filtering status code. Please refer to the creative-status-codes.txt file
            # for different statuses.
            # Corresponds to the JSON property `filteringStatus`
            # @return [Fixnum]
            attr_accessor :filtering_status
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @filtering_count = args[:filtering_count] if args.key?(:filtering_count)
              @filtering_status = args[:filtering_status] if args.key?(:filtering_status)
            end
          end
        end
        
        # If nativeAd is set, HTMLSnippet and videoURL should not be set.
        class NativeAd
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `advertiser`
          # @return [String]
          attr_accessor :advertiser
        
          # The app icon, for app download ads.
          # Corresponds to the JSON property `appIcon`
          # @return [Google::Apis::AdexchangebuyerV1_3::Creative::NativeAd::AppIcon]
          attr_accessor :app_icon
        
          # A long description of the ad.
          # Corresponds to the JSON property `body`
          # @return [String]
          attr_accessor :body
        
          # A label for the button that the user is supposed to click.
          # Corresponds to the JSON property `callToAction`
          # @return [String]
          attr_accessor :call_to_action
        
          # The URL to use for click tracking.
          # Corresponds to the JSON property `clickTrackingUrl`
          # @return [String]
          attr_accessor :click_tracking_url
        
          # A short title for the ad.
          # Corresponds to the JSON property `headline`
          # @return [String]
          attr_accessor :headline
        
          # A large image.
          # Corresponds to the JSON property `image`
          # @return [Google::Apis::AdexchangebuyerV1_3::Creative::NativeAd::Image]
          attr_accessor :image
        
          # The URLs are called when the impression is rendered.
          # Corresponds to the JSON property `impressionTrackingUrl`
          # @return [Array<String>]
          attr_accessor :impression_tracking_url
        
          # A smaller image, for the advertiser logo.
          # Corresponds to the JSON property `logo`
          # @return [Google::Apis::AdexchangebuyerV1_3::Creative::NativeAd::Logo]
          attr_accessor :logo
        
          # The price of the promoted app including the currency info.
          # Corresponds to the JSON property `price`
          # @return [String]
          attr_accessor :price
        
          # The app rating in the app store. Must be in the range [0-5].
          # Corresponds to the JSON property `starRating`
          # @return [Float]
          attr_accessor :star_rating
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @advertiser = args[:advertiser] if args.key?(:advertiser)
            @app_icon = args[:app_icon] if args.key?(:app_icon)
            @body = args[:body] if args.key?(:body)
            @call_to_action = args[:call_to_action] if args.key?(:call_to_action)
            @click_tracking_url = args[:click_tracking_url] if args.key?(:click_tracking_url)
            @headline = args[:headline] if args.key?(:headline)
            @image = args[:image] if args.key?(:image)
            @impression_tracking_url = args[:impression_tracking_url] if args.key?(:impression_tracking_url)
            @logo = args[:logo] if args.key?(:logo)
            @price = args[:price] if args.key?(:price)
            @star_rating = args[:star_rating] if args.key?(:star_rating)
          end
          
          # The app icon, for app download ads.
          class AppIcon
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `height`
            # @return [Fixnum]
            attr_accessor :height
          
            # 
            # Corresponds to the JSON property `url`
            # @return [String]
            attr_accessor :url
          
            # 
            # Corresponds to the JSON property `width`
            # @return [Fixnum]
            attr_accessor :width
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @height = args[:height] if args.key?(:height)
              @url = args[:url] if args.key?(:url)
              @width = args[:width] if args.key?(:width)
            end
          end
          
          # A large image.
          class Image
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `height`
            # @return [Fixnum]
            attr_accessor :height
          
            # 
            # Corresponds to the JSON property `url`
            # @return [String]
            attr_accessor :url
          
            # 
            # Corresponds to the JSON property `width`
            # @return [Fixnum]
            attr_accessor :width
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @height = args[:height] if args.key?(:height)
              @url = args[:url] if args.key?(:url)
              @width = args[:width] if args.key?(:width)
            end
          end
          
          # A smaller image, for the advertiser logo.
          class Logo
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `height`
            # @return [Fixnum]
            attr_accessor :height
          
            # 
            # Corresponds to the JSON property `url`
            # @return [String]
            attr_accessor :url
          
            # 
            # Corresponds to the JSON property `width`
            # @return [Fixnum]
            attr_accessor :width
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @height = args[:height] if args.key?(:height)
              @url = args[:url] if args.key?(:url)
              @width = args[:width] if args.key?(:width)
            end
          end
        end
      end
      
      # The creatives feed lists the active creatives for the Ad Exchange buyer
      # accounts that the user has access to. Each entry in the feed corresponds to a
      # single creative.
      class CreativesList
        include Google::Apis::Core::Hashable
      
        # A list of creatives.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AdexchangebuyerV1_3::Creative>]
        attr_accessor :items
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Continuation token used to page through creatives. To retrieve the next page
        # of results, set the next request's "pageToken" value to this.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The configuration data for an Ad Exchange direct deal.
      class DirectDeal
        include Google::Apis::Core::Hashable
      
        # The account id of the buyer this deal is for.
        # Corresponds to the JSON property `accountId`
        # @return [Fixnum]
        attr_accessor :account_id
      
        # The name of the advertiser this deal is for.
        # Corresponds to the JSON property `advertiser`
        # @return [String]
        attr_accessor :advertiser
      
        # Whether the publisher for this deal is eligible for alcohol ads.
        # Corresponds to the JSON property `allowsAlcohol`
        # @return [Boolean]
        attr_accessor :allows_alcohol
        alias_method :allows_alcohol?, :allows_alcohol
      
        # The account id that this deal was negotiated for. It is either the buyer or
        # the client that this deal was negotiated on behalf of.
        # Corresponds to the JSON property `buyerAccountId`
        # @return [Fixnum]
        attr_accessor :buyer_account_id
      
        # The currency code that applies to the fixed_cpm value. If not set then assumed
        # to be USD.
        # Corresponds to the JSON property `currencyCode`
        # @return [String]
        attr_accessor :currency_code
      
        # The deal type such as programmatic reservation or fixed price and so on.
        # Corresponds to the JSON property `dealTier`
        # @return [String]
        attr_accessor :deal_tier
      
        # End time for when this deal stops being active. If not set then this deal is
        # valid until manually disabled by the publisher. In seconds since the epoch.
        # Corresponds to the JSON property `endTime`
        # @return [Fixnum]
        attr_accessor :end_time
      
        # The fixed price for this direct deal. In cpm micros of currency according to
        # currency_code. If set, then this deal is eligible for the fixed price tier of
        # buying (highest priority, pay exactly the configured fixed price).
        # Corresponds to the JSON property `fixedCpm`
        # @return [Fixnum]
        attr_accessor :fixed_cpm
      
        # Deal id.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Deal name.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The minimum price for this direct deal. In cpm micros of currency according to
        # currency_code. If set, then this deal is eligible for the private exchange
        # tier of buying (below fixed price priority, run as a second price auction).
        # Corresponds to the JSON property `privateExchangeMinCpm`
        # @return [Fixnum]
        attr_accessor :private_exchange_min_cpm
      
        # If true, the publisher has opted to have their blocks ignored when a creative
        # is bid with for this deal.
        # Corresponds to the JSON property `publisherBlocksOverriden`
        # @return [Boolean]
        attr_accessor :publisher_blocks_overriden
        alias_method :publisher_blocks_overriden?, :publisher_blocks_overriden
      
        # The name of the publisher offering this direct deal.
        # Corresponds to the JSON property `sellerNetwork`
        # @return [String]
        attr_accessor :seller_network
      
        # Start time for when this deal becomes active. If not set then this deal is
        # active immediately upon creation. In seconds since the epoch.
        # Corresponds to the JSON property `startTime`
        # @return [Fixnum]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account_id = args[:account_id] if args.key?(:account_id)
          @advertiser = args[:advertiser] if args.key?(:advertiser)
          @allows_alcohol = args[:allows_alcohol] if args.key?(:allows_alcohol)
          @buyer_account_id = args[:buyer_account_id] if args.key?(:buyer_account_id)
          @currency_code = args[:currency_code] if args.key?(:currency_code)
          @deal_tier = args[:deal_tier] if args.key?(:deal_tier)
          @end_time = args[:end_time] if args.key?(:end_time)
          @fixed_cpm = args[:fixed_cpm] if args.key?(:fixed_cpm)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @private_exchange_min_cpm = args[:private_exchange_min_cpm] if args.key?(:private_exchange_min_cpm)
          @publisher_blocks_overriden = args[:publisher_blocks_overriden] if args.key?(:publisher_blocks_overriden)
          @seller_network = args[:seller_network] if args.key?(:seller_network)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # A direct deals feed lists Direct Deals the Ad Exchange buyer account has
      # access to. This includes direct deals set up for the buyer account as well as
      # its merged stream seats.
      class DirectDealsList
        include Google::Apis::Core::Hashable
      
        # A list of direct deals relevant for your account.
        # Corresponds to the JSON property `directDeals`
        # @return [Array<Google::Apis::AdexchangebuyerV1_3::DirectDeal>]
        attr_accessor :direct_deals
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @direct_deals = args[:direct_deals] if args.key?(:direct_deals)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # The configuration data for an Ad Exchange performance report list.
      class PerformanceReport
        include Google::Apis::Core::Hashable
      
        # The number of bid responses with an ad.
        # Corresponds to the JSON property `bidRate`
        # @return [Float]
        attr_accessor :bid_rate
      
        # The number of bid requests sent to your bidder.
        # Corresponds to the JSON property `bidRequestRate`
        # @return [Float]
        attr_accessor :bid_request_rate
      
        # Rate of various prefiltering statuses per match. Please refer to the callout-
        # status-codes.txt file for different statuses.
        # Corresponds to the JSON property `calloutStatusRate`
        # @return [Array<Object>]
        attr_accessor :callout_status_rate
      
        # Average QPS for cookie matcher operations.
        # Corresponds to the JSON property `cookieMatcherStatusRate`
        # @return [Array<Object>]
        attr_accessor :cookie_matcher_status_rate
      
        # Rate of ads with a given status. Please refer to the creative-status-codes.txt
        # file for different statuses.
        # Corresponds to the JSON property `creativeStatusRate`
        # @return [Array<Object>]
        attr_accessor :creative_status_rate
      
        # The number of bid responses that were filtered due to a policy violation or
        # other errors.
        # Corresponds to the JSON property `filteredBidRate`
        # @return [Float]
        attr_accessor :filtered_bid_rate
      
        # Average QPS for hosted match operations.
        # Corresponds to the JSON property `hostedMatchStatusRate`
        # @return [Array<Object>]
        attr_accessor :hosted_match_status_rate
      
        # The number of potential queries based on your pretargeting settings.
        # Corresponds to the JSON property `inventoryMatchRate`
        # @return [Float]
        attr_accessor :inventory_match_rate
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The 50th percentile round trip latency(ms) as perceived from Google servers
        # for the duration period covered by the report.
        # Corresponds to the JSON property `latency50thPercentile`
        # @return [Float]
        attr_accessor :latency_50th_percentile
      
        # The 85th percentile round trip latency(ms) as perceived from Google servers
        # for the duration period covered by the report.
        # Corresponds to the JSON property `latency85thPercentile`
        # @return [Float]
        attr_accessor :latency_85th_percentile
      
        # The 95th percentile round trip latency(ms) as perceived from Google servers
        # for the duration period covered by the report.
        # Corresponds to the JSON property `latency95thPercentile`
        # @return [Float]
        attr_accessor :latency_95th_percentile
      
        # Rate of various quota account statuses per quota check.
        # Corresponds to the JSON property `noQuotaInRegion`
        # @return [Float]
        attr_accessor :no_quota_in_region
      
        # Rate of various quota account statuses per quota check.
        # Corresponds to the JSON property `outOfQuota`
        # @return [Float]
        attr_accessor :out_of_quota
      
        # Average QPS for pixel match requests from clients.
        # Corresponds to the JSON property `pixelMatchRequests`
        # @return [Float]
        attr_accessor :pixel_match_requests
      
        # Average QPS for pixel match responses from clients.
        # Corresponds to the JSON property `pixelMatchResponses`
        # @return [Float]
        attr_accessor :pixel_match_responses
      
        # The configured quota limits for this account.
        # Corresponds to the JSON property `quotaConfiguredLimit`
        # @return [Float]
        attr_accessor :quota_configured_limit
      
        # The throttled quota limits for this account.
        # Corresponds to the JSON property `quotaThrottledLimit`
        # @return [Float]
        attr_accessor :quota_throttled_limit
      
        # The trading location of this data.
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        # The number of properly formed bid responses received by our servers within the
        # deadline.
        # Corresponds to the JSON property `successfulRequestRate`
        # @return [Float]
        attr_accessor :successful_request_rate
      
        # The unix timestamp of the starting time of this performance data.
        # Corresponds to the JSON property `timestamp`
        # @return [Fixnum]
        attr_accessor :timestamp
      
        # The number of bid responses that were unsuccessful due to timeouts, incorrect
        # formatting, etc.
        # Corresponds to the JSON property `unsuccessfulRequestRate`
        # @return [Float]
        attr_accessor :unsuccessful_request_rate
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bid_rate = args[:bid_rate] if args.key?(:bid_rate)
          @bid_request_rate = args[:bid_request_rate] if args.key?(:bid_request_rate)
          @callout_status_rate = args[:callout_status_rate] if args.key?(:callout_status_rate)
          @cookie_matcher_status_rate = args[:cookie_matcher_status_rate] if args.key?(:cookie_matcher_status_rate)
          @creative_status_rate = args[:creative_status_rate] if args.key?(:creative_status_rate)
          @filtered_bid_rate = args[:filtered_bid_rate] if args.key?(:filtered_bid_rate)
          @hosted_match_status_rate = args[:hosted_match_status_rate] if args.key?(:hosted_match_status_rate)
          @inventory_match_rate = args[:inventory_match_rate] if args.key?(:inventory_match_rate)
          @kind = args[:kind] if args.key?(:kind)
          @latency_50th_percentile = args[:latency_50th_percentile] if args.key?(:latency_50th_percentile)
          @latency_85th_percentile = args[:latency_85th_percentile] if args.key?(:latency_85th_percentile)
          @latency_95th_percentile = args[:latency_95th_percentile] if args.key?(:latency_95th_percentile)
          @no_quota_in_region = args[:no_quota_in_region] if args.key?(:no_quota_in_region)
          @out_of_quota = args[:out_of_quota] if args.key?(:out_of_quota)
          @pixel_match_requests = args[:pixel_match_requests] if args.key?(:pixel_match_requests)
          @pixel_match_responses = args[:pixel_match_responses] if args.key?(:pixel_match_responses)
          @quota_configured_limit = args[:quota_configured_limit] if args.key?(:quota_configured_limit)
          @quota_throttled_limit = args[:quota_throttled_limit] if args.key?(:quota_throttled_limit)
          @region = args[:region] if args.key?(:region)
          @successful_request_rate = args[:successful_request_rate] if args.key?(:successful_request_rate)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
          @unsuccessful_request_rate = args[:unsuccessful_request_rate] if args.key?(:unsuccessful_request_rate)
        end
      end
      
      # The configuration data for an Ad Exchange performance report list.
      class PerformanceReportList
        include Google::Apis::Core::Hashable
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A list of performance reports relevant for the account.
        # Corresponds to the JSON property `performanceReport`
        # @return [Array<Google::Apis::AdexchangebuyerV1_3::PerformanceReport>]
        attr_accessor :performance_report
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @performance_report = args[:performance_report] if args.key?(:performance_report)
        end
      end
      
      # 
      class PretargetingConfig
        include Google::Apis::Core::Hashable
      
        # The id for billing purposes, provided for reference. Leave this field blank
        # for insert requests; the id will be generated automatically.
        # Corresponds to the JSON property `billingId`
        # @return [Fixnum]
        attr_accessor :billing_id
      
        # The config id; generated automatically. Leave this field blank for insert
        # requests.
        # Corresponds to the JSON property `configId`
        # @return [Fixnum]
        attr_accessor :config_id
      
        # The name of the config. Must be unique. Required for all requests.
        # Corresponds to the JSON property `configName`
        # @return [String]
        attr_accessor :config_name
      
        # List must contain exactly one of PRETARGETING_CREATIVE_TYPE_HTML or
        # PRETARGETING_CREATIVE_TYPE_VIDEO.
        # Corresponds to the JSON property `creativeType`
        # @return [Array<String>]
        attr_accessor :creative_type
      
        # Requests which allow one of these (width, height) pairs will match. All pairs
        # must be supported ad dimensions.
        # Corresponds to the JSON property `dimensions`
        # @return [Array<Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Dimension>]
        attr_accessor :dimensions
      
        # Requests with any of these content labels will not match. Values are from
        # content-labels.txt in the downloadable files section.
        # Corresponds to the JSON property `excludedContentLabels`
        # @return [Array<Fixnum>]
        attr_accessor :excluded_content_labels
      
        # Requests containing any of these geo criteria ids will not match.
        # Corresponds to the JSON property `excludedGeoCriteriaIds`
        # @return [Array<Fixnum>]
        attr_accessor :excluded_geo_criteria_ids
      
        # Requests containing any of these placements will not match.
        # Corresponds to the JSON property `excludedPlacements`
        # @return [Array<Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::ExcludedPlacement>]
        attr_accessor :excluded_placements
      
        # Requests containing any of these users list ids will not match.
        # Corresponds to the JSON property `excludedUserLists`
        # @return [Array<Fixnum>]
        attr_accessor :excluded_user_lists
      
        # Requests containing any of these vertical ids will not match. Values are from
        # the publisher-verticals.txt file in the downloadable files section.
        # Corresponds to the JSON property `excludedVerticals`
        # @return [Array<Fixnum>]
        attr_accessor :excluded_verticals
      
        # Requests containing any of these geo criteria ids will match.
        # Corresponds to the JSON property `geoCriteriaIds`
        # @return [Array<Fixnum>]
        attr_accessor :geo_criteria_ids
      
        # Whether this config is active. Required for all requests.
        # Corresponds to the JSON property `isActive`
        # @return [Boolean]
        attr_accessor :is_active
        alias_method :is_active?, :is_active
      
        # The kind of the resource, i.e. "adexchangebuyer#pretargetingConfig".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Request containing any of these language codes will match.
        # Corresponds to the JSON property `languages`
        # @return [Array<String>]
        attr_accessor :languages
      
        # Requests containing any of these mobile carrier ids will match. Values are
        # from mobile-carriers.csv in the downloadable files section.
        # Corresponds to the JSON property `mobileCarriers`
        # @return [Array<Fixnum>]
        attr_accessor :mobile_carriers
      
        # Requests containing any of these mobile device ids will match. Values are from
        # mobile-devices.csv in the downloadable files section.
        # Corresponds to the JSON property `mobileDevices`
        # @return [Array<Fixnum>]
        attr_accessor :mobile_devices
      
        # Requests containing any of these mobile operating system version ids will
        # match. Values are from mobile-os.csv in the downloadable files section.
        # Corresponds to the JSON property `mobileOperatingSystemVersions`
        # @return [Array<Fixnum>]
        attr_accessor :mobile_operating_system_versions
      
        # Requests containing any of these placements will match.
        # Corresponds to the JSON property `placements`
        # @return [Array<Google::Apis::AdexchangebuyerV1_3::PretargetingConfig::Placement>]
        attr_accessor :placements
      
        # Requests matching any of these platforms will match. Possible values are
        # PRETARGETING_PLATFORM_MOBILE, PRETARGETING_PLATFORM_DESKTOP, and
        # PRETARGETING_PLATFORM_TABLET.
        # Corresponds to the JSON property `platforms`
        # @return [Array<String>]
        attr_accessor :platforms
      
        # Creative attributes should be declared here if all creatives corresponding to
        # this pretargeting configuration have that creative attribute. Values are from
        # pretargetable-creative-attributes.txt in the downloadable files section.
        # Corresponds to the JSON property `supportedCreativeAttributes`
        # @return [Array<Fixnum>]
        attr_accessor :supported_creative_attributes
      
        # Requests containing any of these user list ids will match.
        # Corresponds to the JSON property `userLists`
        # @return [Array<Fixnum>]
        attr_accessor :user_lists
      
        # Requests that allow any of these vendor ids will match. Values are from
        # vendors.txt in the downloadable files section.
        # Corresponds to the JSON property `vendorTypes`
        # @return [Array<Fixnum>]
        attr_accessor :vendor_types
      
        # Requests containing any of these vertical ids will match.
        # Corresponds to the JSON property `verticals`
        # @return [Array<Fixnum>]
        attr_accessor :verticals
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @billing_id = args[:billing_id] if args.key?(:billing_id)
          @config_id = args[:config_id] if args.key?(:config_id)
          @config_name = args[:config_name] if args.key?(:config_name)
          @creative_type = args[:creative_type] if args.key?(:creative_type)
          @dimensions = args[:dimensions] if args.key?(:dimensions)
          @excluded_content_labels = args[:excluded_content_labels] if args.key?(:excluded_content_labels)
          @excluded_geo_criteria_ids = args[:excluded_geo_criteria_ids] if args.key?(:excluded_geo_criteria_ids)
          @excluded_placements = args[:excluded_placements] if args.key?(:excluded_placements)
          @excluded_user_lists = args[:excluded_user_lists] if args.key?(:excluded_user_lists)
          @excluded_verticals = args[:excluded_verticals] if args.key?(:excluded_verticals)
          @geo_criteria_ids = args[:geo_criteria_ids] if args.key?(:geo_criteria_ids)
          @is_active = args[:is_active] if args.key?(:is_active)
          @kind = args[:kind] if args.key?(:kind)
          @languages = args[:languages] if args.key?(:languages)
          @mobile_carriers = args[:mobile_carriers] if args.key?(:mobile_carriers)
          @mobile_devices = args[:mobile_devices] if args.key?(:mobile_devices)
          @mobile_operating_system_versions = args[:mobile_operating_system_versions] if args.key?(:mobile_operating_system_versions)
          @placements = args[:placements] if args.key?(:placements)
          @platforms = args[:platforms] if args.key?(:platforms)
          @supported_creative_attributes = args[:supported_creative_attributes] if args.key?(:supported_creative_attributes)
          @user_lists = args[:user_lists] if args.key?(:user_lists)
          @vendor_types = args[:vendor_types] if args.key?(:vendor_types)
          @verticals = args[:verticals] if args.key?(:verticals)
        end
        
        # 
        class Dimension
          include Google::Apis::Core::Hashable
        
          # Height in pixels.
          # Corresponds to the JSON property `height`
          # @return [Fixnum]
          attr_accessor :height
        
          # Width in pixels.
          # Corresponds to the JSON property `width`
          # @return [Fixnum]
          attr_accessor :width
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @height = args[:height] if args.key?(:height)
            @width = args[:width] if args.key?(:width)
          end
        end
        
        # 
        class ExcludedPlacement
          include Google::Apis::Core::Hashable
        
          # The value of the placement. Interpretation depends on the placement type, e.g.
          # URL for a site placement, channel name for a channel placement, app id for a
          # mobile app placement.
          # Corresponds to the JSON property `token`
          # @return [String]
          attr_accessor :token
        
          # The type of the placement.
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @token = args[:token] if args.key?(:token)
            @type = args[:type] if args.key?(:type)
          end
        end
        
        # 
        class Placement
          include Google::Apis::Core::Hashable
        
          # The value of the placement. Interpretation depends on the placement type, e.g.
          # URL for a site placement, channel name for a channel placement, app id for a
          # mobile app placement.
          # Corresponds to the JSON property `token`
          # @return [String]
          attr_accessor :token
        
          # The type of the placement.
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @token = args[:token] if args.key?(:token)
            @type = args[:type] if args.key?(:type)
          end
        end
      end
      
      # 
      class PretargetingConfigList
        include Google::Apis::Core::Hashable
      
        # A list of pretargeting configs
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AdexchangebuyerV1_3::PretargetingConfig>]
        attr_accessor :items
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
    end
  end
end
