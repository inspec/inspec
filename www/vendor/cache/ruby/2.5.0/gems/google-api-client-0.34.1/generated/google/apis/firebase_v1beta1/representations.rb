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
    module FirebaseV1beta1
      
      class AddFirebaseRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AddGoogleAnalyticsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AdminSdkConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnalyticsDetails
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnalyticsProperty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AndroidApp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AndroidAppConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DefaultResources
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FinalizeDefaultLocationRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FirebaseAppInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FirebaseProject
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IosApp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IosAppConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAndroidAppsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAvailableLocationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListAvailableProjectsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListFirebaseProjectsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListIosAppsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListShaCertificatesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListWebAppsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Location
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MessageSet
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProjectInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RemoveAnalyticsRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SearchFirebaseAppsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ShaCertificate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StatusProto
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StreamMapping
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TypedMessage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebApp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WebAppConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AddFirebaseRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :location_id, as: 'locationId'
          property :region_code, as: 'regionCode'
          property :time_zone, as: 'timeZone'
        end
      end
      
      class AddGoogleAnalyticsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :analytics_account_id, as: 'analyticsAccountId'
          property :analytics_property_id, as: 'analyticsPropertyId'
        end
      end
      
      class AdminSdkConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :database_url, as: 'databaseURL'
          property :location_id, as: 'locationId'
          property :project_id, as: 'projectId'
          property :storage_bucket, as: 'storageBucket'
        end
      end
      
      class AnalyticsDetails
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :analytics_property, as: 'analyticsProperty', class: Google::Apis::FirebaseV1beta1::AnalyticsProperty, decorator: Google::Apis::FirebaseV1beta1::AnalyticsProperty::Representation
      
          collection :stream_mappings, as: 'streamMappings', class: Google::Apis::FirebaseV1beta1::StreamMapping, decorator: Google::Apis::FirebaseV1beta1::StreamMapping::Representation
      
        end
      end
      
      class AnalyticsProperty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :id, as: 'id'
        end
      end
      
      class AndroidApp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_id, as: 'appId'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :package_name, as: 'packageName'
          property :project_id, as: 'projectId'
        end
      end
      
      class AndroidAppConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config_file_contents, :base64 => true, as: 'configFileContents'
          property :config_filename, as: 'configFilename'
        end
      end
      
      class DefaultResources
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :hosting_site, as: 'hostingSite'
          property :location_id, as: 'locationId'
          property :realtime_database_instance, as: 'realtimeDatabaseInstance'
          property :storage_bucket, as: 'storageBucket'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class FinalizeDefaultLocationRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :location_id, as: 'locationId'
        end
      end
      
      class FirebaseAppInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_id, as: 'appId'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :platform, as: 'platform'
        end
      end
      
      class FirebaseProject
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :project_id, as: 'projectId'
          property :project_number, :numeric_string => true, as: 'projectNumber'
          property :resources, as: 'resources', class: Google::Apis::FirebaseV1beta1::DefaultResources, decorator: Google::Apis::FirebaseV1beta1::DefaultResources::Representation
      
        end
      end
      
      class IosApp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_id, as: 'appId'
          property :app_store_id, as: 'appStoreId'
          property :bundle_id, as: 'bundleId'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :project_id, as: 'projectId'
        end
      end
      
      class IosAppConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :config_file_contents, :base64 => true, as: 'configFileContents'
          property :config_filename, as: 'configFilename'
        end
      end
      
      class ListAndroidAppsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :apps, as: 'apps', class: Google::Apis::FirebaseV1beta1::AndroidApp, decorator: Google::Apis::FirebaseV1beta1::AndroidApp::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListAvailableLocationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :locations, as: 'locations', class: Google::Apis::FirebaseV1beta1::Location, decorator: Google::Apis::FirebaseV1beta1::Location::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListAvailableProjectsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :project_info, as: 'projectInfo', class: Google::Apis::FirebaseV1beta1::ProjectInfo, decorator: Google::Apis::FirebaseV1beta1::ProjectInfo::Representation
      
        end
      end
      
      class ListFirebaseProjectsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :results, as: 'results', class: Google::Apis::FirebaseV1beta1::FirebaseProject, decorator: Google::Apis::FirebaseV1beta1::FirebaseProject::Representation
      
        end
      end
      
      class ListIosAppsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :apps, as: 'apps', class: Google::Apis::FirebaseV1beta1::IosApp, decorator: Google::Apis::FirebaseV1beta1::IosApp::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ListShaCertificatesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :certificates, as: 'certificates', class: Google::Apis::FirebaseV1beta1::ShaCertificate, decorator: Google::Apis::FirebaseV1beta1::ShaCertificate::Representation
      
        end
      end
      
      class ListWebAppsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :apps, as: 'apps', class: Google::Apis::FirebaseV1beta1::WebApp, decorator: Google::Apis::FirebaseV1beta1::WebApp::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Location
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :location_id, as: 'locationId'
        end
      end
      
      class MessageSet
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          property :error, as: 'error', class: Google::Apis::FirebaseV1beta1::Status, decorator: Google::Apis::FirebaseV1beta1::Status::Representation
      
          hash :metadata, as: 'metadata'
          property :name, as: 'name'
          hash :response, as: 'response'
        end
      end
      
      class ProjectInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :location_id, as: 'locationId'
          property :project, as: 'project'
        end
      end
      
      class RemoveAnalyticsRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :analytics_property_id, as: 'analyticsPropertyId'
        end
      end
      
      class SearchFirebaseAppsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :apps, as: 'apps', class: Google::Apis::FirebaseV1beta1::FirebaseAppInfo, decorator: Google::Apis::FirebaseV1beta1::FirebaseAppInfo::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ShaCertificate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cert_type, as: 'certType'
          property :name, as: 'name'
          property :sha_hash, as: 'shaHash'
        end
      end
      
      class Status
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :code, as: 'code'
          collection :details, as: 'details'
          property :message, as: 'message'
        end
      end
      
      class StatusProto
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :canonical_code, as: 'canonicalCode'
          property :code, as: 'code'
          property :message, as: 'message'
          property :message_set, as: 'messageSet', class: Google::Apis::FirebaseV1beta1::MessageSet, decorator: Google::Apis::FirebaseV1beta1::MessageSet::Representation
      
          property :payload, as: 'payload', class: Google::Apis::FirebaseV1beta1::TypedMessage, decorator: Google::Apis::FirebaseV1beta1::TypedMessage::Representation
      
          property :space, as: 'space'
        end
      end
      
      class StreamMapping
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app, as: 'app'
          property :measurement_id, as: 'measurementId'
          property :stream_id, :numeric_string => true, as: 'streamId'
        end
      end
      
      class TypedMessage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :message, :base64 => true, as: 'message'
          property :type_id, as: 'typeId'
        end
      end
      
      class WebApp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_id, as: 'appId'
          collection :app_urls, as: 'appUrls'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :project_id, as: 'projectId'
        end
      end
      
      class WebAppConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :api_key, as: 'apiKey'
          property :app_id, as: 'appId'
          property :auth_domain, as: 'authDomain'
          property :database_url, as: 'databaseURL'
          property :location_id, as: 'locationId'
          property :measurement_id, as: 'measurementId'
          property :messaging_sender_id, as: 'messagingSenderId'
          property :project_id, as: 'projectId'
          property :storage_bucket, as: 'storageBucket'
        end
      end
    end
  end
end
