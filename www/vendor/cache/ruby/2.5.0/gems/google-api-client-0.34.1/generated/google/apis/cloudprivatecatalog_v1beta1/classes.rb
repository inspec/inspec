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
    module CloudprivatecatalogV1beta1
      
      # The readonly representation of a catalog computed with a given resource
      # context.
      class GoogleCloudPrivatecatalogV1beta1Catalog
        include Google::Apis::Core::Hashable
      
        # Output only. The time when the catalog was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The description of the catalog.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Output only. The descriptive name of the catalog as it appears in UIs.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Output only. The resource name of the target catalog, in the format of
        # `catalogs/`catalog_id`'.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The time when the catalog was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @display_name = args[:display_name] if args.key?(:display_name)
          @name = args[:name] if args.key?(:name)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # The readonly representation of a product computed with a given resource
      # context.
      class GoogleCloudPrivatecatalogV1beta1Product
        include Google::Apis::Core::Hashable
      
        # Output only. The type of the product asset. It can be one of the
        # following values:
        # * `google.deploymentmanager.Template`
        # * `google.cloudprivatecatalog.ListingOnly`
        # Corresponds to the JSON property `assetType`
        # @return [String]
        attr_accessor :asset_type
      
        # Output only. The time when the product was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The display metadata to describe the product.
        # The JSON schema of the metadata differs by Product.asset_type.
        # When the type is `google.deploymentmanager.Template`, the schema is as
        # follows:
        # ```
        # "$schema": http://json-schema.org/draft-04/schema#
        # type: object
        # properties:
        # name:
        # type: string
        # minLength: 1
        # maxLength: 64
        # description:
        # type: string
        # minLength: 1
        # maxLength: 2048
        # tagline:
        # type: string
        # minLength: 1
        # maxLength: 100
        # support_info:
        # type: string
        # minLength: 1
        # maxLength: 2048
        # creator:
        # type: string
        # minLength: 1
        # maxLength: 100
        # documentation:
        # type: array
        # items:
        # type: object
        # properties:
        # url:
        # type: string
        # pattern:
        # "^(https?)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]"
        # title:
        # type: string
        # minLength: 1
        # maxLength: 64
        # description:
        # type: string
        # minLength: 1
        # maxLength: 2048
        # required:
        # - name
        # - description
        # additionalProperties: false
        # ```
        # When the asset type is `google.cloudprivatecatalog.ListingOnly`, the schema
        # is as follows:
        # ```
        # "$schema": http://json-schema.org/draft-04/schema#
        # type: object
        # properties:
        # name:
        # type: string
        # minLength: 1
        # maxLength: 64
        # description:
        # type: string
        # minLength: 1
        # maxLength: 2048
        # tagline:
        # type: string
        # minLength: 1
        # maxLength: 100
        # support_info:
        # type: string
        # minLength: 1
        # maxLength: 2048
        # creator:
        # type: string
        # minLength: 1
        # maxLength: 100
        # documentation:
        # type: array
        # items:
        # type: object
        # properties:
        # url:
        # type: string
        # pattern:
        # "^(https?)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]"
        # title:
        # type: string
        # minLength: 1
        # maxLength: 64
        # description:
        # type: string
        # minLength: 1
        # maxLength: 2048
        # signup_url:
        # type: string
        # pattern:
        # "^(https?)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]"
        # required:
        # - name
        # - description
        # - signup_url
        # additionalProperties: false
        # ```
        # Corresponds to the JSON property `displayMetadata`
        # @return [Hash<String,Object>]
        attr_accessor :display_metadata
      
        # Output only. The icon URI of the product.
        # Corresponds to the JSON property `iconUri`
        # @return [String]
        attr_accessor :icon_uri
      
        # Output only. The resource name of the target product, in the format of
        # `products/a-z*[a-z0-9]'.
        # A unique identifier for the product under a catalog.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The time when the product was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @asset_type = args[:asset_type] if args.key?(:asset_type)
          @create_time = args[:create_time] if args.key?(:create_time)
          @display_metadata = args[:display_metadata] if args.key?(:display_metadata)
          @icon_uri = args[:icon_uri] if args.key?(:icon_uri)
          @name = args[:name] if args.key?(:name)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # Response message for PrivateCatalog.SearchCatalogs.
      class GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse
        include Google::Apis::Core::Hashable
      
        # The `Catalog`s computed from the resource context.
        # Corresponds to the JSON property `catalogs`
        # @return [Array<Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1Catalog>]
        attr_accessor :catalogs
      
        # A pagination token returned from a previous call to SearchCatalogs that
        # indicates from where listing should continue.
        # This field is optional.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @catalogs = args[:catalogs] if args.key?(:catalogs)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for PrivateCatalog.SearchProducts.
      class GoogleCloudPrivatecatalogV1beta1SearchProductsResponse
        include Google::Apis::Core::Hashable
      
        # A pagination token returned from a previous call to SearchProducts that
        # indicates from where listing should continue.
        # This field is optional.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The `Product` resources computed from the resource context.
        # Corresponds to the JSON property `products`
        # @return [Array<Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1Product>]
        attr_accessor :products
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @products = args[:products] if args.key?(:products)
        end
      end
      
      # Response message for PrivateCatalog.SearchVersions.
      class GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse
        include Google::Apis::Core::Hashable
      
        # A pagination token returned from a previous call to SearchVersions that
        # indicates from where the listing should continue.
        # This field is optional.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The `Version` resources computed from the resource context.
        # Corresponds to the JSON property `versions`
        # @return [Array<Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1Version>]
        attr_accessor :versions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @versions = args[:versions] if args.key?(:versions)
        end
      end
      
      # The consumer representation of a version which is a child resource under a
      # `Product` with asset data.
      class GoogleCloudPrivatecatalogV1beta1Version
        include Google::Apis::Core::Hashable
      
        # Output only. The asset which has been validated and is ready to be
        # provisioned. See
        # google.cloud.privatecatalogproducer.v1beta.Version.asset for details.
        # Corresponds to the JSON property `asset`
        # @return [Hash<String,Object>]
        attr_accessor :asset
      
        # Output only. The time when the version was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. The user-supplied description of the version. Maximum of 256
        # characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Output only. The resource name of the version, in the format
        # `catalogs/`catalog_id`/products/`product_id`/versions/a-z*[a-z0-9]'.
        # A unique identifier for the version under a product.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Output only. The time when the version was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @asset = args[:asset] if args.key?(:asset)
          @create_time = args[:create_time] if args.key?(:create_time)
          @description = args[:description] if args.key?(:description)
          @name = args[:name] if args.key?(:name)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
    end
  end
end
