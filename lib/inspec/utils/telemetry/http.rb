# frozen_string_literal: true
require_relative "base"
require "faraday" unless defined?(Faraday)
module Inspec
  class Telemetry
    class HTTP < Base
      TELEMETRY_JOBS_PATH = "v1/job"
      TELEMETRY_URL = ENV["TELEMETRY_URL"] # TODO Set to production telemetry URL before release
      def run_ending(opts)
        payload = super
        response = connection.post(TELEMETRY_JOBS_PATH) do |req|
          req.body = payload.to_json
        end
        if response.success?
          Inspec::Log.debug "HTTP connection with Telemetry Client successful."
          Inspec::Log.debug "HTTP response from Telemetry Client -> #{response.to_hash}"
          true
        else
          false
        end
      rescue Faraday::ConnectionFailed
        Inspec::Log.debug "HTTP connection failure with telemetry url -> #{TELEMETRY_URL}"
      end

      def connection
        Faraday.new(url: TELEMETRY_URL) do |config|
          config.request :json
          config.response :json
        end
      end
    end
  end
end
