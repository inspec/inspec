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
      
      class PagespeedApiFormatStringV4
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Arg
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Rect
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
          
          class SecondaryRect
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PagespeedApiImageV4
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class PageRect
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PagespeedApiPagespeedResponseV4
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class FormattedResults
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class RuleResult
            class Representation < Google::Apis::Core::JsonRepresentation; end
            
            class UrlBlock
              class Representation < Google::Apis::Core::JsonRepresentation; end
              
              class Url
                class Representation < Google::Apis::Core::JsonRepresentation; end
              
                include Google::Apis::Core::JsonObjectSupport
              end
            
              include Google::Apis::Core::JsonObjectSupport
            end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class LoadingExperience
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Metric
            class Representation < Google::Apis::Core::JsonRepresentation; end
            
            class Distribution
              class Representation < Google::Apis::Core::JsonRepresentation; end
            
              include Google::Apis::Core::JsonObjectSupport
            end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class PageStats
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class RuleGroup
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Version
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PagespeedApiFormatStringV4
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :args, as: 'args', class: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4::Arg, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4::Arg::Representation
      
          property :format, as: 'format'
        end
        
        class Arg
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :key, as: 'key'
            collection :rects, as: 'rects', class: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4::Arg::Rect, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4::Arg::Rect::Representation
        
            collection :secondary_rects, as: 'secondary_rects', class: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4::Arg::SecondaryRect, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4::Arg::SecondaryRect::Representation
        
            property :type, as: 'type'
            property :value, as: 'value'
          end
          
          class Rect
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :height, as: 'height'
              property :left, as: 'left'
              property :top, as: 'top'
              property :width, as: 'width'
            end
          end
          
          class SecondaryRect
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :height, as: 'height'
              property :left, as: 'left'
              property :top, as: 'top'
              property :width, as: 'width'
            end
          end
        end
      end
      
      class PagespeedApiImageV4
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :data, :base64 => true, as: 'data'
          property :height, as: 'height'
          property :key, as: 'key'
          property :mime_type, as: 'mime_type'
          property :page_rect, as: 'page_rect', class: Google::Apis::PagespeedonlineV4::PagespeedApiImageV4::PageRect, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiImageV4::PageRect::Representation
      
          property :width, as: 'width'
        end
        
        class PageRect
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :height, as: 'height'
            property :left, as: 'left'
            property :top, as: 'top'
            property :width, as: 'width'
          end
        end
      end
      
      class PagespeedApiPagespeedResponseV4
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :captcha_result, as: 'captchaResult'
          property :formatted_results, as: 'formattedResults', class: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::FormattedResults, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::FormattedResults::Representation
      
          property :id, as: 'id'
          collection :invalid_rules, as: 'invalidRules'
          property :kind, as: 'kind'
          property :loading_experience, as: 'loadingExperience', class: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::LoadingExperience, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::LoadingExperience::Representation
      
          property :page_stats, as: 'pageStats', class: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::PageStats, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::PageStats::Representation
      
          property :response_code, as: 'responseCode'
          hash :rule_groups, as: 'ruleGroups', class: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::RuleGroup, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::RuleGroup::Representation
      
          property :screenshot, as: 'screenshot', class: Google::Apis::PagespeedonlineV4::PagespeedApiImageV4, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiImageV4::Representation
      
          collection :snapshots, as: 'snapshots', class: Google::Apis::PagespeedonlineV4::PagespeedApiImageV4, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiImageV4::Representation
      
          property :title, as: 'title'
          property :version, as: 'version', class: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::Version, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::Version::Representation
      
        end
        
        class FormattedResults
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :locale, as: 'locale'
            hash :rule_results, as: 'ruleResults', class: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::FormattedResults::RuleResult, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::FormattedResults::RuleResult::Representation
        
          end
          
          class RuleResult
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :beta, as: 'beta'
              collection :groups, as: 'groups'
              property :localized_rule_name, as: 'localizedRuleName'
              property :rule_impact, as: 'ruleImpact'
              property :summary, as: 'summary', class: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4::Representation
          
              collection :url_blocks, as: 'urlBlocks', class: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::FormattedResults::RuleResult::UrlBlock, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::FormattedResults::RuleResult::UrlBlock::Representation
          
            end
            
            class UrlBlock
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :header, as: 'header', class: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4::Representation
            
                collection :urls, as: 'urls', class: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::FormattedResults::RuleResult::UrlBlock::Url, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::FormattedResults::RuleResult::UrlBlock::Url::Representation
            
              end
              
              class Url
                # @private
                class Representation < Google::Apis::Core::JsonRepresentation
                  collection :details, as: 'details', class: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4::Representation
              
                  property :result, as: 'result', class: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiFormatStringV4::Representation
              
                end
              end
            end
          end
        end
        
        class LoadingExperience
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :id, as: 'id'
            property :initial_url, as: 'initial_url'
            hash :metrics, as: 'metrics', class: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::LoadingExperience::Metric, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::LoadingExperience::Metric::Representation
        
            property :overall_category, as: 'overall_category'
          end
          
          class Metric
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :category, as: 'category'
              collection :distributions, as: 'distributions', class: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::LoadingExperience::Metric::Distribution, decorator: Google::Apis::PagespeedonlineV4::PagespeedApiPagespeedResponseV4::LoadingExperience::Metric::Distribution::Representation
          
              property :median, as: 'median'
            end
            
            class Distribution
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :max, as: 'max'
                property :min, as: 'min'
                property :proportion, as: 'proportion'
              end
            end
          end
        end
        
        class PageStats
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :cms, as: 'cms'
            property :css_response_bytes, :numeric_string => true, as: 'cssResponseBytes'
            property :flash_response_bytes, :numeric_string => true, as: 'flashResponseBytes'
            property :html_response_bytes, :numeric_string => true, as: 'htmlResponseBytes'
            property :image_response_bytes, :numeric_string => true, as: 'imageResponseBytes'
            property :javascript_response_bytes, :numeric_string => true, as: 'javascriptResponseBytes'
            property :num_render_blocking_round_trips, as: 'numRenderBlockingRoundTrips'
            property :num_total_round_trips, as: 'numTotalRoundTrips'
            property :number_css_resources, as: 'numberCssResources'
            property :number_hosts, as: 'numberHosts'
            property :number_js_resources, as: 'numberJsResources'
            property :number_resources, as: 'numberResources'
            property :number_roboted_resources, as: 'numberRobotedResources'
            property :number_static_resources, as: 'numberStaticResources'
            property :number_transient_fetch_failure_resources, as: 'numberTransientFetchFailureResources'
            property :other_response_bytes, :numeric_string => true, as: 'otherResponseBytes'
            property :over_the_wire_response_bytes, :numeric_string => true, as: 'overTheWireResponseBytes'
            collection :roboted_urls, as: 'robotedUrls'
            property :text_response_bytes, :numeric_string => true, as: 'textResponseBytes'
            property :total_request_bytes, :numeric_string => true, as: 'totalRequestBytes'
            collection :transient_fetch_failure_urls, as: 'transientFetchFailureUrls'
          end
        end
        
        class RuleGroup
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :pass, as: 'pass'
            property :score, as: 'score'
          end
        end
        
        class Version
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :major, as: 'major'
            property :minor, as: 'minor'
          end
        end
      end
    end
  end
end
