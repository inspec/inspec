# frozen_string_literal: true
require_relative "base"
module Inspec
  class Telemetry
    class Debug < Base
      def run_ending(opts)
        payload = super(opts)
        require "byebug"; byebug
        # 1
      end
    end
  end
end
