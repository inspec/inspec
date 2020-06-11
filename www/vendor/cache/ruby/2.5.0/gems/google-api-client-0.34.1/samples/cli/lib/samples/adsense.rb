# Copyright 2017 Google Inc.
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

require 'google/apis/adsense_v1_4'
require 'base_cli'

module Samples
  # Examples for the Adsense API
  #
  # Sample usage:
  #
  #     $ ./google-api-samples adsense list_accounts
  #     $ ./google-api-samples adsense list_account_ad_clients pub-0000000000000000
  #     $ ./google-api-samples adsense list_account_ad_units pub-0000000000000000 ca-pub-0000000000000000
  #     $ ./google-api-samples adsense get_account_ad_unit_ad_code pub-0000000000000000 ca-pub-0000000000000000 ca-pub-0000000000000000:0000000000
  #
  class Adsense < BaseCli
    Adsense = Google::Apis::AdsenseV1_4

    desc 'list_accounts', 'List all accounts available to this AdSense account'
    method_option :max_results, type: :numeric, default: 100
    def list_accounts
      adsense = Adsense::AdSenseService.new
      adsense.authorization = user_credentials_for(Adsense::AUTH_ADSENSE)

      result = adsense.list_accounts(max_results: options[:max_results])
      if result.items
        result.items.each { |account| puts "#{account.id} #{account.kind} #{account.name} #{account.premium} #{account.timezone}" }
      end
    end

    desc(
      'list_account_ad_clients ACCOUNT_ID',
      'List all ad clients in the specified account'
    )
    method_option :max_results, type: :numeric, default: 100
    def list_account_ad_clients(account_id)
      adsense = Adsense::AdSenseService.new
      adsense.authorization = user_credentials_for(Adsense::AUTH_ADSENSE)

      result = adsense.list_account_ad_clients(
        account_id,
        max_results: options[:max_results]
      )
      if result.items
        result.items.each { |ad_client| puts ad_client.id }
      end
    end

    desc(
      'list_account_ad_units ACCOUNT_ID AD_CLIENT_ID',
      'List all ad units in the specified ad client for the specified account'
    )
    method_option :max_results, type: :numeric, default: 100
    method_option :include_inactive, type: :boolean, default: true
    def list_account_ad_units(account_id, ad_client_id)
      adsense = Adsense::AdSenseService.new
      adsense.authorization = user_credentials_for(Adsense::AUTH_ADSENSE)

      result = adsense.list_account_ad_units(
        account_id, ad_client_id,
        max_results: options[:max_results],
        include_inactive: options[:include_inactive]
      )
      if result.items
        result.items.each do |ad_unit|
          puts "#{ad_unit.id} #{ad_unit.name} #{ad_unit.status} #{ad_unit.code}"
        end
      end
    end

    desc(
      'get_account_ad_unit_ad_code ACCOUNT_ID AD_CLIENT_ID AD_UNIT_ID',
      'Get ad code for the specified ad unit'
    )
    def get_account_ad_unit_ad_code(account_id, ad_client_id, ad_unit_id)
      adsense = Adsense::AdSenseService.new
      adsense.authorization = user_credentials_for(Adsense::AUTH_ADSENSE)

      result = adsense.get_account_ad_unit_ad_code(
        account_id,
        ad_client_id,
        ad_unit_id
      )
      puts result.ad_code
    end
  end
end