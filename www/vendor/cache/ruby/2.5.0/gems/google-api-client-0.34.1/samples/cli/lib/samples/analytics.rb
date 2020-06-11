# Copyright 2016 Google Inc.
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

require 'google/apis/analytics_v3'
require 'base_cli'

module Samples
  # Examples for the Google Analytics APIs
  #
  # Sample usage session:
  #
  #     $ ./google-api-samples analytics show_visits 55622900 --start='2015-12-01' --end='2015-12-08'
  #     ga:date   ga:sessions  ga:users  ga:newUsers  ga:percentNewSessions  ga:sessionDuration  ga:avgSessionDuration
  #     20151201  0            0         0            0.0                    0.0                 0.0
  #     20151202  0            0         0            0.0                    0.0                 0.0
  #     20151203  1            1         1            100.0                  0.0                 0.0
  #     20151204  2            2         1            50.0                   616.0               308.0
  #     20151205  0            0         0            0.0                    0.0                 0.0
  #     20151206  1            1         1            100.0                  0.0                 0.0
  #     20151207  0            0         0            0.0                    0.0                 0.0
  #     20151208  2            2         1            50.0                   0.0                 0.0
  #
  class Analytics < BaseCli
    Analytics = Google::Apis::AnalyticsV3

    desc 'show_visits PROFILE_ID', 'Show visits for the given analytics profile ID'
    method_option :start, type: :string, required: true
    method_option :end, type: :string, required: true
    def show_visits(profile_id)
      analytics = Analytics::AnalyticsService.new
      analytics.authorization = user_credentials_for(Analytics::AUTH_ANALYTICS)

      dimensions = %w(ga:date)
      metrics = %w(ga:sessions ga:users ga:newUsers ga:percentNewSessions
                   ga:sessionDuration ga:avgSessionDuration)
      sort = %w(ga:date)
      result = analytics.get_ga_data("ga:#{profile_id}",
                                     options[:start],
                                     options[:end],
                                     metrics.join(','),
                                     dimensions: dimensions.join(','),
                                     sort: sort.join(','))

      data = []
      data.push(result.column_headers.map { |h| h.name })
      data.push(*result.rows)
      print_table(data)
    end

    desc 'show_realtime_visits PROFILE_ID', 'Show realtime visits for the given analytics profile ID'
    def show_realtime_visits(profile_id)
      analytics = Analytics::AnalyticsService.new
      analytics.authorization = user_credentials_for(Analytics::AUTH_ANALYTICS)

      dimensions = %w(rt:medium rt:pagePath)
      metrics = %w(rt:activeUsers)
      sort = %w(rt:medium rt:pagePath)
      result = analytics.get_realtime_data("ga:#{profile_id}",
                                           metrics.join(','),
                                           dimensions: dimensions.join(','),
                                           sort: sort.join(','))

      data = []
      data.push(result.column_headers.map { |h| h.name })
      data.push(*result.rows)
      print_table(data)
    end
  end
end
