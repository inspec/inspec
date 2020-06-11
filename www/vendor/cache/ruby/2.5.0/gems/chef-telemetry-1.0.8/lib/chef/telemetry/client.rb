require "net/http"
require "uri"
require "json"
require "concurrent"

class Chef
  class Telemetry
    class Client
      include Concurrent::Async

      TELEMETRY_ENDPOINT = "https://telemetry.chef.io".freeze

      attr_reader :http
      def initialize(endpoint = TELEMETRY_ENDPOINT)
        super()
        uri = URI(endpoint)
        @http = Net::HTTP.new(uri.host, uri.port)
        @http.use_ssl = uri.scheme == "https"
        @http.start
      end

      def fire(event)
        req = Net::HTTP::Post.new("/events")
        req["Content-Type"] = "application/json"
        req.body = JSON.dump(event)
        # TODO: @cwolfe use response and at least debug log status
        http.request req
      end
    end

    class OptOutClient
      def fire(_); end
    end
  end
end
