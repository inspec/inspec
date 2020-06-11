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
    module AndroidpublisherV2
      
      class Apk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApkBinary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApkListing
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListApkListingsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApksAddExternallyHostedRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ApksAddExternallyHostedResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListApksResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AppDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AppEdit
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Bundle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BundlesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Comment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeobfuscationFile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeobfuscationFilesUploadResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeveloperComment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeviceMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExpansionFile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UploadExpansionFilesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExternallyHostedApk
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ExternallyHostedApkUsesPermission
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Image
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteAllImagesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListImagesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UploadImagesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InAppProduct
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class InAppProductListing
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListInAppProductsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Listing
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListListingsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MonthDay
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PageInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Price
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductPurchase
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Prorate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Review
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReviewReplyResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReviewsListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReviewsReplyRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReviewsReplyResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Season
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubscriptionCancelSurveyResult
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubscriptionDeferralInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubscriptionPriceChange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SubscriptionPurchase
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeferSubscriptionPurchasesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeferSubscriptionPurchasesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Testers
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Timestamp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TokenPagination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Track
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTracksResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserComment
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VoidedPurchase
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VoidedPurchasesListResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Apk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :binary, as: 'binary', class: Google::Apis::AndroidpublisherV2::ApkBinary, decorator: Google::Apis::AndroidpublisherV2::ApkBinary::Representation
      
          property :version_code, as: 'versionCode'
        end
      end
      
      class ApkBinary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :sha1, as: 'sha1'
          property :sha256, as: 'sha256'
        end
      end
      
      class ApkListing
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :language, as: 'language'
          property :recent_changes, as: 'recentChanges'
        end
      end
      
      class ListApkListingsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :listings, as: 'listings', class: Google::Apis::AndroidpublisherV2::ApkListing, decorator: Google::Apis::AndroidpublisherV2::ApkListing::Representation
      
        end
      end
      
      class ApksAddExternallyHostedRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :externally_hosted_apk, as: 'externallyHostedApk', class: Google::Apis::AndroidpublisherV2::ExternallyHostedApk, decorator: Google::Apis::AndroidpublisherV2::ExternallyHostedApk::Representation
      
        end
      end
      
      class ApksAddExternallyHostedResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :externally_hosted_apk, as: 'externallyHostedApk', class: Google::Apis::AndroidpublisherV2::ExternallyHostedApk, decorator: Google::Apis::AndroidpublisherV2::ExternallyHostedApk::Representation
      
        end
      end
      
      class ListApksResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :apks, as: 'apks', class: Google::Apis::AndroidpublisherV2::Apk, decorator: Google::Apis::AndroidpublisherV2::Apk::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class AppDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :contact_email, as: 'contactEmail'
          property :contact_phone, as: 'contactPhone'
          property :contact_website, as: 'contactWebsite'
          property :default_language, as: 'defaultLanguage'
        end
      end
      
      class AppEdit
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expiry_time_seconds, as: 'expiryTimeSeconds'
          property :id, as: 'id'
        end
      end
      
      class Bundle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :sha1, as: 'sha1'
          property :sha256, as: 'sha256'
          property :version_code, as: 'versionCode'
        end
      end
      
      class BundlesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :bundles, as: 'bundles', class: Google::Apis::AndroidpublisherV2::Bundle, decorator: Google::Apis::AndroidpublisherV2::Bundle::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Comment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :developer_comment, as: 'developerComment', class: Google::Apis::AndroidpublisherV2::DeveloperComment, decorator: Google::Apis::AndroidpublisherV2::DeveloperComment::Representation
      
          property :user_comment, as: 'userComment', class: Google::Apis::AndroidpublisherV2::UserComment, decorator: Google::Apis::AndroidpublisherV2::UserComment::Representation
      
        end
      end
      
      class DeobfuscationFile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :symbol_type, as: 'symbolType'
        end
      end
      
      class DeobfuscationFilesUploadResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deobfuscation_file, as: 'deobfuscationFile', class: Google::Apis::AndroidpublisherV2::DeobfuscationFile, decorator: Google::Apis::AndroidpublisherV2::DeobfuscationFile::Representation
      
        end
      end
      
      class DeveloperComment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_modified, as: 'lastModified', class: Google::Apis::AndroidpublisherV2::Timestamp, decorator: Google::Apis::AndroidpublisherV2::Timestamp::Representation
      
          property :text, as: 'text'
        end
      end
      
      class DeviceMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cpu_make, as: 'cpuMake'
          property :cpu_model, as: 'cpuModel'
          property :device_class, as: 'deviceClass'
          property :gl_es_version, as: 'glEsVersion'
          property :manufacturer, as: 'manufacturer'
          property :native_platform, as: 'nativePlatform'
          property :product_name, as: 'productName'
          property :ram_mb, as: 'ramMb'
          property :screen_density_dpi, as: 'screenDensityDpi'
          property :screen_height_px, as: 'screenHeightPx'
          property :screen_width_px, as: 'screenWidthPx'
        end
      end
      
      class ExpansionFile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :file_size, :numeric_string => true, as: 'fileSize'
          property :references_version, as: 'referencesVersion'
        end
      end
      
      class UploadExpansionFilesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expansion_file, as: 'expansionFile', class: Google::Apis::AndroidpublisherV2::ExpansionFile, decorator: Google::Apis::AndroidpublisherV2::ExpansionFile::Representation
      
        end
      end
      
      class ExternallyHostedApk
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :application_label, as: 'applicationLabel'
          collection :certificate_base64s, as: 'certificateBase64s'
          property :externally_hosted_url, as: 'externallyHostedUrl'
          property :file_sha1_base64, as: 'fileSha1Base64'
          property :file_sha256_base64, as: 'fileSha256Base64'
          property :file_size, :numeric_string => true, as: 'fileSize'
          property :icon_base64, as: 'iconBase64'
          property :maximum_sdk, as: 'maximumSdk'
          property :minimum_sdk, as: 'minimumSdk'
          collection :native_codes, as: 'nativeCodes'
          property :package_name, as: 'packageName'
          collection :uses_features, as: 'usesFeatures'
          collection :uses_permissions, as: 'usesPermissions', class: Google::Apis::AndroidpublisherV2::ExternallyHostedApkUsesPermission, decorator: Google::Apis::AndroidpublisherV2::ExternallyHostedApkUsesPermission::Representation
      
          property :version_code, as: 'versionCode'
          property :version_name, as: 'versionName'
        end
      end
      
      class ExternallyHostedApkUsesPermission
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :max_sdk_version, as: 'maxSdkVersion'
          property :name, as: 'name'
        end
      end
      
      class Image
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :sha1, as: 'sha1'
          property :sha256, as: 'sha256'
          property :url, as: 'url'
        end
      end
      
      class DeleteAllImagesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :deleted, as: 'deleted', class: Google::Apis::AndroidpublisherV2::Image, decorator: Google::Apis::AndroidpublisherV2::Image::Representation
      
        end
      end
      
      class ListImagesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :images, as: 'images', class: Google::Apis::AndroidpublisherV2::Image, decorator: Google::Apis::AndroidpublisherV2::Image::Representation
      
        end
      end
      
      class UploadImagesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image, as: 'image', class: Google::Apis::AndroidpublisherV2::Image, decorator: Google::Apis::AndroidpublisherV2::Image::Representation
      
        end
      end
      
      class InAppProduct
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_language, as: 'defaultLanguage'
          property :default_price, as: 'defaultPrice', class: Google::Apis::AndroidpublisherV2::Price, decorator: Google::Apis::AndroidpublisherV2::Price::Representation
      
          property :grace_period, as: 'gracePeriod'
          hash :listings, as: 'listings', class: Google::Apis::AndroidpublisherV2::InAppProductListing, decorator: Google::Apis::AndroidpublisherV2::InAppProductListing::Representation
      
          property :package_name, as: 'packageName'
          hash :prices, as: 'prices', class: Google::Apis::AndroidpublisherV2::Price, decorator: Google::Apis::AndroidpublisherV2::Price::Representation
      
          property :purchase_type, as: 'purchaseType'
          property :season, as: 'season', class: Google::Apis::AndroidpublisherV2::Season, decorator: Google::Apis::AndroidpublisherV2::Season::Representation
      
          property :sku, as: 'sku'
          property :status, as: 'status'
          property :subscription_period, as: 'subscriptionPeriod'
          property :trial_period, as: 'trialPeriod'
        end
      end
      
      class InAppProductListing
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :title, as: 'title'
        end
      end
      
      class ListInAppProductsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :inappproduct, as: 'inappproduct', class: Google::Apis::AndroidpublisherV2::InAppProduct, decorator: Google::Apis::AndroidpublisherV2::InAppProduct::Representation
      
          property :kind, as: 'kind'
          property :page_info, as: 'pageInfo', class: Google::Apis::AndroidpublisherV2::PageInfo, decorator: Google::Apis::AndroidpublisherV2::PageInfo::Representation
      
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::AndroidpublisherV2::TokenPagination, decorator: Google::Apis::AndroidpublisherV2::TokenPagination::Representation
      
        end
      end
      
      class Listing
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :full_description, as: 'fullDescription'
          property :language, as: 'language'
          property :short_description, as: 'shortDescription'
          property :title, as: 'title'
          property :video, as: 'video'
        end
      end
      
      class ListListingsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :listings, as: 'listings', class: Google::Apis::AndroidpublisherV2::Listing, decorator: Google::Apis::AndroidpublisherV2::Listing::Representation
      
        end
      end
      
      class MonthDay
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :day, as: 'day'
          property :month, as: 'month'
        end
      end
      
      class PageInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :result_per_page, as: 'resultPerPage'
          property :start_index, as: 'startIndex'
          property :total_results, as: 'totalResults'
        end
      end
      
      class Price
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :currency, as: 'currency'
          property :price_micros, as: 'priceMicros'
        end
      end
      
      class ProductPurchase
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :consumption_state, as: 'consumptionState'
          property :developer_payload, as: 'developerPayload'
          property :kind, as: 'kind'
          property :order_id, as: 'orderId'
          property :purchase_state, as: 'purchaseState'
          property :purchase_time_millis, :numeric_string => true, as: 'purchaseTimeMillis'
          property :purchase_type, as: 'purchaseType'
        end
      end
      
      class Prorate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :default_price, as: 'defaultPrice', class: Google::Apis::AndroidpublisherV2::Price, decorator: Google::Apis::AndroidpublisherV2::Price::Representation
      
          property :start, as: 'start', class: Google::Apis::AndroidpublisherV2::MonthDay, decorator: Google::Apis::AndroidpublisherV2::MonthDay::Representation
      
        end
      end
      
      class Review
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author_name, as: 'authorName'
          collection :comments, as: 'comments', class: Google::Apis::AndroidpublisherV2::Comment, decorator: Google::Apis::AndroidpublisherV2::Comment::Representation
      
          property :review_id, as: 'reviewId'
        end
      end
      
      class ReviewReplyResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :last_edited, as: 'lastEdited', class: Google::Apis::AndroidpublisherV2::Timestamp, decorator: Google::Apis::AndroidpublisherV2::Timestamp::Representation
      
          property :reply_text, as: 'replyText'
        end
      end
      
      class ReviewsListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :page_info, as: 'pageInfo', class: Google::Apis::AndroidpublisherV2::PageInfo, decorator: Google::Apis::AndroidpublisherV2::PageInfo::Representation
      
          collection :reviews, as: 'reviews', class: Google::Apis::AndroidpublisherV2::Review, decorator: Google::Apis::AndroidpublisherV2::Review::Representation
      
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::AndroidpublisherV2::TokenPagination, decorator: Google::Apis::AndroidpublisherV2::TokenPagination::Representation
      
        end
      end
      
      class ReviewsReplyRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :reply_text, as: 'replyText'
        end
      end
      
      class ReviewsReplyResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :result, as: 'result', class: Google::Apis::AndroidpublisherV2::ReviewReplyResult, decorator: Google::Apis::AndroidpublisherV2::ReviewReplyResult::Representation
      
        end
      end
      
      class Season
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end, as: 'end', class: Google::Apis::AndroidpublisherV2::MonthDay, decorator: Google::Apis::AndroidpublisherV2::MonthDay::Representation
      
          collection :prorations, as: 'prorations', class: Google::Apis::AndroidpublisherV2::Prorate, decorator: Google::Apis::AndroidpublisherV2::Prorate::Representation
      
          property :start, as: 'start', class: Google::Apis::AndroidpublisherV2::MonthDay, decorator: Google::Apis::AndroidpublisherV2::MonthDay::Representation
      
        end
      end
      
      class SubscriptionCancelSurveyResult
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cancel_survey_reason, as: 'cancelSurveyReason'
          property :user_input_cancel_reason, as: 'userInputCancelReason'
        end
      end
      
      class SubscriptionDeferralInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :desired_expiry_time_millis, :numeric_string => true, as: 'desiredExpiryTimeMillis'
          property :expected_expiry_time_millis, :numeric_string => true, as: 'expectedExpiryTimeMillis'
        end
      end
      
      class SubscriptionPriceChange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :new_price, as: 'newPrice', class: Google::Apis::AndroidpublisherV2::Price, decorator: Google::Apis::AndroidpublisherV2::Price::Representation
      
          property :state, as: 'state'
        end
      end
      
      class SubscriptionPurchase
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :auto_renewing, as: 'autoRenewing'
          property :cancel_reason, as: 'cancelReason'
          property :cancel_survey_result, as: 'cancelSurveyResult', class: Google::Apis::AndroidpublisherV2::SubscriptionCancelSurveyResult, decorator: Google::Apis::AndroidpublisherV2::SubscriptionCancelSurveyResult::Representation
      
          property :country_code, as: 'countryCode'
          property :developer_payload, as: 'developerPayload'
          property :email_address, as: 'emailAddress'
          property :expiry_time_millis, :numeric_string => true, as: 'expiryTimeMillis'
          property :family_name, as: 'familyName'
          property :given_name, as: 'givenName'
          property :kind, as: 'kind'
          property :linked_purchase_token, as: 'linkedPurchaseToken'
          property :order_id, as: 'orderId'
          property :payment_state, as: 'paymentState'
          property :price_amount_micros, :numeric_string => true, as: 'priceAmountMicros'
          property :price_change, as: 'priceChange', class: Google::Apis::AndroidpublisherV2::SubscriptionPriceChange, decorator: Google::Apis::AndroidpublisherV2::SubscriptionPriceChange::Representation
      
          property :price_currency_code, as: 'priceCurrencyCode'
          property :profile_id, as: 'profileId'
          property :profile_name, as: 'profileName'
          property :purchase_type, as: 'purchaseType'
          property :start_time_millis, :numeric_string => true, as: 'startTimeMillis'
          property :user_cancellation_time_millis, :numeric_string => true, as: 'userCancellationTimeMillis'
        end
      end
      
      class DeferSubscriptionPurchasesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deferral_info, as: 'deferralInfo', class: Google::Apis::AndroidpublisherV2::SubscriptionDeferralInfo, decorator: Google::Apis::AndroidpublisherV2::SubscriptionDeferralInfo::Representation
      
        end
      end
      
      class DeferSubscriptionPurchasesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :new_expiry_time_millis, :numeric_string => true, as: 'newExpiryTimeMillis'
        end
      end
      
      class Testers
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :google_groups, as: 'googleGroups'
        end
      end
      
      class Timestamp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :nanos, as: 'nanos'
          property :seconds, :numeric_string => true, as: 'seconds'
        end
      end
      
      class TokenPagination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          property :previous_page_token, as: 'previousPageToken'
        end
      end
      
      class Track
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :track, as: 'track'
          property :user_fraction, as: 'userFraction'
          collection :version_codes, as: 'versionCodes'
        end
      end
      
      class ListTracksResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :tracks, as: 'tracks', class: Google::Apis::AndroidpublisherV2::Track, decorator: Google::Apis::AndroidpublisherV2::Track::Representation
      
        end
      end
      
      class UserComment
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :android_os_version, as: 'androidOsVersion'
          property :app_version_code, as: 'appVersionCode'
          property :app_version_name, as: 'appVersionName'
          property :device, as: 'device'
          property :device_metadata, as: 'deviceMetadata', class: Google::Apis::AndroidpublisherV2::DeviceMetadata, decorator: Google::Apis::AndroidpublisherV2::DeviceMetadata::Representation
      
          property :last_modified, as: 'lastModified', class: Google::Apis::AndroidpublisherV2::Timestamp, decorator: Google::Apis::AndroidpublisherV2::Timestamp::Representation
      
          property :original_text, as: 'originalText'
          property :reviewer_language, as: 'reviewerLanguage'
          property :star_rating, as: 'starRating'
          property :text, as: 'text'
          property :thumbs_down_count, as: 'thumbsDownCount'
          property :thumbs_up_count, as: 'thumbsUpCount'
        end
      end
      
      class VoidedPurchase
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :purchase_time_millis, :numeric_string => true, as: 'purchaseTimeMillis'
          property :purchase_token, as: 'purchaseToken'
          property :voided_time_millis, :numeric_string => true, as: 'voidedTimeMillis'
        end
      end
      
      class VoidedPurchasesListResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :page_info, as: 'pageInfo', class: Google::Apis::AndroidpublisherV2::PageInfo, decorator: Google::Apis::AndroidpublisherV2::PageInfo::Representation
      
          property :token_pagination, as: 'tokenPagination', class: Google::Apis::AndroidpublisherV2::TokenPagination, decorator: Google::Apis::AndroidpublisherV2::TokenPagination::Representation
      
          collection :voided_purchases, as: 'voidedPurchases', class: Google::Apis::AndroidpublisherV2::VoidedPurchase, decorator: Google::Apis::AndroidpublisherV2::VoidedPurchase::Representation
      
        end
      end
    end
  end
end
