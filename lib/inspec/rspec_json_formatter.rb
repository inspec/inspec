# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rspec/core'
require 'rspec/core/formatters/json_formatter'

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
        impact: example.metadata[:impact],
      }
    end
  end
end

class InspecRspecFormatter < RSpec::Core::Formatters::JsonFormatter
  RSpec::Core::Formatters.register self, :message, :dump_summary, :dump_profile, :stop, :close

  def add_profile(profile)
    @profiles ||= []
    @profiles.push(profile)
  end

  def dump_summary(summary)
    super(summary)
    @output_hash[:profiles] = @profiles.map do |profile|
      r = profile.params.dup
      r.delete(:rules)
      r
    end
  end

  private

  def format_example(example)
    res = {
      id: example.metadata[:id],
      title: example.metadata[:title],
      desc: example.metadata[:desc],
      code: example.metadata[:code],
      impact: example.metadata[:impact],
      status: example.execution_result.status.to_s,
      code_desc: example.full_description,
      ref: example.metadata['file_path'],
      ref_line: example.metadata['line_number'],
      run_time: example.execution_result.run_time,
      start_time: example.execution_result.started_at.to_s,
    }

    # pending messages are embedded in the resources description
    res[:pending] = example.metadata[:description] if res[:status] == 'pending'

    res
  end
end
