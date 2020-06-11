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
    module PagespeedonlineV2
      
      # 
      class FormatString
        include Google::Apis::Core::Hashable
      
        # List of arguments for the format string.
        # Corresponds to the JSON property `args`
        # @return [Array<Google::Apis::PagespeedonlineV2::FormatString::Arg>]
        attr_accessor :args
      
        # A localized format string with ``FOO`` placeholders, where 'FOO' is the key of
        # the argument whose value should be substituted. For HYPERLINK arguments, the
        # format string will instead contain ``BEGIN_FOO`` and ``END_FOO`` for the
        # argument with key 'FOO'.
        # Corresponds to the JSON property `format`
        # @return [String]
        attr_accessor :format
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @args = args[:args] if args.key?(:args)
          @format = args[:format] if args.key?(:format)
        end
        
        # 
        class Arg
          include Google::Apis::Core::Hashable
        
          # The placeholder key for this arg, as a string.
          # Corresponds to the JSON property `key`
          # @return [String]
          attr_accessor :key
        
          # The screen rectangles being referred to, with dimensions measured in CSS
          # pixels. This is only ever used for SNAPSHOT_RECT arguments. If this is absent
          # for a SNAPSHOT_RECT argument, it means that that argument refers to the entire
          # snapshot.
          # Corresponds to the JSON property `rects`
          # @return [Array<Google::Apis::PagespeedonlineV2::FormatString::Arg::Rect>]
          attr_accessor :rects
        
          # Secondary screen rectangles being referred to, with dimensions measured in CSS
          # pixels. This is only ever used for SNAPSHOT_RECT arguments.
          # Corresponds to the JSON property `secondary_rects`
          # @return [Array<Google::Apis::PagespeedonlineV2::FormatString::Arg::SecondaryRect>]
          attr_accessor :secondary_rects
        
          # Type of argument. One of URL, STRING_LITERAL, INT_LITERAL, BYTES, DURATION,
          # VERBATIM_STRING, PERCENTAGE, HYPERLINK, or SNAPSHOT_RECT.
          # Corresponds to the JSON property `type`
          # @return [String]
          attr_accessor :type
        
          # Argument value, as a localized string.
          # Corresponds to the JSON property `value`
          # @return [String]
          attr_accessor :value
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @key = args[:key] if args.key?(:key)
            @rects = args[:rects] if args.key?(:rects)
            @secondary_rects = args[:secondary_rects] if args.key?(:secondary_rects)
            @type = args[:type] if args.key?(:type)
            @value = args[:value] if args.key?(:value)
          end
          
          # 
          class Rect
            include Google::Apis::Core::Hashable
          
            # The height of the rect.
            # Corresponds to the JSON property `height`
            # @return [Fixnum]
            attr_accessor :height
          
            # The left coordinate of the rect, in page coordinates.
            # Corresponds to the JSON property `left`
            # @return [Fixnum]
            attr_accessor :left
          
            # The top coordinate of the rect, in page coordinates.
            # Corresponds to the JSON property `top`
            # @return [Fixnum]
            attr_accessor :top
          
            # The width of the rect.
            # Corresponds to the JSON property `width`
            # @return [Fixnum]
            attr_accessor :width
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @height = args[:height] if args.key?(:height)
              @left = args[:left] if args.key?(:left)
              @top = args[:top] if args.key?(:top)
              @width = args[:width] if args.key?(:width)
            end
          end
          
          # 
          class SecondaryRect
            include Google::Apis::Core::Hashable
          
            # The height of the rect.
            # Corresponds to the JSON property `height`
            # @return [Fixnum]
            attr_accessor :height
          
            # The left coordinate of the rect, in page coordinates.
            # Corresponds to the JSON property `left`
            # @return [Fixnum]
            attr_accessor :left
          
            # The top coordinate of the rect, in page coordinates.
            # Corresponds to the JSON property `top`
            # @return [Fixnum]
            attr_accessor :top
          
            # The width of the rect.
            # Corresponds to the JSON property `width`
            # @return [Fixnum]
            attr_accessor :width
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @height = args[:height] if args.key?(:height)
              @left = args[:left] if args.key?(:left)
              @top = args[:top] if args.key?(:top)
              @width = args[:width] if args.key?(:width)
            end
          end
        end
      end
      
      # 
      class Image
        include Google::Apis::Core::Hashable
      
        # Image data base64 encoded.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # Height of screenshot in pixels.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # Unique string key, if any, identifying this image.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Mime type of image data (e.g. "image/jpeg").
        # Corresponds to the JSON property `mime_type`
        # @return [String]
        attr_accessor :mime_type
      
        # The region of the page that is captured by this image, with dimensions
        # measured in CSS pixels.
        # Corresponds to the JSON property `page_rect`
        # @return [Google::Apis::PagespeedonlineV2::Image::PageRect]
        attr_accessor :page_rect
      
        # Width of screenshot in pixels.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data = args[:data] if args.key?(:data)
          @height = args[:height] if args.key?(:height)
          @key = args[:key] if args.key?(:key)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @page_rect = args[:page_rect] if args.key?(:page_rect)
          @width = args[:width] if args.key?(:width)
        end
        
        # The region of the page that is captured by this image, with dimensions
        # measured in CSS pixels.
        class PageRect
          include Google::Apis::Core::Hashable
        
          # The height of the rect.
          # Corresponds to the JSON property `height`
          # @return [Fixnum]
          attr_accessor :height
        
          # The left coordinate of the rect, in page coordinates.
          # Corresponds to the JSON property `left`
          # @return [Fixnum]
          attr_accessor :left
        
          # The top coordinate of the rect, in page coordinates.
          # Corresponds to the JSON property `top`
          # @return [Fixnum]
          attr_accessor :top
        
          # The width of the rect.
          # Corresponds to the JSON property `width`
          # @return [Fixnum]
          attr_accessor :width
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @height = args[:height] if args.key?(:height)
            @left = args[:left] if args.key?(:left)
            @top = args[:top] if args.key?(:top)
            @width = args[:width] if args.key?(:width)
          end
        end
      end
      
      # 
      class Result
        include Google::Apis::Core::Hashable
      
        # The captcha verify result
        # Corresponds to the JSON property `captchaResult`
        # @return [String]
        attr_accessor :captcha_result
      
        # Localized PageSpeed results. Contains a ruleResults entry for each PageSpeed
        # rule instantiated and run by the server.
        # Corresponds to the JSON property `formattedResults`
        # @return [Google::Apis::PagespeedonlineV2::Result::FormattedResults]
        attr_accessor :formatted_results
      
        # Canonicalized and final URL for the document, after following page redirects (
        # if any).
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # List of rules that were specified in the request, but which the server did not
        # know how to instantiate.
        # Corresponds to the JSON property `invalidRules`
        # @return [Array<String>]
        attr_accessor :invalid_rules
      
        # Kind of result.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Summary statistics for the page, such as number of JavaScript bytes, number of
        # HTML bytes, etc.
        # Corresponds to the JSON property `pageStats`
        # @return [Google::Apis::PagespeedonlineV2::Result::PageStats]
        attr_accessor :page_stats
      
        # Response code for the document. 200 indicates a normal page load. 4xx/5xx
        # indicates an error.
        # Corresponds to the JSON property `responseCode`
        # @return [Fixnum]
        attr_accessor :response_code
      
        # A map with one entry for each rule group in these results.
        # Corresponds to the JSON property `ruleGroups`
        # @return [Hash<String,Google::Apis::PagespeedonlineV2::Result::RuleGroup>]
        attr_accessor :rule_groups
      
        # Base64-encoded screenshot of the page that was analyzed.
        # Corresponds to the JSON property `screenshot`
        # @return [Google::Apis::PagespeedonlineV2::Image]
        attr_accessor :screenshot
      
        # Title of the page, as displayed in the browser's title bar.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The version of PageSpeed used to generate these results.
        # Corresponds to the JSON property `version`
        # @return [Google::Apis::PagespeedonlineV2::Result::Version]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @captcha_result = args[:captcha_result] if args.key?(:captcha_result)
          @formatted_results = args[:formatted_results] if args.key?(:formatted_results)
          @id = args[:id] if args.key?(:id)
          @invalid_rules = args[:invalid_rules] if args.key?(:invalid_rules)
          @kind = args[:kind] if args.key?(:kind)
          @page_stats = args[:page_stats] if args.key?(:page_stats)
          @response_code = args[:response_code] if args.key?(:response_code)
          @rule_groups = args[:rule_groups] if args.key?(:rule_groups)
          @screenshot = args[:screenshot] if args.key?(:screenshot)
          @title = args[:title] if args.key?(:title)
          @version = args[:version] if args.key?(:version)
        end
        
        # Localized PageSpeed results. Contains a ruleResults entry for each PageSpeed
        # rule instantiated and run by the server.
        class FormattedResults
          include Google::Apis::Core::Hashable
        
          # The locale of the formattedResults, e.g. "en_US".
          # Corresponds to the JSON property `locale`
          # @return [String]
          attr_accessor :locale
        
          # Dictionary of formatted rule results, with one entry for each PageSpeed rule
          # instantiated and run by the server.
          # Corresponds to the JSON property `ruleResults`
          # @return [Hash<String,Google::Apis::PagespeedonlineV2::Result::FormattedResults::RuleResult>]
          attr_accessor :rule_results
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @locale = args[:locale] if args.key?(:locale)
            @rule_results = args[:rule_results] if args.key?(:rule_results)
          end
          
          # The enum-like identifier for this rule. For instance "EnableKeepAlive" or "
          # AvoidCssImport". Not localized.
          class RuleResult
            include Google::Apis::Core::Hashable
          
            # List of rule groups that this rule belongs to. Each entry in the list is one
            # of "SPEED" or "USABILITY".
            # Corresponds to the JSON property `groups`
            # @return [Array<String>]
            attr_accessor :groups
          
            # Localized name of the rule, intended for presentation to a user.
            # Corresponds to the JSON property `localizedRuleName`
            # @return [String]
            attr_accessor :localized_rule_name
          
            # The impact (unbounded floating point value) that implementing the suggestions
            # for this rule would have on making the page faster. Impact is comparable
            # between rules to determine which rule's suggestions would have a higher or
            # lower impact on making a page faster. For instance, if enabling compression
            # would save 1MB, while optimizing images would save 500kB, the enable
            # compression rule would have 2x the impact of the image optimization rule, all
            # other things being equal.
            # Corresponds to the JSON property `ruleImpact`
            # @return [Float]
            attr_accessor :rule_impact
          
            # A brief summary description for the rule, indicating at a high level what
            # should be done to follow the rule and what benefit can be gained by doing so.
            # Corresponds to the JSON property `summary`
            # @return [Google::Apis::PagespeedonlineV2::FormatString]
            attr_accessor :summary
          
            # List of blocks of URLs. Each block may contain a heading and a list of URLs.
            # Each URL may optionally include additional details.
            # Corresponds to the JSON property `urlBlocks`
            # @return [Array<Google::Apis::PagespeedonlineV2::Result::FormattedResults::RuleResult::UrlBlock>]
            attr_accessor :url_blocks
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @groups = args[:groups] if args.key?(:groups)
              @localized_rule_name = args[:localized_rule_name] if args.key?(:localized_rule_name)
              @rule_impact = args[:rule_impact] if args.key?(:rule_impact)
              @summary = args[:summary] if args.key?(:summary)
              @url_blocks = args[:url_blocks] if args.key?(:url_blocks)
            end
            
            # 
            class UrlBlock
              include Google::Apis::Core::Hashable
            
              # Heading to be displayed with the list of URLs.
              # Corresponds to the JSON property `header`
              # @return [Google::Apis::PagespeedonlineV2::FormatString]
              attr_accessor :header
            
              # List of entries that provide information about URLs in the url block. Optional.
              # Corresponds to the JSON property `urls`
              # @return [Array<Google::Apis::PagespeedonlineV2::Result::FormattedResults::RuleResult::UrlBlock::Url>]
              attr_accessor :urls
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @header = args[:header] if args.key?(:header)
                @urls = args[:urls] if args.key?(:urls)
              end
              
              # 
              class Url
                include Google::Apis::Core::Hashable
              
                # List of entries that provide additional details about a single URL. Optional.
                # Corresponds to the JSON property `details`
                # @return [Array<Google::Apis::PagespeedonlineV2::FormatString>]
                attr_accessor :details
              
                # A format string that gives information about the URL, and a list of arguments
                # for that format string.
                # Corresponds to the JSON property `result`
                # @return [Google::Apis::PagespeedonlineV2::FormatString]
                attr_accessor :result
              
                def initialize(**args)
                   update!(**args)
                end
              
                # Update properties of this object
                def update!(**args)
                  @details = args[:details] if args.key?(:details)
                  @result = args[:result] if args.key?(:result)
                end
              end
            end
          end
        end
        
        # Summary statistics for the page, such as number of JavaScript bytes, number of
        # HTML bytes, etc.
        class PageStats
          include Google::Apis::Core::Hashable
        
          # Number of uncompressed response bytes for CSS resources on the page.
          # Corresponds to the JSON property `cssResponseBytes`
          # @return [Fixnum]
          attr_accessor :css_response_bytes
        
          # Number of response bytes for flash resources on the page.
          # Corresponds to the JSON property `flashResponseBytes`
          # @return [Fixnum]
          attr_accessor :flash_response_bytes
        
          # Number of uncompressed response bytes for the main HTML document and all
          # iframes on the page.
          # Corresponds to the JSON property `htmlResponseBytes`
          # @return [Fixnum]
          attr_accessor :html_response_bytes
        
          # Number of response bytes for image resources on the page.
          # Corresponds to the JSON property `imageResponseBytes`
          # @return [Fixnum]
          attr_accessor :image_response_bytes
        
          # Number of uncompressed response bytes for JS resources on the page.
          # Corresponds to the JSON property `javascriptResponseBytes`
          # @return [Fixnum]
          attr_accessor :javascript_response_bytes
        
          # Number of CSS resources referenced by the page.
          # Corresponds to the JSON property `numberCssResources`
          # @return [Fixnum]
          attr_accessor :number_css_resources
        
          # Number of unique hosts referenced by the page.
          # Corresponds to the JSON property `numberHosts`
          # @return [Fixnum]
          attr_accessor :number_hosts
        
          # Number of JavaScript resources referenced by the page.
          # Corresponds to the JSON property `numberJsResources`
          # @return [Fixnum]
          attr_accessor :number_js_resources
        
          # Number of HTTP resources loaded by the page.
          # Corresponds to the JSON property `numberResources`
          # @return [Fixnum]
          attr_accessor :number_resources
        
          # Number of static (i.e. cacheable) resources on the page.
          # Corresponds to the JSON property `numberStaticResources`
          # @return [Fixnum]
          attr_accessor :number_static_resources
        
          # Number of response bytes for other resources on the page.
          # Corresponds to the JSON property `otherResponseBytes`
          # @return [Fixnum]
          attr_accessor :other_response_bytes
        
          # Number of uncompressed response bytes for text resources not covered by other
          # statistics (i.e non-HTML, non-script, non-CSS resources) on the page.
          # Corresponds to the JSON property `textResponseBytes`
          # @return [Fixnum]
          attr_accessor :text_response_bytes
        
          # Total size of all request bytes sent by the page.
          # Corresponds to the JSON property `totalRequestBytes`
          # @return [Fixnum]
          attr_accessor :total_request_bytes
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @css_response_bytes = args[:css_response_bytes] if args.key?(:css_response_bytes)
            @flash_response_bytes = args[:flash_response_bytes] if args.key?(:flash_response_bytes)
            @html_response_bytes = args[:html_response_bytes] if args.key?(:html_response_bytes)
            @image_response_bytes = args[:image_response_bytes] if args.key?(:image_response_bytes)
            @javascript_response_bytes = args[:javascript_response_bytes] if args.key?(:javascript_response_bytes)
            @number_css_resources = args[:number_css_resources] if args.key?(:number_css_resources)
            @number_hosts = args[:number_hosts] if args.key?(:number_hosts)
            @number_js_resources = args[:number_js_resources] if args.key?(:number_js_resources)
            @number_resources = args[:number_resources] if args.key?(:number_resources)
            @number_static_resources = args[:number_static_resources] if args.key?(:number_static_resources)
            @other_response_bytes = args[:other_response_bytes] if args.key?(:other_response_bytes)
            @text_response_bytes = args[:text_response_bytes] if args.key?(:text_response_bytes)
            @total_request_bytes = args[:total_request_bytes] if args.key?(:total_request_bytes)
          end
        end
        
        # The name of this rule group: one of "SPEED" or "USABILITY".
        class RuleGroup
          include Google::Apis::Core::Hashable
        
          # The score (0-100) for this rule group, which indicates how much better a page
          # could be in that category (e.g. how much faster, or how much more usable). A
          # high score indicates little room for improvement, while a lower score
          # indicates more room for improvement.
          # Corresponds to the JSON property `score`
          # @return [Fixnum]
          attr_accessor :score
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @score = args[:score] if args.key?(:score)
          end
        end
        
        # The version of PageSpeed used to generate these results.
        class Version
          include Google::Apis::Core::Hashable
        
          # The major version number of PageSpeed used to generate these results.
          # Corresponds to the JSON property `major`
          # @return [Fixnum]
          attr_accessor :major
        
          # The minor version number of PageSpeed used to generate these results.
          # Corresponds to the JSON property `minor`
          # @return [Fixnum]
          attr_accessor :minor
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @major = args[:major] if args.key?(:major)
            @minor = args[:minor] if args.key?(:minor)
          end
        end
      end
    end
  end
end
