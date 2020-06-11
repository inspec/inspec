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
    module PagespeedonlineV4
      
      # 
      class PagespeedApiFormatStringV4
        include Google::Apis::Core::Hashable
      
        # List of arguments for the format string.
        # Corresponds to the JSON property `args`
        # @return [Array<Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4::Arg>]
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
          # @return [Array<Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4::Arg::Rect>]
          attr_accessor :rects
        
          # Secondary screen rectangles being referred to, with dimensions measured in CSS
          # pixels. This is only ever used for SNAPSHOT_RECT arguments.
          # Corresponds to the JSON property `secondary_rects`
          # @return [Array<Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4::Arg::SecondaryRect>]
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
          
            # 
            # Corresponds to the JSON property `height`
            # @return [Fixnum]
            attr_accessor :height
          
            # 
            # Corresponds to the JSON property `left`
            # @return [Fixnum]
            attr_accessor :left
          
            # 
            # Corresponds to the JSON property `top`
            # @return [Fixnum]
            attr_accessor :top
          
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
              @left = args[:left] if args.key?(:left)
              @top = args[:top] if args.key?(:top)
              @width = args[:width] if args.key?(:width)
            end
          end
          
          # 
          class SecondaryRect
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `height`
            # @return [Fixnum]
            attr_accessor :height
          
            # 
            # Corresponds to the JSON property `left`
            # @return [Fixnum]
            attr_accessor :left
          
            # 
            # Corresponds to the JSON property `top`
            # @return [Fixnum]
            attr_accessor :top
          
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
              @left = args[:left] if args.key?(:left)
              @top = args[:top] if args.key?(:top)
              @width = args[:width] if args.key?(:width)
            end
          end
        end
      end
      
      # 
      class PagespeedApiImageV4
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
      
        # 
        # Corresponds to the JSON property `page_rect`
        # @return [Google::Apis::PagespeedonlineV4::PagespeedApiImageV4::PageRect]
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
        
        # 
        class PageRect
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `height`
          # @return [Fixnum]
          attr_accessor :height
        
          # 
          # Corresponds to the JSON property `left`
          # @return [Fixnum]
          attr_accessor :left
        
          # 
          # Corresponds to the JSON property `top`
          # @return [Fixnum]
          attr_accessor :top
        
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
            @left = args[:left] if args.key?(:left)
            @top = args[:top] if args.key?(:top)
            @width = args[:width] if args.key?(:width)
          end
        end
      end
      
      # 
      class PagespeedApiPagespeedResponseV4
        include Google::Apis::Core::Hashable
      
        # The captcha verify result
        # Corresponds to the JSON property `captchaResult`
        # @return [String]
        attr_accessor :captcha_result
      
        # Localized PageSpeed results. Contains a ruleResults entry for each PageSpeed
        # rule instantiated and run by the server.
        # Corresponds to the JSON property `formattedResults`
        # @return [Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::FormattedResults]
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
      
        # Metrics of end users' page loading experience.
        # Corresponds to the JSON property `loadingExperience`
        # @return [Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::LoadingExperience]
        attr_accessor :loading_experience
      
        # Summary statistics for the page, such as number of JavaScript bytes, number of
        # HTML bytes, etc.
        # Corresponds to the JSON property `pageStats`
        # @return [Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::PageStats]
        attr_accessor :page_stats
      
        # Response code for the document. 200 indicates a normal page load. 4xx/5xx
        # indicates an error.
        # Corresponds to the JSON property `responseCode`
        # @return [Fixnum]
        attr_accessor :response_code
      
        # A map with one entry for each rule group in these results.
        # Corresponds to the JSON property `ruleGroups`
        # @return [Hash<String,Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::RuleGroup>]
        attr_accessor :rule_groups
      
        # Base64-encoded screenshot of the page that was analyzed.
        # Corresponds to the JSON property `screenshot`
        # @return [Google::Apis::PagespeedonlineV4::PagespeedApiImageV4]
        attr_accessor :screenshot
      
        # Additional base64-encoded screenshots of the page, in various partial render
        # states.
        # Corresponds to the JSON property `snapshots`
        # @return [Array<Google::Apis::PagespeedonlineV4::PagespeedApiImageV4>]
        attr_accessor :snapshots
      
        # Title of the page, as displayed in the browser's title bar.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # The version of PageSpeed used to generate these results.
        # Corresponds to the JSON property `version`
        # @return [Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::Version]
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
          @loading_experience = args[:loading_experience] if args.key?(:loading_experience)
          @page_stats = args[:page_stats] if args.key?(:page_stats)
          @response_code = args[:response_code] if args.key?(:response_code)
          @rule_groups = args[:rule_groups] if args.key?(:rule_groups)
          @screenshot = args[:screenshot] if args.key?(:screenshot)
          @snapshots = args[:snapshots] if args.key?(:snapshots)
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
          # @return [Hash<String,Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::FormattedResults::RuleResult>]
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
          
            # Whether this rule is in 'beta'. Rules in beta are new rules that are being
            # tested, which do not impact the overall score.
            # Corresponds to the JSON property `beta`
            # @return [Boolean]
            attr_accessor :beta
            alias_method :beta?, :beta
          
            # List of rule groups that this rule belongs to. Each entry in the list is one
            # of "SPEED", "USABILITY", or "SECURITY".
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
            # @return [Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4]
            attr_accessor :summary
          
            # List of blocks of URLs. Each block may contain a heading and a list of URLs.
            # Each URL may optionally include additional details.
            # Corresponds to the JSON property `urlBlocks`
            # @return [Array<Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::FormattedResults::RuleResult::UrlBlock>]
            attr_accessor :url_blocks
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @beta = args[:beta] if args.key?(:beta)
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
              # @return [Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4]
              attr_accessor :header
            
              # List of entries that provide information about URLs in the url block. Optional.
              # Corresponds to the JSON property `urls`
              # @return [Array<Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::FormattedResults::RuleResult::UrlBlock::Url>]
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
                # @return [Array<Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4>]
                attr_accessor :details
              
                # A format string that gives information about the URL, and a list of arguments
                # for that format string.
                # Corresponds to the JSON property `result`
                # @return [Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4]
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
        
        # Metrics of end users' page loading experience.
        class LoadingExperience
          include Google::Apis::Core::Hashable
        
          # The url, pattern or origin which the metrics are on.
          # Corresponds to the JSON property `id`
          # @return [String]
          attr_accessor :id
        
          # 
          # Corresponds to the JSON property `initial_url`
          # @return [String]
          attr_accessor :initial_url
        
          # 
          # Corresponds to the JSON property `metrics`
          # @return [Hash<String,Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::LoadingExperience::Metric>]
          attr_accessor :metrics
        
          # 
          # Corresponds to the JSON property `overall_category`
          # @return [String]
          attr_accessor :overall_category
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @id = args[:id] if args.key?(:id)
            @initial_url = args[:initial_url] if args.key?(:initial_url)
            @metrics = args[:metrics] if args.key?(:metrics)
            @overall_category = args[:overall_category] if args.key?(:overall_category)
          end
          
          # The type of the metric.
          class Metric
            include Google::Apis::Core::Hashable
          
            # 
            # Corresponds to the JSON property `category`
            # @return [String]
            attr_accessor :category
          
            # 
            # Corresponds to the JSON property `distributions`
            # @return [Array<Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::LoadingExperience::Metric::Distribution>]
            attr_accessor :distributions
          
            # 
            # Corresponds to the JSON property `median`
            # @return [Fixnum]
            attr_accessor :median
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @category = args[:category] if args.key?(:category)
              @distributions = args[:distributions] if args.key?(:distributions)
              @median = args[:median] if args.key?(:median)
            end
            
            # 
            class Distribution
              include Google::Apis::Core::Hashable
            
              # 
              # Corresponds to the JSON property `max`
              # @return [Fixnum]
              attr_accessor :max
            
              # 
              # Corresponds to the JSON property `min`
              # @return [Fixnum]
              attr_accessor :min
            
              # 
              # Corresponds to the JSON property `proportion`
              # @return [Float]
              attr_accessor :proportion
            
              def initialize(**args)
                 update!(**args)
              end
            
              # Update properties of this object
              def update!(**args)
                @max = args[:max] if args.key?(:max)
                @min = args[:min] if args.key?(:min)
                @proportion = args[:proportion] if args.key?(:proportion)
              end
            end
          end
        end
        
        # Summary statistics for the page, such as number of JavaScript bytes, number of
        # HTML bytes, etc.
        class PageStats
          include Google::Apis::Core::Hashable
        
          # Content management system (CMS) used for the page.
          # Corresponds to the JSON property `cms`
          # @return [String]
          attr_accessor :cms
        
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
        
          # The needed round trips to load render blocking resources
          # Corresponds to the JSON property `numRenderBlockingRoundTrips`
          # @return [Fixnum]
          attr_accessor :num_render_blocking_round_trips
        
          # The needed round trips to load the full page
          # Corresponds to the JSON property `numTotalRoundTrips`
          # @return [Fixnum]
          attr_accessor :num_total_round_trips
        
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
        
          # Number of roboted resources.
          # Corresponds to the JSON property `numberRobotedResources`
          # @return [Fixnum]
          attr_accessor :number_roboted_resources
        
          # Number of static (i.e. cacheable) resources on the page.
          # Corresponds to the JSON property `numberStaticResources`
          # @return [Fixnum]
          attr_accessor :number_static_resources
        
          # Number of transient-failed resources.
          # Corresponds to the JSON property `numberTransientFetchFailureResources`
          # @return [Fixnum]
          attr_accessor :number_transient_fetch_failure_resources
        
          # Number of response bytes for other resources on the page.
          # Corresponds to the JSON property `otherResponseBytes`
          # @return [Fixnum]
          attr_accessor :other_response_bytes
        
          # Number of over-the-wire bytes, uses the default gzip compression strategy as
          # an estimation.
          # Corresponds to the JSON property `overTheWireResponseBytes`
          # @return [Fixnum]
          attr_accessor :over_the_wire_response_bytes
        
          # List of roboted urls.
          # Corresponds to the JSON property `robotedUrls`
          # @return [Array<String>]
          attr_accessor :roboted_urls
        
          # Number of uncompressed response bytes for text resources not covered by other
          # statistics (i.e non-HTML, non-script, non-CSS resources) on the page.
          # Corresponds to the JSON property `textResponseBytes`
          # @return [Fixnum]
          attr_accessor :text_response_bytes
        
          # Total size of all request bytes sent by the page.
          # Corresponds to the JSON property `totalRequestBytes`
          # @return [Fixnum]
          attr_accessor :total_request_bytes
        
          # List of transient fetch failure urls.
          # Corresponds to the JSON property `transientFetchFailureUrls`
          # @return [Array<String>]
          attr_accessor :transient_fetch_failure_urls
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @cms = args[:cms] if args.key?(:cms)
            @css_response_bytes = args[:css_response_bytes] if args.key?(:css_response_bytes)
            @flash_response_bytes = args[:flash_response_bytes] if args.key?(:flash_response_bytes)
            @html_response_bytes = args[:html_response_bytes] if args.key?(:html_response_bytes)
            @image_response_bytes = args[:image_response_bytes] if args.key?(:image_response_bytes)
            @javascript_response_bytes = args[:javascript_response_bytes] if args.key?(:javascript_response_bytes)
            @num_render_blocking_round_trips = args[:num_render_blocking_round_trips] if args.key?(:num_render_blocking_round_trips)
            @num_total_round_trips = args[:num_total_round_trips] if args.key?(:num_total_round_trips)
            @number_css_resources = args[:number_css_resources] if args.key?(:number_css_resources)
            @number_hosts = args[:number_hosts] if args.key?(:number_hosts)
            @number_js_resources = args[:number_js_resources] if args.key?(:number_js_resources)
            @number_resources = args[:number_resources] if args.key?(:number_resources)
            @number_roboted_resources = args[:number_roboted_resources] if args.key?(:number_roboted_resources)
            @number_static_resources = args[:number_static_resources] if args.key?(:number_static_resources)
            @number_transient_fetch_failure_resources = args[:number_transient_fetch_failure_resources] if args.key?(:number_transient_fetch_failure_resources)
            @other_response_bytes = args[:other_response_bytes] if args.key?(:other_response_bytes)
            @over_the_wire_response_bytes = args[:over_the_wire_response_bytes] if args.key?(:over_the_wire_response_bytes)
            @roboted_urls = args[:roboted_urls] if args.key?(:roboted_urls)
            @text_response_bytes = args[:text_response_bytes] if args.key?(:text_response_bytes)
            @total_request_bytes = args[:total_request_bytes] if args.key?(:total_request_bytes)
            @transient_fetch_failure_urls = args[:transient_fetch_failure_urls] if args.key?(:transient_fetch_failure_urls)
          end
        end
        
        # The name of this rule group: one of "SPEED", "USABILITY", or "SECURITY".
        class RuleGroup
          include Google::Apis::Core::Hashable
        
          # 
          # Corresponds to the JSON property `pass`
          # @return [Boolean]
          attr_accessor :pass
          alias_method :pass?, :pass
        
          # The score (0-100) for this rule group, which indicates how much better a page
          # could be in that category (e.g. how much faster, or how much more usable, or
          # how much more secure). A high score indicates little room for improvement,
          # while a lower score indicates more room for improvement.
          # Corresponds to the JSON property `score`
          # @return [Fixnum]
          attr_accessor :score
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @pass = args[:pass] if args.key?(:pass)
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
