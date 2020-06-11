require "uri"
require "net/http"

module TrainPlugins
  module Habitat
    class HTTPGateway
      Response = Struct.new(:code, :body, :raw_response)

      attr_reader :base_uri

      def initialize(opts)
        @base_uri = URI(opts[:url])
        # check for provided port and default if not provided
        if base_uri.port == 80 && opts[:url] !~ %r{\w+:\d+(\/|$)}
          base_uri.port = 9631
        end

        @auth_token = opts[:auth_token]
      end

      def get_path(path)
        uri = base_uri.dup
        uri.path = path
        headers = {}
        unless auth_token.nil?
          headers["Authorization"] = "Bearer " + auth_token # Set bearer token, see https://www.habitat.sh/docs/using-habitat/#authentication
        end

        conn = Net::HTTP.start(uri.host, uri.port)
        conn.read_timeout = 5

        resp = Response.new
        resp.raw_response = conn.get(uri, headers)

        resp.code = resp.raw_response.code.to_i
        if resp.code == 200
          resp.body = JSON.parse(resp.raw_response.body, symbolize_names: true)
        end
        resp
      end

      # Private accessor
      attr_reader :auth_token
    end
  end
end
