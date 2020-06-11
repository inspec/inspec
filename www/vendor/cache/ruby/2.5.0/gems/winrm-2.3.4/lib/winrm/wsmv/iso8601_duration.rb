# Copyright 2010 Dan Wanek <dan.wanek@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# rubocop:disable Metrics/MethodLength

# Format an ISO8601 Duration
module WinRM
  module WSMV
    # Converts seconds to ISO8601 duration format
    module Iso8601Duration
      # Convert the number of seconds to an ISO8601 duration format
      # @see http://tools.ietf.org/html/rfc2445#section-4.3.6
      # @param [Integer] seconds The amount of seconds for this duration
      def self.sec_to_dur(seconds)
        seconds = seconds.to_i
        iso_str = 'P'
        if seconds > 604_800 # more than a week
          weeks = seconds / 604_800
          seconds -= (604_800 * weeks)
          iso_str << "#{weeks}W"
        end
        if seconds > 86_400 # more than a day
          days = seconds / 86_400
          seconds -= (86_400 * days)
          iso_str << "#{days}D"
        end
        if seconds > 0
          iso_str << 'T'
          if seconds > 3600 # more than an hour
            hours = seconds / 3600
            seconds -= (3600 * hours)
            iso_str << "#{hours}H"
          end
          if seconds > 60 # more than a minute
            minutes = seconds / 60
            seconds -= (60 * minutes)
            iso_str << "#{minutes}M"
          end
          iso_str << "#{seconds}S"
        end

        iso_str
      end
    end
  end
end
# rubocop:enable Metrics/MethodLength
