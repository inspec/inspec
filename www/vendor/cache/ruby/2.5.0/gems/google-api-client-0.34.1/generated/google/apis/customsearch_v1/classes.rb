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
      
      # 
      class Context
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `facets`
        # @return [Array<Array<Google::Apis::CustomsearchV1::Context::Facet>>]
        attr_accessor :facets
      
        # 
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @facets = args[:facets] if args.key?(:facets)
          @title = args[:title] if args.key?(:title)
        end
        
        # 
        class Facet
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `anchor`
          # @return [String]
          attr_accessor :anchor
        
          # 
          # Corresponds to the JSON property `label`
          # @return [String]
          attr_accessor :label
        
          # 
          # Corresponds to the JSON property `label_with_op`
          # @return [String]
          attr_accessor :label_with_op
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @anchor = args[:anchor] if args.key?(:anchor)
            @label = args[:label] if args.key?(:label)
            @label_with_op = args[:label_with_op] if args.key?(:label_with_op)
          end
        end
      end
      
      # 
      class Promotion
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `bodyLines`
        # @return [Array<Google::Apis::CustomsearchV1::Promotion::BodyLine>]
        attr_accessor :body_lines
      
        # 
        # Corresponds to the JSON property `displayLink`
        # @return [String]
        attr_accessor :display_link
      
        # 
        # Corresponds to the JSON property `htmlTitle`
        # @return [String]
        attr_accessor :html_title
      
        # 
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::CustomsearchV1::Promotion::Image]
        attr_accessor :image
      
        # 
        # Corresponds to the JSON property `link`
        # @return [String]
        attr_accessor :link
      
        # 
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @body_lines = args[:body_lines] if args.key?(:body_lines)
          @display_link = args[:display_link] if args.key?(:display_link)
          @html_title = args[:html_title] if args.key?(:html_title)
          @image = args[:image] if args.key?(:image)
          @link = args[:link] if args.key?(:link)
          @title = args[:title] if args.key?(:title)
        end
        
        # 
        class BodyLine
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `htmlTitle`
          # @return [String]
          attr_accessor :html_title
        
          # 
          # Corresponds to the JSON property `link`
          # @return [String]
          attr_accessor :link
        
          # 
          # Corresponds to the JSON property `title`
          # @return [String]
          attr_accessor :title
        
          # 
          # Corresponds to the JSON property `url`
          # @return [String]
          attr_accessor :url
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @html_title = args[:html_title] if args.key?(:html_title)
            @link = args[:link] if args.key?(:link)
            @title = args[:title] if args.key?(:title)
            @url = args[:url] if args.key?(:url)
          end
        end
        
        # 
        class Image
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `height`
          # @return [Fixnum]
          attr_accessor :height
        
          # 
          # Corresponds to the JSON property `source`
          # @return [String]
          attr_accessor :source
        
          # 
          # Corresponds to the JSON property `width`
          # @return [Fixnum]
          attr_accessor :width
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @height = args[:height] if args.key?(:height)
            @source = args[:source] if args.key?(:source)
            @width = args[:width] if args.key?(:width)
          end
        end
      end
      
      # 
      class Query
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # 
        # Corresponds to the JSON property `cr`
        # @return [String]
        attr_accessor :cr
      
        # 
        # Corresponds to the JSON property `cx`
        # @return [String]
        attr_accessor :cx
      
        # 
        # Corresponds to the JSON property `dateRestrict`
        # @return [String]
        attr_accessor :date_restrict
      
        # 
        # Corresponds to the JSON property `disableCnTwTranslation`
        # @return [String]
        attr_accessor :disable_cn_tw_translation
      
        # 
        # Corresponds to the JSON property `exactTerms`
        # @return [String]
        attr_accessor :exact_terms
      
        # 
        # Corresponds to the JSON property `excludeTerms`
        # @return [String]
        attr_accessor :exclude_terms
      
        # 
        # Corresponds to the JSON property `fileType`
        # @return [String]
        attr_accessor :file_type
      
        # 
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # 
        # Corresponds to the JSON property `gl`
        # @return [String]
        attr_accessor :gl
      
        # 
        # Corresponds to the JSON property `googleHost`
        # @return [String]
        attr_accessor :google_host
      
        # 
        # Corresponds to the JSON property `highRange`
        # @return [String]
        attr_accessor :high_range
      
        # 
        # Corresponds to the JSON property `hl`
        # @return [String]
        attr_accessor :hl
      
        # 
        # Corresponds to the JSON property `hq`
        # @return [String]
        attr_accessor :hq
      
        # 
        # Corresponds to the JSON property `imgColorType`
        # @return [String]
        attr_accessor :img_color_type
      
        # 
        # Corresponds to the JSON property `imgDominantColor`
        # @return [String]
        attr_accessor :img_dominant_color
      
        # 
        # Corresponds to the JSON property `imgSize`
        # @return [String]
        attr_accessor :img_size
      
        # 
        # Corresponds to the JSON property `imgType`
        # @return [String]
        attr_accessor :img_type
      
        # 
        # Corresponds to the JSON property `inputEncoding`
        # @return [String]
        attr_accessor :input_encoding
      
        # 
        # Corresponds to the JSON property `language`
        # @return [String]
        attr_accessor :language
      
        # 
        # Corresponds to the JSON property `linkSite`
        # @return [String]
        attr_accessor :link_site
      
        # 
        # Corresponds to the JSON property `lowRange`
        # @return [String]
        attr_accessor :low_range
      
        # 
        # Corresponds to the JSON property `orTerms`
        # @return [String]
        attr_accessor :or_terms
      
        # 
        # Corresponds to the JSON property `outputEncoding`
        # @return [String]
        attr_accessor :output_encoding
      
        # 
        # Corresponds to the JSON property `relatedSite`
        # @return [String]
        attr_accessor :related_site
      
        # 
        # Corresponds to the JSON property `rights`
        # @return [String]
        attr_accessor :rights
      
        # 
        # Corresponds to the JSON property `safe`
        # @return [String]
        attr_accessor :safe
      
        # 
        # Corresponds to the JSON property `searchTerms`
        # @return [String]
        attr_accessor :search_terms
      
        # 
        # Corresponds to the JSON property `searchType`
        # @return [String]
        attr_accessor :search_type
      
        # 
        # Corresponds to the JSON property `siteSearch`
        # @return [String]
        attr_accessor :site_search
      
        # 
        # Corresponds to the JSON property `siteSearchFilter`
        # @return [String]
        attr_accessor :site_search_filter
      
        # 
        # Corresponds to the JSON property `sort`
        # @return [String]
        attr_accessor :sort
      
        # 
        # Corresponds to the JSON property `startIndex`
        # @return [Fixnum]
        attr_accessor :start_index
      
        # 
        # Corresponds to the JSON property `startPage`
        # @return [Fixnum]
        attr_accessor :start_page
      
        # 
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # 
        # Corresponds to the JSON property `totalResults`
        # @return [Fixnum]
        attr_accessor :total_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @cr = args[:cr] if args.key?(:cr)
          @cx = args[:cx] if args.key?(:cx)
          @date_restrict = args[:date_restrict] if args.key?(:date_restrict)
          @disable_cn_tw_translation = args[:disable_cn_tw_translation] if args.key?(:disable_cn_tw_translation)
          @exact_terms = args[:exact_terms] if args.key?(:exact_terms)
          @exclude_terms = args[:exclude_terms] if args.key?(:exclude_terms)
          @file_type = args[:file_type] if args.key?(:file_type)
          @filter = args[:filter] if args.key?(:filter)
          @gl = args[:gl] if args.key?(:gl)
          @google_host = args[:google_host] if args.key?(:google_host)
          @high_range = args[:high_range] if args.key?(:high_range)
          @hl = args[:hl] if args.key?(:hl)
          @hq = args[:hq] if args.key?(:hq)
          @img_color_type = args[:img_color_type] if args.key?(:img_color_type)
          @img_dominant_color = args[:img_dominant_color] if args.key?(:img_dominant_color)
          @img_size = args[:img_size] if args.key?(:img_size)
          @img_type = args[:img_type] if args.key?(:img_type)
          @input_encoding = args[:input_encoding] if args.key?(:input_encoding)
          @language = args[:language] if args.key?(:language)
          @link_site = args[:link_site] if args.key?(:link_site)
          @low_range = args[:low_range] if args.key?(:low_range)
          @or_terms = args[:or_terms] if args.key?(:or_terms)
          @output_encoding = args[:output_encoding] if args.key?(:output_encoding)
          @related_site = args[:related_site] if args.key?(:related_site)
          @rights = args[:rights] if args.key?(:rights)
          @safe = args[:safe] if args.key?(:safe)
          @search_terms = args[:search_terms] if args.key?(:search_terms)
          @search_type = args[:search_type] if args.key?(:search_type)
          @site_search = args[:site_search] if args.key?(:site_search)
          @site_search_filter = args[:site_search_filter] if args.key?(:site_search_filter)
          @sort = args[:sort] if args.key?(:sort)
          @start_index = args[:start_index] if args.key?(:start_index)
          @start_page = args[:start_page] if args.key?(:start_page)
          @title = args[:title] if args.key?(:title)
          @total_results = args[:total_results] if args.key?(:total_results)
        end
      end
      
      # 
      class Result
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `cacheId`
        # @return [String]
        attr_accessor :cache_id
      
        # 
        # Corresponds to the JSON property `displayLink`
        # @return [String]
        attr_accessor :display_link
      
        # 
        # Corresponds to the JSON property `fileFormat`
        # @return [String]
        attr_accessor :file_format
      
        # 
        # Corresponds to the JSON property `formattedUrl`
        # @return [String]
        attr_accessor :formatted_url
      
        # 
        # Corresponds to the JSON property `htmlFormattedUrl`
        # @return [String]
        attr_accessor :html_formatted_url
      
        # 
        # Corresponds to the JSON property `htmlSnippet`
        # @return [String]
        attr_accessor :html_snippet
      
        # 
        # Corresponds to the JSON property `htmlTitle`
        # @return [String]
        attr_accessor :html_title
      
        # 
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::CustomsearchV1::Result::Image]
        attr_accessor :image
      
        # 
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # 
        # Corresponds to the JSON property `labels`
        # @return [Array<Google::Apis::CustomsearchV1::Result::Label>]
        attr_accessor :labels
      
        # 
        # Corresponds to the JSON property `link`
        # @return [String]
        attr_accessor :link
      
        # 
        # Corresponds to the JSON property `mime`
        # @return [String]
        attr_accessor :mime
      
        # 
        # Corresponds to the JSON property `pagemap`
        # @return [Hash<String,Array<Hash<String,Object>>>]
        attr_accessor :pagemap
      
        # 
        # Corresponds to the JSON property `snippet`
        # @return [String]
        attr_accessor :snippet
      
        # 
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cache_id = args[:cache_id] if args.key?(:cache_id)
          @display_link = args[:display_link] if args.key?(:display_link)
          @file_format = args[:file_format] if args.key?(:file_format)
          @formatted_url = args[:formatted_url] if args.key?(:formatted_url)
          @html_formatted_url = args[:html_formatted_url] if args.key?(:html_formatted_url)
          @html_snippet = args[:html_snippet] if args.key?(:html_snippet)
          @html_title = args[:html_title] if args.key?(:html_title)
          @image = args[:image] if args.key?(:image)
          @kind = args[:kind] if args.key?(:kind)
          @labels = args[:labels] if args.key?(:labels)
          @link = args[:link] if args.key?(:link)
          @mime = args[:mime] if args.key?(:mime)
          @pagemap = args[:pagemap] if args.key?(:pagemap)
          @snippet = args[:snippet] if args.key?(:snippet)
          @title = args[:title] if args.key?(:title)
        end
        
        # 
        class Image
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `byteSize`
          # @return [Fixnum]
          attr_accessor :byte_size
        
          # 
          # Corresponds to the JSON property `contextLink`
          # @return [String]
          attr_accessor :context_link
        
          # 
          # Corresponds to the JSON property `height`
          # @return [Fixnum]
          attr_accessor :height
        
          # 
          # Corresponds to the JSON property `thumbnailHeight`
          # @return [Fixnum]
          attr_accessor :thumbnail_height
        
          # 
          # Corresponds to the JSON property `thumbnailLink`
          # @return [String]
          attr_accessor :thumbnail_link
        
          # 
          # Corresponds to the JSON property `thumbnailWidth`
          # @return [Fixnum]
          attr_accessor :thumbnail_width
        
          # 
          # Corresponds to the JSON property `width`
          # @return [Fixnum]
          attr_accessor :width
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @byte_size = args[:byte_size] if args.key?(:byte_size)
            @context_link = args[:context_link] if args.key?(:context_link)
            @height = args[:height] if args.key?(:height)
            @thumbnail_height = args[:thumbnail_height] if args.key?(:thumbnail_height)
            @thumbnail_link = args[:thumbnail_link] if args.key?(:thumbnail_link)
            @thumbnail_width = args[:thumbnail_width] if args.key?(:thumbnail_width)
            @width = args[:width] if args.key?(:width)
          end
        end
        
        # 
        class Label
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `displayName`
          # @return [String]
          attr_accessor :display_name
        
          # 
          # Corresponds to the JSON property `label_with_op`
          # @return [String]
          attr_accessor :label_with_op
        
          # 
          # Corresponds to the JSON property `name`
          # @return [String]
          attr_accessor :name
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @display_name = args[:display_name] if args.key?(:display_name)
            @label_with_op = args[:label_with_op] if args.key?(:label_with_op)
            @name = args[:name] if args.key?(:name)
          end
        end
      end
      
      # 
      class Search
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::CustomsearchV1::Context]
        attr_accessor :context
      
        # 
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::CustomsearchV1::Result>]
        attr_accessor :items
      
        # 
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # 
        # Corresponds to the JSON property `promotions`
        # @return [Array<Google::Apis::CustomsearchV1::Promotion>]
        attr_accessor :promotions
      
        # 
        # Corresponds to the JSON property `queries`
        # @return [Hash<String,Array<Google::Apis::CustomsearchV1::Query>>]
        attr_accessor :queries
      
        # 
        # Corresponds to the JSON property `searchInformation`
        # @return [Google::Apis::CustomsearchV1::Search::SearchInformation]
        attr_accessor :search_information
      
        # 
        # Corresponds to the JSON property `spelling`
        # @return [Google::Apis::CustomsearchV1::Search::Spelling]
        attr_accessor :spelling
      
        # 
        # Corresponds to the JSON property `url`
        # @return [Google::Apis::CustomsearchV1::Search::Url]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @promotions = args[:promotions] if args.key?(:promotions)
          @queries = args[:queries] if args.key?(:queries)
          @search_information = args[:search_information] if args.key?(:search_information)
          @spelling = args[:spelling] if args.key?(:spelling)
          @url = args[:url] if args.key?(:url)
        end
        
        # 
        class SearchInformation
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `formattedSearchTime`
          # @return [String]
          attr_accessor :formatted_search_time
        
          # 
          # Corresponds to the JSON property `formattedTotalResults`
          # @return [String]
          attr_accessor :formatted_total_results
        
          # 
          # Corresponds to the JSON property `searchTime`
          # @return [Float]
          attr_accessor :search_time
        
          # 
          # Corresponds to the JSON property `totalResults`
          # @return [Fixnum]
          attr_accessor :total_results
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @formatted_search_time = args[:formatted_search_time] if args.key?(:formatted_search_time)
            @formatted_total_results = args[:formatted_total_results] if args.key?(:formatted_total_results)
            @search_time = args[:search_time] if args.key?(:search_time)
            @total_results = args[:total_results] if args.key?(:total_results)
          end
        end
        
        # 
        class Spelling
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `correctedQuery`
          # @return [String]
          attr_accessor :corrected_query
        
          # 
          # Corresponds to the JSON property `htmlCorrectedQuery`
          # @return [String]
          attr_accessor :html_corrected_query
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @corrected_query = args[:corrected_query] if args.key?(:corrected_query)
            @html_corrected_query = args[:html_corrected_query] if args.key?(:html_corrected_query)
          end
        end
        
        # 
        class Url
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `template`
          # @return [String]
          attr_accessor :template
        
          # 
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @template = args[:template] if args.key?(:template)
            @type = args[:type] if args.key?(:type)
          end
        end
      end
    end
  end
end
