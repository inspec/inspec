# frozen_string_literal: true
require_relative "base"
require "faraday" unless defined?(Faraday)
module Inspec
  class Telemetry
    class HTTP < Base
      TELEMETRY_JOBS_PATH = "v1/job"
      def run_ending(opts)
        payload = super
        response = connection.post(TELEMETRY_JOBS_PATH) do |req|
          req.body = payload.to_json
        end
        if response.success?
          Inspec::Log.debug "HTTP connection with Telemetry Client successful"
          Inspec::Log.debug "HTTP response from Telemetry Client -> #{response.to_hash}"
          true
        else
          false
        end
      end

      def connection
        Faraday.new(url: ENV["TELEMETRY_URL"]) do |config|
          config.request :json
          config.response :json
        end
      end
    end
  end
end
