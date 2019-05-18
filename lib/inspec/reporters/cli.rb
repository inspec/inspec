
module Inspec::Reporters
  class CLI < Base
    case RUBY_PLATFORM
    when /windows|mswin|msys|mingw|cygwin/
      # Most currently available Windows terminals have poor support
      # for ANSI extended colors
      COLORS = {
        'failed'   => "\033[0;1;31m",
        'passed'   => "\033[0;1;32m",
        'skipped'  => "\033[0;37m",
        'reset'    => "\033[0m",
      }.freeze

      # Most currently available Windows terminals have poor support
      # for UTF-8 characters so use these boring indicators
      INDICATORS = {
        'failed'   => '[FAIL]',
        'skipped'  => '[SKIP]',
        'passed'   => '[PASS]',
        'unknown'  => '[UNKN]',
      }.freeze
    else
      # Extended colors for everyone else
      COLORS = {
        'failed'   => "\033[38;5;9m",
        'passed'   => "\033[38;5;41m",
        'skipped'  => "\033[38;5;247m",
        'reset'    => "\033[0m",
      }.freeze

      # Groovy UTF-8 characters for everyone else...
      # ...even though they probably only work on Mac
      INDICATORS = {
        'failed'   => '×',
        'skipped'  => '↺',
        'passed'   => '✔',
        'unknown'  => '?',
      }.freeze
    end

    MULTI_TEST_CONTROL_SUMMARY_MAX_LEN = 60

    def render
      run_data[:profiles].each do |profile|
        if profile[:status] == 'skipped'
          platform = run_data[:platform]
          output("Skipping profile: '#{profile[:name]}' on unsupported platform: '#{platform[:name]}/#{platform[:release]}'.")
          next
        end
        @control_count = 0
        output('')
        print_profile_header(profile)
        print_standard_control_results(profile)
        print_anonymous_control_results(profile)
        output(format_message(
                 indentation: 5,
                 message: 'No tests executed.',
        )) if @control_count == 0
      end

      output('')
      print_profile_summary
      print_tests_summary
    end

    private

    def print_profile_header(profile)
      header = {
        'Profile' => format_profile_name(profile),
        'Version' => profile[:version] || '(not specified)',
      }
      header['Target'] = run_data[:platform][:target] unless run_data[:platform][:target].nil?
      header['Target ID'] = @config['target_id'] unless @config['target_id'].nil?

      pad = header.keys.max_by(&:length).length + 1
      header.each do |title, value|
        output(format("%-#{pad}s %s", title + ':', value))
      end
      output('')
    end

    def print_standard_control_results(profile)
      standard_controls_from_profile(profile).each do |control_from_profile|
        control = Control.new(control_from_profile)
        next if control.results.nil?
        output(format_control_header(control))
        control.results.each do |result|
          output(format_result(control, result, :standard))
          @control_count += 1
        end
      end
      output('') if @control_count > 0
    end

    def print_anonymous_control_results(profile)
      anonymous_controls_from_profile(profile).each do |control_from_profile|
        control = Control.new(control_from_profile)
        next if control.results.nil?
        output(format_control_header(control))
        control.results.each do |result|
          output(format_result(control, result, :anonymous))
          @control_count += 1
        end
      end
    end

    def format_profile_name(profile)
      if profile[:title].nil?
        (profile[:name] || 'unknown').to_s
      else
        "#{profile[:title]} (#{profile[:name] || 'unknown'})"
      end
    end

    def format_control_header(control)
      impact = control.impact_string
      format_message(
        color: impact,
        indicator: impact,
        message: control.title_for_report,
      )
    end

    def format_result(control, result, type)
      impact = control.impact_string_for_result(result)

      message = if result[:status] == 'skipped'
                  result[:skip_message]
                elsif type == :anonymous
                  result[:expectation_message]
                else
                  result[:code_desc]
                end

      # append any failure details to the message if they exist
      message += "\n#{result[:message]}" if result[:message]

      format_message(
        color: impact,
        indicator: impact,
        indentation: 5,
        message: message,
      )
    end

    def format_message(message_info)
      indicator = message_info[:indicator]
      color = message_info[:color]
      indentation = message_info.fetch(:indentation, 2)
      message = message_info[:message]

      message_to_format = ''
      message_to_format += "#{INDICATORS[indicator]}  " unless indicator.nil?
      message_to_format += message.to_s.lstrip.force_encoding(Encoding::UTF_8)

      format_with_color(color, indent_lines(message_to_format, indentation))
    end

    def format_with_color(color_name, text)
      return text if defined?(RSpec.configuration) && !RSpec.configuration.color
      return text unless COLORS.key?(color_name)

      "#{COLORS[color_name]}#{text}#{COLORS['reset']}"
    end

    def all_unique_controls
      @unique_controls ||= begin
                             run_data[:profiles].flat_map { |profile|
                               profile[:controls]
                             }.uniq
                           end
    end

    def profile_summary
      failed = 0
      skipped = 0
      passed = 0

      all_unique_controls.each do |control|
        next if control[:id].start_with? '(generated from '
        next unless control[:results]
        if control[:results].any? { |r| r[:status] == 'failed' }
          failed += 1
        elsif control[:results].any? { |r| r[:status] == 'skipped' }
          skipped += 1
        else
          passed += 1
        end
      end

      total = failed + passed + skipped

      {
        'total' => total,
        'failed' => failed,
        'skipped' => skipped,
        'passed' => passed,
      }
    end

    def tests_summary
      total = 0
      failed = 0
      skipped = 0
      passed = 0

      all_unique_controls.each do |control|
        next unless control[:results]
        control[:results].each do |result|
          if result[:status] == 'failed'
            failed += 1
          elsif result[:status] == 'skipped'
            skipped += 1
          else
            passed += 1
          end
        end
      end

      {
        'total' => total,
        'failed' => failed,
        'skipped' => skipped,
        'passed' => passed,
      }
    end

    def print_profile_summary
      summary = profile_summary
      return unless summary['total'] > 0

      success_str = summary['passed'] == 1 ? '1 successful control' : "#{summary['passed']} successful controls"
      failed_str  = summary['failed'] == 1 ? '1 control failure' : "#{summary['failed']} control failures"
      skipped_str = summary['skipped'] == 1 ? '1 control skipped' : "#{summary['skipped']} controls skipped"

      success_color = summary['passed'] > 0 ? 'passed' : 'no_color'
      failed_color = summary['failed'] > 0 ? 'failed' : 'no_color'
      skipped_color = summary['skipped'] > 0 ? 'skipped' : 'no_color'

      s = format(
        'Profile Summary: %s, %s, %s',
        format_with_color(success_color, success_str),
        format_with_color(failed_color, failed_str),
        format_with_color(skipped_color, skipped_str),
      )
      output(s) if summary['total'] > 0
    end

    def print_tests_summary
      summary = tests_summary

      failed_str = summary['failed'] == 1 ? '1 failure' : "#{summary['failed']} failures"

      success_color = summary['passed'] > 0 ? 'passed' : 'no_color'
      failed_color = summary['failed'] > 0 ? 'failed' : 'no_color'
      skipped_color = summary['skipped'] > 0 ? 'skipped' : 'no_color'

      s = format(
        'Test Summary: %s, %s, %s',
        format_with_color(success_color, "#{summary['passed']} successful"),
        format_with_color(failed_color, failed_str),
        format_with_color(skipped_color, "#{summary['skipped']} skipped"),
      )

      output(s)
    end

    def standard_controls_from_profile(profile)
      profile[:controls].reject { |c| is_anonymous_control?(c) }
    end

    def anonymous_controls_from_profile(profile)
      profile[:controls].select { |c| is_anonymous_control?(c) && !c[:results].nil? }
    end

    def is_anonymous_control?(control)
      control[:id].start_with?('(generated from ')
    end

    def indent_lines(message, indentation)
      message.lines.map { |line| ' ' * indentation + line }.join
    end

    class Control
      attr_reader :data

      def initialize(control_hash)
        @data = control_hash
      end

      def id
        data[:id]
      end

      def title
        data[:title]
      end

      def results
        data[:results]
      end

      def impact
        data[:impact]
      end

      def anonymous?
        id.start_with?('(generated from ')
      end

      def title_for_report
        # if this is an anonymous control, just grab the resource title from any result entry
        return results.first[:resource_title] if anonymous?

        title_for_report = "#{id}: #{title || results.first[:resource_title]}"

        # we will not add any additional data to the title if there's only
        # zero or one test for this control.
        return title_for_report if results.nil? || results.size <= 1

        # append a failure summary if appropriate.
        title_for_report += " (#{failure_count} failed)" if failure_count > 0
        title_for_report += " (#{skipped_count} skipped)" if skipped_count > 0

        title_for_report
      end

      def impact_string
        if anonymous?
          nil
        elsif impact.nil?
          'unknown'
        elsif results&.find { |r| r[:status] == 'skipped' }
          'skipped'
        elsif results.nil? || results.empty? || results.all? { |r| r[:status] == 'passed' }
          'passed'
        else
          'failed'
        end
      end

      def impact_string_for_result(result)
        if result[:status] == 'skipped'
          'skipped'
        elsif result[:status] == 'passed'
          'passed'
        elsif impact.nil?
          'unknown'
        else
          'failed'
        end
      end

      def failure_count
        results.select { |r| r[:status] == 'failed' }.size
      end

      def skipped_count
        results.select { |r| r[:status] == 'skipped' }.size
      end
    end
  end
end
