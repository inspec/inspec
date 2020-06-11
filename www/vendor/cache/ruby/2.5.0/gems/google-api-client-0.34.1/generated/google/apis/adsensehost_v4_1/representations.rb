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
    module AdsensehostV4_1
      
      class Account
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Accounts
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdClient
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdClients
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdCode
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Colors
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Font
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdUnit
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ContentAdsSettings
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class BackupOption
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class MobileContentAdsSettings
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdUnits
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AssociationSession
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomChannel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomChannels
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Report
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Header
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlChannel
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UrlChannels
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Account
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :status, as: 'status'
        end
      end
      
      class Accounts
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AdsensehostV4_1::Account, decorator: Google::Apis::AdsensehostV4_1::Account::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class AdClient
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :arc_opt_in, as: 'arcOptIn'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :product_code, as: 'productCode'
          property :supports_reporting, as: 'supportsReporting'
        end
      end
      
      class AdClients
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AdsensehostV4_1::AdClient, decorator: Google::Apis::AdsensehostV4_1::AdClient::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class AdCode
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ad_code, as: 'adCode'
          property :kind, as: 'kind'
        end
      end
      
      class AdStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :colors, as: 'colors', class: Google::Apis::AdsensehostV4_1::AdStyle::Colors, decorator: Google::Apis::AdsensehostV4_1::AdStyle::Colors::Representation
      
          property :corners, as: 'corners'
          property :font, as: 'font', class: Google::Apis::AdsensehostV4_1::AdStyle::Font, decorator: Google::Apis::AdsensehostV4_1::AdStyle::Font::Representation
      
          property :kind, as: 'kind'
        end
        
        class Colors
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :background, as: 'background'
            property :border, as: 'border'
            property :text, as: 'text'
            property :title, as: 'title'
            property :url, as: 'url'
          end
        end
        
        class Font
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :family, as: 'family'
            property :size, as: 'size'
          end
        end
      end
      
      class AdUnit
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :content_ads_settings, as: 'contentAdsSettings', class: Google::Apis::AdsensehostV4_1::AdUnit::ContentAdsSettings, decorator: Google::Apis::AdsensehostV4_1::AdUnit::ContentAdsSettings::Representation
      
          property :custom_style, as: 'customStyle', class: Google::Apis::AdsensehostV4_1::AdStyle, decorator: Google::Apis::AdsensehostV4_1::AdStyle::Representation
      
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :mobile_content_ads_settings, as: 'mobileContentAdsSettings', class: Google::Apis::AdsensehostV4_1::AdUnit::MobileContentAdsSettings, decorator: Google::Apis::AdsensehostV4_1::AdUnit::MobileContentAdsSettings::Representation
      
          property :name, as: 'name'
          property :status, as: 'status'
        end
        
        class ContentAdsSettings
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :backup_option, as: 'backupOption', class: Google::Apis::AdsensehostV4_1::AdUnit::ContentAdsSettings::BackupOption, decorator: Google::Apis::AdsensehostV4_1::AdUnit::ContentAdsSettings::BackupOption::Representation
        
            property :size, as: 'size'
            property :type, as: 'type'
          end
          
          class BackupOption
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :color, as: 'color'
              property :type, as: 'type'
              property :url, as: 'url'
            end
          end
        end
        
        class MobileContentAdsSettings
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :markup_language, as: 'markupLanguage'
            property :scripting_language, as: 'scriptingLanguage'
            property :size, as: 'size'
            property :type, as: 'type'
          end
        end
      end
      
      class AdUnits
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AdsensehostV4_1::AdUnit, decorator: Google::Apis::AdsensehostV4_1::AdUnit::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class AssociationSession
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :account_id, as: 'accountId'
          property :id, as: 'id'
          property :kind, as: 'kind'
          collection :product_codes, as: 'productCodes'
          property :redirect_url, as: 'redirectUrl'
          property :status, as: 'status'
          property :user_locale, as: 'userLocale'
          property :website_locale, as: 'websiteLocale'
          property :website_url, as: 'websiteUrl'
        end
      end
      
      class CustomChannel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :name, as: 'name'
        end
      end
      
      class CustomChannels
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AdsensehostV4_1::CustomChannel, decorator: Google::Apis::AdsensehostV4_1::CustomChannel::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Report
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :averages, as: 'averages'
          collection :headers, as: 'headers', class: Google::Apis::AdsensehostV4_1::Report::Header, decorator: Google::Apis::AdsensehostV4_1::Report::Header::Representation
      
          property :kind, as: 'kind'
          collection :rows, as: 'rows', :class => Array do
        include Representable::JSON::Collection
        items
      end
      
          property :total_matched_rows, :numeric_string => true, as: 'totalMatchedRows'
          collection :totals, as: 'totals'
          collection :warnings, as: 'warnings'
        end
        
        class Header
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :currency, as: 'currency'
            property :name, as: 'name'
            property :type, as: 'type'
          end
        end
      end
      
      class UrlChannel
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :url_pattern, as: 'urlPattern'
        end
      end
      
      class UrlChannels
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :etag, as: 'etag'
          collection :items, as: 'items', class: Google::Apis::AdsensehostV4_1::UrlChannel, decorator: Google::Apis::AdsensehostV4_1::UrlChannel::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
    end
  end
end
