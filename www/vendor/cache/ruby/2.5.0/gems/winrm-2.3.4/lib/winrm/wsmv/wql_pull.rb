require 'nori'
require_relative 'base'

module WinRM
  module WSMV
    # WSMV message to 'pull' rest of enumeration results from Windows via WQL
    class WqlPull < Base
      def initialize(session_opts, namespace, enumeration_context)
        @session_opts = session_opts
        @namespace = namespace
        @enumeration_context = enumeration_context
      end

      def process_response(response)
        parser = Nori.new(
          parser: :rexml,
          advanced_typecasting: false,
          convert_tags_to: ->(tag) { tag.snakecase.to_sym },
          strip_namespaces: true
        )
        parser.parse(response.to_s)[:envelope][:body]
      end

      protected

      def create_header(header)
        header << Gyoku.xml(wql_header)
      end

      def create_body(body)
        body.tag!("#{NS_ENUM}:Pull") { |en| en << Gyoku.xml(wql_body) }
      end

      private

      def wql_header
        merge_headers(
          shared_headers(@session_opts),
          resource_uri_wmi(@namespace),
          action_enumerate_pull
        )
      end

      def wql_body
        {
          "#{NS_ENUM}:EnumerationContext" => @enumeration_context,
          "#{NS_WSMAN_DMTF}:OptimizeEnumeration" => nil,
          "#{NS_ENUM}:MaxElements" => '32000',
          "#{NS_WSMAN_MSFT}:SessionId" => "uuid:#{@session_opts[:session_id]}"
        }
      end
    end
  end
end
