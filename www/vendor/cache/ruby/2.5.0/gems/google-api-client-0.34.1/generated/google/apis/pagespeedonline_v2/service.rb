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

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module PagespeedonlineV2
      # PageSpeed Insights API
      #
      # Analyzes the performance of a web page and provides tailored suggestions to
      #  make that page faster.
      #
      # @example
      #    require 'google/apis/pagespeedonline_v2'
      #
      #    Pagespeedonline = Google::Apis::PagespeedonlineV2 # Alias the module
      #    service = Pagespeedonline::PagespeedonlineService.new
      #
      # @see https://developers.google.com/speed/docs/insights/v2/getting-started
      class PagespeedonlineService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  An opaque string that represents a user for quota purposes. Must not exceed 40
        #  characters.
        attr_accessor :quota_user

        # @return [String]
        #  Deprecated. Please use quotaUser instead.
        attr_accessor :user_ip

        def initialize
          super('https://www.googleapis.com/', 'pagespeedonline/v2/')
          @batch_path = 'batch/pagespeedonline/v2'
        end
        
        # Runs PageSpeed analysis on the page at the specified URL, and returns
        # PageSpeed scores, a list of suggestions to make that page faster, and other
        # information.
        # @param [String] url
        #   The URL to fetch and analyze
        # @param [Boolean] filter_third_party_resources
        #   Indicates if third party resources should be filtered out before PageSpeed
        #   analysis.
        # @param [String] locale
        #   The locale used to localize formatted results
        # @param [Array<String>, String] rule
        #   A PageSpeed rule to run; if none are given, all rules are run
        # @param [Boolean] screenshot
        #   Indicates if binary data containing a screenshot should be included
        # @param [String] strategy
        #   The analysis strategy to use
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   An opaque string that represents a user for quota purposes. Must not exceed 40
        #   characters.
        # @param [String] user_ip
        #   Deprecated. Please use quotaUser instead.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PagespeedonlineV2::Result] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PagespeedonlineV2::Result]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def run_pagespeed(url, filter_third_party_resources: nil, locale: nil, rule: nil, screenshot: nil, strategy: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command = make_simple_command(:get, 'runPagespeed', options)
          command.response_representation = Google::Apis::PagespeedonlineV2::Result::Representation
          command.response_class = Google::Apis::PagespeedonlineV2::Result
          command.query['filter_third_party_resources'] = filter_third_party_resources unless filter_third_party_resources.nil?
          command.query['locale'] = locale unless locale.nil?
          command.query['rule'] = rule unless rule.nil?
          command.query['screenshot'] = screenshot unless screenshot.nil?
          command.query['strategy'] = strategy unless strategy.nil?
          command.query['url'] = url unless url.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
        end
      end
    end
  end
end
