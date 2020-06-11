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
    module ManufacturersV1
      
      class Attributes
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Capacity
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Count
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DestinationStatus
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FeatureDescription
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Image
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Issue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListProductsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Price
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Product
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ProductDetail
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Attributes
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :additional_image_link, as: 'additionalImageLink', class: Google::Apis::ManufacturersV1::Image, decorator: Google::Apis::ManufacturersV1::Image::Representation
      
          property :age_group, as: 'ageGroup'
          property :brand, as: 'brand'
          property :capacity, as: 'capacity', class: Google::Apis::ManufacturersV1::Capacity, decorator: Google::Apis::ManufacturersV1::Capacity::Representation
      
          property :color, as: 'color'
          property :count, as: 'count', class: Google::Apis::ManufacturersV1::Count, decorator: Google::Apis::ManufacturersV1::Count::Representation
      
          property :description, as: 'description'
          property :disclosure_date, as: 'disclosureDate'
          collection :excluded_destination, as: 'excludedDestination'
          collection :feature_description, as: 'featureDescription', class: Google::Apis::ManufacturersV1::FeatureDescription, decorator: Google::Apis::ManufacturersV1::FeatureDescription::Representation
      
          property :flavor, as: 'flavor'
          property :format, as: 'format'
          property :gender, as: 'gender'
          collection :gtin, as: 'gtin'
          property :image_link, as: 'imageLink', class: Google::Apis::ManufacturersV1::Image, decorator: Google::Apis::ManufacturersV1::Image::Representation
      
          collection :included_destination, as: 'includedDestination'
          property :item_group_id, as: 'itemGroupId'
          property :material, as: 'material'
          property :mpn, as: 'mpn'
          property :pattern, as: 'pattern'
          collection :product_detail, as: 'productDetail', class: Google::Apis::ManufacturersV1::ProductDetail, decorator: Google::Apis::ManufacturersV1::ProductDetail::Representation
      
          property :product_line, as: 'productLine'
          property :product_name, as: 'productName'
          property :product_page_url, as: 'productPageUrl'
          collection :product_type, as: 'productType'
          property :release_date, as: 'releaseDate'
          property :scent, as: 'scent'
          property :size, as: 'size'
          property :size_system, as: 'sizeSystem'
          property :size_type, as: 'sizeType'
          property :suggested_retail_price, as: 'suggestedRetailPrice', class: Google::Apis::ManufacturersV1::Price, decorator: Google::Apis::ManufacturersV1::Price::Representation
      
          property :target_client_id, as: 'targetClientId'
          property :theme, as: 'theme'
          property :title, as: 'title'
          collection :video_link, as: 'videoLink'
        end
      end
      
      class Capacity
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :unit, as: 'unit'
          property :value, :numeric_string => true, as: 'value'
        end
      end
      
      class Count
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :unit, as: 'unit'
          property :value, :numeric_string => true, as: 'value'
        end
      end
      
      class DestinationStatus
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :destination, as: 'destination'
          property :status, as: 'status'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class FeatureDescription
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :headline, as: 'headline'
          property :image, as: 'image', class: Google::Apis::ManufacturersV1::Image, decorator: Google::Apis::ManufacturersV1::Image::Representation
      
          property :text, as: 'text'
        end
      end
      
      class Image
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :image_url, as: 'imageUrl'
          property :status, as: 'status'
          property :type, as: 'type'
        end
      end
      
      class Issue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attribute, as: 'attribute'
          property :description, as: 'description'
          property :destination, as: 'destination'
          property :resolution, as: 'resolution'
          property :severity, as: 'severity'
          property :timestamp, as: 'timestamp'
          property :title, as: 'title'
          property :type, as: 'type'
        end
      end
      
      class ListProductsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :products, as: 'products', class: Google::Apis::ManufacturersV1::Product, decorator: Google::Apis::ManufacturersV1::Product::Representation
      
        end
      end
      
      class Price
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :amount, as: 'amount'
          property :currency, as: 'currency'
        end
      end
      
      class Product
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attributes, as: 'attributes', class: Google::Apis::ManufacturersV1::Attributes, decorator: Google::Apis::ManufacturersV1::Attributes::Representation
      
          property :content_language, as: 'contentLanguage'
          collection :destination_statuses, as: 'destinationStatuses', class: Google::Apis::ManufacturersV1::DestinationStatus, decorator: Google::Apis::ManufacturersV1::DestinationStatus::Representation
      
          collection :issues, as: 'issues', class: Google::Apis::ManufacturersV1::Issue, decorator: Google::Apis::ManufacturersV1::Issue::Representation
      
          property :name, as: 'name'
          property :parent, as: 'parent'
          property :product_id, as: 'productId'
          property :target_country, as: 'targetCountry'
        end
      end
      
      class ProductDetail
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attribute_name, as: 'attributeName'
          property :attribute_value, as: 'attributeValue'
          property :section_name, as: 'sectionName'
        end
      end
    end
  end
end
