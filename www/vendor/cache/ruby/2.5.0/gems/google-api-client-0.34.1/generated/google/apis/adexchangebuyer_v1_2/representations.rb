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
      
      class Creative
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
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
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreativesList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Account
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bidder_location, as: 'bidderLocation', class: Google::Apis::AdexchangebuyerV1_2::Account::BidderLocation, decorator: Google::Apis::AdexchangebuyerV1_2::Account::BidderLocation::Representation
      
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
          collection :items, as: 'items', class: Google::Apis::AdexchangebuyerV1_2::Account, decorator: Google::Apis::AdexchangebuyerV1_2::Account::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Creative
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :html_snippet, as: 'HTMLSnippet'
          property :account_id, as: 'accountId'
          collection :advertiser_id, as: 'advertiserId'
          property :advertiser_name, as: 'advertiserName'
          property :agency_id, :numeric_string => true, as: 'agencyId'
          property :api_upload_timestamp, as: 'apiUploadTimestamp', type: DateTime
      
          collection :attribute, as: 'attribute'
          property :buyer_creative_id, as: 'buyerCreativeId'
          collection :click_through_url, as: 'clickThroughUrl'
          collection :corrections, as: 'corrections', class: Google::Apis::AdexchangebuyerV1_2::Creative::Correction, decorator: Google::Apis::AdexchangebuyerV1_2::Creative::Correction::Representation
      
          collection :disapproval_reasons, as: 'disapprovalReasons', class: Google::Apis::AdexchangebuyerV1_2::Creative::DisapprovalReason, decorator: Google::Apis::AdexchangebuyerV1_2::Creative::DisapprovalReason::Representation
      
          property :filtering_reasons, as: 'filteringReasons', class: Google::Apis::AdexchangebuyerV1_2::Creative::FilteringReasons, decorator: Google::Apis::AdexchangebuyerV1_2::Creative::FilteringReasons::Representation
      
          property :height, as: 'height'
          collection :impression_tracking_url, as: 'impressionTrackingUrl'
          property :kind, as: 'kind'
          collection :product_categories, as: 'productCategories'
          collection :restricted_categories, as: 'restrictedCategories'
          collection :sensitive_categories, as: 'sensitiveCategories'
          property :status, as: 'status'
          collection :vendor_type, as: 'vendorType'
          property :version, as: 'version'
          property :video_url, as: 'videoURL'
          property :width, as: 'width'
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
            collection :reasons, as: 'reasons', class: Google::Apis::AdexchangebuyerV1_2::Creative::FilteringReasons::Reason, decorator: Google::Apis::AdexchangebuyerV1_2::Creative::FilteringReasons::Reason::Representation
        
          end
          
          class Reason
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :filtering_count, :numeric_string => true, as: 'filteringCount'
              property :filtering_status, as: 'filteringStatus'
            end
          end
        end
      end
      
      class CreativesList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::AdexchangebuyerV1_2::Creative, decorator: Google::Apis::AdexchangebuyerV1_2::Creative::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
    end
  end
end
