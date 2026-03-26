require "mixlib/log"

# Redefine the log level integer scale to insert VERBOSE between DEBUG and INFO.
# We shift INFO/WARN/ERROR/FATAL/UNKNOWN each up by 1, giving VERBOSE = 1.
#
# New scale:
#   TRACE = -1, DEBUG = 0, VERBOSE = 1, INFO = 2, WARN = 3, ERROR = 4, FATAL = 5, UNKNOWN = 6
#
# We patch Logger::Severity (stdlib), Mixlib::Log::Logging, and the SEV_LABEL array.

module Logger::Severity
  remove_const :INFO
  remove_const :WARN
  remove_const :ERROR
  remove_const :FATAL
  remove_const :UNKNOWN

  INFO    = 2
  WARN    = 3
  ERROR   = 4
  FATAL   = 5
  UNKNOWN = 6
end

module Mixlib
  module Log
    module Logging
      VERBOSE = 1

      remove_const :SEV_LABEL
      SEV_LABEL = %w{TRACE DEBUG VERBOSE INFO WARN ERROR FATAL ANY}.each(&:freeze).freeze

      remove_const :LEVELS
      LEVELS = {
        trace:   TRACE,
        debug:   DEBUG,
        verbose: VERBOSE,
        info:    ::Logger::INFO,
        warn:    ::Logger::WARN,
        error:   ::Logger::ERROR,
        fatal:   ::Logger::FATAL,
      }.freeze

      remove_const :LEVEL_NAMES
      LEVEL_NAMES = LEVELS.invert.freeze

      def verbose(msg = nil, data: {}, &block)
        msg = block.call if block
        pass(VERBOSE, msg, data: data)
      end

      def verbose?
        logger.level <= VERBOSE
      end
    end
  end
end

# Also patch stdlib Logger's SEV_LABEL so format_severity uses correct labels
Logger.send(:remove_const, :SEV_LABEL)
Logger::SEV_LABEL = %w{TRACE DEBUG VERBOSE INFO WARN ERROR FATAL ANY}.each(&:freeze).freeze

module Inspec
  class Log
    extend Mixlib::Log
  end
end
