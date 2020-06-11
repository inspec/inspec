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
    module BooksV1
      
      # 
      class Annotation
        include Google::Apis::Core::Hashable
      
        # Anchor text after excerpt. For requests, if the user bookmarked a screen that
        # has no flowing text on it, then this field should be empty.
        # Corresponds to the JSON property `afterSelectedText`
        # @return [String]
        attr_accessor :after_selected_text
      
        # Anchor text before excerpt. For requests, if the user bookmarked a screen that
        # has no flowing text on it, then this field should be empty.
        # Corresponds to the JSON property `beforeSelectedText`
        # @return [String]
        attr_accessor :before_selected_text
      
        # Selection ranges sent from the client.
        # Corresponds to the JSON property `clientVersionRanges`
        # @return [Google::Apis::BooksV1::Annotation::ClientVersionRanges]
        attr_accessor :client_version_ranges
      
        # Timestamp for the created time of this annotation.
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # Selection ranges for the most recent content version.
        # Corresponds to the JSON property `currentVersionRanges`
        # @return [Google::Apis::BooksV1::Annotation::CurrentVersionRanges]
        attr_accessor :current_version_ranges
      
        # User-created data for this annotation.
        # Corresponds to the JSON property `data`
        # @return [String]
        attr_accessor :data
      
        # Indicates that this annotation is deleted.
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # The highlight style for this annotation.
        # Corresponds to the JSON property `highlightStyle`
        # @return [String]
        attr_accessor :highlight_style
      
        # Id of this annotation, in the form of a GUID.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The layer this annotation is for.
        # Corresponds to the JSON property `layerId`
        # @return [String]
        attr_accessor :layer_id
      
        # 
        # Corresponds to the JSON property `layerSummary`
        # @return [Google::Apis::BooksV1::Annotation::LayerSummary]
        attr_accessor :layer_summary
      
        # Pages that this annotation spans.
        # Corresponds to the JSON property `pageIds`
        # @return [Array<String>]
        attr_accessor :page_ids
      
        # Excerpt from the volume.
        # Corresponds to the JSON property `selectedText`
        # @return [String]
        attr_accessor :selected_text
      
        # URL to this resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Timestamp for the last time this annotation was modified.
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # The volume that this annotation belongs to.
        # Corresponds to the JSON property `volumeId`
        # @return [String]
        attr_accessor :volume_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @after_selected_text = args[:after_selected_text] if args.key?(:after_selected_text)
          @before_selected_text = args[:before_selected_text] if args.key?(:before_selected_text)
          @client_version_ranges = args[:client_version_ranges] if args.key?(:client_version_ranges)
          @created = args[:created] if args.key?(:created)
          @current_version_ranges = args[:current_version_ranges] if args.key?(:current_version_ranges)
          @data = args[:data] if args.key?(:data)
          @deleted = args[:deleted] if args.key?(:deleted)
          @highlight_style = args[:highlight_style] if args.key?(:highlight_style)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @layer_id = args[:layer_id] if args.key?(:layer_id)
          @layer_summary = args[:layer_summary] if args.key?(:layer_summary)
          @page_ids = args[:page_ids] if args.key?(:page_ids)
          @selected_text = args[:selected_text] if args.key?(:selected_text)
          @self_link = args[:self_link] if args.key?(:self_link)
          @updated = args[:updated] if args.key?(:updated)
          @volume_id = args[:volume_id] if args.key?(:volume_id)
        end
        
        # Selection ranges sent from the client.
        class ClientVersionRanges
          include Google::Apis::Core::Hashable
        
          # Range in CFI format for this annotation sent by client.
          # Corresponds to the JSON property `cfiRange`
          # @return [Google::Apis::BooksV1::AnnotatinsRange]
          attr_accessor :cfi_range
        
          # Content version the client sent in.
          # Corresponds to the JSON property `contentVersion`
          # @return [String]
          attr_accessor :content_version
        
          # Range in GB image format for this annotation sent by client.
          # Corresponds to the JSON property `gbImageRange`
          # @return [Google::Apis::BooksV1::AnnotatinsRange]
          attr_accessor :gb_image_range
        
          # Range in GB text format for this annotation sent by client.
          # Corresponds to the JSON property `gbTextRange`
          # @return [Google::Apis::BooksV1::AnnotatinsRange]
          attr_accessor :gb_text_range
        
          # Range in image CFI format for this annotation sent by client.
          # Corresponds to the JSON property `imageCfiRange`
          # @return [Google::Apis::BooksV1::AnnotatinsRange]
          attr_accessor :image_cfi_range
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @cfi_range = args[:cfi_range] if args.key?(:cfi_range)
            @content_version = args[:content_version] if args.key?(:content_version)
            @gb_image_range = args[:gb_image_range] if args.key?(:gb_image_range)
            @gb_text_range = args[:gb_text_range] if args.key?(:gb_text_range)
            @image_cfi_range = args[:image_cfi_range] if args.key?(:image_cfi_range)
          end
        end
        
        # Selection ranges for the most recent content version.
        class CurrentVersionRanges
          include Google::Apis::Core::Hashable
        
          # Range in CFI format for this annotation for version above.
          # Corresponds to the JSON property `cfiRange`
          # @return [Google::Apis::BooksV1::AnnotatinsRange]
          attr_accessor :cfi_range
        
          # Content version applicable to ranges below.
          # Corresponds to the JSON property `contentVersion`
          # @return [String]
          attr_accessor :content_version
        
          # Range in GB image format for this annotation for version above.
          # Corresponds to the JSON property `gbImageRange`
          # @return [Google::Apis::BooksV1::AnnotatinsRange]
          attr_accessor :gb_image_range
        
          # Range in GB text format for this annotation for version above.
          # Corresponds to the JSON property `gbTextRange`
          # @return [Google::Apis::BooksV1::AnnotatinsRange]
          attr_accessor :gb_text_range
        
          # Range in image CFI format for this annotation for version above.
          # Corresponds to the JSON property `imageCfiRange`
          # @return [Google::Apis::BooksV1::AnnotatinsRange]
          attr_accessor :image_cfi_range
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @cfi_range = args[:cfi_range] if args.key?(:cfi_range)
            @content_version = args[:content_version] if args.key?(:content_version)
            @gb_image_range = args[:gb_image_range] if args.key?(:gb_image_range)
            @gb_text_range = args[:gb_text_range] if args.key?(:gb_text_range)
            @image_cfi_range = args[:image_cfi_range] if args.key?(:image_cfi_range)
          end
        end
        
        # 
        class LayerSummary
          include Google::Apis::Core::Hashable
        
          # Maximum allowed characters on this layer, especially for the "copy" layer.
          # Corresponds to the JSON property `allowedCharacterCount`
          # @return [Fixnum]
          attr_accessor :allowed_character_count
        
          # Type of limitation on this layer. "limited" or "unlimited" for the "copy"
          # layer.
          # Corresponds to the JSON property `limitType`
          # @return [String]
          attr_accessor :limit_type
        
          # Remaining allowed characters on this layer, especially for the "copy" layer.
          # Corresponds to the JSON property `remainingCharacterCount`
          # @return [Fixnum]
          attr_accessor :remaining_character_count
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @allowed_character_count = args[:allowed_character_count] if args.key?(:allowed_character_count)
            @limit_type = args[:limit_type] if args.key?(:limit_type)
            @remaining_character_count = args[:remaining_character_count] if args.key?(:remaining_character_count)
          end
        end
      end
      
      # 
      class AnnotationData
        include Google::Apis::Core::Hashable
      
        # The type of annotation this data is for.
        # Corresponds to the JSON property `annotationType`
        # @return [String]
        attr_accessor :annotation_type
      
        # 
        # Corresponds to the JSON property `data`
        # @return [Object]
        attr_accessor :data
      
        # Base64 encoded data for this annotation data.
        # Corresponds to the JSON property `encoded_data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :encoded_data
      
        # Unique id for this annotation data.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource Type
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The Layer id for this data. *
        # Corresponds to the JSON property `layerId`
        # @return [String]
        attr_accessor :layer_id
      
        # URL for this resource. *
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Timestamp for the last time this data was updated. (RFC 3339 UTC date-time
        # format).
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # The volume id for this data. *
        # Corresponds to the JSON property `volumeId`
        # @return [String]
        attr_accessor :volume_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_type = args[:annotation_type] if args.key?(:annotation_type)
          @data = args[:data] if args.key?(:data)
          @encoded_data = args[:encoded_data] if args.key?(:encoded_data)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @layer_id = args[:layer_id] if args.key?(:layer_id)
          @self_link = args[:self_link] if args.key?(:self_link)
          @updated = args[:updated] if args.key?(:updated)
          @volume_id = args[:volume_id] if args.key?(:volume_id)
        end
      end
      
      # 
      class Annotations
        include Google::Apis::Core::Hashable
      
        # A list of annotations.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BooksV1::Annotation>]
        attr_accessor :items
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token to pass in for pagination for the next page. This will not be present if
        # this request does not have more results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Total number of annotations found. This may be greater than the number of
        # notes returned in this response if results have been paginated.
        # Corresponds to the JSON property `totalItems`
        # @return [Fixnum]
        attr_accessor :total_items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_items = args[:total_items] if args.key?(:total_items)
        end
      end
      
      # 
      class AnnotationsSummary
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # 
        # Corresponds to the JSON property `layers`
        # @return [Array<Google::Apis::BooksV1::AnnotationsSummary::Layer>]
        attr_accessor :layers
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @layers = args[:layers] if args.key?(:layers)
        end
        
        # 
        class Layer
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `allowedCharacterCount`
          # @return [Fixnum]
          attr_accessor :allowed_character_count
        
          # 
          # Corresponds to the JSON property `layerId`
          # @return [String]
          attr_accessor :layer_id
        
          # 
          # Corresponds to the JSON property `limitType`
          # @return [String]
          attr_accessor :limit_type
        
          # 
          # Corresponds to the JSON property `remainingCharacterCount`
          # @return [Fixnum]
          attr_accessor :remaining_character_count
        
          # 
          # Corresponds to the JSON property `updated`
          # @return [DateTime]
          attr_accessor :updated
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @allowed_character_count = args[:allowed_character_count] if args.key?(:allowed_character_count)
            @layer_id = args[:layer_id] if args.key?(:layer_id)
            @limit_type = args[:limit_type] if args.key?(:limit_type)
            @remaining_character_count = args[:remaining_character_count] if args.key?(:remaining_character_count)
            @updated = args[:updated] if args.key?(:updated)
          end
        end
      end
      
      # 
      class AnnotationsData
        include Google::Apis::Core::Hashable
      
        # A list of Annotation Data.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BooksV1::AnnotationData>]
        attr_accessor :items
      
        # Resource type
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token to pass in for pagination for the next page. This will not be present if
        # this request does not have more results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The total number of volume annotations found.
        # Corresponds to the JSON property `totalItems`
        # @return [Fixnum]
        attr_accessor :total_items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_items = args[:total_items] if args.key?(:total_items)
        end
      end
      
      # 
      class AnnotatinsRange
        include Google::Apis::Core::Hashable
      
        # The offset from the ending position.
        # Corresponds to the JSON property `endOffset`
        # @return [String]
        attr_accessor :end_offset
      
        # The ending position for the range.
        # Corresponds to the JSON property `endPosition`
        # @return [String]
        attr_accessor :end_position
      
        # The offset from the starting position.
        # Corresponds to the JSON property `startOffset`
        # @return [String]
        attr_accessor :start_offset
      
        # The starting position for the range.
        # Corresponds to the JSON property `startPosition`
        # @return [String]
        attr_accessor :start_position
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_offset = args[:end_offset] if args.key?(:end_offset)
          @end_position = args[:end_position] if args.key?(:end_position)
          @start_offset = args[:start_offset] if args.key?(:start_offset)
          @start_position = args[:start_position] if args.key?(:start_position)
        end
      end
      
      # 
      class LoadingResource
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `author`
        # @return [String]
        attr_accessor :author
      
        # 
        # Corresponds to the JSON property `processingState`
        # @return [String]
        attr_accessor :processing_state
      
        # 
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # 
        # Corresponds to the JSON property `volumeId`
        # @return [String]
        attr_accessor :volume_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @author = args[:author] if args.key?(:author)
          @processing_state = args[:processing_state] if args.key?(:processing_state)
          @title = args[:title] if args.key?(:title)
          @volume_id = args[:volume_id] if args.key?(:volume_id)
        end
      end
      
      # 
      class RateRecommendedVolumeResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `consistency_token`
        # @return [String]
        attr_accessor :consistency_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consistency_token = args[:consistency_token] if args.key?(:consistency_token)
        end
      end
      
      # 
      class Bookshelf
        include Google::Apis::Core::Hashable
      
        # Whether this bookshelf is PUBLIC or PRIVATE.
        # Corresponds to the JSON property `access`
        # @return [String]
        attr_accessor :access
      
        # Created time for this bookshelf (formatted UTC timestamp with millisecond
        # resolution).
        # Corresponds to the JSON property `created`
        # @return [DateTime]
        attr_accessor :created
      
        # Description of this bookshelf.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Id of this bookshelf, only unique by user.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # Resource type for bookshelf metadata.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # URL to this resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Title of this bookshelf.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Last modified time of this bookshelf (formatted UTC timestamp with millisecond
        # resolution).
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # Number of volumes in this bookshelf.
        # Corresponds to the JSON property `volumeCount`
        # @return [Fixnum]
        attr_accessor :volume_count
      
        # Last time a volume was added or removed from this bookshelf (formatted UTC
        # timestamp with millisecond resolution).
        # Corresponds to the JSON property `volumesLastUpdated`
        # @return [DateTime]
        attr_accessor :volumes_last_updated
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access = args[:access] if args.key?(:access)
          @created = args[:created] if args.key?(:created)
          @description = args[:description] if args.key?(:description)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @self_link = args[:self_link] if args.key?(:self_link)
          @title = args[:title] if args.key?(:title)
          @updated = args[:updated] if args.key?(:updated)
          @volume_count = args[:volume_count] if args.key?(:volume_count)
          @volumes_last_updated = args[:volumes_last_updated] if args.key?(:volumes_last_updated)
        end
      end
      
      # 
      class Bookshelves
        include Google::Apis::Core::Hashable
      
        # A list of bookshelves.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BooksV1::Bookshelf>]
        attr_accessor :items
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # 
      class Category
        include Google::Apis::Core::Hashable
      
        # A list of onboarding categories.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BooksV1::Category::Item>]
        attr_accessor :items
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
        
        # 
        class Item
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `badgeUrl`
          # @return [String]
          attr_accessor :badge_url
        
          # 
          # Corresponds to the JSON property `categoryId`
          # @return [String]
          attr_accessor :category_id
        
          # 
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @badge_url = args[:badge_url] if args.key?(:badge_url)
            @category_id = args[:category_id] if args.key?(:category_id)
            @name = args[:name] if args.key?(:name)
          end
        end
      end
      
      # 
      class ConcurrentAccessRestriction
        include Google::Apis::Core::Hashable
      
        # Whether access is granted for this (user, device, volume).
        # Corresponds to the JSON property `deviceAllowed`
        # @return [Boolean]
        attr_accessor :device_allowed
        alias_method :device_allowed?, :device_allowed
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The maximum number of concurrent access licenses for this volume.
        # Corresponds to the JSON property `maxConcurrentDevices`
        # @return [Fixnum]
        attr_accessor :max_concurrent_devices
      
        # Error/warning message.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # Client nonce for verification. Download access and client-validation only.
        # Corresponds to the JSON property `nonce`
        # @return [String]
        attr_accessor :nonce
      
        # Error/warning reason code.
        # Corresponds to the JSON property `reasonCode`
        # @return [String]
        attr_accessor :reason_code
      
        # Whether this volume has any concurrent access restrictions.
        # Corresponds to the JSON property `restricted`
        # @return [Boolean]
        attr_accessor :restricted
        alias_method :restricted?, :restricted
      
        # Response signature.
        # Corresponds to the JSON property `signature`
        # @return [String]
        attr_accessor :signature
      
        # Client app identifier for verification. Download access and client-validation
        # only.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        # Time in seconds for license auto-expiration.
        # Corresponds to the JSON property `timeWindowSeconds`
        # @return [Fixnum]
        attr_accessor :time_window_seconds
      
        # Identifies the volume for which this entry applies.
        # Corresponds to the JSON property `volumeId`
        # @return [String]
        attr_accessor :volume_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_allowed = args[:device_allowed] if args.key?(:device_allowed)
          @kind = args[:kind] if args.key?(:kind)
          @max_concurrent_devices = args[:max_concurrent_devices] if args.key?(:max_concurrent_devices)
          @message = args[:message] if args.key?(:message)
          @nonce = args[:nonce] if args.key?(:nonce)
          @reason_code = args[:reason_code] if args.key?(:reason_code)
          @restricted = args[:restricted] if args.key?(:restricted)
          @signature = args[:signature] if args.key?(:signature)
          @source = args[:source] if args.key?(:source)
          @time_window_seconds = args[:time_window_seconds] if args.key?(:time_window_seconds)
          @volume_id = args[:volume_id] if args.key?(:volume_id)
        end
      end
      
      # 
      class DictLayerData
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `common`
        # @return [Google::Apis::BooksV1::DictLayerData::Common]
        attr_accessor :common
      
        # 
        # Corresponds to the JSON property `dict`
        # @return [Google::Apis::BooksV1::DictLayerData::Dict]
        attr_accessor :dict
      
        # 
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @common = args[:common] if args.key?(:common)
          @dict = args[:dict] if args.key?(:dict)
          @kind = args[:kind] if args.key?(:kind)
        end
        
        # 
        class Common
          include Google::Apis::Core::Hashable
        
          # The display title and localized canonical name to use when searching for this
          # entity on Google search.
          # Corresponds to the JSON property `title`
          # @return [String]
          attr_accessor :title
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @title = args[:title] if args.key?(:title)
          end
        end
        
        # 
        class Dict
          include Google::Apis::Core::Hashable
        
          # The source, url and attribution for this dictionary data.
          # Corresponds to the JSON property `source`
          # @return [Google::Apis::BooksV1::DictLayerData::Dict::Source]
          attr_accessor :source
        
          # 
          # Corresponds to the JSON property `words`
          # @return [Array<Google::Apis::BooksV1::DictLayerData::Dict::Word>]
          attr_accessor :words
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @source = args[:source] if args.key?(:source)
            @words = args[:words] if args.key?(:words)
          end
          
          # The source, url and attribution for this dictionary data.
          class Source
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `attribution`
            # @return [String]
            attr_accessor :attribution
          
            # 
            # Corresponds to the JSON property `url`
            # @return [String]
            attr_accessor :url
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @attribution = args[:attribution] if args.key?(:attribution)
              @url = args[:url] if args.key?(:url)
            end
          end
          
          # 
          class Word
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `derivatives`
            # @return [Array<Google::Apis::BooksV1::DictLayerData::Dict::Word::Derivative>]
            attr_accessor :derivatives
          
            # 
            # Corresponds to the JSON property `examples`
            # @return [Array<Google::Apis::BooksV1::DictLayerData::Dict::Word::Example>]
            attr_accessor :examples
          
            # 
            # Corresponds to the JSON property `senses`
            # @return [Array<Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense>]
            attr_accessor :senses
          
            # The words with different meanings but not related words, e.g. "go" (game) and "
            # go" (verb).
            # Corresponds to the JSON property `source`
            # @return [Google::Apis::BooksV1::DictLayerData::Dict::Word::Source]
            attr_accessor :source
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @derivatives = args[:derivatives] if args.key?(:derivatives)
              @examples = args[:examples] if args.key?(:examples)
              @senses = args[:senses] if args.key?(:senses)
              @source = args[:source] if args.key?(:source)
            end
            
            # 
            class Derivative
              include Google::Apis::Core::Hashable
            
              # 
              # Corresponds to the JSON property `source`
              # @return [Google::Apis::BooksV1::DictLayerData::Dict::Word::Derivative::Source]
              attr_accessor :source
            
              # 
              # Corresponds to the JSON property `text`
              # @return [String]
              attr_accessor :text
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @source = args[:source] if args.key?(:source)
                @text = args[:text] if args.key?(:text)
              end
              
              # 
              class Source
                include Google::Apis::Core::Hashable
              
                # 
                # Corresponds to the JSON property `attribution`
                # @return [String]
                attr_accessor :attribution
              
                # 
                # Corresponds to the JSON property `url`
                # @return [String]
                attr_accessor :url
              
                def initialize(**args)
                   update!(**args)
                end
              
                # Update properties of this object
                def update!(**args)
                  @attribution = args[:attribution] if args.key?(:attribution)
                  @url = args[:url] if args.key?(:url)
                end
              end
            end
            
            # 
            class Example
              include Google::Apis::Core::Hashable
            
              # 
              # Corresponds to the JSON property `source`
              # @return [Google::Apis::BooksV1::DictLayerData::Dict::Word::Example::Source]
              attr_accessor :source
            
              # 
              # Corresponds to the JSON property `text`
              # @return [String]
              attr_accessor :text
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @source = args[:source] if args.key?(:source)
                @text = args[:text] if args.key?(:text)
              end
              
              # 
              class Source
                include Google::Apis::Core::Hashable
              
                # 
                # Corresponds to the JSON property `attribution`
                # @return [String]
                attr_accessor :attribution
              
                # 
                # Corresponds to the JSON property `url`
                # @return [String]
                attr_accessor :url
              
                def initialize(**args)
                   update!(**args)
                end
              
                # Update properties of this object
                def update!(**args)
                  @attribution = args[:attribution] if args.key?(:attribution)
                  @url = args[:url] if args.key?(:url)
                end
              end
            end
            
            # 
            class Sense
              include Google::Apis::Core::Hashable
            
              # 
              # Corresponds to the JSON property `conjugations`
              # @return [Array<Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Conjugation>]
              attr_accessor :conjugations
            
              # 
              # Corresponds to the JSON property `definitions`
              # @return [Array<Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Definition>]
              attr_accessor :definitions
            
              # 
              # Corresponds to the JSON property `partOfSpeech`
              # @return [String]
              attr_accessor :part_of_speech
            
              # 
              # Corresponds to the JSON property `pronunciation`
              # @return [String]
              attr_accessor :pronunciation
            
              # 
              # Corresponds to the JSON property `pronunciationUrl`
              # @return [String]
              attr_accessor :pronunciation_url
            
              # 
              # Corresponds to the JSON property `source`
              # @return [Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Source]
              attr_accessor :source
            
              # 
              # Corresponds to the JSON property `syllabification`
              # @return [String]
              attr_accessor :syllabification
            
              # 
              # Corresponds to the JSON property `synonyms`
              # @return [Array<Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Synonym>]
              attr_accessor :synonyms
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @conjugations = args[:conjugations] if args.key?(:conjugations)
                @definitions = args[:definitions] if args.key?(:definitions)
                @part_of_speech = args[:part_of_speech] if args.key?(:part_of_speech)
                @pronunciation = args[:pronunciation] if args.key?(:pronunciation)
                @pronunciation_url = args[:pronunciation_url] if args.key?(:pronunciation_url)
                @source = args[:source] if args.key?(:source)
                @syllabification = args[:syllabification] if args.key?(:syllabification)
                @synonyms = args[:synonyms] if args.key?(:synonyms)
              end
              
              # 
              class Conjugation
                include Google::Apis::Core::Hashable
              
                # 
                # Corresponds to the JSON property `type`
                # @return [String]
                attr_accessor :type
              
                # 
                # Corresponds to the JSON property `value`
                # @return [String]
                attr_accessor :value
              
                def initialize(**args)
                   update!(**args)
                end
              
                # Update properties of this object
                def update!(**args)
                  @type = args[:type] if args.key?(:type)
                  @value = args[:value] if args.key?(:value)
                end
              end
              
              # 
              class Definition
                include Google::Apis::Core::Hashable
              
                # 
                # Corresponds to the JSON property `definition`
                # @return [String]
                attr_accessor :definition
              
                # 
                # Corresponds to the JSON property `examples`
                # @return [Array<Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Definition::Example>]
                attr_accessor :examples
              
                def initialize(**args)
                   update!(**args)
                end
              
                # Update properties of this object
                def update!(**args)
                  @definition = args[:definition] if args.key?(:definition)
                  @examples = args[:examples] if args.key?(:examples)
                end
                
                # 
                class Example
                  include Google::Apis::Core::Hashable
                
                  # 
                  # Corresponds to the JSON property `source`
                  # @return [Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Definition::Example::Source]
                  attr_accessor :source
                
                  # 
                  # Corresponds to the JSON property `text`
                  # @return [String]
                  attr_accessor :text
                
                  def initialize(**args)
                     update!(**args)
                  end
                
                  # Update properties of this object
                  def update!(**args)
                    @source = args[:source] if args.key?(:source)
                    @text = args[:text] if args.key?(:text)
                  end
                  
                  # 
                  class Source
                    include Google::Apis::Core::Hashable
                  
                    # 
                    # Corresponds to the JSON property `attribution`
                    # @return [String]
                    attr_accessor :attribution
                  
                    # 
                    # Corresponds to the JSON property `url`
                    # @return [String]
                    attr_accessor :url
                  
                    def initialize(**args)
                       update!(**args)
                    end
                  
                    # Update properties of this object
                    def update!(**args)
                      @attribution = args[:attribution] if args.key?(:attribution)
                      @url = args[:url] if args.key?(:url)
                    end
                  end
                end
              end
              
              # 
              class Source
                include Google::Apis::Core::Hashable
              
                # 
                # Corresponds to the JSON property `attribution`
                # @return [String]
                attr_accessor :attribution
              
                # 
                # Corresponds to the JSON property `url`
                # @return [String]
                attr_accessor :url
              
                def initialize(**args)
                   update!(**args)
                end
              
                # Update properties of this object
                def update!(**args)
                  @attribution = args[:attribution] if args.key?(:attribution)
                  @url = args[:url] if args.key?(:url)
                end
              end
              
              # 
              class Synonym
                include Google::Apis::Core::Hashable
              
                # 
                # Corresponds to the JSON property `source`
                # @return [Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Synonym::Source]
                attr_accessor :source
              
                # 
                # Corresponds to the JSON property `text`
                # @return [String]
                attr_accessor :text
              
                def initialize(**args)
                   update!(**args)
                end
              
                # Update properties of this object
                def update!(**args)
                  @source = args[:source] if args.key?(:source)
                  @text = args[:text] if args.key?(:text)
                end
                
                # 
                class Source
                  include Google::Apis::Core::Hashable
                
                  # 
                  # Corresponds to the JSON property `attribution`
                  # @return [String]
                  attr_accessor :attribution
                
                  # 
                  # Corresponds to the JSON property `url`
                  # @return [String]
                  attr_accessor :url
                
                  def initialize(**args)
                     update!(**args)
                  end
                
                  # Update properties of this object
                  def update!(**args)
                    @attribution = args[:attribution] if args.key?(:attribution)
                    @url = args[:url] if args.key?(:url)
                  end
                end
              end
            end
            
            # The words with different meanings but not related words, e.g. "go" (game) and "
            # go" (verb).
            class Source
              include Google::Apis::Core::Hashable
            
              # 
              # Corresponds to the JSON property `attribution`
              # @return [String]
              attr_accessor :attribution
            
              # 
              # Corresponds to the JSON property `url`
              # @return [String]
              attr_accessor :url
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @attribution = args[:attribution] if args.key?(:attribution)
                @url = args[:url] if args.key?(:url)
              end
            end
          end
        end
      end
      
      # 
      class Discoveryclusters
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `clusters`
        # @return [Array<Google::Apis::BooksV1::Discoveryclusters::Cluster>]
        attr_accessor :clusters
      
        # Resorce type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # 
        # Corresponds to the JSON property `totalClusters`
        # @return [Fixnum]
        attr_accessor :total_clusters
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @clusters = args[:clusters] if args.key?(:clusters)
          @kind = args[:kind] if args.key?(:kind)
          @total_clusters = args[:total_clusters] if args.key?(:total_clusters)
        end
        
        # 
        class Cluster
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `banner_with_content_container`
          # @return [Google::Apis::BooksV1::Discoveryclusters::Cluster::BannerWithContentContainer]
          attr_accessor :banner_with_content_container
        
          # 
          # Corresponds to the JSON property `subTitle`
          # @return [String]
          attr_accessor :sub_title
        
          # 
          # Corresponds to the JSON property `title`
          # @return [String]
          attr_accessor :title
        
          # 
          # Corresponds to the JSON property `totalVolumes`
          # @return [Fixnum]
          attr_accessor :total_volumes
        
          # 
          # Corresponds to the JSON property `uid`
          # @return [String]
          attr_accessor :uid
        
          # 
          # Corresponds to the JSON property `volumes`
          # @return [Array<Google::Apis::BooksV1::Volume>]
          attr_accessor :volumes
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @banner_with_content_container = args[:banner_with_content_container] if args.key?(:banner_with_content_container)
            @sub_title = args[:sub_title] if args.key?(:sub_title)
            @title = args[:title] if args.key?(:title)
            @total_volumes = args[:total_volumes] if args.key?(:total_volumes)
            @uid = args[:uid] if args.key?(:uid)
            @volumes = args[:volumes] if args.key?(:volumes)
          end
          
          # 
          class BannerWithContentContainer
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `fillColorArgb`
            # @return [String]
            attr_accessor :fill_color_argb
          
            # 
            # Corresponds to the JSON property `imageUrl`
            # @return [String]
            attr_accessor :image_url
          
            # 
            # Corresponds to the JSON property `maskColorArgb`
            # @return [String]
            attr_accessor :mask_color_argb
          
            # 
            # Corresponds to the JSON property `moreButtonText`
            # @return [String]
            attr_accessor :more_button_text
          
            # 
            # Corresponds to the JSON property `moreButtonUrl`
            # @return [String]
            attr_accessor :more_button_url
          
            # 
            # Corresponds to the JSON property `textColorArgb`
            # @return [String]
            attr_accessor :text_color_argb
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @fill_color_argb = args[:fill_color_argb] if args.key?(:fill_color_argb)
              @image_url = args[:image_url] if args.key?(:image_url)
              @mask_color_argb = args[:mask_color_argb] if args.key?(:mask_color_argb)
              @more_button_text = args[:more_button_text] if args.key?(:more_button_text)
              @more_button_url = args[:more_button_url] if args.key?(:more_button_url)
              @text_color_argb = args[:text_color_argb] if args.key?(:text_color_argb)
            end
          end
        end
      end
      
      # 
      class DownloadAccessRestriction
        include Google::Apis::Core::Hashable
      
        # If restricted, whether access is granted for this (user, device, volume).
        # Corresponds to the JSON property `deviceAllowed`
        # @return [Boolean]
        attr_accessor :device_allowed
        alias_method :device_allowed?, :device_allowed
      
        # If restricted, the number of content download licenses already acquired (
        # including the requesting client, if licensed).
        # Corresponds to the JSON property `downloadsAcquired`
        # @return [Fixnum]
        attr_accessor :downloads_acquired
      
        # If deviceAllowed, whether access was just acquired with this request.
        # Corresponds to the JSON property `justAcquired`
        # @return [Boolean]
        attr_accessor :just_acquired
        alias_method :just_acquired?, :just_acquired
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # If restricted, the maximum number of content download licenses for this volume.
        # Corresponds to the JSON property `maxDownloadDevices`
        # @return [Fixnum]
        attr_accessor :max_download_devices
      
        # Error/warning message.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # Client nonce for verification. Download access and client-validation only.
        # Corresponds to the JSON property `nonce`
        # @return [String]
        attr_accessor :nonce
      
        # Error/warning reason code. Additional codes may be added in the future. 0 OK
        # 100 ACCESS_DENIED_PUBLISHER_LIMIT 101 ACCESS_DENIED_LIMIT 200
        # WARNING_USED_LAST_ACCESS
        # Corresponds to the JSON property `reasonCode`
        # @return [String]
        attr_accessor :reason_code
      
        # Whether this volume has any download access restrictions.
        # Corresponds to the JSON property `restricted`
        # @return [Boolean]
        attr_accessor :restricted
        alias_method :restricted?, :restricted
      
        # Response signature.
        # Corresponds to the JSON property `signature`
        # @return [String]
        attr_accessor :signature
      
        # Client app identifier for verification. Download access and client-validation
        # only.
        # Corresponds to the JSON property `source`
        # @return [String]
        attr_accessor :source
      
        # Identifies the volume for which this entry applies.
        # Corresponds to the JSON property `volumeId`
        # @return [String]
        attr_accessor :volume_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_allowed = args[:device_allowed] if args.key?(:device_allowed)
          @downloads_acquired = args[:downloads_acquired] if args.key?(:downloads_acquired)
          @just_acquired = args[:just_acquired] if args.key?(:just_acquired)
          @kind = args[:kind] if args.key?(:kind)
          @max_download_devices = args[:max_download_devices] if args.key?(:max_download_devices)
          @message = args[:message] if args.key?(:message)
          @nonce = args[:nonce] if args.key?(:nonce)
          @reason_code = args[:reason_code] if args.key?(:reason_code)
          @restricted = args[:restricted] if args.key?(:restricted)
          @signature = args[:signature] if args.key?(:signature)
          @source = args[:source] if args.key?(:source)
          @volume_id = args[:volume_id] if args.key?(:volume_id)
        end
      end
      
      # 
      class DownloadAccesses
        include Google::Apis::Core::Hashable
      
        # A list of download access responses.
        # Corresponds to the JSON property `downloadAccessList`
        # @return [Array<Google::Apis::BooksV1::DownloadAccessRestriction>]
        attr_accessor :download_access_list
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @download_access_list = args[:download_access_list] if args.key?(:download_access_list)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # 
      class FamilyInfo
        include Google::Apis::Core::Hashable
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Family membership info of the user that made the request.
        # Corresponds to the JSON property `membership`
        # @return [Google::Apis::BooksV1::FamilyInfo::Membership]
        attr_accessor :membership
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @membership = args[:membership] if args.key?(:membership)
        end
        
        # Family membership info of the user that made the request.
        class Membership
          include Google::Apis::Core::Hashable
        
          # Restrictions on user buying and acquiring content.
          # Corresponds to the JSON property `acquirePermission`
          # @return [String]
          attr_accessor :acquire_permission
        
          # The age group of the user.
          # Corresponds to the JSON property `ageGroup`
          # @return [String]
          attr_accessor :age_group
        
          # The maximum allowed maturity rating for the user.
          # Corresponds to the JSON property `allowedMaturityRating`
          # @return [String]
          attr_accessor :allowed_maturity_rating
        
          # 
          # Corresponds to the JSON property `isInFamily`
          # @return [Boolean]
          attr_accessor :is_in_family
          alias_method :is_in_family?, :is_in_family
        
          # The role of the user in the family.
          # Corresponds to the JSON property `role`
          # @return [String]
          attr_accessor :role
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @acquire_permission = args[:acquire_permission] if args.key?(:acquire_permission)
            @age_group = args[:age_group] if args.key?(:age_group)
            @allowed_maturity_rating = args[:allowed_maturity_rating] if args.key?(:allowed_maturity_rating)
            @is_in_family = args[:is_in_family] if args.key?(:is_in_family)
            @role = args[:role] if args.key?(:role)
          end
        end
      end
      
      # 
      class GeoLayerData
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `common`
        # @return [Google::Apis::BooksV1::GeoLayerData::Common]
        attr_accessor :common
      
        # 
        # Corresponds to the JSON property `geo`
        # @return [Google::Apis::BooksV1::GeoLayerData::Geo]
        attr_accessor :geo
      
        # 
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @common = args[:common] if args.key?(:common)
          @geo = args[:geo] if args.key?(:geo)
          @kind = args[:kind] if args.key?(:kind)
        end
        
        # 
        class Common
          include Google::Apis::Core::Hashable
        
          # The language of the information url and description.
          # Corresponds to the JSON property `lang`
          # @return [String]
          attr_accessor :lang
        
          # The URL for the preview image information.
          # Corresponds to the JSON property `previewImageUrl`
          # @return [String]
          attr_accessor :preview_image_url
        
          # The description for this location.
          # Corresponds to the JSON property `snippet`
          # @return [String]
          attr_accessor :snippet
        
          # The URL for information for this location. Ex: wikipedia link.
          # Corresponds to the JSON property `snippetUrl`
          # @return [String]
          attr_accessor :snippet_url
        
          # The display title and localized canonical name to use when searching for this
          # entity on Google search.
          # Corresponds to the JSON property `title`
          # @return [String]
          attr_accessor :title
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @lang = args[:lang] if args.key?(:lang)
            @preview_image_url = args[:preview_image_url] if args.key?(:preview_image_url)
            @snippet = args[:snippet] if args.key?(:snippet)
            @snippet_url = args[:snippet_url] if args.key?(:snippet_url)
            @title = args[:title] if args.key?(:title)
          end
        end
        
        # 
        class Geo
          include Google::Apis::Core::Hashable
        
          # The boundary of the location as a set of loops containing pairs of latitude,
          # longitude coordinates.
          # Corresponds to the JSON property `boundary`
          # @return [Array<Array<Google::Apis::BooksV1::GeoLayerData::Geo::Boundary>>]
          attr_accessor :boundary
        
          # The cache policy active for this data. EX: UNRESTRICTED, RESTRICTED, NEVER
          # Corresponds to the JSON property `cachePolicy`
          # @return [String]
          attr_accessor :cache_policy
        
          # The country code of the location.
          # Corresponds to the JSON property `countryCode`
          # @return [String]
          attr_accessor :country_code
        
          # The latitude of the location.
          # Corresponds to the JSON property `latitude`
          # @return [Float]
          attr_accessor :latitude
        
          # The longitude of the location.
          # Corresponds to the JSON property `longitude`
          # @return [Float]
          attr_accessor :longitude
        
          # The type of map that should be used for this location. EX: HYBRID, ROADMAP,
          # SATELLITE, TERRAIN
          # Corresponds to the JSON property `mapType`
          # @return [String]
          attr_accessor :map_type
        
          # The viewport for showing this location. This is a latitude, longitude
          # rectangle.
          # Corresponds to the JSON property `viewport`
          # @return [Google::Apis::BooksV1::GeoLayerData::Geo::Viewport]
          attr_accessor :viewport
        
          # The Zoom level to use for the map. Zoom levels between 0 (the lowest zoom
          # level, in which the entire world can be seen on one map) to 21+ (down to
          # individual buildings). See: https://developers.google.com/maps/documentation/
          # staticmaps/#Zoomlevels
          # Corresponds to the JSON property `zoom`
          # @return [Fixnum]
          attr_accessor :zoom
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @boundary = args[:boundary] if args.key?(:boundary)
            @cache_policy = args[:cache_policy] if args.key?(:cache_policy)
            @country_code = args[:country_code] if args.key?(:country_code)
            @latitude = args[:latitude] if args.key?(:latitude)
            @longitude = args[:longitude] if args.key?(:longitude)
            @map_type = args[:map_type] if args.key?(:map_type)
            @viewport = args[:viewport] if args.key?(:viewport)
            @zoom = args[:zoom] if args.key?(:zoom)
          end
          
          # 
          class Boundary
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `latitude`
            # @return [Fixnum]
            attr_accessor :latitude
          
            # 
            # Corresponds to the JSON property `longitude`
            # @return [Fixnum]
            attr_accessor :longitude
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @latitude = args[:latitude] if args.key?(:latitude)
              @longitude = args[:longitude] if args.key?(:longitude)
            end
          end
          
          # The viewport for showing this location. This is a latitude, longitude
          # rectangle.
          class Viewport
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `hi`
            # @return [Google::Apis::BooksV1::GeoLayerData::Geo::Viewport::Hi]
            attr_accessor :hi
          
            # 
            # Corresponds to the JSON property `lo`
            # @return [Google::Apis::BooksV1::GeoLayerData::Geo::Viewport::Lo]
            attr_accessor :lo
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @hi = args[:hi] if args.key?(:hi)
              @lo = args[:lo] if args.key?(:lo)
            end
            
            # 
            class Hi
              include Google::Apis::Core::Hashable
            
              # 
              # Corresponds to the JSON property `latitude`
              # @return [Float]
              attr_accessor :latitude
            
              # 
              # Corresponds to the JSON property `longitude`
              # @return [Float]
              attr_accessor :longitude
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @latitude = args[:latitude] if args.key?(:latitude)
                @longitude = args[:longitude] if args.key?(:longitude)
              end
            end
            
            # 
            class Lo
              include Google::Apis::Core::Hashable
            
              # 
              # Corresponds to the JSON property `latitude`
              # @return [Float]
              attr_accessor :latitude
            
              # 
              # Corresponds to the JSON property `longitude`
              # @return [Float]
              attr_accessor :longitude
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @latitude = args[:latitude] if args.key?(:latitude)
                @longitude = args[:longitude] if args.key?(:longitude)
              end
            end
          end
        end
      end
      
      # 
      class LayerSummaries
        include Google::Apis::Core::Hashable
      
        # A list of layer summary items.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BooksV1::LayerSummary>]
        attr_accessor :items
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The total number of layer summaries found.
        # Corresponds to the JSON property `totalItems`
        # @return [Fixnum]
        attr_accessor :total_items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @total_items = args[:total_items] if args.key?(:total_items)
        end
      end
      
      # 
      class LayerSummary
        include Google::Apis::Core::Hashable
      
        # The number of annotations for this layer.
        # Corresponds to the JSON property `annotationCount`
        # @return [Fixnum]
        attr_accessor :annotation_count
      
        # The list of annotation types contained for this layer.
        # Corresponds to the JSON property `annotationTypes`
        # @return [Array<String>]
        attr_accessor :annotation_types
      
        # Link to get data for this annotation.
        # Corresponds to the JSON property `annotationsDataLink`
        # @return [String]
        attr_accessor :annotations_data_link
      
        # The link to get the annotations for this layer.
        # Corresponds to the JSON property `annotationsLink`
        # @return [String]
        attr_accessor :annotations_link
      
        # The content version this resource is for.
        # Corresponds to the JSON property `contentVersion`
        # @return [String]
        attr_accessor :content_version
      
        # The number of data items for this layer.
        # Corresponds to the JSON property `dataCount`
        # @return [Fixnum]
        attr_accessor :data_count
      
        # Unique id of this layer summary.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource Type
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The layer id for this summary.
        # Corresponds to the JSON property `layerId`
        # @return [String]
        attr_accessor :layer_id
      
        # URL to this resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Timestamp for the last time an item in this layer was updated. (RFC 3339 UTC
        # date-time format).
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # The current version of this layer's volume annotations. Note that this version
        # applies only to the data in the books.layers.volumeAnnotations.* responses.
        # The actual annotation data is versioned separately.
        # Corresponds to the JSON property `volumeAnnotationsVersion`
        # @return [String]
        attr_accessor :volume_annotations_version
      
        # The volume id this resource is for.
        # Corresponds to the JSON property `volumeId`
        # @return [String]
        attr_accessor :volume_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_count = args[:annotation_count] if args.key?(:annotation_count)
          @annotation_types = args[:annotation_types] if args.key?(:annotation_types)
          @annotations_data_link = args[:annotations_data_link] if args.key?(:annotations_data_link)
          @annotations_link = args[:annotations_link] if args.key?(:annotations_link)
          @content_version = args[:content_version] if args.key?(:content_version)
          @data_count = args[:data_count] if args.key?(:data_count)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @layer_id = args[:layer_id] if args.key?(:layer_id)
          @self_link = args[:self_link] if args.key?(:self_link)
          @updated = args[:updated] if args.key?(:updated)
          @volume_annotations_version = args[:volume_annotations_version] if args.key?(:volume_annotations_version)
          @volume_id = args[:volume_id] if args.key?(:volume_id)
        end
      end
      
      # 
      class Metadata
        include Google::Apis::Core::Hashable
      
        # A list of offline dictionary metadata.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BooksV1::Metadata::Item>]
        attr_accessor :items
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
        
        # 
        class Item
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `download_url`
          # @return [String]
          attr_accessor :download_url
        
          # 
          # Corresponds to the JSON property `encrypted_key`
          # @return [String]
          attr_accessor :encrypted_key
        
          # 
          # Corresponds to the JSON property `language`
          # @return [String]
          attr_accessor :language
        
          # 
          # Corresponds to the JSON property `size`
          # @return [Fixnum]
          attr_accessor :size
        
          # 
          # Corresponds to the JSON property `version`
          # @return [Fixnum]
          attr_accessor :version
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @download_url = args[:download_url] if args.key?(:download_url)
            @encrypted_key = args[:encrypted_key] if args.key?(:encrypted_key)
            @language = args[:language] if args.key?(:language)
            @size = args[:size] if args.key?(:size)
            @version = args[:version] if args.key?(:version)
          end
        end
      end
      
      # 
      class Notification
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `body`
        # @return [String]
        attr_accessor :body
      
        # The list of crm experiment ids.
        # Corresponds to the JSON property `crmExperimentIds`
        # @return [Array<Fixnum>]
        attr_accessor :crm_experiment_ids
      
        # 
        # Corresponds to the JSON property `doc_id`
        # @return [String]
        attr_accessor :doc_id
      
        # 
        # Corresponds to the JSON property `doc_type`
        # @return [String]
        attr_accessor :doc_type
      
        # 
        # Corresponds to the JSON property `dont_show_notification`
        # @return [Boolean]
        attr_accessor :dont_show_notification
        alias_method :dont_show_notification?, :dont_show_notification
      
        # 
        # Corresponds to the JSON property `iconUrl`
        # @return [String]
        attr_accessor :icon_url
      
        # 
        # Corresponds to the JSON property `is_document_mature`
        # @return [Boolean]
        attr_accessor :is_document_mature
        alias_method :is_document_mature?, :is_document_mature
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # 
        # Corresponds to the JSON property `notificationGroup`
        # @return [String]
        attr_accessor :notification_group
      
        # 
        # Corresponds to the JSON property `notification_type`
        # @return [String]
        attr_accessor :notification_type
      
        # 
        # Corresponds to the JSON property `pcampaign_id`
        # @return [String]
        attr_accessor :pcampaign_id
      
        # 
        # Corresponds to the JSON property `reason`
        # @return [String]
        attr_accessor :reason
      
        # 
        # Corresponds to the JSON property `show_notification_settings_action`
        # @return [Boolean]
        attr_accessor :show_notification_settings_action
        alias_method :show_notification_settings_action?, :show_notification_settings_action
      
        # 
        # Corresponds to the JSON property `targetUrl`
        # @return [String]
        attr_accessor :target_url
      
        # 
        # Corresponds to the JSON property `timeToExpireMs`
        # @return [Fixnum]
        attr_accessor :time_to_expire_ms
      
        # 
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @body = args[:body] if args.key?(:body)
          @crm_experiment_ids = args[:crm_experiment_ids] if args.key?(:crm_experiment_ids)
          @doc_id = args[:doc_id] if args.key?(:doc_id)
          @doc_type = args[:doc_type] if args.key?(:doc_type)
          @dont_show_notification = args[:dont_show_notification] if args.key?(:dont_show_notification)
          @icon_url = args[:icon_url] if args.key?(:icon_url)
          @is_document_mature = args[:is_document_mature] if args.key?(:is_document_mature)
          @kind = args[:kind] if args.key?(:kind)
          @notification_group = args[:notification_group] if args.key?(:notification_group)
          @notification_type = args[:notification_type] if args.key?(:notification_type)
          @pcampaign_id = args[:pcampaign_id] if args.key?(:pcampaign_id)
          @reason = args[:reason] if args.key?(:reason)
          @show_notification_settings_action = args[:show_notification_settings_action] if args.key?(:show_notification_settings_action)
          @target_url = args[:target_url] if args.key?(:target_url)
          @time_to_expire_ms = args[:time_to_expire_ms] if args.key?(:time_to_expire_ms)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # 
      class Offers
        include Google::Apis::Core::Hashable
      
        # A list of offers.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BooksV1::Offers::Item>]
        attr_accessor :items
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
        end
        
        # 
        class Item
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `artUrl`
          # @return [String]
          attr_accessor :art_url
        
          # 
          # Corresponds to the JSON property `gservicesKey`
          # @return [String]
          attr_accessor :gservices_key
        
          # 
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # 
          # Corresponds to the JSON property `items`
          # @return [Array<Google::Apis::BooksV1::Offers::Item::Item>]
          attr_accessor :items
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @art_url = args[:art_url] if args.key?(:art_url)
            @gservices_key = args[:gservices_key] if args.key?(:gservices_key)
            @id = args[:id] if args.key?(:id)
            @items = args[:items] if args.key?(:items)
          end
          
          # 
          class Item
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `author`
            # @return [String]
            attr_accessor :author
          
            # 
            # Corresponds to the JSON property `canonicalVolumeLink`
            # @return [String]
            attr_accessor :canonical_volume_link
          
            # 
            # Corresponds to the JSON property `coverUrl`
            # @return [String]
            attr_accessor :cover_url
          
            # 
            # Corresponds to the JSON property `description`
            # @return [String]
            attr_accessor :description
          
            # 
            # Corresponds to the JSON property `title`
            # @return [String]
            attr_accessor :title
          
            # 
            # Corresponds to the JSON property `volumeId`
            # @return [String]
            attr_accessor :volume_id
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @author = args[:author] if args.key?(:author)
              @canonical_volume_link = args[:canonical_volume_link] if args.key?(:canonical_volume_link)
              @cover_url = args[:cover_url] if args.key?(:cover_url)
              @description = args[:description] if args.key?(:description)
              @title = args[:title] if args.key?(:title)
              @volume_id = args[:volume_id] if args.key?(:volume_id)
            end
          end
        end
      end
      
      # 
      class ReadingPosition
        include Google::Apis::Core::Hashable
      
        # Position in an EPUB as a CFI.
        # Corresponds to the JSON property `epubCfiPosition`
        # @return [String]
        attr_accessor :epub_cfi_position
      
        # Position in a volume for image-based content.
        # Corresponds to the JSON property `gbImagePosition`
        # @return [String]
        attr_accessor :gb_image_position
      
        # Position in a volume for text-based content.
        # Corresponds to the JSON property `gbTextPosition`
        # @return [String]
        attr_accessor :gb_text_position
      
        # Resource type for a reading position.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Position in a PDF file.
        # Corresponds to the JSON property `pdfPosition`
        # @return [String]
        attr_accessor :pdf_position
      
        # Timestamp when this reading position was last updated (formatted UTC timestamp
        # with millisecond resolution).
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # Volume id associated with this reading position.
        # Corresponds to the JSON property `volumeId`
        # @return [String]
        attr_accessor :volume_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @epub_cfi_position = args[:epub_cfi_position] if args.key?(:epub_cfi_position)
          @gb_image_position = args[:gb_image_position] if args.key?(:gb_image_position)
          @gb_text_position = args[:gb_text_position] if args.key?(:gb_text_position)
          @kind = args[:kind] if args.key?(:kind)
          @pdf_position = args[:pdf_position] if args.key?(:pdf_position)
          @updated = args[:updated] if args.key?(:updated)
          @volume_id = args[:volume_id] if args.key?(:volume_id)
        end
      end
      
      # 
      class RequestAccess
        include Google::Apis::Core::Hashable
      
        # A concurrent access response.
        # Corresponds to the JSON property `concurrentAccess`
        # @return [Google::Apis::BooksV1::ConcurrentAccessRestriction]
        attr_accessor :concurrent_access
      
        # A download access response.
        # Corresponds to the JSON property `downloadAccess`
        # @return [Google::Apis::BooksV1::DownloadAccessRestriction]
        attr_accessor :download_access
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @concurrent_access = args[:concurrent_access] if args.key?(:concurrent_access)
          @download_access = args[:download_access] if args.key?(:download_access)
          @kind = args[:kind] if args.key?(:kind)
        end
      end
      
      # 
      class Review
        include Google::Apis::Core::Hashable
      
        # Author of this review.
        # Corresponds to the JSON property `author`
        # @return [Google::Apis::BooksV1::Review::Author]
        attr_accessor :author
      
        # Review text.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # Date of this review.
        # Corresponds to the JSON property `date`
        # @return [String]
        attr_accessor :date
      
        # URL for the full review text, for reviews gathered from the web.
        # Corresponds to the JSON property `fullTextUrl`
        # @return [String]
        attr_accessor :full_text_url
      
        # Resource type for a review.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Star rating for this review. Possible values are ONE, TWO, THREE, FOUR, FIVE
        # or NOT_RATED.
        # Corresponds to the JSON property `rating`
        # @return [String]
        attr_accessor :rating
      
        # Information regarding the source of this review, when the review is not from a
        # Google Books user.
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::BooksV1::Review::Source]
        attr_accessor :source
      
        # Title for this review.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Source type for this review. Possible values are EDITORIAL, WEB_USER or
        # GOOGLE_USER.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # Volume that this review is for.
        # Corresponds to the JSON property `volumeId`
        # @return [String]
        attr_accessor :volume_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @author = args[:author] if args.key?(:author)
          @content = args[:content] if args.key?(:content)
          @date = args[:date] if args.key?(:date)
          @full_text_url = args[:full_text_url] if args.key?(:full_text_url)
          @kind = args[:kind] if args.key?(:kind)
          @rating = args[:rating] if args.key?(:rating)
          @source = args[:source] if args.key?(:source)
          @title = args[:title] if args.key?(:title)
          @type = args[:type] if args.key?(:type)
          @volume_id = args[:volume_id] if args.key?(:volume_id)
        end
        
        # Author of this review.
        class Author
          include Google::Apis::Core::Hashable
        
          # Name of this person.
          # Corresponds to the JSON property `displayName`
          # @return [String]
          attr_accessor :display_name
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @display_name = args[:display_name] if args.key?(:display_name)
          end
        end
        
        # Information regarding the source of this review, when the review is not from a
        # Google Books user.
        class Source
          include Google::Apis::Core::Hashable
        
          # Name of the source.
          # Corresponds to the JSON property `description`
          # @return [String]
          attr_accessor :description
        
          # Extra text about the source of the review.
          # Corresponds to the JSON property `extraDescription`
          # @return [String]
          attr_accessor :extra_description
        
          # URL of the source of the review.
          # Corresponds to the JSON property `url`
          # @return [String]
          attr_accessor :url
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @description = args[:description] if args.key?(:description)
            @extra_description = args[:extra_description] if args.key?(:extra_description)
            @url = args[:url] if args.key?(:url)
          end
        end
      end
      
      # 
      class Series
        include Google::Apis::Core::Hashable
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # 
        # Corresponds to the JSON property `series`
        # @return [Array<Google::Apis::BooksV1::Series::Series>]
        attr_accessor :series
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @series = args[:series] if args.key?(:series)
        end
        
        # 
        class Series
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `bannerImageUrl`
          # @return [String]
          attr_accessor :banner_image_url
        
          # 
          # Corresponds to the JSON property `imageUrl`
          # @return [String]
          attr_accessor :image_url
        
          # 
          # Corresponds to the JSON property `seriesId`
          # @return [String]
          attr_accessor :series_id
        
          # 
          # Corresponds to the JSON property `seriesType`
          # @return [String]
          attr_accessor :series_type
        
          # 
          # Corresponds to the JSON property `title`
          # @return [String]
          attr_accessor :title
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @banner_image_url = args[:banner_image_url] if args.key?(:banner_image_url)
            @image_url = args[:image_url] if args.key?(:image_url)
            @series_id = args[:series_id] if args.key?(:series_id)
            @series_type = args[:series_type] if args.key?(:series_type)
            @title = args[:title] if args.key?(:title)
          end
        end
      end
      
      # 
      class SeriesMembership
        include Google::Apis::Core::Hashable
      
        # Resorce type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # 
        # Corresponds to the JSON property `member`
        # @return [Array<Google::Apis::BooksV1::Volume>]
        attr_accessor :member
      
        # 
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @member = args[:member] if args.key?(:member)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class UserSettings
        include Google::Apis::Core::Hashable
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # User settings in sub-objects, each for different purposes.
        # Corresponds to the JSON property `notesExport`
        # @return [Google::Apis::BooksV1::UserSettings::NotesExport]
        attr_accessor :notes_export
      
        # 
        # Corresponds to the JSON property `notification`
        # @return [Google::Apis::BooksV1::UserSettings::Notification]
        attr_accessor :notification
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @notes_export = args[:notes_export] if args.key?(:notes_export)
          @notification = args[:notification] if args.key?(:notification)
        end
        
        # User settings in sub-objects, each for different purposes.
        class NotesExport
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `folderName`
          # @return [String]
          attr_accessor :folder_name
        
          # 
          # Corresponds to the JSON property `isEnabled`
          # @return [Boolean]
          attr_accessor :is_enabled
          alias_method :is_enabled?, :is_enabled
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @folder_name = args[:folder_name] if args.key?(:folder_name)
            @is_enabled = args[:is_enabled] if args.key?(:is_enabled)
          end
        end
        
        # 
        class Notification
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `matchMyInterests`
          # @return [Google::Apis::BooksV1::UserSettings::Notification::MatchMyInterests]
          attr_accessor :match_my_interests
        
          # 
          # Corresponds to the JSON property `moreFromAuthors`
          # @return [Google::Apis::BooksV1::UserSettings::Notification::MoreFromAuthors]
          attr_accessor :more_from_authors
        
          # 
          # Corresponds to the JSON property `moreFromSeries`
          # @return [Google::Apis::BooksV1::UserSettings::Notification::MoreFromSeries]
          attr_accessor :more_from_series
        
          # 
          # Corresponds to the JSON property `priceDrop`
          # @return [Google::Apis::BooksV1::UserSettings::Notification::PriceDrop]
          attr_accessor :price_drop
        
          # 
          # Corresponds to the JSON property `rewardExpirations`
          # @return [Google::Apis::BooksV1::UserSettings::Notification::RewardExpirations]
          attr_accessor :reward_expirations
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @match_my_interests = args[:match_my_interests] if args.key?(:match_my_interests)
            @more_from_authors = args[:more_from_authors] if args.key?(:more_from_authors)
            @more_from_series = args[:more_from_series] if args.key?(:more_from_series)
            @price_drop = args[:price_drop] if args.key?(:price_drop)
            @reward_expirations = args[:reward_expirations] if args.key?(:reward_expirations)
          end
          
          # 
          class MatchMyInterests
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `opted_state`
            # @return [String]
            attr_accessor :opted_state
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @opted_state = args[:opted_state] if args.key?(:opted_state)
            end
          end
          
          # 
          class MoreFromAuthors
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `opted_state`
            # @return [String]
            attr_accessor :opted_state
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @opted_state = args[:opted_state] if args.key?(:opted_state)
            end
          end
          
          # 
          class MoreFromSeries
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `opted_state`
            # @return [String]
            attr_accessor :opted_state
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @opted_state = args[:opted_state] if args.key?(:opted_state)
            end
          end
          
          # 
          class PriceDrop
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `opted_state`
            # @return [String]
            attr_accessor :opted_state
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @opted_state = args[:opted_state] if args.key?(:opted_state)
            end
          end
          
          # 
          class RewardExpirations
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `opted_state`
            # @return [String]
            attr_accessor :opted_state
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @opted_state = args[:opted_state] if args.key?(:opted_state)
            end
          end
        end
      end
      
      # 
      class Volume
        include Google::Apis::Core::Hashable
      
        # Any information about a volume related to reading or obtaining that volume
        # text. This information can depend on country (books may be public domain in
        # one country but not in another, e.g.).
        # Corresponds to the JSON property `accessInfo`
        # @return [Google::Apis::BooksV1::Volume::AccessInfo]
        attr_accessor :access_info
      
        # Opaque identifier for a specific version of a volume resource. (In LITE
        # projection)
        # Corresponds to the JSON property `etag`
        # @return [String]
        attr_accessor :etag
      
        # Unique identifier for a volume. (In LITE projection.)
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource type for a volume. (In LITE projection.)
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # What layers exist in this volume and high level information about them.
        # Corresponds to the JSON property `layerInfo`
        # @return [Google::Apis::BooksV1::Volume::LayerInfo]
        attr_accessor :layer_info
      
        # Recommendation related information for this volume.
        # Corresponds to the JSON property `recommendedInfo`
        # @return [Google::Apis::BooksV1::Volume::RecommendedInfo]
        attr_accessor :recommended_info
      
        # Any information about a volume related to the eBookstore and/or
        # purchaseability. This information can depend on the country where the request
        # originates from (i.e. books may not be for sale in certain countries).
        # Corresponds to the JSON property `saleInfo`
        # @return [Google::Apis::BooksV1::Volume::SaleInfo]
        attr_accessor :sale_info
      
        # Search result information related to this volume.
        # Corresponds to the JSON property `searchInfo`
        # @return [Google::Apis::BooksV1::Volume::SearchInfo]
        attr_accessor :search_info
      
        # URL to this resource. (In LITE projection.)
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # User specific information related to this volume. (e.g. page this user last
        # read or whether they purchased this book)
        # Corresponds to the JSON property `userInfo`
        # @return [Google::Apis::BooksV1::Volume::UserInfo]
        attr_accessor :user_info
      
        # General volume information.
        # Corresponds to the JSON property `volumeInfo`
        # @return [Google::Apis::BooksV1::Volume::VolumeInfo]
        attr_accessor :volume_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @access_info = args[:access_info] if args.key?(:access_info)
          @etag = args[:etag] if args.key?(:etag)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @layer_info = args[:layer_info] if args.key?(:layer_info)
          @recommended_info = args[:recommended_info] if args.key?(:recommended_info)
          @sale_info = args[:sale_info] if args.key?(:sale_info)
          @search_info = args[:search_info] if args.key?(:search_info)
          @self_link = args[:self_link] if args.key?(:self_link)
          @user_info = args[:user_info] if args.key?(:user_info)
          @volume_info = args[:volume_info] if args.key?(:volume_info)
        end
        
        # Any information about a volume related to reading or obtaining that volume
        # text. This information can depend on country (books may be public domain in
        # one country but not in another, e.g.).
        class AccessInfo
          include Google::Apis::Core::Hashable
        
          # Combines the access and viewability of this volume into a single status field
          # for this user. Values can be FULL_PURCHASED, FULL_PUBLIC_DOMAIN, SAMPLE or
          # NONE. (In LITE projection.)
          # Corresponds to the JSON property `accessViewStatus`
          # @return [String]
          attr_accessor :access_view_status
        
          # The two-letter ISO_3166-1 country code for which this access information is
          # valid. (In LITE projection.)
          # Corresponds to the JSON property `country`
          # @return [String]
          attr_accessor :country
        
          # Information about a volume's download license access restrictions.
          # Corresponds to the JSON property `downloadAccess`
          # @return [Google::Apis::BooksV1::DownloadAccessRestriction]
          attr_accessor :download_access
        
          # URL to the Google Drive viewer if this volume is uploaded by the user by
          # selecting the file from Google Drive.
          # Corresponds to the JSON property `driveImportedContentLink`
          # @return [String]
          attr_accessor :drive_imported_content_link
        
          # Whether this volume can be embedded in a viewport using the Embedded Viewer
          # API.
          # Corresponds to the JSON property `embeddable`
          # @return [Boolean]
          attr_accessor :embeddable
          alias_method :embeddable?, :embeddable
        
          # Information about epub content. (In LITE projection.)
          # Corresponds to the JSON property `epub`
          # @return [Google::Apis::BooksV1::Volume::AccessInfo::Epub]
          attr_accessor :epub
        
          # Whether this volume requires that the client explicitly request offline
          # download license rather than have it done automatically when loading the
          # content, if the client supports it.
          # Corresponds to the JSON property `explicitOfflineLicenseManagement`
          # @return [Boolean]
          attr_accessor :explicit_offline_license_management
          alias_method :explicit_offline_license_management?, :explicit_offline_license_management
        
          # Information about pdf content. (In LITE projection.)
          # Corresponds to the JSON property `pdf`
          # @return [Google::Apis::BooksV1::Volume::AccessInfo::Pdf]
          attr_accessor :pdf
        
          # Whether or not this book is public domain in the country listed above.
          # Corresponds to the JSON property `publicDomain`
          # @return [Boolean]
          attr_accessor :public_domain
          alias_method :public_domain?, :public_domain
        
          # Whether quote sharing is allowed for this volume.
          # Corresponds to the JSON property `quoteSharingAllowed`
          # @return [Boolean]
          attr_accessor :quote_sharing_allowed
          alias_method :quote_sharing_allowed?, :quote_sharing_allowed
        
          # Whether text-to-speech is permitted for this volume. Values can be ALLOWED,
          # ALLOWED_FOR_ACCESSIBILITY, or NOT_ALLOWED.
          # Corresponds to the JSON property `textToSpeechPermission`
          # @return [String]
          attr_accessor :text_to_speech_permission
        
          # For ordered but not yet processed orders, we give a URL that can be used to go
          # to the appropriate Google Wallet page.
          # Corresponds to the JSON property `viewOrderUrl`
          # @return [String]
          attr_accessor :view_order_url
        
          # The read access of a volume. Possible values are PARTIAL, ALL_PAGES, NO_PAGES
          # or UNKNOWN. This value depends on the country listed above. A value of PARTIAL
          # means that the publisher has allowed some portion of the volume to be viewed
          # publicly, without purchase. This can apply to eBooks as well as non-eBooks.
          # Public domain books will always have a value of ALL_PAGES.
          # Corresponds to the JSON property `viewability`
          # @return [String]
          attr_accessor :viewability
        
          # URL to read this volume on the Google Books site. Link will not allow users to
          # read non-viewable volumes.
          # Corresponds to the JSON property `webReaderLink`
          # @return [String]
          attr_accessor :web_reader_link
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @access_view_status = args[:access_view_status] if args.key?(:access_view_status)
            @country = args[:country] if args.key?(:country)
            @download_access = args[:download_access] if args.key?(:download_access)
            @drive_imported_content_link = args[:drive_imported_content_link] if args.key?(:drive_imported_content_link)
            @embeddable = args[:embeddable] if args.key?(:embeddable)
            @epub = args[:epub] if args.key?(:epub)
            @explicit_offline_license_management = args[:explicit_offline_license_management] if args.key?(:explicit_offline_license_management)
            @pdf = args[:pdf] if args.key?(:pdf)
            @public_domain = args[:public_domain] if args.key?(:public_domain)
            @quote_sharing_allowed = args[:quote_sharing_allowed] if args.key?(:quote_sharing_allowed)
            @text_to_speech_permission = args[:text_to_speech_permission] if args.key?(:text_to_speech_permission)
            @view_order_url = args[:view_order_url] if args.key?(:view_order_url)
            @viewability = args[:viewability] if args.key?(:viewability)
            @web_reader_link = args[:web_reader_link] if args.key?(:web_reader_link)
          end
          
          # Information about epub content. (In LITE projection.)
          class Epub
            include Google::Apis::Core::Hashable
          
            # URL to retrieve ACS token for epub download. (In LITE projection.)
            # Corresponds to the JSON property `acsTokenLink`
            # @return [String]
            attr_accessor :acs_token_link
          
            # URL to download epub. (In LITE projection.)
            # Corresponds to the JSON property `downloadLink`
            # @return [String]
            attr_accessor :download_link
          
            # Is a flowing text epub available either as public domain or for purchase. (In
            # LITE projection.)
            # Corresponds to the JSON property `isAvailable`
            # @return [Boolean]
            attr_accessor :is_available
            alias_method :is_available?, :is_available
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @acs_token_link = args[:acs_token_link] if args.key?(:acs_token_link)
              @download_link = args[:download_link] if args.key?(:download_link)
              @is_available = args[:is_available] if args.key?(:is_available)
            end
          end
          
          # Information about pdf content. (In LITE projection.)
          class Pdf
            include Google::Apis::Core::Hashable
          
            # URL to retrieve ACS token for pdf download. (In LITE projection.)
            # Corresponds to the JSON property `acsTokenLink`
            # @return [String]
            attr_accessor :acs_token_link
          
            # URL to download pdf. (In LITE projection.)
            # Corresponds to the JSON property `downloadLink`
            # @return [String]
            attr_accessor :download_link
          
            # Is a scanned image pdf available either as public domain or for purchase. (In
            # LITE projection.)
            # Corresponds to the JSON property `isAvailable`
            # @return [Boolean]
            attr_accessor :is_available
            alias_method :is_available?, :is_available
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @acs_token_link = args[:acs_token_link] if args.key?(:acs_token_link)
              @download_link = args[:download_link] if args.key?(:download_link)
              @is_available = args[:is_available] if args.key?(:is_available)
            end
          end
        end
        
        # What layers exist in this volume and high level information about them.
        class LayerInfo
          include Google::Apis::Core::Hashable
        
          # A layer should appear here if and only if the layer exists for this book.
          # Corresponds to the JSON property `layers`
          # @return [Array<Google::Apis::BooksV1::Volume::LayerInfo::Layer>]
          attr_accessor :layers
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @layers = args[:layers] if args.key?(:layers)
          end
          
          # 
          class Layer
            include Google::Apis::Core::Hashable
          
            # The layer id of this layer (e.g. "geo").
            # Corresponds to the JSON property `layerId`
            # @return [String]
            attr_accessor :layer_id
          
            # The current version of this layer's volume annotations. Note that this version
            # applies only to the data in the books.layers.volumeAnnotations.* responses.
            # The actual annotation data is versioned separately.
            # Corresponds to the JSON property `volumeAnnotationsVersion`
            # @return [String]
            attr_accessor :volume_annotations_version
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @layer_id = args[:layer_id] if args.key?(:layer_id)
              @volume_annotations_version = args[:volume_annotations_version] if args.key?(:volume_annotations_version)
            end
          end
        end
        
        # Recommendation related information for this volume.
        class RecommendedInfo
          include Google::Apis::Core::Hashable
        
          # A text explaining why this volume is recommended.
          # Corresponds to the JSON property `explanation`
          # @return [String]
          attr_accessor :explanation
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @explanation = args[:explanation] if args.key?(:explanation)
          end
        end
        
        # Any information about a volume related to the eBookstore and/or
        # purchaseability. This information can depend on the country where the request
        # originates from (i.e. books may not be for sale in certain countries).
        class SaleInfo
          include Google::Apis::Core::Hashable
        
          # URL to purchase this volume on the Google Books site. (In LITE projection)
          # Corresponds to the JSON property `buyLink`
          # @return [String]
          attr_accessor :buy_link
        
          # The two-letter ISO_3166-1 country code for which this sale information is
          # valid. (In LITE projection.)
          # Corresponds to the JSON property `country`
          # @return [String]
          attr_accessor :country
        
          # Whether or not this volume is an eBook (can be added to the My eBooks shelf).
          # Corresponds to the JSON property `isEbook`
          # @return [Boolean]
          attr_accessor :is_ebook
          alias_method :is_ebook?, :is_ebook
        
          # Suggested retail price. (In LITE projection.)
          # Corresponds to the JSON property `listPrice`
          # @return [Google::Apis::BooksV1::Volume::SaleInfo::ListPrice]
          attr_accessor :list_price
        
          # Offers available for this volume (sales and rentals).
          # Corresponds to the JSON property `offers`
          # @return [Array<Google::Apis::BooksV1::Volume::SaleInfo::Offer>]
          attr_accessor :offers
        
          # The date on which this book is available for sale.
          # Corresponds to the JSON property `onSaleDate`
          # @return [DateTime]
          attr_accessor :on_sale_date
        
          # The actual selling price of the book. This is the same as the suggested retail
          # or list price unless there are offers or discounts on this volume. (In LITE
          # projection.)
          # Corresponds to the JSON property `retailPrice`
          # @return [Google::Apis::BooksV1::Volume::SaleInfo::RetailPrice]
          attr_accessor :retail_price
        
          # Whether or not this book is available for sale or offered for free in the
          # Google eBookstore for the country listed above. Possible values are FOR_SALE,
          # FOR_RENTAL_ONLY, FOR_SALE_AND_RENTAL, FREE, NOT_FOR_SALE, or FOR_PREORDER.
          # Corresponds to the JSON property `saleability`
          # @return [String]
          attr_accessor :saleability
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @buy_link = args[:buy_link] if args.key?(:buy_link)
            @country = args[:country] if args.key?(:country)
            @is_ebook = args[:is_ebook] if args.key?(:is_ebook)
            @list_price = args[:list_price] if args.key?(:list_price)
            @offers = args[:offers] if args.key?(:offers)
            @on_sale_date = args[:on_sale_date] if args.key?(:on_sale_date)
            @retail_price = args[:retail_price] if args.key?(:retail_price)
            @saleability = args[:saleability] if args.key?(:saleability)
          end
          
          # Suggested retail price. (In LITE projection.)
          class ListPrice
            include Google::Apis::Core::Hashable
          
            # Amount in the currency listed below. (In LITE projection.)
            # Corresponds to the JSON property `amount`
            # @return [Float]
            attr_accessor :amount
          
            # An ISO 4217, three-letter currency code. (In LITE projection.)
            # Corresponds to the JSON property `currencyCode`
            # @return [String]
            attr_accessor :currency_code
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @amount = args[:amount] if args.key?(:amount)
              @currency_code = args[:currency_code] if args.key?(:currency_code)
            end
          end
          
          # 
          class Offer
            include Google::Apis::Core::Hashable
          
            # The finsky offer type (e.g., PURCHASE=0 RENTAL=3)
            # Corresponds to the JSON property `finskyOfferType`
            # @return [Fixnum]
            attr_accessor :finsky_offer_type
          
            # Indicates whether the offer is giftable.
            # Corresponds to the JSON property `giftable`
            # @return [Boolean]
            attr_accessor :giftable
            alias_method :giftable?, :giftable
          
            # Offer list (=undiscounted) price in Micros.
            # Corresponds to the JSON property `listPrice`
            # @return [Google::Apis::BooksV1::Volume::SaleInfo::Offer::ListPrice]
            attr_accessor :list_price
          
            # The rental duration (for rental offers only).
            # Corresponds to the JSON property `rentalDuration`
            # @return [Google::Apis::BooksV1::Volume::SaleInfo::Offer::RentalDuration]
            attr_accessor :rental_duration
          
            # Offer retail (=discounted) price in Micros
            # Corresponds to the JSON property `retailPrice`
            # @return [Google::Apis::BooksV1::Volume::SaleInfo::Offer::RetailPrice]
            attr_accessor :retail_price
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @finsky_offer_type = args[:finsky_offer_type] if args.key?(:finsky_offer_type)
              @giftable = args[:giftable] if args.key?(:giftable)
              @list_price = args[:list_price] if args.key?(:list_price)
              @rental_duration = args[:rental_duration] if args.key?(:rental_duration)
              @retail_price = args[:retail_price] if args.key?(:retail_price)
            end
            
            # Offer list (=undiscounted) price in Micros.
            class ListPrice
              include Google::Apis::Core::Hashable
            
              # 
              # Corresponds to the JSON property `amountInMicros`
              # @return [Float]
              attr_accessor :amount_in_micros
            
              # 
              # Corresponds to the JSON property `currencyCode`
              # @return [String]
              attr_accessor :currency_code
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @amount_in_micros = args[:amount_in_micros] if args.key?(:amount_in_micros)
                @currency_code = args[:currency_code] if args.key?(:currency_code)
              end
            end
            
            # The rental duration (for rental offers only).
            class RentalDuration
              include Google::Apis::Core::Hashable
            
              # 
              # Corresponds to the JSON property `count`
              # @return [Float]
              attr_accessor :count
            
              # 
              # Corresponds to the JSON property `unit`
              # @return [String]
              attr_accessor :unit
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @count = args[:count] if args.key?(:count)
                @unit = args[:unit] if args.key?(:unit)
              end
            end
            
            # Offer retail (=discounted) price in Micros
            class RetailPrice
              include Google::Apis::Core::Hashable
            
              # 
              # Corresponds to the JSON property `amountInMicros`
              # @return [Float]
              attr_accessor :amount_in_micros
            
              # 
              # Corresponds to the JSON property `currencyCode`
              # @return [String]
              attr_accessor :currency_code
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @amount_in_micros = args[:amount_in_micros] if args.key?(:amount_in_micros)
                @currency_code = args[:currency_code] if args.key?(:currency_code)
              end
            end
          end
          
          # The actual selling price of the book. This is the same as the suggested retail
          # or list price unless there are offers or discounts on this volume. (In LITE
          # projection.)
          class RetailPrice
            include Google::Apis::Core::Hashable
          
            # Amount in the currency listed below. (In LITE projection.)
            # Corresponds to the JSON property `amount`
            # @return [Float]
            attr_accessor :amount
          
            # An ISO 4217, three-letter currency code. (In LITE projection.)
            # Corresponds to the JSON property `currencyCode`
            # @return [String]
            attr_accessor :currency_code
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @amount = args[:amount] if args.key?(:amount)
              @currency_code = args[:currency_code] if args.key?(:currency_code)
            end
          end
        end
        
        # Search result information related to this volume.
        class SearchInfo
          include Google::Apis::Core::Hashable
        
          # A text snippet containing the search query.
          # Corresponds to the JSON property `textSnippet`
          # @return [String]
          attr_accessor :text_snippet
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @text_snippet = args[:text_snippet] if args.key?(:text_snippet)
          end
        end
        
        # User specific information related to this volume. (e.g. page this user last
        # read or whether they purchased this book)
        class UserInfo
          include Google::Apis::Core::Hashable
        
          # Timestamp when this volume was acquired by the user. (RFC 3339 UTC date-time
          # format) Acquiring includes purchase, user upload, receiving family sharing,
          # etc.
          # Corresponds to the JSON property `acquiredTime`
          # @return [DateTime]
          attr_accessor :acquired_time
        
          # How this volume was acquired.
          # Corresponds to the JSON property `acquisitionType`
          # @return [Fixnum]
          attr_accessor :acquisition_type
        
          # Copy/Paste accounting information.
          # Corresponds to the JSON property `copy`
          # @return [Google::Apis::BooksV1::Volume::UserInfo::Copy]
          attr_accessor :copy
        
          # Whether this volume is purchased, sample, pd download etc.
          # Corresponds to the JSON property `entitlementType`
          # @return [Fixnum]
          attr_accessor :entitlement_type
        
          # Information on the ability to share with the family.
          # Corresponds to the JSON property `familySharing`
          # @return [Google::Apis::BooksV1::Volume::UserInfo::FamilySharing]
          attr_accessor :family_sharing
        
          # Whether or not the user shared this volume with the family.
          # Corresponds to the JSON property `isFamilySharedFromUser`
          # @return [Boolean]
          attr_accessor :is_family_shared_from_user
          alias_method :is_family_shared_from_user?, :is_family_shared_from_user
        
          # Whether or not the user received this volume through family sharing.
          # Corresponds to the JSON property `isFamilySharedToUser`
          # @return [Boolean]
          attr_accessor :is_family_shared_to_user
          alias_method :is_family_shared_to_user?, :is_family_shared_to_user
        
          # Deprecated: Replaced by familySharing.
          # Corresponds to the JSON property `isFamilySharingAllowed`
          # @return [Boolean]
          attr_accessor :is_family_sharing_allowed
          alias_method :is_family_sharing_allowed?, :is_family_sharing_allowed
        
          # Deprecated: Replaced by familySharing.
          # Corresponds to the JSON property `isFamilySharingDisabledByFop`
          # @return [Boolean]
          attr_accessor :is_family_sharing_disabled_by_fop
          alias_method :is_family_sharing_disabled_by_fop?, :is_family_sharing_disabled_by_fop
        
          # Whether or not this volume is currently in "my books."
          # Corresponds to the JSON property `isInMyBooks`
          # @return [Boolean]
          attr_accessor :is_in_my_books
          alias_method :is_in_my_books?, :is_in_my_books
        
          # Whether or not this volume was pre-ordered by the authenticated user making
          # the request. (In LITE projection.)
          # Corresponds to the JSON property `isPreordered`
          # @return [Boolean]
          attr_accessor :is_preordered
          alias_method :is_preordered?, :is_preordered
        
          # Whether or not this volume was purchased by the authenticated user making the
          # request. (In LITE projection.)
          # Corresponds to the JSON property `isPurchased`
          # @return [Boolean]
          attr_accessor :is_purchased
          alias_method :is_purchased?, :is_purchased
        
          # Whether or not this volume was user uploaded.
          # Corresponds to the JSON property `isUploaded`
          # @return [Boolean]
          attr_accessor :is_uploaded
          alias_method :is_uploaded?, :is_uploaded
        
          # The user's current reading position in the volume, if one is available. (In
          # LITE projection.)
          # Corresponds to the JSON property `readingPosition`
          # @return [Google::Apis::BooksV1::ReadingPosition]
          attr_accessor :reading_position
        
          # Period during this book is/was a valid rental.
          # Corresponds to the JSON property `rentalPeriod`
          # @return [Google::Apis::BooksV1::Volume::UserInfo::RentalPeriod]
          attr_accessor :rental_period
        
          # Whether this book is an active or an expired rental.
          # Corresponds to the JSON property `rentalState`
          # @return [String]
          attr_accessor :rental_state
        
          # This user's review of this volume, if one exists.
          # Corresponds to the JSON property `review`
          # @return [Google::Apis::BooksV1::Review]
          attr_accessor :review
        
          # Timestamp when this volume was last modified by a user action, such as a
          # reading position update, volume purchase or writing a review. (RFC 3339 UTC
          # date-time format).
          # Corresponds to the JSON property `updated`
          # @return [DateTime]
          attr_accessor :updated
        
          # 
          # Corresponds to the JSON property `userUploadedVolumeInfo`
          # @return [Google::Apis::BooksV1::Volume::UserInfo::UserUploadedVolumeInfo]
          attr_accessor :user_uploaded_volume_info
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @acquired_time = args[:acquired_time] if args.key?(:acquired_time)
            @acquisition_type = args[:acquisition_type] if args.key?(:acquisition_type)
            @copy = args[:copy] if args.key?(:copy)
            @entitlement_type = args[:entitlement_type] if args.key?(:entitlement_type)
            @family_sharing = args[:family_sharing] if args.key?(:family_sharing)
            @is_family_shared_from_user = args[:is_family_shared_from_user] if args.key?(:is_family_shared_from_user)
            @is_family_shared_to_user = args[:is_family_shared_to_user] if args.key?(:is_family_shared_to_user)
            @is_family_sharing_allowed = args[:is_family_sharing_allowed] if args.key?(:is_family_sharing_allowed)
            @is_family_sharing_disabled_by_fop = args[:is_family_sharing_disabled_by_fop] if args.key?(:is_family_sharing_disabled_by_fop)
            @is_in_my_books = args[:is_in_my_books] if args.key?(:is_in_my_books)
            @is_preordered = args[:is_preordered] if args.key?(:is_preordered)
            @is_purchased = args[:is_purchased] if args.key?(:is_purchased)
            @is_uploaded = args[:is_uploaded] if args.key?(:is_uploaded)
            @reading_position = args[:reading_position] if args.key?(:reading_position)
            @rental_period = args[:rental_period] if args.key?(:rental_period)
            @rental_state = args[:rental_state] if args.key?(:rental_state)
            @review = args[:review] if args.key?(:review)
            @updated = args[:updated] if args.key?(:updated)
            @user_uploaded_volume_info = args[:user_uploaded_volume_info] if args.key?(:user_uploaded_volume_info)
          end
          
          # Copy/Paste accounting information.
          class Copy
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `allowedCharacterCount`
            # @return [Fixnum]
            attr_accessor :allowed_character_count
          
            # 
            # Corresponds to the JSON property `limitType`
            # @return [String]
            attr_accessor :limit_type
          
            # 
            # Corresponds to the JSON property `remainingCharacterCount`
            # @return [Fixnum]
            attr_accessor :remaining_character_count
          
            # 
            # Corresponds to the JSON property `updated`
            # @return [DateTime]
            attr_accessor :updated
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @allowed_character_count = args[:allowed_character_count] if args.key?(:allowed_character_count)
              @limit_type = args[:limit_type] if args.key?(:limit_type)
              @remaining_character_count = args[:remaining_character_count] if args.key?(:remaining_character_count)
              @updated = args[:updated] if args.key?(:updated)
            end
          end
          
          # Information on the ability to share with the family.
          class FamilySharing
            include Google::Apis::Core::Hashable
          
            # The role of the user in the family.
            # Corresponds to the JSON property `familyRole`
            # @return [String]
            attr_accessor :family_role
          
            # Whether or not this volume can be shared with the family by the user. This
            # includes sharing eligibility of both the volume and the user. If the value is
            # true, the user can initiate a family sharing action.
            # Corresponds to the JSON property `isSharingAllowed`
            # @return [Boolean]
            attr_accessor :is_sharing_allowed
            alias_method :is_sharing_allowed?, :is_sharing_allowed
          
            # Whether or not sharing this volume is temporarily disabled due to issues with
            # the Family Wallet.
            # Corresponds to the JSON property `isSharingDisabledByFop`
            # @return [Boolean]
            attr_accessor :is_sharing_disabled_by_fop
            alias_method :is_sharing_disabled_by_fop?, :is_sharing_disabled_by_fop
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @family_role = args[:family_role] if args.key?(:family_role)
              @is_sharing_allowed = args[:is_sharing_allowed] if args.key?(:is_sharing_allowed)
              @is_sharing_disabled_by_fop = args[:is_sharing_disabled_by_fop] if args.key?(:is_sharing_disabled_by_fop)
            end
          end
          
          # Period during this book is/was a valid rental.
          class RentalPeriod
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `endUtcSec`
            # @return [Fixnum]
            attr_accessor :end_utc_sec
          
            # 
            # Corresponds to the JSON property `startUtcSec`
            # @return [Fixnum]
            attr_accessor :start_utc_sec
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @end_utc_sec = args[:end_utc_sec] if args.key?(:end_utc_sec)
              @start_utc_sec = args[:start_utc_sec] if args.key?(:start_utc_sec)
            end
          end
          
          # 
          class UserUploadedVolumeInfo
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `processingState`
            # @return [String]
            attr_accessor :processing_state
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @processing_state = args[:processing_state] if args.key?(:processing_state)
            end
          end
        end
        
        # General volume information.
        class VolumeInfo
          include Google::Apis::Core::Hashable
        
          # Whether anonymous logging should be allowed.
          # Corresponds to the JSON property `allowAnonLogging`
          # @return [Boolean]
          attr_accessor :allow_anon_logging
          alias_method :allow_anon_logging?, :allow_anon_logging
        
          # The names of the authors and/or editors for this volume. (In LITE projection)
          # Corresponds to the JSON property `authors`
          # @return [Array<String>]
          attr_accessor :authors
        
          # The mean review rating for this volume. (min = 1.0, max = 5.0)
          # Corresponds to the JSON property `averageRating`
          # @return [Float]
          attr_accessor :average_rating
        
          # Canonical URL for a volume. (In LITE projection.)
          # Corresponds to the JSON property `canonicalVolumeLink`
          # @return [String]
          attr_accessor :canonical_volume_link
        
          # A list of subject categories, such as "Fiction", "Suspense", etc.
          # Corresponds to the JSON property `categories`
          # @return [Array<String>]
          attr_accessor :categories
        
          # Whether the volume has comics content.
          # Corresponds to the JSON property `comicsContent`
          # @return [Boolean]
          attr_accessor :comics_content
          alias_method :comics_content?, :comics_content
        
          # An identifier for the version of the volume content (text & images). (In LITE
          # projection)
          # Corresponds to the JSON property `contentVersion`
          # @return [String]
          attr_accessor :content_version
        
          # A synopsis of the volume. The text of the description is formatted in HTML and
          # includes simple formatting elements, such as b, i, and br tags. (In LITE
          # projection.)
          # Corresponds to the JSON property `description`
          # @return [String]
          attr_accessor :description
        
          # Physical dimensions of this volume.
          # Corresponds to the JSON property `dimensions`
          # @return [Google::Apis::BooksV1::Volume::VolumeInfo::Dimensions]
          attr_accessor :dimensions
        
          # A list of image links for all the sizes that are available. (In LITE
          # projection.)
          # Corresponds to the JSON property `imageLinks`
          # @return [Google::Apis::BooksV1::Volume::VolumeInfo::ImageLinks]
          attr_accessor :image_links
        
          # Industry standard identifiers for this volume.
          # Corresponds to the JSON property `industryIdentifiers`
          # @return [Array<Google::Apis::BooksV1::Volume::VolumeInfo::IndustryIdentifier>]
          attr_accessor :industry_identifiers
        
          # URL to view information about this volume on the Google Books site. (In LITE
          # projection)
          # Corresponds to the JSON property `infoLink`
          # @return [String]
          attr_accessor :info_link
        
          # Best language for this volume (based on content). It is the two-letter ISO 639-
          # 1 code such as 'fr', 'en', etc.
          # Corresponds to the JSON property `language`
          # @return [String]
          attr_accessor :language
        
          # The main category to which this volume belongs. It will be the category from
          # the categories list returned below that has the highest weight.
          # Corresponds to the JSON property `mainCategory`
          # @return [String]
          attr_accessor :main_category
        
          # 
          # Corresponds to the JSON property `maturityRating`
          # @return [String]
          attr_accessor :maturity_rating
        
          # Total number of pages as per publisher metadata.
          # Corresponds to the JSON property `pageCount`
          # @return [Fixnum]
          attr_accessor :page_count
        
          # A top-level summary of the panelization info in this volume.
          # Corresponds to the JSON property `panelizationSummary`
          # @return [Google::Apis::BooksV1::Volume::VolumeInfo::PanelizationSummary]
          attr_accessor :panelization_summary
        
          # URL to preview this volume on the Google Books site.
          # Corresponds to the JSON property `previewLink`
          # @return [String]
          attr_accessor :preview_link
        
          # Type of publication of this volume. Possible values are BOOK or MAGAZINE.
          # Corresponds to the JSON property `printType`
          # @return [String]
          attr_accessor :print_type
        
          # Total number of printed pages in generated pdf representation.
          # Corresponds to the JSON property `printedPageCount`
          # @return [Fixnum]
          attr_accessor :printed_page_count
        
          # Date of publication. (In LITE projection.)
          # Corresponds to the JSON property `publishedDate`
          # @return [String]
          attr_accessor :published_date
        
          # Publisher of this volume. (In LITE projection.)
          # Corresponds to the JSON property `publisher`
          # @return [String]
          attr_accessor :publisher
        
          # The number of review ratings for this volume.
          # Corresponds to the JSON property `ratingsCount`
          # @return [Fixnum]
          attr_accessor :ratings_count
        
          # The reading modes available for this volume.
          # Corresponds to the JSON property `readingModes`
          # @return [Object]
          attr_accessor :reading_modes
        
          # Total number of sample pages as per publisher metadata.
          # Corresponds to the JSON property `samplePageCount`
          # @return [Fixnum]
          attr_accessor :sample_page_count
        
          # 
          # Corresponds to the JSON property `seriesInfo`
          # @return [Google::Apis::BooksV1::Volumeseriesinfo]
          attr_accessor :series_info
        
          # Volume subtitle. (In LITE projection.)
          # Corresponds to the JSON property `subtitle`
          # @return [String]
          attr_accessor :subtitle
        
          # Volume title. (In LITE projection.)
          # Corresponds to the JSON property `title`
          # @return [String]
          attr_accessor :title
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @allow_anon_logging = args[:allow_anon_logging] if args.key?(:allow_anon_logging)
            @authors = args[:authors] if args.key?(:authors)
            @average_rating = args[:average_rating] if args.key?(:average_rating)
            @canonical_volume_link = args[:canonical_volume_link] if args.key?(:canonical_volume_link)
            @categories = args[:categories] if args.key?(:categories)
            @comics_content = args[:comics_content] if args.key?(:comics_content)
            @content_version = args[:content_version] if args.key?(:content_version)
            @description = args[:description] if args.key?(:description)
            @dimensions = args[:dimensions] if args.key?(:dimensions)
            @image_links = args[:image_links] if args.key?(:image_links)
            @industry_identifiers = args[:industry_identifiers] if args.key?(:industry_identifiers)
            @info_link = args[:info_link] if args.key?(:info_link)
            @language = args[:language] if args.key?(:language)
            @main_category = args[:main_category] if args.key?(:main_category)
            @maturity_rating = args[:maturity_rating] if args.key?(:maturity_rating)
            @page_count = args[:page_count] if args.key?(:page_count)
            @panelization_summary = args[:panelization_summary] if args.key?(:panelization_summary)
            @preview_link = args[:preview_link] if args.key?(:preview_link)
            @print_type = args[:print_type] if args.key?(:print_type)
            @printed_page_count = args[:printed_page_count] if args.key?(:printed_page_count)
            @published_date = args[:published_date] if args.key?(:published_date)
            @publisher = args[:publisher] if args.key?(:publisher)
            @ratings_count = args[:ratings_count] if args.key?(:ratings_count)
            @reading_modes = args[:reading_modes] if args.key?(:reading_modes)
            @sample_page_count = args[:sample_page_count] if args.key?(:sample_page_count)
            @series_info = args[:series_info] if args.key?(:series_info)
            @subtitle = args[:subtitle] if args.key?(:subtitle)
            @title = args[:title] if args.key?(:title)
          end
          
          # Physical dimensions of this volume.
          class Dimensions
            include Google::Apis::Core::Hashable
          
            # Height or length of this volume (in cm).
            # Corresponds to the JSON property `height`
            # @return [String]
            attr_accessor :height
          
            # Thickness of this volume (in cm).
            # Corresponds to the JSON property `thickness`
            # @return [String]
            attr_accessor :thickness
          
            # Width of this volume (in cm).
            # Corresponds to the JSON property `width`
            # @return [String]
            attr_accessor :width
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @height = args[:height] if args.key?(:height)
              @thickness = args[:thickness] if args.key?(:thickness)
              @width = args[:width] if args.key?(:width)
            end
          end
          
          # A list of image links for all the sizes that are available. (In LITE
          # projection.)
          class ImageLinks
            include Google::Apis::Core::Hashable
          
            # Image link for extra large size (width of ~1280 pixels). (In LITE projection)
            # Corresponds to the JSON property `extraLarge`
            # @return [String]
            attr_accessor :extra_large
          
            # Image link for large size (width of ~800 pixels). (In LITE projection)
            # Corresponds to the JSON property `large`
            # @return [String]
            attr_accessor :large
          
            # Image link for medium size (width of ~575 pixels). (In LITE projection)
            # Corresponds to the JSON property `medium`
            # @return [String]
            attr_accessor :medium
          
            # Image link for small size (width of ~300 pixels). (In LITE projection)
            # Corresponds to the JSON property `small`
            # @return [String]
            attr_accessor :small
          
            # Image link for small thumbnail size (width of ~80 pixels). (In LITE projection)
            # Corresponds to the JSON property `smallThumbnail`
            # @return [String]
            attr_accessor :small_thumbnail
          
            # Image link for thumbnail size (width of ~128 pixels). (In LITE projection)
            # Corresponds to the JSON property `thumbnail`
            # @return [String]
            attr_accessor :thumbnail
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @extra_large = args[:extra_large] if args.key?(:extra_large)
              @large = args[:large] if args.key?(:large)
              @medium = args[:medium] if args.key?(:medium)
              @small = args[:small] if args.key?(:small)
              @small_thumbnail = args[:small_thumbnail] if args.key?(:small_thumbnail)
              @thumbnail = args[:thumbnail] if args.key?(:thumbnail)
            end
          end
          
          # 
          class IndustryIdentifier
            include Google::Apis::Core::Hashable
          
            # Industry specific volume identifier.
            # Corresponds to the JSON property `identifier`
            # @return [String]
            attr_accessor :identifier
          
            # Identifier type. Possible values are ISBN_10, ISBN_13, ISSN and OTHER.
            # Corresponds to the JSON property `type`
            # @return [String]
            attr_accessor :type
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @identifier = args[:identifier] if args.key?(:identifier)
              @type = args[:type] if args.key?(:type)
            end
          end
          
          # A top-level summary of the panelization info in this volume.
          class PanelizationSummary
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `containsEpubBubbles`
            # @return [Boolean]
            attr_accessor :contains_epub_bubbles
            alias_method :contains_epub_bubbles?, :contains_epub_bubbles
          
            # 
            # Corresponds to the JSON property `containsImageBubbles`
            # @return [Boolean]
            attr_accessor :contains_image_bubbles
            alias_method :contains_image_bubbles?, :contains_image_bubbles
          
            # 
            # Corresponds to the JSON property `epubBubbleVersion`
            # @return [String]
            attr_accessor :epub_bubble_version
          
            # 
            # Corresponds to the JSON property `imageBubbleVersion`
            # @return [String]
            attr_accessor :image_bubble_version
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @contains_epub_bubbles = args[:contains_epub_bubbles] if args.key?(:contains_epub_bubbles)
              @contains_image_bubbles = args[:contains_image_bubbles] if args.key?(:contains_image_bubbles)
              @epub_bubble_version = args[:epub_bubble_version] if args.key?(:epub_bubble_version)
              @image_bubble_version = args[:image_bubble_version] if args.key?(:image_bubble_version)
            end
          end
        end
      end
      
      # 
      class Volume2
        include Google::Apis::Core::Hashable
      
        # A list of volumes.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BooksV1::Volume>]
        attr_accessor :items
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # 
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class VolumeAnnotation
        include Google::Apis::Core::Hashable
      
        # The annotation data id for this volume annotation.
        # Corresponds to the JSON property `annotationDataId`
        # @return [String]
        attr_accessor :annotation_data_id
      
        # Link to get data for this annotation.
        # Corresponds to the JSON property `annotationDataLink`
        # @return [String]
        attr_accessor :annotation_data_link
      
        # The type of annotation this is.
        # Corresponds to the JSON property `annotationType`
        # @return [String]
        attr_accessor :annotation_type
      
        # The content ranges to identify the selected text.
        # Corresponds to the JSON property `contentRanges`
        # @return [Google::Apis::BooksV1::VolumeAnnotation::ContentRanges]
        attr_accessor :content_ranges
      
        # Data for this annotation.
        # Corresponds to the JSON property `data`
        # @return [String]
        attr_accessor :data
      
        # Indicates that this annotation is deleted.
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # Unique id of this volume annotation.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Resource Type
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The Layer this annotation is for.
        # Corresponds to the JSON property `layerId`
        # @return [String]
        attr_accessor :layer_id
      
        # Pages the annotation spans.
        # Corresponds to the JSON property `pageIds`
        # @return [Array<String>]
        attr_accessor :page_ids
      
        # Excerpt from the volume.
        # Corresponds to the JSON property `selectedText`
        # @return [String]
        attr_accessor :selected_text
      
        # URL to this resource.
        # Corresponds to the JSON property `selfLink`
        # @return [String]
        attr_accessor :self_link
      
        # Timestamp for the last time this anntoation was updated. (RFC 3339 UTC date-
        # time format).
        # Corresponds to the JSON property `updated`
        # @return [DateTime]
        attr_accessor :updated
      
        # The Volume this annotation is for.
        # Corresponds to the JSON property `volumeId`
        # @return [String]
        attr_accessor :volume_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @annotation_data_id = args[:annotation_data_id] if args.key?(:annotation_data_id)
          @annotation_data_link = args[:annotation_data_link] if args.key?(:annotation_data_link)
          @annotation_type = args[:annotation_type] if args.key?(:annotation_type)
          @content_ranges = args[:content_ranges] if args.key?(:content_ranges)
          @data = args[:data] if args.key?(:data)
          @deleted = args[:deleted] if args.key?(:deleted)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @layer_id = args[:layer_id] if args.key?(:layer_id)
          @page_ids = args[:page_ids] if args.key?(:page_ids)
          @selected_text = args[:selected_text] if args.key?(:selected_text)
          @self_link = args[:self_link] if args.key?(:self_link)
          @updated = args[:updated] if args.key?(:updated)
          @volume_id = args[:volume_id] if args.key?(:volume_id)
        end
        
        # The content ranges to identify the selected text.
        class ContentRanges
          include Google::Apis::Core::Hashable
        
          # Range in CFI format for this annotation for version above.
          # Corresponds to the JSON property `cfiRange`
          # @return [Google::Apis::BooksV1::AnnotatinsRange]
          attr_accessor :cfi_range
        
          # Content version applicable to ranges below.
          # Corresponds to the JSON property `contentVersion`
          # @return [String]
          attr_accessor :content_version
        
          # Range in GB image format for this annotation for version above.
          # Corresponds to the JSON property `gbImageRange`
          # @return [Google::Apis::BooksV1::AnnotatinsRange]
          attr_accessor :gb_image_range
        
          # Range in GB text format for this annotation for version above.
          # Corresponds to the JSON property `gbTextRange`
          # @return [Google::Apis::BooksV1::AnnotatinsRange]
          attr_accessor :gb_text_range
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @cfi_range = args[:cfi_range] if args.key?(:cfi_range)
            @content_version = args[:content_version] if args.key?(:content_version)
            @gb_image_range = args[:gb_image_range] if args.key?(:gb_image_range)
            @gb_text_range = args[:gb_text_range] if args.key?(:gb_text_range)
          end
        end
      end
      
      # 
      class Volumeannotations
        include Google::Apis::Core::Hashable
      
        # A list of volume annotations.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BooksV1::VolumeAnnotation>]
        attr_accessor :items
      
        # Resource type
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token to pass in for pagination for the next page. This will not be present if
        # this request does not have more results.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The total number of volume annotations found.
        # Corresponds to the JSON property `totalItems`
        # @return [Fixnum]
        attr_accessor :total_items
      
        # The version string for all of the volume annotations in this layer (not just
        # the ones in this response). Note: the version string doesn't apply to the
        # annotation data, just the information in this response (e.g. the location of
        # annotations in the book).
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_items = args[:total_items] if args.key?(:total_items)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # 
      class Volumes
        include Google::Apis::Core::Hashable
      
        # A list of volumes.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::BooksV1::Volume>]
        attr_accessor :items
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Total number of volumes found. This might be greater than the number of
        # volumes returned in this response if results have been paginated.
        # Corresponds to the JSON property `totalItems`
        # @return [Fixnum]
        attr_accessor :total_items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @total_items = args[:total_items] if args.key?(:total_items)
        end
      end
      
      # 
      class Volumeseriesinfo
        include Google::Apis::Core::Hashable
      
        # The display number string. This should be used only for display purposes and
        # the actual sequence should be inferred from the below orderNumber.
        # Corresponds to the JSON property `bookDisplayNumber`
        # @return [String]
        attr_accessor :book_display_number
      
        # Resource type.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Short book title in the context of the series.
        # Corresponds to the JSON property `shortSeriesBookTitle`
        # @return [String]
        attr_accessor :short_series_book_title
      
        # 
        # Corresponds to the JSON property `volumeSeries`
        # @return [Array<Google::Apis::BooksV1::Volumeseriesinfo::VolumeSeries>]
        attr_accessor :volume_series
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @book_display_number = args[:book_display_number] if args.key?(:book_display_number)
          @kind = args[:kind] if args.key?(:kind)
          @short_series_book_title = args[:short_series_book_title] if args.key?(:short_series_book_title)
          @volume_series = args[:volume_series] if args.key?(:volume_series)
        end
        
        # 
        class VolumeSeries
          include Google::Apis::Core::Hashable
        
          # List of issues. Applicable only for Collection Edition and Omnibus.
          # Corresponds to the JSON property `issue`
          # @return [Array<Google::Apis::BooksV1::Volumeseriesinfo::VolumeSeries::Issue>]
          attr_accessor :issue
        
          # The book order number in the series.
          # Corresponds to the JSON property `orderNumber`
          # @return [Fixnum]
          attr_accessor :order_number
        
          # The book type in the context of series. Examples - Single Issue, Collection
          # Edition, etc.
          # Corresponds to the JSON property `seriesBookType`
          # @return [String]
          attr_accessor :series_book_type
        
          # The series id.
          # Corresponds to the JSON property `seriesId`
          # @return [String]
          attr_accessor :series_id
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @issue = args[:issue] if args.key?(:issue)
            @order_number = args[:order_number] if args.key?(:order_number)
            @series_book_type = args[:series_book_type] if args.key?(:series_book_type)
            @series_id = args[:series_id] if args.key?(:series_id)
          end
          
          # 
          class Issue
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `issueDisplayNumber`
            # @return [String]
            attr_accessor :issue_display_number
          
            # 
            # Corresponds to the JSON property `issueOrderNumber`
            # @return [Fixnum]
            attr_accessor :issue_order_number
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @issue_display_number = args[:issue_display_number] if args.key?(:issue_display_number)
              @issue_order_number = args[:issue_order_number] if args.key?(:issue_order_number)
            end
          end
        end
      end
    end
  end
end
