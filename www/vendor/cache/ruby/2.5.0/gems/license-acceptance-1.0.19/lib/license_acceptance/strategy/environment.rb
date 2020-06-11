require "license_acceptance/strategy/base"

module LicenseAcceptance
  module Strategy

    # Look for acceptance values in the environment
    class Environment < Base

      attr_reader :env

      def initialize(env)
        @env = env
      end

      def accepted?
        look_for_value(ACCEPT)
      end

      def silent?
        look_for_value(ACCEPT_SILENT)
      end

      def no_persist?
        look_for_value(ACCEPT_NO_PERSIST)
      end

      private

      def look_for_value(sought)
        if env["CHEF_LICENSE"] && env["CHEF_LICENSE"].downcase == sought
          return true
        end

        false
      end

    end
  end
end
