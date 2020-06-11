# Copyright 2016 Shawn Neal <sneal@sneal.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'nori'
require_relative 'base'

module WinRM
  module WSMV
    # WSMV message to query Windows via WQL
    class WqlQuery < Base
      def initialize(transport, session_opts, wql, namespace = nil)
        @session_opts = session_opts
        @wql = wql
        @namespace = namespace
        @transport = transport
      end

      def process_response(response, &block)
        parser = Nori.new(
          parser: :rexml,
          advanced_typecasting: false,
          convert_tags_to: ->(tag) { tag.snakecase.to_sym },
          strip_namespaces: true
        )
        @items = Hash.new { |h, k| h[k] = [] }

        hresp = parser.parse(response.to_s)[:envelope][:body][:enumerate_response]
        process_items hresp[:items], &block

        # Perform WS-Enum PULL's until we have all the elements
        enumeration_context = hresp[:enumeration_context]
        until enumeration_context.nil?
          query = WqlPull.new(@session_opts, @namespace, enumeration_context)
          hresp = query.process_response(@transport.send_request(query.build))[:pull_response]
          process_items hresp[:items], &block
          enumeration_context = hresp[:enumeration_context]
        end

        @items
      end

      protected

      def create_header(header)
        header << Gyoku.xml(wql_header)
      end

      def create_body(body)
        body.tag!("#{NS_ENUM}:Enumerate") { |en| en << Gyoku.xml(wql_body) }
      end

      private

      def process_items(items, &block)
        return if items.nil?

        items.each_pair do |k, v|
          # Normalize items so the type always has an array even if it's just a single item.
          v_ary = v.is_a?(Array) ? v : [v]
          if block
            v_ary.each { |val| yield k, val }
          else
            @items[k] += v_ary
          end
        end
      end

      def wql_header
        merge_headers(shared_headers(@session_opts), resource_uri_wmi(@namespace), action_enumerate)
      end

      def wql_body
        {
          "#{NS_WSMAN_DMTF}:OptimizeEnumeration" => nil,
          "#{NS_WSMAN_DMTF}:MaxElements" => '32000',
          "#{NS_WSMAN_DMTF}:Filter" => @wql,
          "#{NS_WSMAN_MSFT}:SessionId" => "uuid:#{@session_opts[:session_id]}",
          :attributes! => {
            "#{NS_WSMAN_DMTF}:Filter" => {
              'Dialect' => 'http://schemas.microsoft.com/wbem/wsman/1/WQL'
            }
          }
        }
      end
    end
  end
end
