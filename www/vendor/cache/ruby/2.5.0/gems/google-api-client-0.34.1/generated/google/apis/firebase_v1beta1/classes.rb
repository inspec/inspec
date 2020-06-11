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
      
      # All fields are required.
      class AddFirebaseRequest
        include Google::Apis::Core::Hashable
      
        # Deprecated. Instead, to set your project's default GCP resource location,
        # call [`FinalizeDefaultLocation`](../projects.defaultLocation/finalize)
        # after you add Firebase resources to your project.
        # <br>
        # <br>The ID of the project's default GCP resource location. The location
        # must be one of the available
        # [GCP resource
        # locations](https://firebase.google.com/docs/projects/locations).
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # Deprecated. Instead, to link your Project with a Google Analytics account,
        # call [`AddGoogleAnalytics`](../../v1beta1/projects/addGoogleAnalytics)
        # after you add Firebase resources to your Project.
        # <br>
        # <br>The region code (CLDR) that the account will use for Firebase Analytics
        # data.
        # <br>For example: US, GB, or DE
        # <br>
        # <br>In Java, use `com.google.i18n.identifiers.RegionCode`.
        # Corresponds to the JSON property `regionCode`
        # @return [String]
        attr_accessor :region_code
      
        # Deprecated. Instead, to link your Project with a Google Analytics account,
        # call [`AddGoogleAnalytics`](../../v1beta1/projects/addGoogleAnalytics)
        # after you add Firebase resources to your Project.
        # <br>
        # <br>The time zone that the account will use for Firebase Analytics data.
        # <br>For example: America/Los_Angeles or Africa/Abidjan
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @location_id = args[:location_id] if args.key?(:location_id)
          @region_code = args[:region_code] if args.key?(:region_code)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
        end
      end
      
      # 
      class AddGoogleAnalyticsRequest
        include Google::Apis::Core::Hashable
      
        # The ID for the existing
        # [Google Analytics account](http://www.google.com/analytics/) that you
        # want to link with your `FirebaseProject`.
        # <br>
        # <br>Specifying this field will provision a new Google Analytics
        # property in your Google Analytics account and associate the new property
        # with your `FirebaseProject`.
        # Corresponds to the JSON property `analyticsAccountId`
        # @return [String]
        attr_accessor :analytics_account_id
      
        # The ID for the existing Google Analytics property that you want to
        # associate with your `FirebaseProject`.
        # Corresponds to the JSON property `analyticsPropertyId`
        # @return [String]
        attr_accessor :analytics_property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @analytics_account_id = args[:analytics_account_id] if args.key?(:analytics_account_id)
          @analytics_property_id = args[:analytics_property_id] if args.key?(:analytics_property_id)
        end
      end
      
      # 
      class AdminSdkConfig
        include Google::Apis::Core::Hashable
      
        # The default Firebase Realtime Database URL.
        # Corresponds to the JSON property `databaseURL`
        # @return [String]
        attr_accessor :database_url
      
        # The ID of the project's default GCP resource location. The location is one
        # of the available
        # [GCP resource
        # locations](https://firebase.google.com/docs/projects/locations). <br>
        # <br>This field is omitted if the default GCP resource location has not been
        # finalized yet. To set your project's default GCP resource location,
        # call [`FinalizeDefaultLocation`](../projects.defaultLocation/finalize)
        # after you add Firebase services to your project.
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # Immutable. The globally unique, user-assigned project ID of the parent
        # Project.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # The default Cloud Storage for Firebase storage bucket name.
        # Corresponds to the JSON property `storageBucket`
        # @return [String]
        attr_accessor :storage_bucket
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @database_url = args[:database_url] if args.key?(:database_url)
          @location_id = args[:location_id] if args.key?(:location_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @storage_bucket = args[:storage_bucket] if args.key?(:storage_bucket)
        end
      end
      
      # 
      class AnalyticsDetails
        include Google::Apis::Core::Hashable
      
        # Details of a Google Analytics property
        # Corresponds to the JSON property `analyticsProperty`
        # @return [Google::Apis::FirebaseV1beta1::AnalyticsProperty]
        attr_accessor :analytics_property
      
        # For Android Apps and iOS Apps: A map of `app` to `streamId` for each
        # Firebase App in the specified `FirebaseProject`. Each `app` and
        # `streamId` appears only once.<br>
        # <br>
        # For Web Apps: A map of `app` to `streamId` and `measurementId` for each
        # Firebase App in the specified `FirebaseProject`. Each `app`, `streamId`,
        # and `measurementId` appears only once.
        # Corresponds to the JSON property `streamMappings`
        # @return [Array<Google::Apis::FirebaseV1beta1::StreamMapping>]
        attr_accessor :stream_mappings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @analytics_property = args[:analytics_property] if args.key?(:analytics_property)
          @stream_mappings = args[:stream_mappings] if args.key?(:stream_mappings)
        end
      end
      
      # Details of a Google Analytics property
      class AnalyticsProperty
        include Google::Apis::Core::Hashable
      
        # The display name of the Google Analytics property associated with the
        # specified `FirebaseProject`.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The globally unique, Google-assigned identifier of the Google Analytics
        # property associated with the specified `FirebaseProject`.
        # <br>
        # <br>If you called
        # [`AddGoogleAnalytics`](../../v1beta1/projects/addGoogleAnalytics) to link
        # your `FirebaseProject` with a Google Analytics account, the value in this
        # `id` field is the same as the ID of the property either specified or
        # provisioned with that call to `AddGoogleAnalytics`.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @id = args[:id] if args.key?(:id)
        end
      end
      
      # Details of a Firebase App for Android.
      class AndroidApp
        include Google::Apis::Core::Hashable
      
        # Immutable. The globally unique, Firebase-assigned identifier of the App.
        # <br>
        # <br>This identifier should be treated as an opaque token, as the data
        # format is not specified.
        # Corresponds to the JSON property `appId`
        # @return [String]
        attr_accessor :app_id
      
        # The user-assigned display name of the App.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The fully qualified resource name of the App, in the format:
        # <br><code>projects/<var>projectId</var>/androidApps/<var>appId</var></code>
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The canonical package name of the Android App as would appear in the
        # Google Play Developer Console.
        # Corresponds to the JSON property `packageName`
        # @return [String]
        attr_accessor :package_name
      
        # The globally unique, user-assigned ID of the parent Project for the App.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_id = args[:app_id] if args.key?(:app_id)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @package_name = args[:package_name] if args.key?(:package_name)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # Configuration metadata of a single Firebase App for Android.
      class AndroidAppConfig
        include Google::Apis::Core::Hashable
      
        # The contents of the JSON configuration file.
        # Corresponds to the JSON property `configFileContents`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :config_file_contents
      
        # The filename that the configuration artifact is typically saved as.
        # <br>For example: `google-services.json`
        # Corresponds to the JSON property `configFilename`
        # @return [String]
        attr_accessor :config_filename
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config_file_contents = args[:config_file_contents] if args.key?(:config_file_contents)
          @config_filename = args[:config_filename] if args.key?(:config_filename)
        end
      end
      
      # The default resources associated with a `FirebaseProject`.
      class DefaultResources
        include Google::Apis::Core::Hashable
      
        # The default Firebase Hosting site name, in the format:
        # <br><code><var>projectId</var></code>
        # <br>Though rare, your `projectId` might already be used as the name for an
        # existing Hosting site in another project (learn more about creating
        # non-default,
        # [additional sites](https://firebase.google.com/docs/hosting/multisites)).
        # In these cases, your `projectId` is appended with a hyphen then five
        # alphanumeric characters to create your default Hosting site name. For
        # example, if your `projectId` is `myproject123`, your default Hosting site
        # name might be:
        # <br><code>myproject123-a5c16</code>
        # Corresponds to the JSON property `hostingSite`
        # @return [String]
        attr_accessor :hosting_site
      
        # The ID of the project's default GCP resource location. The location is one
        # of the available
        # [GCP resource
        # locations](https://firebase.google.com/docs/projects/locations). <br>
        # <br>This field is omitted if the default GCP resource location has not been
        # finalized yet. To set your project's default GCP resource location,
        # call [`FinalizeDefaultLocation`](../projects.defaultLocation/finalize)
        # after you add Firebase services to your project.
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # The default Firebase Realtime Database instance name, in the format:
        # <br><code><var>projectId</var></code>
        # <br>Though rare, your `projectId` might already be used as the name for an
        # existing Realtime Database instance in another project (learn more about
        # [database
        # sharding](https://firebase.google.com/docs/database/usage/sharding)). In
        # these cases, your `projectId` is appended with a hyphen then five
        # alphanumeric characters to create your default Realtime Database instance
        # name. For example, if your `projectId` is `myproject123`, your default
        # database instance name might be:
        # <br><code>myproject123-a5c16</code>
        # Corresponds to the JSON property `realtimeDatabaseInstance`
        # @return [String]
        attr_accessor :realtime_database_instance
      
        # The default Cloud Storage for Firebase storage bucket, in the format:
        # <br><code><var>projectId</var>.appspot.com</code>
        # Corresponds to the JSON property `storageBucket`
        # @return [String]
        attr_accessor :storage_bucket
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hosting_site = args[:hosting_site] if args.key?(:hosting_site)
          @location_id = args[:location_id] if args.key?(:location_id)
          @realtime_database_instance = args[:realtime_database_instance] if args.key?(:realtime_database_instance)
          @storage_bucket = args[:storage_bucket] if args.key?(:storage_bucket)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # 
      class FinalizeDefaultLocationRequest
        include Google::Apis::Core::Hashable
      
        # The ID of the default GCP resource location for the Project. The location
        # must be one of the available
        # [GCP resource
        # locations](https://firebase.google.com/docs/projects/locations).
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @location_id = args[:location_id] if args.key?(:location_id)
        end
      end
      
      # A high-level summary of an App.
      class FirebaseAppInfo
        include Google::Apis::Core::Hashable
      
        # Immutable. The globally unique, Firebase-assigned identifier of the App.
        # <br>
        # <br>This identifier should be treated as an opaque token, as the data
        # format is not specified.
        # Corresponds to the JSON property `appId`
        # @return [String]
        attr_accessor :app_id
      
        # The user-assigned display name of the Firebase App.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The fully qualified resource name of the Firebase App, in the format:
        # <br><code>projects/<var>projectId</var>/iosApps/<var>appId</var></code>
        # or <br><code>projects/<var>projectId</var>/androidApps/<var>appId</var>
        # </code>
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The platform of the Firebase App.
        # Corresponds to the JSON property `platform`
        # @return [String]
        attr_accessor :platform
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_id = args[:app_id] if args.key?(:app_id)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @platform = args[:platform] if args.key?(:platform)
        end
      end
      
      # A `FirebaseProject` is the top-level Firebase entity. It is the container for
      # Firebase Apps, Firebase Hosting sites, storage systems (Firebase Realtime
      # Database, Cloud Firestore, Cloud Storage buckets) and other Firebase and
      # Google Cloud Platform (GCP) resources.
      # <br>
      # <br>You can create a new `FirebaseProject` in the
      # [Firebase console](https://console.firebase.google.com/),
      # or you can add Firebase resources to an existing
      # [GCP
      # `Project`](https://cloud.google.com/resource-manager/reference/rest/v1/
      # projects)
      # by calling
      # AddFirebase.
      # <br>
      # <br>A `FirebaseProject` is actually also a GCP `Project`, so a
      # `FirebaseProject` uses underlying GCP identifiers (most importantly,
      # `projectId`) as its own for easy interop with GCP APIs.
      class FirebaseProject
        include Google::Apis::Core::Hashable
      
        # The user-assigned display name of the Project.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The fully qualified resource name of the Project, in the format:
        # <br><code>projects/<var>projectId</var></code>
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Immutable. The globally unique, user-assigned ID of the Project.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # The globally unique, Google-assigned identifier of the Project.
        # Corresponds to the JSON property `projectNumber`
        # @return [Fixnum]
        attr_accessor :project_number
      
        # The default resources associated with a `FirebaseProject`.
        # Corresponds to the JSON property `resources`
        # @return [Google::Apis::FirebaseV1beta1::DefaultResources]
        attr_accessor :resources
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
          @project_number = args[:project_number] if args.key?(:project_number)
          @resources = args[:resources] if args.key?(:resources)
        end
      end
      
      # Details of a Firebase App for iOS.
      class IosApp
        include Google::Apis::Core::Hashable
      
        # Immutable. The globally unique, Firebase-assigned identifier of the App.
        # <br>
        # <br>This identifier should be treated as an opaque token, as the data
        # format is not specified.
        # Corresponds to the JSON property `appId`
        # @return [String]
        attr_accessor :app_id
      
        # The automatically generated Apple ID assigned to the App by Apple in the
        # iOS App Store.
        # Corresponds to the JSON property `appStoreId`
        # @return [String]
        attr_accessor :app_store_id
      
        # The canonical bundle ID of the iOS App as it would appear in the iOS
        # AppStore.
        # Corresponds to the JSON property `bundleId`
        # @return [String]
        attr_accessor :bundle_id
      
        # The user-assigned display name of the App.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The fully qualified resource name of the App, in the format:
        # <br><code>projects/<var>projectId</var>/iosApps/<var>appId</var></code>
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The globally unique, user-assigned ID of the parent Project for the App.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_id = args[:app_id] if args.key?(:app_id)
          @app_store_id = args[:app_store_id] if args.key?(:app_store_id)
          @bundle_id = args[:bundle_id] if args.key?(:bundle_id)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # Configuration metadata of a single Firebase App for iOS.
      class IosAppConfig
        include Google::Apis::Core::Hashable
      
        # The content of the XML configuration file.
        # Corresponds to the JSON property `configFileContents`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :config_file_contents
      
        # The filename that the configuration artifact is typically saved as.
        # <br>For example: `GoogleService-Info.plist`
        # Corresponds to the JSON property `configFilename`
        # @return [String]
        attr_accessor :config_filename
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config_file_contents = args[:config_file_contents] if args.key?(:config_file_contents)
          @config_filename = args[:config_filename] if args.key?(:config_filename)
        end
      end
      
      # 
      class ListAndroidAppsResponse
        include Google::Apis::Core::Hashable
      
        # List of each AndroidApp that is in the parent Firebase Project.
        # Corresponds to the JSON property `apps`
        # @return [Array<Google::Apis::FirebaseV1beta1::AndroidApp>]
        attr_accessor :apps
      
        # If the result list is too large to fit in a single response, then a token
        # is returned. If the string is empty, then this response is the last page of
        # results.
        # <br>
        # <br>This token can be used in a subsequent call to `ListAndroidApps` to
        # find the next group of Apps.
        # <br>
        # <br>Page tokens are short-lived and should not be persisted.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @apps = args[:apps] if args.key?(:apps)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class ListAvailableLocationsResponse
        include Google::Apis::Core::Hashable
      
        # One page of results from a call to `ListAvailableLocations`.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::FirebaseV1beta1::Location>]
        attr_accessor :locations
      
        # If the result list is too large to fit in a single response, then a token
        # is returned. If the string is empty, then this response is the last page of
        # results and all available locations have been listed.
        # <br>
        # <br>This token can be used in a subsequent call to
        # `ListAvailableLocations` to find more locations.
        # <br>
        # <br>Page tokens are short-lived and should not be persisted.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @locations = args[:locations] if args.key?(:locations)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class ListAvailableProjectsResponse
        include Google::Apis::Core::Hashable
      
        # If the result list is too large to fit in a single response, then a token
        # is returned. If the string is empty, then this response is the last page of
        # results.
        # <br>
        # <br>This token can be used in a subsequent calls to `ListAvailableProjects`
        # to find the next group of GCP `Projects`.
        # <br>
        # <br>Page tokens are short-lived and should not be persisted.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of GCP `Projects` which can have Firebase resources added to them.
        # Corresponds to the JSON property `projectInfo`
        # @return [Array<Google::Apis::FirebaseV1beta1::ProjectInfo>]
        attr_accessor :project_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @project_info = args[:project_info] if args.key?(:project_info)
        end
      end
      
      # 
      class ListFirebaseProjectsResponse
        include Google::Apis::Core::Hashable
      
        # If the result list is too large to fit in a single response, then a token
        # is returned. If the string is empty, then this response is the last page of
        # results.
        # <br>
        # <br>This token can be used in a subsequent calls to `ListFirebaseProjects`
        # to find the next group of Projects.
        # <br>
        # <br>Page tokens are short-lived and should not be persisted.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # One page of the list of Projects that are accessible to the caller.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::FirebaseV1beta1::FirebaseProject>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # 
      class ListIosAppsResponse
        include Google::Apis::Core::Hashable
      
        # List of each IosApp that is in the parent Firebase Project.
        # Corresponds to the JSON property `apps`
        # @return [Array<Google::Apis::FirebaseV1beta1::IosApp>]
        attr_accessor :apps
      
        # If the result list is too large to fit in a single response, then a token
        # is returned. If the string is empty, then this response is the last page of
        # results.
        # <br>
        # <br>This token can be used in a subsequent call to `ListIosApps` to find
        # the next group of Apps.
        # <br>
        # <br>Page tokens are short-lived and should not be persisted.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @apps = args[:apps] if args.key?(:apps)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class ListShaCertificatesResponse
        include Google::Apis::Core::Hashable
      
        # The list of SHA certificates associated with the App.
        # Corresponds to the JSON property `certificates`
        # @return [Array<Google::Apis::FirebaseV1beta1::ShaCertificate>]
        attr_accessor :certificates
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @certificates = args[:certificates] if args.key?(:certificates)
        end
      end
      
      # 
      class ListWebAppsResponse
        include Google::Apis::Core::Hashable
      
        # List of each WebApp that is in the parent Firebase Project.
        # Corresponds to the JSON property `apps`
        # @return [Array<Google::Apis::FirebaseV1beta1::WebApp>]
        attr_accessor :apps
      
        # If the result list is too large to fit in a single response, then a token
        # is returned. If the string is empty, then this response is the last page of
        # results.
        # <br>
        # <br>This token can be used in a subsequent call to `ListWebApps` to find
        # the next group of Apps.
        # <br>
        # <br>Page tokens are short-lived and should not be persisted.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @apps = args[:apps] if args.key?(:apps)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # A GCP resource location that can be selected for a Project.
      class Location
        include Google::Apis::Core::Hashable
      
        # The ID of the default GCP resource location. It must be one of the
        # available
        # [GCP resource
        # locations](https://firebase.google.com/docs/projects/locations).
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @location_id = args[:location_id] if args.key?(:location_id)
        end
      end
      
      # This is proto2's version of MessageSet.
      class MessageSet
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If `true`, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::FirebaseV1beta1::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # A reference to a Google Cloud Platform (GCP) `Project`.
      class ProjectInfo
        include Google::Apis::Core::Hashable
      
        # The user-assigned display name of the GCP `Project`, for example:
        # <code>My App</code>
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The ID of the project's default GCP resource location. The location is one
        # of the available
        # [GCP resource
        # locations](https://firebase.google.com/docs/projects/locations). <br> <br>
        # Not all projects will have this field populated. If it is not populated, it
        # means that the project does not yet have a default GCP resource location.
        # To set your project's default GCP resource location, call
        # [`FinalizeDefaultLocation`](../projects.defaultLocation/finalize) after you
        # add Firebase resources to your project.
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # The resource name of the GCP `Project` to which Firebase resources can be
        # added, in the format:
        # <br><code>projects/<var>projectId</var></code>
        # Corresponds to the JSON property `project`
        # @return [String]
        attr_accessor :project
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @location_id = args[:location_id] if args.key?(:location_id)
          @project = args[:project] if args.key?(:project)
        end
      end
      
      # 
      class RemoveAnalyticsRequest
        include Google::Apis::Core::Hashable
      
        # Optional. The ID of the Google Analytics property associated with the
        # specified `FirebaseProject`.
        # <ul>
        # <li>If not set, then the Google Analytics property that is currently
        # associated with the specified `FirebaseProject` is removed.</li>
        # <li>If set, and the specified `FirebaseProject` is currently associated
        # with a <em>different</em> Google Analytics property, then the response is a
        # `412 Precondition Failed` error.</li>
        # </ul>
        # Corresponds to the JSON property `analyticsPropertyId`
        # @return [String]
        attr_accessor :analytics_property_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @analytics_property_id = args[:analytics_property_id] if args.key?(:analytics_property_id)
        end
      end
      
      # 
      class SearchFirebaseAppsResponse
        include Google::Apis::Core::Hashable
      
        # One page of results from a call to `SearchFirebaseApps`.
        # Corresponds to the JSON property `apps`
        # @return [Array<Google::Apis::FirebaseV1beta1::FirebaseAppInfo>]
        attr_accessor :apps
      
        # If the result list is too large to fit in a single response, then a token
        # is returned.
        # <br>
        # <br>This token can be used in a subsequent calls to `SearchFirebaseApps`
        # to find the next group of Apps.
        # <br>If the string is empty, then this response is the last page of results.
        # <br>Page tokens are short-lived and should not be persisted.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @apps = args[:apps] if args.key?(:apps)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # A SHA-1 or SHA-256 certificate associated with the AndroidApp.
      class ShaCertificate
        include Google::Apis::Core::Hashable
      
        # The SHA certificate type.
        # Corresponds to the JSON property `certType`
        # @return [String]
        attr_accessor :cert_type
      
        # The fully qualified resource name of the `sha-key`, in the format:
        # <br><code>projects/<var>projectId</var>/androidApps/<var>appId</var>/sha/<var>
        # shaId</var></code>
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The certificate hash for the App.
        # Corresponds to the JSON property `shaHash`
        # @return [String]
        attr_accessor :sha_hash
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cert_type = args[:cert_type] if args.key?(:cert_type)
          @name = args[:name] if args.key?(:name)
          @sha_hash = args[:sha_hash] if args.key?(:sha_hash)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details.  There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Wire-format for a Status object
      class StatusProto
        include Google::Apis::Core::Hashable
      
        # The canonical error code (see codes.proto) that most closely
        # corresponds to this status. May be missing.
        # Corresponds to the JSON property `canonicalCode`
        # @return [Fixnum]
        attr_accessor :canonical_code
      
        # Numeric code drawn from the space specified below. Often, this is the
        # canonical error space, and code is drawn from google3/util/task/codes.proto
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # Detail message
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # This is proto2's version of MessageSet.
        # Corresponds to the JSON property `messageSet`
        # @return [Google::Apis::FirebaseV1beta1::MessageSet]
        attr_accessor :message_set
      
        # Message that groups a protocol type_id (as defined by MessageSet),
        # with an encoded message of that type.  Its use is similar to
        # MessageSet, except it represents a single (type, encoded message)
        # instead of a set.
        # To fill for known protocol type:
        # MyProtocolMsg proto;
        # TypedMessage typed_msg;
        # typed_msg.set_type_id(MyProtocolMsg::MESSAGE_TYPE_ID);
        # proto.AppendToCord(typed_msg.mutable_message());
        # To fill for unknown protocol type:
        # ProtocolMessage proto;
        # TypedMessage typed_msg;
        # typed_msg.set_type_id(proto.GetMapper()->type_id());
        # proto.AppendToCord(typed_msg.mutable_message());
        # Corresponds to the JSON property `payload`
        # @return [Google::Apis::FirebaseV1beta1::TypedMessage]
        attr_accessor :payload
      
        # The following are usually only present when code != 0
        # Space to which this status belongs
        # Corresponds to the JSON property `space`
        # @return [String]
        attr_accessor :space
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @canonical_code = args[:canonical_code] if args.key?(:canonical_code)
          @code = args[:code] if args.key?(:code)
          @message = args[:message] if args.key?(:message)
          @message_set = args[:message_set] if args.key?(:message_set)
          @payload = args[:payload] if args.key?(:payload)
          @space = args[:space] if args.key?(:space)
        end
      end
      
      # A mapping of a Firebase App to a Google Analytics data stream
      class StreamMapping
        include Google::Apis::Core::Hashable
      
        # The fully qualified resource name of the Firebase App associated with the
        # Google Analytics data stream, in the format:
        # <br><code>projects/<var>projectId</var>/androidApps/<var>appId</var></code>
        # or
        # <code>projects/<var>projectId</var>/iosApps/<var>appId</var></code>
        # or
        # <code>projects/<var>projectId</var>/webApps/<var>appId</var></code>
        # Corresponds to the JSON property `app`
        # @return [String]
        attr_accessor :app
      
        # Applicable for Firebase Web Apps only.<br>
        # <br>The unique Google-assigned identifier of the Google Analytics web
        # stream associated with the Firebase Web App. Firebase SDKs use this ID to
        # interact with Google Analytics APIs.
        # <br>
        # <br>Learn more about this ID and Google Analytics web streams in the
        # [Analytics
        # documentation](https://support.google.com/analytics/topic/9303475).
        # Corresponds to the JSON property `measurementId`
        # @return [String]
        attr_accessor :measurement_id
      
        # The unique Google-assigned identifier of the Google Analytics data stream
        # associated with the Firebase App.
        # <br>
        # <br>Learn more about Google Analytics data streams in the
        # [Analytics
        # documentation](https://support.google.com/analytics/answer/9303323).
        # Corresponds to the JSON property `streamId`
        # @return [Fixnum]
        attr_accessor :stream_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app = args[:app] if args.key?(:app)
          @measurement_id = args[:measurement_id] if args.key?(:measurement_id)
          @stream_id = args[:stream_id] if args.key?(:stream_id)
        end
      end
      
      # Message that groups a protocol type_id (as defined by MessageSet),
      # with an encoded message of that type.  Its use is similar to
      # MessageSet, except it represents a single (type, encoded message)
      # instead of a set.
      # To fill for known protocol type:
      # MyProtocolMsg proto;
      # TypedMessage typed_msg;
      # typed_msg.set_type_id(MyProtocolMsg::MESSAGE_TYPE_ID);
      # proto.AppendToCord(typed_msg.mutable_message());
      # To fill for unknown protocol type:
      # ProtocolMessage proto;
      # TypedMessage typed_msg;
      # typed_msg.set_type_id(proto.GetMapper()->type_id());
      # proto.AppendToCord(typed_msg.mutable_message());
      class TypedMessage
        include Google::Apis::Core::Hashable
      
        # Message bytes.
        # Corresponds to the JSON property `message`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :message
      
        # Identifier for the type.
        # Corresponds to the JSON property `typeId`
        # @return [Fixnum]
        attr_accessor :type_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @message = args[:message] if args.key?(:message)
          @type_id = args[:type_id] if args.key?(:type_id)
        end
      end
      
      # Details of a Firebase App for the web.
      class WebApp
        include Google::Apis::Core::Hashable
      
        # Immutable. The globally unique, Firebase-assigned identifier of the App.
        # <br>
        # <br>This identifier should be treated as an opaque token, as the data
        # format is not specified.
        # Corresponds to the JSON property `appId`
        # @return [String]
        attr_accessor :app_id
      
        # The fully qualified URLs where the App is hosted.
        # Corresponds to the JSON property `appUrls`
        # @return [Array<String>]
        attr_accessor :app_urls
      
        # The user-assigned display name of the App.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The fully qualified resource name of the App, for example:
        # <br><code>projects/<var>projectId</var>/webApps/<var>appId</var></code>
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The globally unique, user-assigned ID of the parent Project for the App.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_id = args[:app_id] if args.key?(:app_id)
          @app_urls = args[:app_urls] if args.key?(:app_urls)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # Configuration metadata of a single Firebase App for the web.
      class WebAppConfig
        include Google::Apis::Core::Hashable
      
        # The API key associated with the web App.
        # Corresponds to the JSON property `apiKey`
        # @return [String]
        attr_accessor :api_key
      
        # Immutable. The globally unique, Firebase-assigned identifier of the App.
        # Corresponds to the JSON property `appId`
        # @return [String]
        attr_accessor :app_id
      
        # The domain Firebase Auth configures for OAuth redirects, in the format:
        # <br><code><var>projectId</var>.firebaseapp.com</code>
        # Corresponds to the JSON property `authDomain`
        # @return [String]
        attr_accessor :auth_domain
      
        # The default Firebase Realtime Database URL.
        # Corresponds to the JSON property `databaseURL`
        # @return [String]
        attr_accessor :database_url
      
        # The ID of the project's default GCP resource location. The location is one
        # of the available
        # [GCP resource
        # locations](https://firebase.google.com/docs/projects/locations). <br>
        # <br>This field is omitted if the default GCP resource location has not been
        # finalized yet. To set your project's default GCP resource location,
        # call [`FinalizeDefaultLocation`](../projects.defaultLocation/finalize)
        # after you add Firebase services to your project.
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # The unique Google-assigned identifier of the Google Analytics web stream
        # associated with the Firebase Web App. Firebase SDKs use this ID to interact
        # with Google Analytics APIs.
        # <br>
        # <br>This field is only present if the App is linked to a web stream in a
        # Google Analytics App + Web property. Learn more about this ID and Google
        # Analytics web streams in the [Analytics
        # documentation](https://support.google.com/analytics/topic/9303475).
        # <br>
        # <br>To generate a `measurementId` and link the Web App with a Google
        # Analytics web stream, call
        # [`AddGoogleAnalytics`](../../v1beta1/projects/addGoogleAnalytics).
        # Corresponds to the JSON property `measurementId`
        # @return [String]
        attr_accessor :measurement_id
      
        # The sender ID for use with Firebase Cloud Messaging.
        # Corresponds to the JSON property `messagingSenderId`
        # @return [String]
        attr_accessor :messaging_sender_id
      
        # Immutable. The globally unique, user-assigned project ID of the parent
        # Project for the App.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # The default Cloud Storage for Firebase storage bucket name.
        # Corresponds to the JSON property `storageBucket`
        # @return [String]
        attr_accessor :storage_bucket
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_key = args[:api_key] if args.key?(:api_key)
          @app_id = args[:app_id] if args.key?(:app_id)
          @auth_domain = args[:auth_domain] if args.key?(:auth_domain)
          @database_url = args[:database_url] if args.key?(:database_url)
          @location_id = args[:location_id] if args.key?(:location_id)
          @measurement_id = args[:measurement_id] if args.key?(:measurement_id)
          @messaging_sender_id = args[:messaging_sender_id] if args.key?(:messaging_sender_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @storage_bucket = args[:storage_bucket] if args.key?(:storage_bucket)
        end
      end
    end
  end
end
