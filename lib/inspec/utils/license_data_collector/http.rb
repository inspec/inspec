require "uri"
require "net/http"
require "json"
require "fileutils"

module Inspec
  class LicenseDataCollector
    class Base; end
    class Http < Base

      LDC_URL = "https://postman-echo.com/post" # TODO: get real URL
      # LDC_URL = "https://postman-echo.com/error/404" # Not a real endpoint but does 404 :-)
      # LDC_URL = "https://postman-echo.com/delay/5" # Only works for GET

      def scan_finishing(opts)
        super(opts)
        Thread.new { send_license_data }
      end

      def send_license_data
        # TODO: check for and send aggregate file if present

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

        # Write POST contents to file for fallback aggregation
        file_basename = "http-" + Time.now.getutc.strftime("%Y%m%d-%H%M%S-%L")
        FileUtils.mkdir_p(Base.license_data_dir)
        json_file = File.join(Base.license_data_dir, "#{file_basename}.json")
        fail_file = File.join(Base.license_data_dir, "#{file_basename}.fail")
        File.write(json_file, JSON.generate({headers: headers, payload: payload}))

        begin
          # make POST
          response = https.request(request)

          case response
          when Net::HTTPSuccess, Net::HTTPRedirection
            # cleanup http-TIMESTAMP.json
            FileUtils.rm(json_file)
          else
            # Something went wrong.
            error = {
              type: "http_error",
              code: response.code,
              body: response.body,
              url: url
            }
            File.write(fail_file, JSON.generate(error))
          end
        rescue Net::OpenTimeout, Net::ReadTimeout => e
          error = {
            type: "net_error",
            class: e.class.name,
            body: e.message,
            url: url
          }
          File.write(fail_file, JSON.generate(error))
        end
      end
    end
  end
end
