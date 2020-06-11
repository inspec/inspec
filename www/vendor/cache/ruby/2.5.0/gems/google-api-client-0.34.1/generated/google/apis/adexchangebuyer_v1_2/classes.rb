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
    module AdexchangebuyerV1_2
      
      # Configuration data for an Ad Exchange buyer account.
      class Account
        include Google::Apis::Core::Hashable
      
        # Your bidder locations that have distinct URLs.
        # Corresponds to the JSON property `bidderLocation`
        # @return [Array<Google::Apis::AdexchangebuyerV1_2::Account::BidderLocation>]
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
        # @return [Array<Google::Apis::AdexchangebuyerV1_2::Account>]
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
        # @return [Array<Google::Apis::AdexchangebuyerV1_2::Creative::Correction>]
        attr_accessor :corrections
      
        # The reasons for disapproval, if any. Note that not all disapproval reasons may
        # be categorized, so it is possible for the creative to have a status of
        # DISAPPROVED with an empty list for disapproval_reasons. In this case, please
        # reach out to your TAM to help debug the issue. Read-only. This field should
        # not be set in requests.
        # Corresponds to the JSON property `disapprovalReasons`
        # @return [Array<Google::Apis::AdexchangebuyerV1_2::Creative::DisapprovalReason>]
        attr_accessor :disapproval_reasons
      
        # The filtering reasons for the creative. Read-only. This field should not be
        # set in requests.
        # Corresponds to the JSON property `filteringReasons`
        # @return [Google::Apis::AdexchangebuyerV1_2::Creative::FilteringReasons]
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
      
        # The url to fetch a video ad. If set, HTMLSnippet should not be set.
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
          # @return [Array<Google::Apis::AdexchangebuyerV1_2::Creative::FilteringReasons::Reason>]
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
      end
      
      # The creatives feed lists the active creatives for the Ad Exchange buyer
      # accounts that the user has access to. Each entry in the feed corresponds to a
      # single creative.
      class CreativesList
        include Google::Apis::Core::Hashable
      
        # A list of creatives.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::AdexchangebuyerV1_2::Creative>]
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
    end
  end
end
