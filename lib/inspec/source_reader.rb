# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'inspec/plugins'
require 'utils/plugin_registry'

module Inspec
  # Pre-checking of target resolution. Make sure that SourceReader plugins
  # always receive a fetcher.
  class SourceReaderRegistry < PluginRegistry
    def resolve(target)
      return nil if target.nil?
      super(target)
    end
  end

  SourceReader = SourceReaderRegistry.new

  def self.source_reader(version)
    if version != 1
      raise 'Only source readers version 1 is supported!'
    end
    Inspec::Plugins::SourceReader
  end
end

require 'source_readers/inspec'
require 'source_readers/flat'
