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
    module CustomsearchV1
      
      class Context
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Facet
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Promotion
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class BodyLine
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Image
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Query
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Result
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Image
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Label
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Search
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class SearchInformation
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Spelling
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Url
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Context
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :facets, as: 'facets', :class => Array do
        include Representable::JSON::Collection
        items class: Google::Apis::CustomsearchV1::Context::Facet, decorator: Google::Apis::CustomsearchV1::Context::Facet::Representation
      
      end
      
          property :title, as: 'title'
        end
        
        class Facet
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :anchor, as: 'anchor'
            property :label, as: 'label'
            property :label_with_op, as: 'label_with_op'
          end
        end
      end
      
      class Promotion
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :body_lines, as: 'bodyLines', class: Google::Apis::CustomsearchV1::Promotion::BodyLine, decorator: Google::Apis::CustomsearchV1::Promotion::BodyLine::Representation
      
          property :display_link, as: 'displayLink'
          property :html_title, as: 'htmlTitle'
          property :image, as: 'image', class: Google::Apis::CustomsearchV1::Promotion::Image, decorator: Google::Apis::CustomsearchV1::Promotion::Image::Representation
      
          property :link, as: 'link'
          property :title, as: 'title'
        end
        
        class BodyLine
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :html_title, as: 'htmlTitle'
            property :link, as: 'link'
            property :title, as: 'title'
            property :url, as: 'url'
          end
        end
        
        class Image
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :height, as: 'height'
            property :source, as: 'source'
            property :width, as: 'width'
          end
        end
      end
      
      class Query
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :count, as: 'count'
          property :cr, as: 'cr'
          property :cx, as: 'cx'
          property :date_restrict, as: 'dateRestrict'
          property :disable_cn_tw_translation, as: 'disableCnTwTranslation'
          property :exact_terms, as: 'exactTerms'
          property :exclude_terms, as: 'excludeTerms'
          property :file_type, as: 'fileType'
          property :filter, as: 'filter'
          property :gl, as: 'gl'
          property :google_host, as: 'googleHost'
          property :high_range, as: 'highRange'
          property :hl, as: 'hl'
          property :hq, as: 'hq'
          property :img_color_type, as: 'imgColorType'
          property :img_dominant_color, as: 'imgDominantColor'
          property :img_size, as: 'imgSize'
          property :img_type, as: 'imgType'
          property :input_encoding, as: 'inputEncoding'
          property :language, as: 'language'
          property :link_site, as: 'linkSite'
          property :low_range, as: 'lowRange'
          property :or_terms, as: 'orTerms'
          property :output_encoding, as: 'outputEncoding'
          property :related_site, as: 'relatedSite'
          property :rights, as: 'rights'
          property :safe, as: 'safe'
          property :search_terms, as: 'searchTerms'
          property :search_type, as: 'searchType'
          property :site_search, as: 'siteSearch'
          property :site_search_filter, as: 'siteSearchFilter'
          property :sort, as: 'sort'
          property :start_index, as: 'startIndex'
          property :start_page, as: 'startPage'
          property :title, as: 'title'
          property :total_results, :numeric_string => true, as: 'totalResults'
        end
      end
      
      class Result
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cache_id, as: 'cacheId'
          property :display_link, as: 'displayLink'
          property :file_format, as: 'fileFormat'
          property :formatted_url, as: 'formattedUrl'
          property :html_formatted_url, as: 'htmlFormattedUrl'
          property :html_snippet, as: 'htmlSnippet'
          property :html_title, as: 'htmlTitle'
          property :image, as: 'image', class: Google::Apis::CustomsearchV1::Result::Image, decorator: Google::Apis::CustomsearchV1::Result::Image::Representation
      
          property :kind, as: 'kind'
          collection :labels, as: 'labels', class: Google::Apis::CustomsearchV1::Result::Label, decorator: Google::Apis::CustomsearchV1::Result::Label::Representation
      
          property :link, as: 'link'
          property :mime, as: 'mime'
          hash :pagemap, as: 'pagemap', :class => Array do
        include Representable::JSON::Collection
        items
      end
      
          property :snippet, as: 'snippet'
          property :title, as: 'title'
        end
        
        class Image
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :byte_size, as: 'byteSize'
            property :context_link, as: 'contextLink'
            property :height, as: 'height'
            property :thumbnail_height, as: 'thumbnailHeight'
            property :thumbnail_link, as: 'thumbnailLink'
            property :thumbnail_width, as: 'thumbnailWidth'
            property :width, as: 'width'
          end
        end
        
        class Label
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :display_name, as: 'displayName'
            property :label_with_op, as: 'label_with_op'
            property :name, as: 'name'
          end
        end
      end
      
      class Search
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :context, as: 'context', class: Google::Apis::CustomsearchV1::Context, decorator: Google::Apis::CustomsearchV1::Context::Representation
      
          collection :items, as: 'items', class: Google::Apis::CustomsearchV1::Result, decorator: Google::Apis::CustomsearchV1::Result::Representation
      
          property :kind, as: 'kind'
          collection :promotions, as: 'promotions', class: Google::Apis::CustomsearchV1::Promotion, decorator: Google::Apis::CustomsearchV1::Promotion::Representation
      
          hash :queries, as: 'queries', :class => Array do
        include Representable::JSON::Collection
        items class: Google::Apis::CustomsearchV1::Query, decorator: Google::Apis::CustomsearchV1::Query::Representation
      
      end
      
          property :search_information, as: 'searchInformation', class: Google::Apis::CustomsearchV1::Search::SearchInformation, decorator: Google::Apis::CustomsearchV1::Search::SearchInformation::Representation
      
          property :spelling, as: 'spelling', class: Google::Apis::CustomsearchV1::Search::Spelling, decorator: Google::Apis::CustomsearchV1::Search::Spelling::Representation
      
          property :url, as: 'url', class: Google::Apis::CustomsearchV1::Search::Url, decorator: Google::Apis::CustomsearchV1::Search::Url::Representation
      
        end
        
        class SearchInformation
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :formatted_search_time, as: 'formattedSearchTime'
            property :formatted_total_results, as: 'formattedTotalResults'
            property :search_time, as: 'searchTime'
            property :total_results, :numeric_string => true, as: 'totalResults'
          end
        end
        
        class Spelling
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :corrected_query, as: 'correctedQuery'
            property :html_corrected_query, as: 'htmlCorrectedQuery'
          end
        end
        
        class Url
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :template, as: 'template'
            property :type, as: 'type'
          end
        end
      end
    end
  end
end
