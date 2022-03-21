require "uri"
require "net/http"
require "json"

module Inspec
  class LicenseDataCollector
    class Base; end
    class Http < Base

      LDC_URL = "https://postman-echo.com/post" # TODO: get real URL

      def scan_finishing(opts)
        super(opts)
        Thread.new { send_license_data }
      end

      def send_license_data
        # Construct HTTP query
        url = URI(LDC_URL)
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
        https.open_timeout = 2 # Give up quickly
        https.read_timeout = 2 # Give up quickly
        request = Net::HTTP::Post.new(url)

        # Set request body
        request.body = JSON.generate(payload)

        # Set headers
        headers.each do |k,v|
          request[k.to_s] = v
        end
        request["Content-Type"] = "application/json"

        # TODO: write to file

        begin
          # make POST
          response = https.request(request)

          case response
          when Net::HTTPSuccess, Net::HTTPRedirection
            #   TODO: if POST succeeds, delete file
          else
            # Something went wrong.
            # TODO: track failures?
          end
        rescue Net::OpenTimeout, Net::ReadTimeout
            # TODO: track failures?
        end
      end
    end
  end
end
