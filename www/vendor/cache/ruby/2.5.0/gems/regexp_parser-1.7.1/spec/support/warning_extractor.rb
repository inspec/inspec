require 'set'
require 'delegate'

module RegexpParserSpec
  class Warning
    class UnexpectedWarnings < StandardError
      MSG = 'Unexpected warnings: %s'.freeze

      def initialize(warnings)
        super(MSG % warnings.join("\n"))
      end
    end

    class Filter
      def initialize(whitelist)
        @whitelist = whitelist
      end

      def assert_expected_warnings_only
        original = $stderr
        $stderr  = Extractor.new(original, @whitelist)

        yield

        assert_no_warnings($stderr.warnings)
      ensure
        $stderr = original
      end

      private

      def assert_no_warnings(warnings)
        raise UnexpectedWarnings, warnings.to_a if warnings.any?
      end
    end

    class Extractor < DelegateClass(IO)
      PATTERN = /\A(?:.+):(?:\d+): warning: (?:.+)\n\z/

      def initialize(io, whitelist)
        @whitelist = whitelist
        @warnings  = Set.new
        super(io)
      end

      def write(message)
        return super if PATTERN !~ message

        warning = message.chomp
        @warnings << warning if @whitelist.none?(&warning.method(:include?))

        self
      end

      def warnings
        @warnings.dup.freeze
      end
    end
  end
end
