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
  attr_writer :backend

  def initialize(*args)
    super(*args)
    @profiles = []
    @backend = nil
  end

  def add_profile(profile)
    @profiles.push(profile)
  end

  def dump_one_example(example, control)
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
    examples = @output_hash.delete(:controls)
    profiles = Hash[@profiles.map { |x| profile_info(x) }]
    missing = []

    examples.each do |example|
      control = example2control(example, profiles)
      next missing.push(example) if control.nil?
      dump_one_example(example, control)
    end

    @output_hash[:profiles] = profiles
    @output_hash[:other_checks] = missing
  end

  private

  def example2control(example, profiles)
    profile = profiles[example[:profile_id]]
    return nil if profile.nil? || profile[:controls].nil?
    profile[:controls][example[:id]]
  end

  def format_example(example)
    super(example).tap do |res|
      res[:run_time]   = example.execution_result.run_time
      res[:start_time] = example.execution_result.started_at.to_s
    end
  end
end

class InspecRspecCli < InspecRspecJson # rubocop:disable Metrics/ClassLength
  RSpec::Core::Formatters.register self, :message, :dump_summary, :dump_profile, :stop, :close

  STATUS_TYPES = {
    'unknown'  => -3,
    'passed'   => -2,
    'skipped'  => -1,
    'minor'    => 1,
    'major'    => 2,
    'failed'   => 2.5,
    'critical' => 3,
  }.freeze

  COLORS = {
    'critical' => "\033[31;1m",
    'major'    => "\033[31m",
    'minor'    => "\033[33m",
    'failed'   => "\033[31m",
    'passed'   => "\033[32m",
    'skipped'  => "\033[37m",
    'reset'    => "\033[0m",
  }.freeze

  INDICATORS = {
    'critical' => '  ✖  ',
    'major'    => '  ✖  ',
    'minor'    => '  ✖  ',
    'failed'   => '  ✖  ',
    'skipped'  => '  ○  ',
    'passed'   => '  ✔  ',
    'unknown'  => '  ?  ',
    'empty'    => '     ',
  }.freeze

  TEST_INDICATORS = {
    'failed'   => '     fail: ',
    'skipped'  => '     skip: ',
    'empty'    => '     ',
  }.freeze

  def initialize(*args)
    @colors = COLORS
    @indicators = INDICATORS
    @test_indicators = TEST_INDICATORS

    @format = '%color%indicator%id%summary'
    @current_control = nil
    @current_profile = nil
    @missing_controls = []
    super(*args)
  end

  def start(_notification)
    @profiles_info ||= Hash[@profiles.map { |x| profile_info(x) }]
  end

  def close(_notification)
    flush_current_control
    output.puts('') unless @current_control.nil?

    @profiles_info.each do |_id, profile|
      next if profile[:already_printed]
      @current_profile = profile
      next unless print_current_profile
      print_line(
        color: '', indicator: @indicators['empty'], id: '', profile: '',
        summary: 'No tests executed.'
      )
      output.puts('')
    end

    res = @output_hash[:summary]
    passed = res[:example_count] - res[:failure_count] - res[:skip_count]
    s = format('Summary: %3d successful  %3d failures  %3d skipped',
               passed, res[:failure_count], res[:skip_count])
    output.puts(s)
  end

  private

  def status_type(data, control)
    status = data[:status]
    return status if status != 'failed' || control[:impact].nil?
    if    control[:impact] > 0.7
      'critical'
    elsif control[:impact] > 0.4
      'major'
    elsif control[:impact] > 0.0
      'minor'
    else
      'failed'
    end
  end

  def current_control_infos
    summary_status = STATUS_TYPES['unknown']
    skips = []
    fails = []
    @current_control[:results].each do |r|
      i = STATUS_TYPES[r[:status_type]]
      summary_status = i if i > summary_status
      fails.push(r) if i > 0
      skips.push(r) if i == STATUS_TYPES['skipped']
    end
    [fails, skips, STATUS_TYPES.key(summary_status)]
  end

  def current_control_summary(fails, skips)
    sum_info = [
      (fails.length > 0) ? "#{fails.length} failed" : nil,
      (skips.length > 0) ? "#{skips.length} skipped" : nil,
    ].compact

    summary = @current_control[:title]
    unless summary.nil?
      return summary + ' (' + sum_info.join(' ') + ')' unless sum_info.empty?
      return summary
    end

    return sum_info.join(' ') if @current_control[:results].length != 1

    fails.clear
    skips.clear
    c = @current_control[:results][0]
    c[:code_desc].to_s + c[:message].to_s
  end

  def format_line(fields)
    @format.gsub(/%\w+/) do |x|
      term = x[1..-1]
      fields.key?(term.to_sym) ? fields[term.to_sym].to_s : x
    end + @colors['reset']
  end

  def print_line(fields)
    output.puts(format_line(fields))
  end

  def format_lines(lines, indentation)
    lines.gsub(/\n/, "\n" + indentation)
  end

  def print_fails_and_skips(all, color)
    all.each do |x|
      indicator = @test_indicators[x[:status]]
      indicator = @test_indicators['empty'] if all.length == 1 || indicator.nil?
      msg = x[:message] || x[:skip_message] || x[:code_desc]
      print_line(
        color:      color,
        indicator:  indicator,
        summary:    format_lines(msg, @test_indicators['empty']),
        id: nil, profile: nil
      )
    end
  end

  def flush_current_control
    return if @current_control.nil?

    prev_profile = @current_profile
    @current_profile = @profiles_info[@current_control[:profile_id]]
    print_current_profile if prev_profile != @current_profile

    fails, skips, summary_indicator = current_control_infos
    summary = current_control_summary(fails, skips)

    control_id = @current_control[:id].to_s
    control_id += ': '
    control_id = '' if control_id.start_with? '(generated from '

    print_line(
      color:      @colors[summary_indicator] || '',
      indicator:  @indicators[summary_indicator] || @indicators['unknown'],
      summary:    format_lines(summary, @indicators['empty']),
      id:         control_id,
      profile:    @current_control[:profile_id],
    )

    print_fails_and_skips(fails + skips, @colors[summary_indicator] || '')
  end

  def print_target(before, after)
    return if @backend.nil?
    connection = @backend.backend
    return unless connection.respond_to?(:uri)
    output.puts(before + connection.uri + after)
  end

  def print_current_profile
    profile = @current_profile
    return false if profile.nil?

    output.puts ''
    profile[:already_printed] = true
    if profile[:name].nil?
      print_target('Target:  ', "\n\n")
      return true
    end

    if profile[:title].nil?
      output.puts "Profile: #{profile[:name] || 'unknown'}"
    else
      output.puts "Profile: #{profile[:title]} (#{profile[:name] || 'unknown'})"
    end

    output.puts 'Version: ' + (profile[:version] || 'unknown')
    print_target('Target:  ', "\n")
    output.puts
    true
  end

  def format_example(example)
    data = super(example)
    control = example2control(data, @profiles_info) || {}
    control[:id] = data[:id]
    control[:profile_id] = data[:profile_id]

    data[:status_type] = status_type(data, control)
    dump_one_example(data, control)

    @current_control ||= control
    if control[:id].nil?
      @missing_controls.push(data)
    elsif @current_control[:id] != control[:id]
      flush_current_control
      @current_control = control
    end

    data
  end
end
