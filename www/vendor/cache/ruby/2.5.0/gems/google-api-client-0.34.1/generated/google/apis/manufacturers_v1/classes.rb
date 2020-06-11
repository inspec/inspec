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
      
      # Attributes of the product. For more information, see
      # https://support.google.com/manufacturers/answer/6124116.
      class Attributes
        include Google::Apis::Core::Hashable
      
        # The additional images of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#addlimage.
        # Corresponds to the JSON property `additionalImageLink`
        # @return [Array<Google::Apis::ManufacturersV1::Image>]
        attr_accessor :additional_image_link
      
        # The target age group of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#agegroup.
        # Corresponds to the JSON property `ageGroup`
        # @return [String]
        attr_accessor :age_group
      
        # The brand name of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#brand.
        # Corresponds to the JSON property `brand`
        # @return [String]
        attr_accessor :brand
      
        # The capacity of a product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#capacity.
        # Corresponds to the JSON property `capacity`
        # @return [Google::Apis::ManufacturersV1::Capacity]
        attr_accessor :capacity
      
        # The color of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#color.
        # Corresponds to the JSON property `color`
        # @return [String]
        attr_accessor :color
      
        # The number of products in a single package. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#count.
        # Corresponds to the JSON property `count`
        # @return [Google::Apis::ManufacturersV1::Count]
        attr_accessor :count
      
        # The description of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The disclosure date of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#disclosure.
        # Corresponds to the JSON property `disclosureDate`
        # @return [String]
        attr_accessor :disclosure_date
      
        # A list of excluded destinations.
        # Corresponds to the JSON property `excludedDestination`
        # @return [Array<String>]
        attr_accessor :excluded_destination
      
        # The rich format description of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#featuredesc.
        # Corresponds to the JSON property `featureDescription`
        # @return [Array<Google::Apis::ManufacturersV1::FeatureDescription>]
        attr_accessor :feature_description
      
        # The flavor of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#flavor.
        # Corresponds to the JSON property `flavor`
        # @return [String]
        attr_accessor :flavor
      
        # The format of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#format.
        # Corresponds to the JSON property `format`
        # @return [String]
        attr_accessor :format
      
        # The target gender of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#gender.
        # Corresponds to the JSON property `gender`
        # @return [String]
        attr_accessor :gender
      
        # The Global Trade Item Number (GTIN) of the product. For more information,
        # see https://support.google.com/manufacturers/answer/6124116#gtin.
        # Corresponds to the JSON property `gtin`
        # @return [Array<String>]
        attr_accessor :gtin
      
        # An image.
        # Corresponds to the JSON property `imageLink`
        # @return [Google::Apis::ManufacturersV1::Image]
        attr_accessor :image_link
      
        # A list of included destinations.
        # Corresponds to the JSON property `includedDestination`
        # @return [Array<String>]
        attr_accessor :included_destination
      
        # The item group id of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#itemgroupid.
        # Corresponds to the JSON property `itemGroupId`
        # @return [String]
        attr_accessor :item_group_id
      
        # The material of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#material.
        # Corresponds to the JSON property `material`
        # @return [String]
        attr_accessor :material
      
        # The Manufacturer Part Number (MPN) of the product. For more information,
        # see https://support.google.com/manufacturers/answer/6124116#mpn.
        # Corresponds to the JSON property `mpn`
        # @return [String]
        attr_accessor :mpn
      
        # The pattern of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#pattern.
        # Corresponds to the JSON property `pattern`
        # @return [String]
        attr_accessor :pattern
      
        # The details of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#productdetail.
        # Corresponds to the JSON property `productDetail`
        # @return [Array<Google::Apis::ManufacturersV1::ProductDetail>]
        attr_accessor :product_detail
      
        # The name of the group of products related to the product. For more
        # information, see
        # https://support.google.com/manufacturers/answer/6124116#productline.
        # Corresponds to the JSON property `productLine`
        # @return [String]
        attr_accessor :product_line
      
        # The canonical name of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#productname.
        # Corresponds to the JSON property `productName`
        # @return [String]
        attr_accessor :product_name
      
        # The URL of the detail page of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#productpage.
        # Corresponds to the JSON property `productPageUrl`
        # @return [String]
        attr_accessor :product_page_url
      
        # The type or category of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#producttype.
        # Corresponds to the JSON property `productType`
        # @return [Array<String>]
        attr_accessor :product_type
      
        # The release date of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#release.
        # Corresponds to the JSON property `releaseDate`
        # @return [String]
        attr_accessor :release_date
      
        # The scent of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#scent.
        # Corresponds to the JSON property `scent`
        # @return [String]
        attr_accessor :scent
      
        # The size of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#size.
        # Corresponds to the JSON property `size`
        # @return [String]
        attr_accessor :size
      
        # The size system of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#sizesystem.
        # Corresponds to the JSON property `sizeSystem`
        # @return [String]
        attr_accessor :size_system
      
        # The size type of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#sizetype.
        # Corresponds to the JSON property `sizeType`
        # @return [String]
        attr_accessor :size_type
      
        # A price.
        # Corresponds to the JSON property `suggestedRetailPrice`
        # @return [Google::Apis::ManufacturersV1::Price]
        attr_accessor :suggested_retail_price
      
        # The target client id. Should only be used in the accounts of the data
        # partners.
        # Corresponds to the JSON property `targetClientId`
        # @return [String]
        attr_accessor :target_client_id
      
        # The theme of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#theme.
        # Corresponds to the JSON property `theme`
        # @return [String]
        attr_accessor :theme
      
        # The title of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The videos of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#video.
        # Corresponds to the JSON property `videoLink`
        # @return [Array<String>]
        attr_accessor :video_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @additional_image_link = args[:additional_image_link] if args.key?(:additional_image_link)
          @age_group = args[:age_group] if args.key?(:age_group)
          @brand = args[:brand] if args.key?(:brand)
          @capacity = args[:capacity] if args.key?(:capacity)
          @color = args[:color] if args.key?(:color)
          @count = args[:count] if args.key?(:count)
          @description = args[:description] if args.key?(:description)
          @disclosure_date = args[:disclosure_date] if args.key?(:disclosure_date)
          @excluded_destination = args[:excluded_destination] if args.key?(:excluded_destination)
          @feature_description = args[:feature_description] if args.key?(:feature_description)
          @flavor = args[:flavor] if args.key?(:flavor)
          @format = args[:format] if args.key?(:format)
          @gender = args[:gender] if args.key?(:gender)
          @gtin = args[:gtin] if args.key?(:gtin)
          @image_link = args[:image_link] if args.key?(:image_link)
          @included_destination = args[:included_destination] if args.key?(:included_destination)
          @item_group_id = args[:item_group_id] if args.key?(:item_group_id)
          @material = args[:material] if args.key?(:material)
          @mpn = args[:mpn] if args.key?(:mpn)
          @pattern = args[:pattern] if args.key?(:pattern)
          @product_detail = args[:product_detail] if args.key?(:product_detail)
          @product_line = args[:product_line] if args.key?(:product_line)
          @product_name = args[:product_name] if args.key?(:product_name)
          @product_page_url = args[:product_page_url] if args.key?(:product_page_url)
          @product_type = args[:product_type] if args.key?(:product_type)
          @release_date = args[:release_date] if args.key?(:release_date)
          @scent = args[:scent] if args.key?(:scent)
          @size = args[:size] if args.key?(:size)
          @size_system = args[:size_system] if args.key?(:size_system)
          @size_type = args[:size_type] if args.key?(:size_type)
          @suggested_retail_price = args[:suggested_retail_price] if args.key?(:suggested_retail_price)
          @target_client_id = args[:target_client_id] if args.key?(:target_client_id)
          @theme = args[:theme] if args.key?(:theme)
          @title = args[:title] if args.key?(:title)
          @video_link = args[:video_link] if args.key?(:video_link)
        end
      end
      
      # The capacity of a product. For more information, see
      # https://support.google.com/manufacturers/answer/6124116#capacity.
      class Capacity
        include Google::Apis::Core::Hashable
      
        # The unit of the capacity, i.e., MB, GB, or TB.
        # Corresponds to the JSON property `unit`
        # @return [String]
        attr_accessor :unit
      
        # The numeric value of the capacity.
        # Corresponds to the JSON property `value`
        # @return [Fixnum]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @unit = args[:unit] if args.key?(:unit)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # The number of products in a single package. For more information, see
      # https://support.google.com/manufacturers/answer/6124116#count.
      class Count
        include Google::Apis::Core::Hashable
      
        # The unit in which these products are counted.
        # Corresponds to the JSON property `unit`
        # @return [String]
        attr_accessor :unit
      
        # The numeric value of the number of products in a package.
        # Corresponds to the JSON property `value`
        # @return [Fixnum]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @unit = args[:unit] if args.key?(:unit)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # The destination status.
      class DestinationStatus
        include Google::Apis::Core::Hashable
      
        # The name of the destination.
        # Corresponds to the JSON property `destination`
        # @return [String]
        attr_accessor :destination
      
        # The status of the destination.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @destination = args[:destination] if args.key?(:destination)
          @status = args[:status] if args.key?(:status)
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
      
      # A feature description of the product. For more information, see
      # https://support.google.com/manufacturers/answer/6124116#featuredesc.
      class FeatureDescription
        include Google::Apis::Core::Hashable
      
        # A short description of the feature.
        # Corresponds to the JSON property `headline`
        # @return [String]
        attr_accessor :headline
      
        # An image.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::ManufacturersV1::Image]
        attr_accessor :image
      
        # A detailed description of the feature.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @headline = args[:headline] if args.key?(:headline)
          @image = args[:image] if args.key?(:image)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # An image.
      class Image
        include Google::Apis::Core::Hashable
      
        # The URL of the image. For crawled images, this is the provided URL. For
        # uploaded images, this is a serving URL from Google if the image has been
        # processed successfully.
        # Corresponds to the JSON property `imageUrl`
        # @return [String]
        attr_accessor :image_url
      
        # The status of the image.
        # @OutputOnly
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        # The type of the image, i.e., crawled or uploaded.
        # @OutputOnly
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_url = args[:image_url] if args.key?(:image_url)
          @status = args[:status] if args.key?(:status)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Product issue.
      class Issue
        include Google::Apis::Core::Hashable
      
        # If present, the attribute that triggered the issue. For more information
        # about attributes, see
        # https://support.google.com/manufacturers/answer/6124116.
        # Corresponds to the JSON property `attribute`
        # @return [String]
        attr_accessor :attribute
      
        # Longer description of the issue focused on how to resolve it.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The destination this issue applies to.
        # Corresponds to the JSON property `destination`
        # @return [String]
        attr_accessor :destination
      
        # What needs to happen to resolve the issue.
        # Corresponds to the JSON property `resolution`
        # @return [String]
        attr_accessor :resolution
      
        # The severity of the issue.
        # Corresponds to the JSON property `severity`
        # @return [String]
        attr_accessor :severity
      
        # The timestamp when this issue appeared.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        # Short title describing the nature of the issue.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The server-generated type of the issue, for example,
        # “INCORRECT_TEXT_FORMATTING”, “IMAGE_NOT_SERVEABLE”, etc.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute = args[:attribute] if args.key?(:attribute)
          @description = args[:description] if args.key?(:description)
          @destination = args[:destination] if args.key?(:destination)
          @resolution = args[:resolution] if args.key?(:resolution)
          @severity = args[:severity] if args.key?(:severity)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
          @title = args[:title] if args.key?(:title)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class ListProductsResponse
        include Google::Apis::Core::Hashable
      
        # The token for the retrieval of the next page of product statuses.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # List of the products.
        # Corresponds to the JSON property `products`
        # @return [Array<Google::Apis::ManufacturersV1::Product>]
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
      
      # A price.
      class Price
        include Google::Apis::Core::Hashable
      
        # The numeric value of the price.
        # Corresponds to the JSON property `amount`
        # @return [String]
        attr_accessor :amount
      
        # The currency in which the price is denoted.
        # Corresponds to the JSON property `currency`
        # @return [String]
        attr_accessor :currency
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @amount = args[:amount] if args.key?(:amount)
          @currency = args[:currency] if args.key?(:currency)
        end
      end
      
      # Product data.
      class Product
        include Google::Apis::Core::Hashable
      
        # Attributes of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116.
        # Corresponds to the JSON property `attributes`
        # @return [Google::Apis::ManufacturersV1::Attributes]
        attr_accessor :attributes
      
        # The content language of the product as a two-letter ISO 639-1 language code
        # (for example, en).
        # Corresponds to the JSON property `contentLanguage`
        # @return [String]
        attr_accessor :content_language
      
        # The status of the destinations.
        # Corresponds to the JSON property `destinationStatuses`
        # @return [Array<Google::Apis::ManufacturersV1::DestinationStatus>]
        attr_accessor :destination_statuses
      
        # A server-generated list of issues associated with the product.
        # Corresponds to the JSON property `issues`
        # @return [Array<Google::Apis::ManufacturersV1::Issue>]
        attr_accessor :issues
      
        # Name in the format ``target_country`:`content_language`:`product_id``.
        # `target_country`   - The target country of the product as a CLDR territory
        # code (for example, US).
        # `content_language` - The content language of the product as a two-letter
        # ISO 639-1 language code (for example, en).
        # `product_id`     -   The ID of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#
        # id.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Parent ID in the format `accounts/`account_id``.
        # `account_id` - The ID of the Manufacturer Center account.
        # Corresponds to the JSON property `parent`
        # @return [String]
        attr_accessor :parent
      
        # The ID of the product. For more information, see
        # https://support.google.com/manufacturers/answer/6124116#id.
        # Corresponds to the JSON property `productId`
        # @return [String]
        attr_accessor :product_id
      
        # The target country of the product as a CLDR territory code (for example,
        # US).
        # Corresponds to the JSON property `targetCountry`
        # @return [String]
        attr_accessor :target_country
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attributes = args[:attributes] if args.key?(:attributes)
          @content_language = args[:content_language] if args.key?(:content_language)
          @destination_statuses = args[:destination_statuses] if args.key?(:destination_statuses)
          @issues = args[:issues] if args.key?(:issues)
          @name = args[:name] if args.key?(:name)
          @parent = args[:parent] if args.key?(:parent)
          @product_id = args[:product_id] if args.key?(:product_id)
          @target_country = args[:target_country] if args.key?(:target_country)
        end
      end
      
      # A product detail of the product. For more information, see
      # https://support.google.com/manufacturers/answer/6124116#productdetail.
      class ProductDetail
        include Google::Apis::Core::Hashable
      
        # The name of the attribute.
        # Corresponds to the JSON property `attributeName`
        # @return [String]
        attr_accessor :attribute_name
      
        # The value of the attribute.
        # Corresponds to the JSON property `attributeValue`
        # @return [String]
        attr_accessor :attribute_value
      
        # A short section name that can be reused between multiple product details.
        # Corresponds to the JSON property `sectionName`
        # @return [String]
        attr_accessor :section_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute_name = args[:attribute_name] if args.key?(:attribute_name)
          @attribute_value = args[:attribute_value] if args.key?(:attribute_value)
          @section_name = args[:section_name] if args.key?(:section_name)
        end
      end
    end
  end
end
