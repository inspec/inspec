# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rspec/core'

# Extend the basic RSpec JSON Formatter
# to give us an ID in its output
# TODO: remove once RSpec has IDs in stable (probably v3.3/v4.0)
module RSpec::Core::Formatters
  class JsonFormatter
    private

    def format_example(example)
      {
        description: example.description,
        full_description: example.full_description,
        status: example.execution_result.status.to_s,
        file_path: example.metadata['file_path'],
        line_number: example.metadata['line_number'],
        run_time: example.execution_result.run_time,
        pending_message: example.execution_result.pending_message,
        id: example.metadata[:id],
      }
    end
  end
end
