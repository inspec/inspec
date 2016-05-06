# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rspec/core'
require 'rspec/core/formatters/json_formatter'

# Vanilla RSpec JSON formatter with a slight extension to show example IDs.
# TODO: Remove these lines when RSpec includes the ID natively
class InspecRspecVanilla < RSpec::Core::Formatters::JsonFormatter
  RSpec::Core::Formatters.register self, :message, :dump_summary, :dump_profile, :stop, :close

  private

  def format_example(example)
    res = super(example)
    res[:id] = example.metadata[:id]
    res
  end
end

# Minimal JSON formatter for inspec. Only contains limited information about
# examples without any extras.
class InspecRspecMiniJson < RSpec::Core::Formatters::JsonFormatter
  RSpec::Core::Formatters.register self, :message, :dump_summary, :dump_profile, :stop, :close

  def dump_summary(summary)
    @output_hash[:version] = Inspec::VERSION
    @output_hash[:summary] = {
      duration: summary.duration,
      example_count: summary.example_count,
      failure_count: summary.failure_count,
      skip_count: summary.pending_count,
    }
  end

  def stop(notification)
    @output_hash[:controls] = notification.examples.map do |example|
      format_example(example).tap do |hash|
        e = example.exception
        next unless e
        hash[:message] = e.message

        next if e.is_a? RSpec::Expectations::ExpectationNotMetError
        hash[:exception] = e.class.name
        hash[:backtrace] = e.backtrace
      end
    end
  end

  private

  def format_example(example)
    res = {
      id: example.metadata[:id],
      status: example.execution_result.status.to_s,
      code_desc: example.full_description,
    }

    unless (pid = example.metadata[:profile_id]).nil?
      res[:profile_id] = pid
    end

    if res[:status] == 'pending'
      res[:status] = 'skipped'
      res[:skip_message] = example.metadata[:description]
      res[:resource] = example.metadata[:described_class].to_s
    end

    res
  end
end

class InspecRspecJson < InspecRspecMiniJson
  RSpec::Core::Formatters.register self, :message, :dump_summary, :dump_profile, :stop, :close

  def add_profile(profile)
    @profiles ||= []
    @profiles.push(profile)
  end

  def dump_one_example(example, profiles, missing)
    profile = profiles[example[:profile_id]]
    return missing.push(example) if profile.nil? || profile[:controls].nil?

    control = profile[:controls][example[:id]]
    return missing.push(example) if control.nil?

    control[:results] ||= []
    example.delete(:id)
    example.delete(:profile_id)
    control[:results].push(example)
  end

  def profile_info(profile)
    info = profile.info.dup
    [info[:name], info]
  end

  def dump_summary(summary)
    super(summary)
    @profiles ||= []
    examples = @output_hash.delete(:controls)
    profiles = Hash[@profiles.map { |x| profile_info(x) }]
    missing = []

    examples.each do |example|
      dump_one_example(example, profiles, missing)
    end

    @output_hash[:profiles] = profiles
    @output_hash[:other_checks] = missing
  end

  private

  def format_example(example)
    super(example).tap do |res|
      res[:run_time]   = example.execution_result.run_time
      res[:start_time] = example.execution_result.started_at.to_s
    end
  end
end
