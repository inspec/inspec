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
      
      class GoogleCloudPrivatecatalogV1beta1Catalog
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogV1beta1Product
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogV1beta1SearchProductsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogV1beta1Version
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GoogleCloudPrivatecatalogV1beta1Catalog
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :display_name, as: 'displayName'
          property :name, as: 'name'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GoogleCloudPrivatecatalogV1beta1Product
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :asset_type, as: 'assetType'
          property :create_time, as: 'createTime'
          hash :display_metadata, as: 'displayMetadata'
          property :icon_uri, as: 'iconUri'
          property :name, as: 'name'
          property :update_time, as: 'updateTime'
        end
      end
      
      class GoogleCloudPrivatecatalogV1beta1SearchCatalogsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :catalogs, as: 'catalogs', class: Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1Catalog, decorator: Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1Catalog::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GoogleCloudPrivatecatalogV1beta1SearchProductsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :products, as: 'products', class: Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1Product, decorator: Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1Product::Representation
      
        end
      end
      
      class GoogleCloudPrivatecatalogV1beta1SearchVersionsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :versions, as: 'versions', class: Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1Version, decorator: Google::Apis::CloudprivatecatalogV1beta1::GoogleCloudPrivatecatalogV1beta1Version::Representation
      
        end
      end
      
      class GoogleCloudPrivatecatalogV1beta1Version
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :asset, as: 'asset'
          property :create_time, as: 'createTime'
          property :description, as: 'description'
          property :name, as: 'name'
          property :update_time, as: 'updateTime'
        end
      end
    end
  end
end
