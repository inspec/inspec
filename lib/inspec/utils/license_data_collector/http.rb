require "uri" unless defined?(URI)
require "net/http" unless defined?(Net::HTTP)
require "json" unless defined?(JSON)
require "fileutils" unless defined?(FileUtils)

module Inspec
  class LicenseDataCollector
    class Base; end

    class Http < Base

      LDC_URL = "https://postman-echo.com/post".freeze # TODO: get real URL
      # LDC_URL = "https://postman-echo.com/error/404".freeze # Not a real endpoint but does 404 :-)
      # LDC_URL = "https://postman-echo.com/delay/5".freeze # Only works for GET

      def scan_finishing(opts)
        super(opts)
        Thread.new do
          lock_aggregate_file do |f|
            send_license_data(f)
          end
        end
      end

      def send_license_data(file)
        # Update the aggregate file
        merged = aggregate_payload_to_file(file)

        # Construct HTTP query
        url = URI(LDC_URL)
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
        https.open_timeout = 2 # Give up quickly
        https.read_timeout = 2 # Give up quickly
        request = Net::HTTP::Post.new(url)

        # Set request body
        # TODO - what if payload is huge?
        request.body = JSON.generate(merged[:payload])

        # Set headers
        headers.each do |k, v|
          request[k.to_s] = v
        end
        request["Content-Type"] = "application/json"

        file_basename = "http-" + Time.now.getutc.strftime("%Y%m%d-%H%M%S-%L")
        fail_file = File.join(Base.license_data_dir, "#{file_basename}.fail")

        begin
          # make POST
          response = https.request(request)

          case response
          when Net::HTTPSuccess, Net::HTTPRedirection
            # Remove old aggregate data, we've successfully sent it
            file.truncate(0)
          else
            # Something went wrong.
            error = {
              type: "http_error",
              code: response.code,
              body: response.body,
              url: url,
            }
            File.write(fail_file, JSON.generate(error))
          end
        rescue Net::OpenTimeout, Net::ReadTimeout => e
          error = {
            type: "net_error",
            class: e.class.name,
            body: e.message,
            url: url,
          }
          File.write(fail_file, JSON.generate(error))
        end
      end
    end
  end
end
