require "license_acceptance/strategy/base"

module LicenseAcceptance
  module Strategy

    # Used for library consumers to parse their own form of acceptance (knife config, omnibus config, etc.) and pass it in
    class ProvidedValue < Base
      attr_reader :value

      def initialize(value)
        @value = value
      end

      def accepted?
        value == ACCEPT
      end

      def silent?
        value == ACCEPT_SILENT
      end

      def no_persist?
        value == ACCEPT_NO_PERSIST
      end
    end

  end
end
