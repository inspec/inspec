require "license_acceptance/strategy/base"

module LicenseAcceptance
  module Strategy

    # Look for acceptance values in the ARGV
    class Argument < Base

      attr_reader :argv

      def initialize(argv)
        @argv = argv
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
        if argv.include?("--chef-license=#{sought}")
          return true
        end

        i = argv.index("--chef-license")
        unless i.nil?
          val = argv[i + 1]
          if !val.nil? && val.downcase == sought
            return true
          end
        end
        false
      end
    end
  end
end
