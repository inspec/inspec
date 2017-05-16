# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec
  module MethodSource
    def self.code_at(location, source_reader)
      # TODO: logger for these cases
      return '' if location.nil? || location[:ref].nil? || location[:line].nil?
      return '' unless source_reader && source_reader.target

      # TODO: Non-controls still need more detection
      ref = location[:ref]
      ref = ref.sub(source_reader.target.prefix, '')
      src = source_reader.tests[ref]
      return '' if src.nil?

      ::MethodSource.expression_at(src.lines, location[:line]).force_encoding('utf-8')
    rescue SyntaxError => e
      raise ::MethodSource::SourceNotFoundError,
            "Could not parse source at #{location[:ref]}:#{location[:line]}: #{e.message}"
    end
  end
end
