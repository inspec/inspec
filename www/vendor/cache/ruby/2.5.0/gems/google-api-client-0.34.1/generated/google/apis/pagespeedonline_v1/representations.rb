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
    module PagespeedonlineV1
      
      class Result
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class FormattedResults
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class RuleResult
            class Representation < Google::Apis::Core::JsonRepresentation; end
            
            class UrlBlock
              class Representation < Google::Apis::Core::JsonRepresentation; end
              
              class Header
                class Representation < Google::Apis::Core::JsonRepresentation; end
                
                class Arg
                  class Representation < Google::Apis::Core::JsonRepresentation; end
                
                  include Google::Apis::Core::JsonObjectSupport
                end
              
                include Google::Apis::Core::JsonObjectSupport
              end
              
              class Url
                class Representation < Google::Apis::Core::JsonRepresentation; end
                
                class Detail
                  class Representation < Google::Apis::Core::JsonRepresentation; end
                  
                  class Arg
                    class Representation < Google::Apis::Core::JsonRepresentation; end
                  
                    include Google::Apis::Core::JsonObjectSupport
                  end
                
                  include Google::Apis::Core::JsonObjectSupport
                end
                
                class Result
                  class Representation < Google::Apis::Core::JsonRepresentation; end
                  
                  class Arg
                    class Representation < Google::Apis::Core::JsonRepresentation; end
                  
                    include Google::Apis::Core::JsonObjectSupport
                  end
                
                  include Google::Apis::Core::JsonObjectSupport
                end
              
                include Google::Apis::Core::JsonObjectSupport
              end
            
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
        
        class Screenshot
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
        
        class Version
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Result
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :captcha_result, as: 'captchaResult'
          property :formatted_results, as: 'formattedResults', class: Google::Apis::PagespeedonlineV1::Result::FormattedResults, decorator: Google::Apis::PagespeedonlineV1::Result::FormattedResults::Representation
      
          property :id, as: 'id'
          collection :invalid_rules, as: 'invalidRules'
          property :kind, as: 'kind'
          property :page_stats, as: 'pageStats', class: Google::Apis::PagespeedonlineV1::Result::PageStats, decorator: Google::Apis::PagespeedonlineV1::Result::PageStats::Representation
      
          property :response_code, as: 'responseCode'
          property :score, as: 'score'
          property :screenshot, as: 'screenshot', class: Google::Apis::PagespeedonlineV1::Result::Screenshot, decorator: Google::Apis::PagespeedonlineV1::Result::Screenshot::Representation
      
          property :title, as: 'title'
          property :version, as: 'version', class: Google::Apis::PagespeedonlineV1::Result::Version, decorator: Google::Apis::PagespeedonlineV1::Result::Version::Representation
      
        end
        
        class FormattedResults
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :locale, as: 'locale'
            hash :rule_results, as: 'ruleResults', class: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult, decorator: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::Representation
        
          end
          
          class RuleResult
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :localized_rule_name, as: 'localizedRuleName'
              property :rule_impact, as: 'ruleImpact'
              collection :url_blocks, as: 'urlBlocks', class: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock, decorator: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Representation
          
            end
            
            class UrlBlock
              # @private
              class Representation < Google::Apis::Core::JsonRepresentation
                property :header, as: 'header', class: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Header, decorator: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Header::Representation
            
                collection :urls, as: 'urls', class: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Url, decorator: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Url::Representation
            
              end
              
              class Header
                # @private
                class Representation < Google::Apis::Core::JsonRepresentation
                  collection :args, as: 'args', class: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Header::Arg, decorator: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Header::Arg::Representation
              
                  property :format, as: 'format'
                end
                
                class Arg
                  # @private
                  class Representation < Google::Apis::Core::JsonRepresentation
                    property :type, as: 'type'
                    property :value, as: 'value'
                  end
                end
              end
              
              class Url
                # @private
                class Representation < Google::Apis::Core::JsonRepresentation
                  collection :details, as: 'details', class: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Url::Detail, decorator: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Url::Detail::Representation
              
                  property :result, as: 'result', class: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Url::Result, decorator: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Url::Result::Representation
              
                end
                
                class Detail
                  # @private
                  class Representation < Google::Apis::Core::JsonRepresentation
                    collection :args, as: 'args', class: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Url::Detail::Arg, decorator: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Url::Detail::Arg::Representation
                
                    property :format, as: 'format'
                  end
                  
                  class Arg
                    # @private
                    class Representation < Google::Apis::Core::JsonRepresentation
                      property :type, as: 'type'
                      property :value, as: 'value'
                    end
                  end
                end
                
                class Result
                  # @private
                  class Representation < Google::Apis::Core::JsonRepresentation
                    collection :args, as: 'args', class: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Url::Result::Arg, decorator: Google::Apis::PagespeedonlineV1::Result::FormattedResults::RuleResult::UrlBlock::Url::Result::Arg::Representation
                
                    property :format, as: 'format'
                  end
                  
                  class Arg
                    # @private
                    class Representation < Google::Apis::Core::JsonRepresentation
                      property :type, as: 'type'
                      property :value, as: 'value'
                    end
                  end
                end
              end
            end
          end
        end
        
        class PageStats
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :css_response_bytes, :numeric_string => true, as: 'cssResponseBytes'
            property :flash_response_bytes, :numeric_string => true, as: 'flashResponseBytes'
            property :html_response_bytes, :numeric_string => true, as: 'htmlResponseBytes'
            property :image_response_bytes, :numeric_string => true, as: 'imageResponseBytes'
            property :javascript_response_bytes, :numeric_string => true, as: 'javascriptResponseBytes'
            property :number_css_resources, as: 'numberCssResources'
            property :number_hosts, as: 'numberHosts'
            property :number_js_resources, as: 'numberJsResources'
            property :number_resources, as: 'numberResources'
            property :number_static_resources, as: 'numberStaticResources'
            property :other_response_bytes, :numeric_string => true, as: 'otherResponseBytes'
            property :text_response_bytes, :numeric_string => true, as: 'textResponseBytes'
            property :total_request_bytes, :numeric_string => true, as: 'totalRequestBytes'
          end
        end
        
        class Screenshot
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :data, :base64 => true, as: 'data'
            property :height, as: 'height'
            property :mime_type, as: 'mime_type'
            property :width, as: 'width'
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
