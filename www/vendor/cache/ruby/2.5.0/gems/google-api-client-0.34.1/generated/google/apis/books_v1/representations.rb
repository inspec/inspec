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
      
      class Annotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ClientVersionRanges
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class CurrentVersionRanges
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class LayerSummary
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnnotationData
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Annotations
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnnotationsSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Layer
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnnotationsData
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AnnotatinsRange
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LoadingResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RateRecommendedVolumeResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Bookshelf
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Bookshelves
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Category
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Item
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ConcurrentAccessRestriction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DictLayerData
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Common
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Dict
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Source
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Word
            class Representation < Google::Apis::Core::JsonRepresentation; end
            
            class Derivative
              class Representation < Google::Apis::Core::JsonRepresentation; end
              
              class Source
                class Representation < Google::Apis::Core::JsonRepresentation; end
              
                include Google::Apis::Core::JsonObjectSupport
              end
            
              include Google::Apis::Core::JsonObjectSupport
            end
            
            class Example
              class Representation < Google::Apis::Core::JsonRepresentation; end
              
              class Source
                class Representation < Google::Apis::Core::JsonRepresentation; end
              
                include Google::Apis::Core::JsonObjectSupport
              end
            
              include Google::Apis::Core::JsonObjectSupport
            end
            
            class Sense
              class Representation < Google::Apis::Core::JsonRepresentation; end
              
              class Conjugation
                class Representation < Google::Apis::Core::JsonRepresentation; end
              
                include Google::Apis::Core::JsonObjectSupport
              end
              
              class Definition
                class Representation < Google::Apis::Core::JsonRepresentation; end
                
                class Example
                  class Representation < Google::Apis::Core::JsonRepresentation; end
                  
                  class Source
                    class Representation < Google::Apis::Core::JsonRepresentation; end
                  
                    include Google::Apis::Core::JsonObjectSupport
                  end
                
                  include Google::Apis::Core::JsonObjectSupport
                end
              
                include Google::Apis::Core::JsonObjectSupport
              end
              
              class Source
                class Representation < Google::Apis::Core::JsonRepresentation; end
              
                include Google::Apis::Core::JsonObjectSupport
              end
              
              class Synonym
                class Representation < Google::Apis::Core::JsonRepresentation; end
                
                class Source
                  class Representation < Google::Apis::Core::JsonRepresentation; end
                
                  include Google::Apis::Core::JsonObjectSupport
                end
              
                include Google::Apis::Core::JsonObjectSupport
              end
            
              include Google::Apis::Core::JsonObjectSupport
            end
            
            class Source
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Discoveryclusters
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Cluster
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class BannerWithContentContainer
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DownloadAccessRestriction
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DownloadAccesses
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class FamilyInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Membership
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GeoLayerData
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Common
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Geo
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Boundary
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Viewport
            class Representation < Google::Apis::Core::JsonRepresentation; end
            
            class Hi
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
            
            class Lo
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LayerSummaries
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LayerSummary
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Metadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Item
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Notification
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Offers
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Item
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Item
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReadingPosition
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RequestAccess
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Review
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Author
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Source
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Series
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Series
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SeriesMembership
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserSettings
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class NotesExport
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Notification
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class MatchMyInterests
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class MoreFromAuthors
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class MoreFromSeries
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class PriceDrop
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class RewardExpirations
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Volume
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class AccessInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Epub
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Pdf
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class LayerInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Layer
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class RecommendedInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class SaleInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class ListPrice
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class Offer
            class Representation < Google::Apis::Core::JsonRepresentation; end
            
            class ListPrice
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
            
            class RentalDuration
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
            
            class RetailPrice
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class RetailPrice
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class SearchInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class UserInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Copy
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class FamilySharing
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class RentalPeriod
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class UserUploadedVolumeInfo
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class VolumeInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Dimensions
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class ImageLinks
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class IndustryIdentifier
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class PanelizationSummary
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Volume2
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VolumeAnnotation
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ContentRanges
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Volumeannotations
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Volumes
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Volumeseriesinfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class VolumeSeries
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Issue
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Annotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :after_selected_text, as: 'afterSelectedText'
          property :before_selected_text, as: 'beforeSelectedText'
          property :client_version_ranges, as: 'clientVersionRanges', class: Google::Apis::BooksV1::Annotation::ClientVersionRanges, decorator: Google::Apis::BooksV1::Annotation::ClientVersionRanges::Representation
      
          property :created, as: 'created', type: DateTime
      
          property :current_version_ranges, as: 'currentVersionRanges', class: Google::Apis::BooksV1::Annotation::CurrentVersionRanges, decorator: Google::Apis::BooksV1::Annotation::CurrentVersionRanges::Representation
      
          property :data, as: 'data'
          property :deleted, as: 'deleted'
          property :highlight_style, as: 'highlightStyle'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :layer_id, as: 'layerId'
          property :layer_summary, as: 'layerSummary', class: Google::Apis::BooksV1::Annotation::LayerSummary, decorator: Google::Apis::BooksV1::Annotation::LayerSummary::Representation
      
          collection :page_ids, as: 'pageIds'
          property :selected_text, as: 'selectedText'
          property :self_link, as: 'selfLink'
          property :updated, as: 'updated', type: DateTime
      
          property :volume_id, as: 'volumeId'
        end
        
        class ClientVersionRanges
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :cfi_range, as: 'cfiRange', class: Google::Apis::BooksV1::AnnotatinsRange, decorator: Google::Apis::BooksV1::AnnotatinsRange::Representation
        
            property :content_version, as: 'contentVersion'
            property :gb_image_range, as: 'gbImageRange', class: Google::Apis::BooksV1::AnnotatinsRange, decorator: Google::Apis::BooksV1::AnnotatinsRange::Representation
        
            property :gb_text_range, as: 'gbTextRange', class: Google::Apis::BooksV1::AnnotatinsRange, decorator: Google::Apis::BooksV1::AnnotatinsRange::Representation
        
            property :image_cfi_range, as: 'imageCfiRange', class: Google::Apis::BooksV1::AnnotatinsRange, decorator: Google::Apis::BooksV1::AnnotatinsRange::Representation
        
          end
        end
        
        class CurrentVersionRanges
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :cfi_range, as: 'cfiRange', class: Google::Apis::BooksV1::AnnotatinsRange, decorator: Google::Apis::BooksV1::AnnotatinsRange::Representation
        
            property :content_version, as: 'contentVersion'
            property :gb_image_range, as: 'gbImageRange', class: Google::Apis::BooksV1::AnnotatinsRange, decorator: Google::Apis::BooksV1::AnnotatinsRange::Representation
        
            property :gb_text_range, as: 'gbTextRange', class: Google::Apis::BooksV1::AnnotatinsRange, decorator: Google::Apis::BooksV1::AnnotatinsRange::Representation
        
            property :image_cfi_range, as: 'imageCfiRange', class: Google::Apis::BooksV1::AnnotatinsRange, decorator: Google::Apis::BooksV1::AnnotatinsRange::Representation
        
          end
        end
        
        class LayerSummary
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :allowed_character_count, as: 'allowedCharacterCount'
            property :limit_type, as: 'limitType'
            property :remaining_character_count, as: 'remainingCharacterCount'
          end
        end
      end
      
      class AnnotationData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :annotation_type, as: 'annotationType'
          property :data, as: 'data'
          property :encoded_data, :base64 => true, as: 'encoded_data'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :layer_id, as: 'layerId'
          property :self_link, as: 'selfLink'
          property :updated, as: 'updated', type: DateTime
      
          property :volume_id, as: 'volumeId'
        end
      end
      
      class Annotations
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BooksV1::Annotation, decorator: Google::Apis::BooksV1::Annotation::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :total_items, as: 'totalItems'
        end
      end
      
      class AnnotationsSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :layers, as: 'layers', class: Google::Apis::BooksV1::AnnotationsSummary::Layer, decorator: Google::Apis::BooksV1::AnnotationsSummary::Layer::Representation
      
        end
        
        class Layer
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :allowed_character_count, as: 'allowedCharacterCount'
            property :layer_id, as: 'layerId'
            property :limit_type, as: 'limitType'
            property :remaining_character_count, as: 'remainingCharacterCount'
            property :updated, as: 'updated', type: DateTime
        
          end
        end
      end
      
      class AnnotationsData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BooksV1::AnnotationData, decorator: Google::Apis::BooksV1::AnnotationData::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :total_items, as: 'totalItems'
        end
      end
      
      class AnnotatinsRange
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :end_offset, as: 'endOffset'
          property :end_position, as: 'endPosition'
          property :start_offset, as: 'startOffset'
          property :start_position, as: 'startPosition'
        end
      end
      
      class LoadingResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author, as: 'author'
          property :processing_state, as: 'processingState'
          property :title, as: 'title'
          property :volume_id, as: 'volumeId'
        end
      end
      
      class RateRecommendedVolumeResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :consistency_token, as: 'consistency_token'
        end
      end
      
      class Bookshelf
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access, as: 'access'
          property :created, as: 'created', type: DateTime
      
          property :description, as: 'description'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :self_link, as: 'selfLink'
          property :title, as: 'title'
          property :updated, as: 'updated', type: DateTime
      
          property :volume_count, as: 'volumeCount'
          property :volumes_last_updated, as: 'volumesLastUpdated', type: DateTime
      
        end
      end
      
      class Bookshelves
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BooksV1::Bookshelf, decorator: Google::Apis::BooksV1::Bookshelf::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Category
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BooksV1::Category::Item, decorator: Google::Apis::BooksV1::Category::Item::Representation
      
          property :kind, as: 'kind'
        end
        
        class Item
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :badge_url, as: 'badgeUrl'
            property :category_id, as: 'categoryId'
            property :name, as: 'name'
          end
        end
      end
      
      class ConcurrentAccessRestriction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_allowed, as: 'deviceAllowed'
          property :kind, as: 'kind'
          property :max_concurrent_devices, as: 'maxConcurrentDevices'
          property :message, as: 'message'
          property :nonce, as: 'nonce'
          property :reason_code, as: 'reasonCode'
          property :restricted, as: 'restricted'
          property :signature, as: 'signature'
          property :source, as: 'source'
          property :time_window_seconds, as: 'timeWindowSeconds'
          property :volume_id, as: 'volumeId'
        end
      end
      
      class DictLayerData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :common, as: 'common', class: Google::Apis::BooksV1::DictLayerData::Common, decorator: Google::Apis::BooksV1::DictLayerData::Common::Representation
      
          property :dict, as: 'dict', class: Google::Apis::BooksV1::DictLayerData::Dict, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Representation
      
          property :kind, as: 'kind'
        end
        
        class Common
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :title, as: 'title'
          end
        end
        
        class Dict
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :source, as: 'source', class: Google::Apis::BooksV1::DictLayerData::Dict::Source, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Source::Representation
        
            collection :words, as: 'words', class: Google::Apis::BooksV1::DictLayerData::Dict::Word, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Representation
        
          end
          
          class Source
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :attribution, as: 'attribution'
              property :url, as: 'url'
            end
          end
          
          class Word
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              collection :derivatives, as: 'derivatives', class: Google::Apis::BooksV1::DictLayerData::Dict::Word::Derivative, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Derivative::Representation
          
              collection :examples, as: 'examples', class: Google::Apis::BooksV1::DictLayerData::Dict::Word::Example, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Example::Representation
          
              collection :senses, as: 'senses', class: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Representation
          
              property :source, as: 'source', class: Google::Apis::BooksV1::DictLayerData::Dict::Word::Source, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Source::Representation
          
            end
            
            class Derivative
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :source, as: 'source', class: Google::Apis::BooksV1::DictLayerData::Dict::Word::Derivative::Source, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Derivative::Source::Representation
            
                property :text, as: 'text'
              end
              
              class Source
                # @private
                class Representation < Google::Apis::Core::JsonRepresentation
                  property :attribution, as: 'attribution'
                  property :url, as: 'url'
                end
              end
            end
            
            class Example
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :source, as: 'source', class: Google::Apis::BooksV1::DictLayerData::Dict::Word::Example::Source, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Example::Source::Representation
            
                property :text, as: 'text'
              end
              
              class Source
                # @private
                class Representation < Google::Apis::Core::JsonRepresentation
                  property :attribution, as: 'attribution'
                  property :url, as: 'url'
                end
              end
            end
            
            class Sense
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                collection :conjugations, as: 'conjugations', class: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Conjugation, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Conjugation::Representation
            
                collection :definitions, as: 'definitions', class: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Definition, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Definition::Representation
            
                property :part_of_speech, as: 'partOfSpeech'
                property :pronunciation, as: 'pronunciation'
                property :pronunciation_url, as: 'pronunciationUrl'
                property :source, as: 'source', class: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Source, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Source::Representation
            
                property :syllabification, as: 'syllabification'
                collection :synonyms, as: 'synonyms', class: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Synonym, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Synonym::Representation
            
              end
              
              class Conjugation
                # @private
                class Representation < Google::Apis::Core::JsonRepresentation
                  property :type, as: 'type'
                  property :value, as: 'value'
                end
              end
              
              class Definition
                # @private
                class Representation < Google::Apis::Core::JsonRepresentation
                  property :definition, as: 'definition'
                  collection :examples, as: 'examples', class: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Definition::Example, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Definition::Example::Representation
              
                end
                
                class Example
                  # @private
                  class Representation < Google::Apis::Core::JsonRepresentation
                    property :source, as: 'source', class: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Definition::Example::Source, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Definition::Example::Source::Representation
                
                    property :text, as: 'text'
                  end
                  
                  class Source
                    # @private
                    class Representation < Google::Apis::Core::JsonRepresentation
                      property :attribution, as: 'attribution'
                      property :url, as: 'url'
                    end
                  end
                end
              end
              
              class Source
                # @private
                class Representation < Google::Apis::Core::JsonRepresentation
                  property :attribution, as: 'attribution'
                  property :url, as: 'url'
                end
              end
              
              class Synonym
                # @private
                class Representation < Google::Apis::Core::JsonRepresentation
                  property :source, as: 'source', class: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Synonym::Source, decorator: Google::Apis::BooksV1::DictLayerData::Dict::Word::Sense::Synonym::Source::Representation
              
                  property :text, as: 'text'
                end
                
                class Source
                  # @private
                  class Representation < Google::Apis::Core::JsonRepresentation
                    property :attribution, as: 'attribution'
                    property :url, as: 'url'
                  end
                end
              end
            end
            
            class Source
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :attribution, as: 'attribution'
                property :url, as: 'url'
              end
            end
          end
        end
      end
      
      class Discoveryclusters
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :clusters, as: 'clusters', class: Google::Apis::BooksV1::Discoveryclusters::Cluster, decorator: Google::Apis::BooksV1::Discoveryclusters::Cluster::Representation
      
          property :kind, as: 'kind'
          property :total_clusters, as: 'totalClusters'
        end
        
        class Cluster
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :banner_with_content_container, as: 'banner_with_content_container', class: Google::Apis::BooksV1::Discoveryclusters::Cluster::BannerWithContentContainer, decorator: Google::Apis::BooksV1::Discoveryclusters::Cluster::BannerWithContentContainer::Representation
        
            property :sub_title, as: 'subTitle'
            property :title, as: 'title'
            property :total_volumes, as: 'totalVolumes'
            property :uid, as: 'uid'
            collection :volumes, as: 'volumes', class: Google::Apis::BooksV1::Volume, decorator: Google::Apis::BooksV1::Volume::Representation
        
          end
          
          class BannerWithContentContainer
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :fill_color_argb, as: 'fillColorArgb'
              property :image_url, as: 'imageUrl'
              property :mask_color_argb, as: 'maskColorArgb'
              property :more_button_text, as: 'moreButtonText'
              property :more_button_url, as: 'moreButtonUrl'
              property :text_color_argb, as: 'textColorArgb'
            end
          end
        end
      end
      
      class DownloadAccessRestriction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :device_allowed, as: 'deviceAllowed'
          property :downloads_acquired, as: 'downloadsAcquired'
          property :just_acquired, as: 'justAcquired'
          property :kind, as: 'kind'
          property :max_download_devices, as: 'maxDownloadDevices'
          property :message, as: 'message'
          property :nonce, as: 'nonce'
          property :reason_code, as: 'reasonCode'
          property :restricted, as: 'restricted'
          property :signature, as: 'signature'
          property :source, as: 'source'
          property :volume_id, as: 'volumeId'
        end
      end
      
      class DownloadAccesses
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :download_access_list, as: 'downloadAccessList', class: Google::Apis::BooksV1::DownloadAccessRestriction, decorator: Google::Apis::BooksV1::DownloadAccessRestriction::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class FamilyInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :membership, as: 'membership', class: Google::Apis::BooksV1::FamilyInfo::Membership, decorator: Google::Apis::BooksV1::FamilyInfo::Membership::Representation
      
        end
        
        class Membership
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :acquire_permission, as: 'acquirePermission'
            property :age_group, as: 'ageGroup'
            property :allowed_maturity_rating, as: 'allowedMaturityRating'
            property :is_in_family, as: 'isInFamily'
            property :role, as: 'role'
          end
        end
      end
      
      class GeoLayerData
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :common, as: 'common', class: Google::Apis::BooksV1::GeoLayerData::Common, decorator: Google::Apis::BooksV1::GeoLayerData::Common::Representation
      
          property :geo, as: 'geo', class: Google::Apis::BooksV1::GeoLayerData::Geo, decorator: Google::Apis::BooksV1::GeoLayerData::Geo::Representation
      
          property :kind, as: 'kind'
        end
        
        class Common
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :lang, as: 'lang'
            property :preview_image_url, as: 'previewImageUrl'
            property :snippet, as: 'snippet'
            property :snippet_url, as: 'snippetUrl'
            property :title, as: 'title'
          end
        end
        
        class Geo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :boundary, as: 'boundary', :class => Array do
          include Representable::JSON::Collection
          items class: Google::Apis::BooksV1::GeoLayerData::Geo::Boundary, decorator: Google::Apis::BooksV1::GeoLayerData::Geo::Boundary::Representation
        
        end
        
            property :cache_policy, as: 'cachePolicy'
            property :country_code, as: 'countryCode'
            property :latitude, as: 'latitude'
            property :longitude, as: 'longitude'
            property :map_type, as: 'mapType'
            property :viewport, as: 'viewport', class: Google::Apis::BooksV1::GeoLayerData::Geo::Viewport, decorator: Google::Apis::BooksV1::GeoLayerData::Geo::Viewport::Representation
        
            property :zoom, as: 'zoom'
          end
          
          class Boundary
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :latitude, as: 'latitude'
              property :longitude, as: 'longitude'
            end
          end
          
          class Viewport
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :hi, as: 'hi', class: Google::Apis::BooksV1::GeoLayerData::Geo::Viewport::Hi, decorator: Google::Apis::BooksV1::GeoLayerData::Geo::Viewport::Hi::Representation
          
              property :lo, as: 'lo', class: Google::Apis::BooksV1::GeoLayerData::Geo::Viewport::Lo, decorator: Google::Apis::BooksV1::GeoLayerData::Geo::Viewport::Lo::Representation
          
            end
            
            class Hi
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :latitude, as: 'latitude'
                property :longitude, as: 'longitude'
              end
            end
            
            class Lo
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :latitude, as: 'latitude'
                property :longitude, as: 'longitude'
              end
            end
          end
        end
      end
      
      class LayerSummaries
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BooksV1::LayerSummary, decorator: Google::Apis::BooksV1::LayerSummary::Representation
      
          property :kind, as: 'kind'
          property :total_items, as: 'totalItems'
        end
      end
      
      class LayerSummary
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :annotation_count, as: 'annotationCount'
          collection :annotation_types, as: 'annotationTypes'
          property :annotations_data_link, as: 'annotationsDataLink'
          property :annotations_link, as: 'annotationsLink'
          property :content_version, as: 'contentVersion'
          property :data_count, as: 'dataCount'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :layer_id, as: 'layerId'
          property :self_link, as: 'selfLink'
          property :updated, as: 'updated', type: DateTime
      
          property :volume_annotations_version, as: 'volumeAnnotationsVersion'
          property :volume_id, as: 'volumeId'
        end
      end
      
      class Metadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BooksV1::Metadata::Item, decorator: Google::Apis::BooksV1::Metadata::Item::Representation
      
          property :kind, as: 'kind'
        end
        
        class Item
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :download_url, as: 'download_url'
            property :encrypted_key, as: 'encrypted_key'
            property :language, as: 'language'
            property :size, :numeric_string => true, as: 'size'
            property :version, :numeric_string => true, as: 'version'
          end
        end
      end
      
      class Notification
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :body, as: 'body'
          collection :crm_experiment_ids, as: 'crmExperimentIds'
          property :doc_id, as: 'doc_id'
          property :doc_type, as: 'doc_type'
          property :dont_show_notification, as: 'dont_show_notification'
          property :icon_url, as: 'iconUrl'
          property :is_document_mature, as: 'is_document_mature'
          property :kind, as: 'kind'
          property :notification_group, as: 'notificationGroup'
          property :notification_type, as: 'notification_type'
          property :pcampaign_id, as: 'pcampaign_id'
          property :reason, as: 'reason'
          property :show_notification_settings_action, as: 'show_notification_settings_action'
          property :target_url, as: 'targetUrl'
          property :time_to_expire_ms, :numeric_string => true, as: 'timeToExpireMs'
          property :title, as: 'title'
        end
      end
      
      class Offers
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BooksV1::Offers::Item, decorator: Google::Apis::BooksV1::Offers::Item::Representation
      
          property :kind, as: 'kind'
        end
        
        class Item
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :art_url, as: 'artUrl'
            property :gservices_key, as: 'gservicesKey'
            property :id, as: 'id'
            collection :items, as: 'items', class: Google::Apis::BooksV1::Offers::Item::Item, decorator: Google::Apis::BooksV1::Offers::Item::Item::Representation
        
          end
          
          class Item
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :author, as: 'author'
              property :canonical_volume_link, as: 'canonicalVolumeLink'
              property :cover_url, as: 'coverUrl'
              property :description, as: 'description'
              property :title, as: 'title'
              property :volume_id, as: 'volumeId'
            end
          end
        end
      end
      
      class ReadingPosition
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :epub_cfi_position, as: 'epubCfiPosition'
          property :gb_image_position, as: 'gbImagePosition'
          property :gb_text_position, as: 'gbTextPosition'
          property :kind, as: 'kind'
          property :pdf_position, as: 'pdfPosition'
          property :updated, as: 'updated', type: DateTime
      
          property :volume_id, as: 'volumeId'
        end
      end
      
      class RequestAccess
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :concurrent_access, as: 'concurrentAccess', class: Google::Apis::BooksV1::ConcurrentAccessRestriction, decorator: Google::Apis::BooksV1::ConcurrentAccessRestriction::Representation
      
          property :download_access, as: 'downloadAccess', class: Google::Apis::BooksV1::DownloadAccessRestriction, decorator: Google::Apis::BooksV1::DownloadAccessRestriction::Representation
      
          property :kind, as: 'kind'
        end
      end
      
      class Review
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :author, as: 'author', class: Google::Apis::BooksV1::Review::Author, decorator: Google::Apis::BooksV1::Review::Author::Representation
      
          property :content, as: 'content'
          property :date, as: 'date'
          property :full_text_url, as: 'fullTextUrl'
          property :kind, as: 'kind'
          property :rating, as: 'rating'
          property :source, as: 'source', class: Google::Apis::BooksV1::Review::Source, decorator: Google::Apis::BooksV1::Review::Source::Representation
      
          property :title, as: 'title'
          property :type, as: 'type'
          property :volume_id, as: 'volumeId'
        end
        
        class Author
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :display_name, as: 'displayName'
          end
        end
        
        class Source
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :description, as: 'description'
            property :extra_description, as: 'extraDescription'
            property :url, as: 'url'
          end
        end
      end
      
      class Series
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :series, as: 'series', class: Google::Apis::BooksV1::Series::Series, decorator: Google::Apis::BooksV1::Series::Series::Representation
      
        end
        
        class Series
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :banner_image_url, as: 'bannerImageUrl'
            property :image_url, as: 'imageUrl'
            property :series_id, as: 'seriesId'
            property :series_type, as: 'seriesType'
            property :title, as: 'title'
          end
        end
      end
      
      class SeriesMembership
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :member, as: 'member', class: Google::Apis::BooksV1::Volume, decorator: Google::Apis::BooksV1::Volume::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class UserSettings
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :notes_export, as: 'notesExport', class: Google::Apis::BooksV1::UserSettings::NotesExport, decorator: Google::Apis::BooksV1::UserSettings::NotesExport::Representation
      
          property :notification, as: 'notification', class: Google::Apis::BooksV1::UserSettings::Notification, decorator: Google::Apis::BooksV1::UserSettings::Notification::Representation
      
        end
        
        class NotesExport
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :folder_name, as: 'folderName'
            property :is_enabled, as: 'isEnabled'
          end
        end
        
        class Notification
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :match_my_interests, as: 'matchMyInterests', class: Google::Apis::BooksV1::UserSettings::Notification::MatchMyInterests, decorator: Google::Apis::BooksV1::UserSettings::Notification::MatchMyInterests::Representation
        
            property :more_from_authors, as: 'moreFromAuthors', class: Google::Apis::BooksV1::UserSettings::Notification::MoreFromAuthors, decorator: Google::Apis::BooksV1::UserSettings::Notification::MoreFromAuthors::Representation
        
            property :more_from_series, as: 'moreFromSeries', class: Google::Apis::BooksV1::UserSettings::Notification::MoreFromSeries, decorator: Google::Apis::BooksV1::UserSettings::Notification::MoreFromSeries::Representation
        
            property :price_drop, as: 'priceDrop', class: Google::Apis::BooksV1::UserSettings::Notification::PriceDrop, decorator: Google::Apis::BooksV1::UserSettings::Notification::PriceDrop::Representation
        
            property :reward_expirations, as: 'rewardExpirations', class: Google::Apis::BooksV1::UserSettings::Notification::RewardExpirations, decorator: Google::Apis::BooksV1::UserSettings::Notification::RewardExpirations::Representation
        
          end
          
          class MatchMyInterests
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :opted_state, as: 'opted_state'
            end
          end
          
          class MoreFromAuthors
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :opted_state, as: 'opted_state'
            end
          end
          
          class MoreFromSeries
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :opted_state, as: 'opted_state'
            end
          end
          
          class PriceDrop
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :opted_state, as: 'opted_state'
            end
          end
          
          class RewardExpirations
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :opted_state, as: 'opted_state'
            end
          end
        end
      end
      
      class Volume
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :access_info, as: 'accessInfo', class: Google::Apis::BooksV1::Volume::AccessInfo, decorator: Google::Apis::BooksV1::Volume::AccessInfo::Representation
      
          property :etag, as: 'etag'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :layer_info, as: 'layerInfo', class: Google::Apis::BooksV1::Volume::LayerInfo, decorator: Google::Apis::BooksV1::Volume::LayerInfo::Representation
      
          property :recommended_info, as: 'recommendedInfo', class: Google::Apis::BooksV1::Volume::RecommendedInfo, decorator: Google::Apis::BooksV1::Volume::RecommendedInfo::Representation
      
          property :sale_info, as: 'saleInfo', class: Google::Apis::BooksV1::Volume::SaleInfo, decorator: Google::Apis::BooksV1::Volume::SaleInfo::Representation
      
          property :search_info, as: 'searchInfo', class: Google::Apis::BooksV1::Volume::SearchInfo, decorator: Google::Apis::BooksV1::Volume::SearchInfo::Representation
      
          property :self_link, as: 'selfLink'
          property :user_info, as: 'userInfo', class: Google::Apis::BooksV1::Volume::UserInfo, decorator: Google::Apis::BooksV1::Volume::UserInfo::Representation
      
          property :volume_info, as: 'volumeInfo', class: Google::Apis::BooksV1::Volume::VolumeInfo, decorator: Google::Apis::BooksV1::Volume::VolumeInfo::Representation
      
        end
        
        class AccessInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :access_view_status, as: 'accessViewStatus'
            property :country, as: 'country'
            property :download_access, as: 'downloadAccess', class: Google::Apis::BooksV1::DownloadAccessRestriction, decorator: Google::Apis::BooksV1::DownloadAccessRestriction::Representation
        
            property :drive_imported_content_link, as: 'driveImportedContentLink'
            property :embeddable, as: 'embeddable'
            property :epub, as: 'epub', class: Google::Apis::BooksV1::Volume::AccessInfo::Epub, decorator: Google::Apis::BooksV1::Volume::AccessInfo::Epub::Representation
        
            property :explicit_offline_license_management, as: 'explicitOfflineLicenseManagement'
            property :pdf, as: 'pdf', class: Google::Apis::BooksV1::Volume::AccessInfo::Pdf, decorator: Google::Apis::BooksV1::Volume::AccessInfo::Pdf::Representation
        
            property :public_domain, as: 'publicDomain'
            property :quote_sharing_allowed, as: 'quoteSharingAllowed'
            property :text_to_speech_permission, as: 'textToSpeechPermission'
            property :view_order_url, as: 'viewOrderUrl'
            property :viewability, as: 'viewability'
            property :web_reader_link, as: 'webReaderLink'
          end
          
          class Epub
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :acs_token_link, as: 'acsTokenLink'
              property :download_link, as: 'downloadLink'
              property :is_available, as: 'isAvailable'
            end
          end
          
          class Pdf
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :acs_token_link, as: 'acsTokenLink'
              property :download_link, as: 'downloadLink'
              property :is_available, as: 'isAvailable'
            end
          end
        end
        
        class LayerInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :layers, as: 'layers', class: Google::Apis::BooksV1::Volume::LayerInfo::Layer, decorator: Google::Apis::BooksV1::Volume::LayerInfo::Layer::Representation
        
          end
          
          class Layer
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :layer_id, as: 'layerId'
              property :volume_annotations_version, as: 'volumeAnnotationsVersion'
            end
          end
        end
        
        class RecommendedInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :explanation, as: 'explanation'
          end
        end
        
        class SaleInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :buy_link, as: 'buyLink'
            property :country, as: 'country'
            property :is_ebook, as: 'isEbook'
            property :list_price, as: 'listPrice', class: Google::Apis::BooksV1::Volume::SaleInfo::ListPrice, decorator: Google::Apis::BooksV1::Volume::SaleInfo::ListPrice::Representation
        
            collection :offers, as: 'offers', class: Google::Apis::BooksV1::Volume::SaleInfo::Offer, decorator: Google::Apis::BooksV1::Volume::SaleInfo::Offer::Representation
        
            property :on_sale_date, as: 'onSaleDate', type: DateTime
        
            property :retail_price, as: 'retailPrice', class: Google::Apis::BooksV1::Volume::SaleInfo::RetailPrice, decorator: Google::Apis::BooksV1::Volume::SaleInfo::RetailPrice::Representation
        
            property :saleability, as: 'saleability'
          end
          
          class ListPrice
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :amount, as: 'amount'
              property :currency_code, as: 'currencyCode'
            end
          end
          
          class Offer
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :finsky_offer_type, as: 'finskyOfferType'
              property :giftable, as: 'giftable'
              property :list_price, as: 'listPrice', class: Google::Apis::BooksV1::Volume::SaleInfo::Offer::ListPrice, decorator: Google::Apis::BooksV1::Volume::SaleInfo::Offer::ListPrice::Representation
          
              property :rental_duration, as: 'rentalDuration', class: Google::Apis::BooksV1::Volume::SaleInfo::Offer::RentalDuration, decorator: Google::Apis::BooksV1::Volume::SaleInfo::Offer::RentalDuration::Representation
          
              property :retail_price, as: 'retailPrice', class: Google::Apis::BooksV1::Volume::SaleInfo::Offer::RetailPrice, decorator: Google::Apis::BooksV1::Volume::SaleInfo::Offer::RetailPrice::Representation
          
            end
            
            class ListPrice
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :amount_in_micros, as: 'amountInMicros'
                property :currency_code, as: 'currencyCode'
              end
            end
            
            class RentalDuration
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :count, as: 'count'
                property :unit, as: 'unit'
              end
            end
            
            class RetailPrice
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :amount_in_micros, as: 'amountInMicros'
                property :currency_code, as: 'currencyCode'
              end
            end
          end
          
          class RetailPrice
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :amount, as: 'amount'
              property :currency_code, as: 'currencyCode'
            end
          end
        end
        
        class SearchInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :text_snippet, as: 'textSnippet'
          end
        end
        
        class UserInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :acquired_time, as: 'acquiredTime', type: DateTime
        
            property :acquisition_type, as: 'acquisitionType'
            property :copy, as: 'copy', class: Google::Apis::BooksV1::Volume::UserInfo::Copy, decorator: Google::Apis::BooksV1::Volume::UserInfo::Copy::Representation
        
            property :entitlement_type, as: 'entitlementType'
            property :family_sharing, as: 'familySharing', class: Google::Apis::BooksV1::Volume::UserInfo::FamilySharing, decorator: Google::Apis::BooksV1::Volume::UserInfo::FamilySharing::Representation
        
            property :is_family_shared_from_user, as: 'isFamilySharedFromUser'
            property :is_family_shared_to_user, as: 'isFamilySharedToUser'
            property :is_family_sharing_allowed, as: 'isFamilySharingAllowed'
            property :is_family_sharing_disabled_by_fop, as: 'isFamilySharingDisabledByFop'
            property :is_in_my_books, as: 'isInMyBooks'
            property :is_preordered, as: 'isPreordered'
            property :is_purchased, as: 'isPurchased'
            property :is_uploaded, as: 'isUploaded'
            property :reading_position, as: 'readingPosition', class: Google::Apis::BooksV1::ReadingPosition, decorator: Google::Apis::BooksV1::ReadingPosition::Representation
        
            property :rental_period, as: 'rentalPeriod', class: Google::Apis::BooksV1::Volume::UserInfo::RentalPeriod, decorator: Google::Apis::BooksV1::Volume::UserInfo::RentalPeriod::Representation
        
            property :rental_state, as: 'rentalState'
            property :review, as: 'review', class: Google::Apis::BooksV1::Review, decorator: Google::Apis::BooksV1::Review::Representation
        
            property :updated, as: 'updated', type: DateTime
        
            property :user_uploaded_volume_info, as: 'userUploadedVolumeInfo', class: Google::Apis::BooksV1::Volume::UserInfo::UserUploadedVolumeInfo, decorator: Google::Apis::BooksV1::Volume::UserInfo::UserUploadedVolumeInfo::Representation
        
          end
          
          class Copy
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :allowed_character_count, as: 'allowedCharacterCount'
              property :limit_type, as: 'limitType'
              property :remaining_character_count, as: 'remainingCharacterCount'
              property :updated, as: 'updated', type: DateTime
          
            end
          end
          
          class FamilySharing
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :family_role, as: 'familyRole'
              property :is_sharing_allowed, as: 'isSharingAllowed'
              property :is_sharing_disabled_by_fop, as: 'isSharingDisabledByFop'
            end
          end
          
          class RentalPeriod
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :end_utc_sec, :numeric_string => true, as: 'endUtcSec'
              property :start_utc_sec, :numeric_string => true, as: 'startUtcSec'
            end
          end
          
          class UserUploadedVolumeInfo
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :processing_state, as: 'processingState'
            end
          end
        end
        
        class VolumeInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :allow_anon_logging, as: 'allowAnonLogging'
            collection :authors, as: 'authors'
            property :average_rating, as: 'averageRating'
            property :canonical_volume_link, as: 'canonicalVolumeLink'
            collection :categories, as: 'categories'
            property :comics_content, as: 'comicsContent'
            property :content_version, as: 'contentVersion'
            property :description, as: 'description'
            property :dimensions, as: 'dimensions', class: Google::Apis::BooksV1::Volume::VolumeInfo::Dimensions, decorator: Google::Apis::BooksV1::Volume::VolumeInfo::Dimensions::Representation
        
            property :image_links, as: 'imageLinks', class: Google::Apis::BooksV1::Volume::VolumeInfo::ImageLinks, decorator: Google::Apis::BooksV1::Volume::VolumeInfo::ImageLinks::Representation
        
            collection :industry_identifiers, as: 'industryIdentifiers', class: Google::Apis::BooksV1::Volume::VolumeInfo::IndustryIdentifier, decorator: Google::Apis::BooksV1::Volume::VolumeInfo::IndustryIdentifier::Representation
        
            property :info_link, as: 'infoLink'
            property :language, as: 'language'
            property :main_category, as: 'mainCategory'
            property :maturity_rating, as: 'maturityRating'
            property :page_count, as: 'pageCount'
            property :panelization_summary, as: 'panelizationSummary', class: Google::Apis::BooksV1::Volume::VolumeInfo::PanelizationSummary, decorator: Google::Apis::BooksV1::Volume::VolumeInfo::PanelizationSummary::Representation
        
            property :preview_link, as: 'previewLink'
            property :print_type, as: 'printType'
            property :printed_page_count, as: 'printedPageCount'
            property :published_date, as: 'publishedDate'
            property :publisher, as: 'publisher'
            property :ratings_count, as: 'ratingsCount'
            property :reading_modes, as: 'readingModes'
            property :sample_page_count, as: 'samplePageCount'
            property :series_info, as: 'seriesInfo', class: Google::Apis::BooksV1::Volumeseriesinfo, decorator: Google::Apis::BooksV1::Volumeseriesinfo::Representation
        
            property :subtitle, as: 'subtitle'
            property :title, as: 'title'
          end
          
          class Dimensions
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :height, as: 'height'
              property :thickness, as: 'thickness'
              property :width, as: 'width'
            end
          end
          
          class ImageLinks
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :extra_large, as: 'extraLarge'
              property :large, as: 'large'
              property :medium, as: 'medium'
              property :small, as: 'small'
              property :small_thumbnail, as: 'smallThumbnail'
              property :thumbnail, as: 'thumbnail'
            end
          end
          
          class IndustryIdentifier
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :identifier, as: 'identifier'
              property :type, as: 'type'
            end
          end
          
          class PanelizationSummary
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :contains_epub_bubbles, as: 'containsEpubBubbles'
              property :contains_image_bubbles, as: 'containsImageBubbles'
              property :epub_bubble_version, as: 'epubBubbleVersion'
              property :image_bubble_version, as: 'imageBubbleVersion'
            end
          end
        end
      end
      
      class Volume2
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BooksV1::Volume, decorator: Google::Apis::BooksV1::Volume::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class VolumeAnnotation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :annotation_data_id, as: 'annotationDataId'
          property :annotation_data_link, as: 'annotationDataLink'
          property :annotation_type, as: 'annotationType'
          property :content_ranges, as: 'contentRanges', class: Google::Apis::BooksV1::VolumeAnnotation::ContentRanges, decorator: Google::Apis::BooksV1::VolumeAnnotation::ContentRanges::Representation
      
          property :data, as: 'data'
          property :deleted, as: 'deleted'
          property :id, as: 'id'
          property :kind, as: 'kind'
          property :layer_id, as: 'layerId'
          collection :page_ids, as: 'pageIds'
          property :selected_text, as: 'selectedText'
          property :self_link, as: 'selfLink'
          property :updated, as: 'updated', type: DateTime
      
          property :volume_id, as: 'volumeId'
        end
        
        class ContentRanges
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :cfi_range, as: 'cfiRange', class: Google::Apis::BooksV1::AnnotatinsRange, decorator: Google::Apis::BooksV1::AnnotatinsRange::Representation
        
            property :content_version, as: 'contentVersion'
            property :gb_image_range, as: 'gbImageRange', class: Google::Apis::BooksV1::AnnotatinsRange, decorator: Google::Apis::BooksV1::AnnotatinsRange::Representation
        
            property :gb_text_range, as: 'gbTextRange', class: Google::Apis::BooksV1::AnnotatinsRange, decorator: Google::Apis::BooksV1::AnnotatinsRange::Representation
        
          end
        end
      end
      
      class Volumeannotations
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BooksV1::VolumeAnnotation, decorator: Google::Apis::BooksV1::VolumeAnnotation::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :total_items, as: 'totalItems'
          property :version, as: 'version'
        end
      end
      
      class Volumes
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::BooksV1::Volume, decorator: Google::Apis::BooksV1::Volume::Representation
      
          property :kind, as: 'kind'
          property :total_items, as: 'totalItems'
        end
      end
      
      class Volumeseriesinfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :book_display_number, as: 'bookDisplayNumber'
          property :kind, as: 'kind'
          property :short_series_book_title, as: 'shortSeriesBookTitle'
          collection :volume_series, as: 'volumeSeries', class: Google::Apis::BooksV1::Volumeseriesinfo::VolumeSeries, decorator: Google::Apis::BooksV1::Volumeseriesinfo::VolumeSeries::Representation
      
        end
        
        class VolumeSeries
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :issue, as: 'issue', class: Google::Apis::BooksV1::Volumeseriesinfo::VolumeSeries::Issue, decorator: Google::Apis::BooksV1::Volumeseriesinfo::VolumeSeries::Issue::Representation
        
            property :order_number, as: 'orderNumber'
            property :series_book_type, as: 'seriesBookType'
            property :series_id, as: 'seriesId'
          end
          
          class Issue
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :issue_display_number, as: 'issueDisplayNumber'
              property :issue_order_number, as: 'issueOrderNumber'
            end
          end
        end
      end
    end
  end
end
