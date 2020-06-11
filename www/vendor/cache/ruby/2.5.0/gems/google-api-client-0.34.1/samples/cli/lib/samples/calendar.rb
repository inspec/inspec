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

require 'google/apis/calendar_v3'
require 'base_cli'


module Samples
  # Examples for the Google Calendar API
  #
  # Sample usage:
  #
  #     $ ./google-api-samples calendar list --limit 10
  class Calendar < BaseCli
    Calendar = Google::Apis::CalendarV3

    desc 'schedule', 'Create an event'
    method_option :summary, type: :string, required: true
    method_option :start, type: :string, required: true
    method_option :end , type: :string, required: true
    method_option :attendees, type: :array
    def schedule
      calendar = Calendar::CalendarService.new
      calendar.authorization = user_credentials_for(Calendar::AUTH_CALENDAR)

      event = {
        summary: options[:summary],
        attendees: Array(options[:attendees]).map { |email| { email: email } },
        start: {
          date_time: DateTime.parse(options[:start])
        },
        end: {
          date_time: DateTime.parse(options[:end])
        }
      }

      event = calendar.insert_event('primary', event, send_notifications: true)
      say "Created event '#{event.summary}' (#{event.id})"
    end

    desc 'list', 'List upcoming events'
    method_option :limit, type: :numeric
    def list()
      calendar = Calendar::CalendarService.new
      calendar.authorization = user_credentials_for(Calendar::AUTH_CALENDAR)

      page_token = nil
      limit = options[:limit] || 1000
      now = Time.now.iso8601
      begin
        result = calendar.list_events('primary',
                                      max_results: [limit, 100].min,
                                      single_events: true,
                                      order_by: 'startTime',
                                      time_min: now,
                                      page_token: page_token,
                                      fields: 'items(id,summary,start),next_page_token')

        result.items.each do |event|
          time = event.start.date_time || event.start.date
          say "#{time}, #{event.summary}"
        end
        limit -= result.items.length
        if result.next_page_token
          page_token = result.next_page_token
        else
          page_token = nil
        end
      end while !page_token.nil? && limit > 0
    end
  end
end
