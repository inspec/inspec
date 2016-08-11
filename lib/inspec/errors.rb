# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec
  class Error < StandardError; end

  # dependency resolution
  class CyclicDependencyError < Error; end
  class VersionConflict < Error
    attr_reader :conflicts
    def initialize(conflicts, msg = nil)
      super(msg)
      @conflicts = conflicts
    end
  end
end
