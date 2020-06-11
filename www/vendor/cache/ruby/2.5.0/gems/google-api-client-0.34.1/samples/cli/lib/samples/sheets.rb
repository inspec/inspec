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

require 'google/apis/sheets_v4'
require 'base_cli'


module Samples
  # Examples for the Google Sheets API
  #
  # Sample usage:
  #
  #     $ ./google-api-samples sheets get_values --spreadsheet_key='1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms' --range='Class Data!A1:F'
  #
  #     Student Name  Gender  Class Level   Home State  Major    Extracurricular Activity
  #     Alexandra     Female  4. Senior     CA          English  Drama Club
  #     Andrew        Male    1. Freshman   SD          Math     Lacrosse
  #     Anna          Female  1. Freshman   NC          English  Basketball
  #     Becky         Female  2. Sophomore  SD          Art      Baseball
  #     Benjamin      Male    4. Senior     WI          English  Basketball
  #     Carl          Male    3. Junior     MD          Art      Debate
  #     Carrie        Female  3. Junior     NE          English  Track & Field
  #     Dorothy       Female  4. Senior     MD          Math     Lacrosse
  #     Dylan         Male    1. Freshman   MA          Math     Baseball
  #     Edward        Male    3. Junior     FL          English  Drama Club
  #     Ellen         Female  1. Freshman   WI          Physics  Drama Club
  #     Fiona         Female  1. Freshman   MA          Art      Debate
  #     John          Male    3. Junior     CA          Physics  Basketball
  #     Jonathan      Male    2. Sophomore  SC          Math     Debate
  class Sheets < BaseCli
    Sheets = Google::Apis::SheetsV4

    desc 'get_values', 'Get values from Google Spreadseets '
    method_option :spreadsheet_key, type: :string, required: true
    method_option :range, type: :string, required: true
    def get_values
      sheets = Sheets::SheetsService.new
      sheets.authorization = user_credentials_for(Sheets::AUTH_SPREADSHEETS_READONLY)
      result = sheets.get_spreadsheet_values(options[:spreadsheet_key], options[:range])
      data = []
      rows = result.values.length
      rows.times.each do |row|
        data.push(result.values[row])
      end
      print_table(data)
    end

    default_task :get_values
  end
end
