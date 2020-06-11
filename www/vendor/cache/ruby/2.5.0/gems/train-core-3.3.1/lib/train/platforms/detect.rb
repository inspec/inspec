# encoding: utf-8

module Train::Platforms
  module Detect
    # Main detect method to scan all platforms for a match
    #
    # @return Train::Platform instance or error if none found
    def self.scan(backend)
      Scanner.new(backend).scan
    end
  end
end
