require "singleton"
require "logger"

module Servolux
  # A "do nothing" implementation of the standard Ruby Logger class.
  class NullLogger < Logger
    include Singleton
    def initialize(*args); end
    def add(*args, &block); end
  end

  # Syntactic sugar for getting the null logger instance.
  #
  #   Servolux::NullLogger()   #=> NullLogger singleton instance
  #
  def self.NullLogger
    NullLogger.instance
  end
end
