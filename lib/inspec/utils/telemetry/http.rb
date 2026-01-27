# frozen_string_literal: true
require_relative "base"
require "faraday" unless defined?(Faraday)
require "inspec/utils/licensing_config"
module Inspec
  class Telemetry
    class HTTP < Base
      TELEMETRY_JOBS_PATH = "v1/job"
      # Allow dev/CI to override the telemetry URL to a staging service
      TELEMETRY_URL = ENV["CHEF_TELEMETRY_URL"] || "https://services.chef.io/telemetry/"
      def run_ending(opts)
        payload = super
        response = connection.post(TELEMETRY_JOBS_PATH) do |req|
          req.body = payload.to_json
        end
        if response.success?
          Inspec::Log.debug "HTTP connection with Telemetry Client successful."
          true
        else
          Inspec::Log.debug "HTTP connection with Telemetry Client faced an error."
          false
        end
      rescue Faraday::ConnectionFailed
        Inspec::Log.debug "HTTP connection failure with telemetry url -> #{TELEMETRY_URL}"
      end

      def connection
        Faraday.new(url: TELEMETRY_URL) do |config|
          config.request :json
          config.response :json
          config.adapter Faraday.default_adapter
        end
      end
    end
  end
end
