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
        response.success?
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
