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
    module FirebasedynamiclinksV1
      
      class AnalyticsInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AndroidInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateManagedShortLinkRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateManagedShortLinkResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateShortDynamicLinkRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateShortDynamicLinkResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DesktopInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DynamicLinkEventStat
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DynamicLinkInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DynamicLinkStats
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DynamicLinkWarning
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetIosPostInstallAttributionRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetIosPostInstallAttributionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetIosReopenAttributionRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetIosReopenAttributionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GooglePlayAnalytics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ITunesConnectAnalytics
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IosInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ManagedShortLink
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class NavigationInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SocialMetaTagInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Suffix
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnalyticsInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :google_play_analytics, as: 'googlePlayAnalytics', class: Google::Apis::FirebasedynamiclinksV1::GooglePlayAnalytics, decorator: Google::Apis::FirebasedynamiclinksV1::GooglePlayAnalytics::Representation
      
          property :itunes_connect_analytics, as: 'itunesConnectAnalytics', class: Google::Apis::FirebasedynamiclinksV1::ITunesConnectAnalytics, decorator: Google::Apis::FirebasedynamiclinksV1::ITunesConnectAnalytics::Representation
      
        end
      end
      
      class AndroidInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :android_fallback_link, as: 'androidFallbackLink'
          property :android_link, as: 'androidLink'
          property :android_min_package_version_code, as: 'androidMinPackageVersionCode'
          property :android_package_name, as: 'androidPackageName'
        end
      end
      
      class CreateManagedShortLinkRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dynamic_link_info, as: 'dynamicLinkInfo', class: Google::Apis::FirebasedynamiclinksV1::DynamicLinkInfo, decorator: Google::Apis::FirebasedynamiclinksV1::DynamicLinkInfo::Representation
      
          property :long_dynamic_link, as: 'longDynamicLink'
          property :name, as: 'name'
          property :sdk_version, as: 'sdkVersion'
          property :suffix, as: 'suffix', class: Google::Apis::FirebasedynamiclinksV1::Suffix, decorator: Google::Apis::FirebasedynamiclinksV1::Suffix::Representation
      
        end
      end
      
      class CreateManagedShortLinkResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :managed_short_link, as: 'managedShortLink', class: Google::Apis::FirebasedynamiclinksV1::ManagedShortLink, decorator: Google::Apis::FirebasedynamiclinksV1::ManagedShortLink::Representation
      
          property :preview_link, as: 'previewLink'
          collection :warning, as: 'warning', class: Google::Apis::FirebasedynamiclinksV1::DynamicLinkWarning, decorator: Google::Apis::FirebasedynamiclinksV1::DynamicLinkWarning::Representation
      
        end
      end
      
      class CreateShortDynamicLinkRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :dynamic_link_info, as: 'dynamicLinkInfo', class: Google::Apis::FirebasedynamiclinksV1::DynamicLinkInfo, decorator: Google::Apis::FirebasedynamiclinksV1::DynamicLinkInfo::Representation
      
          property :long_dynamic_link, as: 'longDynamicLink'
          property :sdk_version, as: 'sdkVersion'
          property :suffix, as: 'suffix', class: Google::Apis::FirebasedynamiclinksV1::Suffix, decorator: Google::Apis::FirebasedynamiclinksV1::Suffix::Representation
      
        end
      end
      
      class CreateShortDynamicLinkResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :preview_link, as: 'previewLink'
          property :short_link, as: 'shortLink'
          collection :warning, as: 'warning', class: Google::Apis::FirebasedynamiclinksV1::DynamicLinkWarning, decorator: Google::Apis::FirebasedynamiclinksV1::DynamicLinkWarning::Representation
      
        end
      end
      
      class DesktopInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :desktop_fallback_link, as: 'desktopFallbackLink'
        end
      end
      
      class DeviceInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_model_name, as: 'deviceModelName'
          property :language_code, as: 'languageCode'
          property :language_code_from_webview, as: 'languageCodeFromWebview'
          property :language_code_raw, as: 'languageCodeRaw'
          property :screen_resolution_height, :numeric_string => true, as: 'screenResolutionHeight'
          property :screen_resolution_width, :numeric_string => true, as: 'screenResolutionWidth'
          property :timezone, as: 'timezone'
        end
      end
      
      class DynamicLinkEventStat
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, :numeric_string => true, as: 'count'
          property :event, as: 'event'
          property :platform, as: 'platform'
        end
      end
      
      class DynamicLinkInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :analytics_info, as: 'analyticsInfo', class: Google::Apis::FirebasedynamiclinksV1::AnalyticsInfo, decorator: Google::Apis::FirebasedynamiclinksV1::AnalyticsInfo::Representation
      
          property :android_info, as: 'androidInfo', class: Google::Apis::FirebasedynamiclinksV1::AndroidInfo, decorator: Google::Apis::FirebasedynamiclinksV1::AndroidInfo::Representation
      
          property :desktop_info, as: 'desktopInfo', class: Google::Apis::FirebasedynamiclinksV1::DesktopInfo, decorator: Google::Apis::FirebasedynamiclinksV1::DesktopInfo::Representation
      
          property :domain_uri_prefix, as: 'domainUriPrefix'
          property :dynamic_link_domain, as: 'dynamicLinkDomain'
          property :ios_info, as: 'iosInfo', class: Google::Apis::FirebasedynamiclinksV1::IosInfo, decorator: Google::Apis::FirebasedynamiclinksV1::IosInfo::Representation
      
          property :link, as: 'link'
          property :navigation_info, as: 'navigationInfo', class: Google::Apis::FirebasedynamiclinksV1::NavigationInfo, decorator: Google::Apis::FirebasedynamiclinksV1::NavigationInfo::Representation
      
          property :social_meta_tag_info, as: 'socialMetaTagInfo', class: Google::Apis::FirebasedynamiclinksV1::SocialMetaTagInfo, decorator: Google::Apis::FirebasedynamiclinksV1::SocialMetaTagInfo::Representation
      
        end
      end
      
      class DynamicLinkStats
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :link_event_stats, as: 'linkEventStats', class: Google::Apis::FirebasedynamiclinksV1::DynamicLinkEventStat, decorator: Google::Apis::FirebasedynamiclinksV1::DynamicLinkEventStat::Representation
      
        end
      end
      
      class DynamicLinkWarning
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :warning_code, as: 'warningCode'
          property :warning_document_link, as: 'warningDocumentLink'
          property :warning_message, as: 'warningMessage'
        end
      end
      
      class GetIosPostInstallAttributionRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_installation_time, :numeric_string => true, as: 'appInstallationTime'
          property :bundle_id, as: 'bundleId'
          property :device, as: 'device', class: Google::Apis::FirebasedynamiclinksV1::DeviceInfo, decorator: Google::Apis::FirebasedynamiclinksV1::DeviceInfo::Representation
      
          property :ios_version, as: 'iosVersion'
          property :retrieval_method, as: 'retrievalMethod'
          property :sdk_version, as: 'sdkVersion'
          property :unique_match_link_to_check, as: 'uniqueMatchLinkToCheck'
          property :visual_style, as: 'visualStyle'
        end
      end
      
      class GetIosPostInstallAttributionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_minimum_version, as: 'appMinimumVersion'
          property :attribution_confidence, as: 'attributionConfidence'
          property :deep_link, as: 'deepLink'
          property :external_browser_destination_link, as: 'externalBrowserDestinationLink'
          property :fallback_link, as: 'fallbackLink'
          property :invitation_id, as: 'invitationId'
          property :is_strong_match_executable, as: 'isStrongMatchExecutable'
          property :match_message, as: 'matchMessage'
          property :request_ip_version, as: 'requestIpVersion'
          property :requested_link, as: 'requestedLink'
          property :resolved_link, as: 'resolvedLink'
          property :utm_campaign, as: 'utmCampaign'
          property :utm_content, as: 'utmContent'
          property :utm_medium, as: 'utmMedium'
          property :utm_source, as: 'utmSource'
          property :utm_term, as: 'utmTerm'
        end
      end
      
      class GetIosReopenAttributionRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :bundle_id, as: 'bundleId'
          property :requested_link, as: 'requestedLink'
          property :sdk_version, as: 'sdkVersion'
        end
      end
      
      class GetIosReopenAttributionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deep_link, as: 'deepLink'
          property :invitation_id, as: 'invitationId'
          property :ios_min_app_version, as: 'iosMinAppVersion'
          property :resolved_link, as: 'resolvedLink'
          property :utm_campaign, as: 'utmCampaign'
          property :utm_content, as: 'utmContent'
          property :utm_medium, as: 'utmMedium'
          property :utm_source, as: 'utmSource'
          property :utm_term, as: 'utmTerm'
        end
      end
      
      class GooglePlayAnalytics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :gclid, as: 'gclid'
          property :utm_campaign, as: 'utmCampaign'
          property :utm_content, as: 'utmContent'
          property :utm_medium, as: 'utmMedium'
          property :utm_source, as: 'utmSource'
          property :utm_term, as: 'utmTerm'
        end
      end
      
      class ITunesConnectAnalytics
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :at, as: 'at'
          property :ct, as: 'ct'
          property :mt, as: 'mt'
          property :pt, as: 'pt'
        end
      end
      
      class IosInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :ios_app_store_id, as: 'iosAppStoreId'
          property :ios_bundle_id, as: 'iosBundleId'
          property :ios_custom_scheme, as: 'iosCustomScheme'
          property :ios_fallback_link, as: 'iosFallbackLink'
          property :ios_ipad_bundle_id, as: 'iosIpadBundleId'
          property :ios_ipad_fallback_link, as: 'iosIpadFallbackLink'
          property :ios_minimum_version, as: 'iosMinimumVersion'
        end
      end
      
      class ManagedShortLink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :creation_time, as: 'creationTime'
          collection :flagged_attribute, as: 'flaggedAttribute'
          property :info, as: 'info', class: Google::Apis::FirebasedynamiclinksV1::DynamicLinkInfo, decorator: Google::Apis::FirebasedynamiclinksV1::DynamicLinkInfo::Representation
      
          property :link, as: 'link'
          property :link_name, as: 'linkName'
          property :visibility, as: 'visibility'
        end
      end
      
      class NavigationInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :enable_forced_redirect, as: 'enableForcedRedirect'
        end
      end
      
      class SocialMetaTagInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :social_description, as: 'socialDescription'
          property :social_image_link, as: 'socialImageLink'
          property :social_title, as: 'socialTitle'
        end
      end
      
      class Suffix
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :custom_suffix, as: 'customSuffix'
          property :option, as: 'option'
        end
      end
    end
  end
end
