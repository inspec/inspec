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

require 'google/apis/calendar_v3/service.rb'
require 'google/apis/calendar_v3/classes.rb'
require 'google/apis/calendar_v3/representations.rb'

module Google
  module Apis
    # Calendar API
    #
    # Manipulates events and other calendar data.
    #
    # @see https://developers.google.com/google-apps/calendar/firstapp
    module CalendarV3
      VERSION = 'V3'
      REVISION = '20190929'

      # See, edit, share, and permanently delete all the calendars you can access using Google Calendar
      AUTH_CALENDAR = 'https://www.googleapis.com/auth/calendar'

      # View and edit events on all your calendars
      AUTH_CALENDAR_EVENTS = 'https://www.googleapis.com/auth/calendar.events'

      # View events on all your calendars
      AUTH_CALENDAR_EVENTS_READONLY = 'https://www.googleapis.com/auth/calendar.events.readonly'

      # View your calendars
      AUTH_CALENDAR_READONLY = 'https://www.googleapis.com/auth/calendar.readonly'

      # View your Calendar settings
      AUTH_CALENDAR_SETTINGS_READONLY = 'https://www.googleapis.com/auth/calendar.settings.readonly'
    end
  end
end
