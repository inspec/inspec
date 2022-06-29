module Inspec::Reporters
  class CLI < Base
    case RUBY_PLATFORM
    when /windows|mswin|msys|mingw|cygwin/
      # Most currently available Windows terminals have poor support
      # for ANSI extended colors
      COLORS = {
        "failed" => "\033[0;1;31m",
        "passed" => "\033[0;1;32m",
        "skipped" => "\033[0;37m",
        "reset" => "\033[0m",
        "error" => "\033[34m",
        "not_applicable" => "\033[36m",
        "not_reviewed" => "\033[33m",
      }.freeze

      # Most currently available Windows terminals have poor support
      # for UTF-8 characters so use these boring indicators
      INDICATORS = {
        "failed" => "[FAIL]",
        "skipped" => "[SKIP]",
        "passed" => "[PASS]",
        "unknown" => "[UNKN]",
        "error" => "[ERR]",
        "not_applicable" => "[N/A]",
        "not_reviewed" => "[N/R]",
      }.freeze
    else
      # Extended colors for everyone else
      COLORS = {
        "failed" => "\033[38;5;9m",
        "passed" => "\033[38;5;41m",
        "skipped" => "\033[38;5;247m",
        "reset" => "\033[0m",
        "error" => "\033[0;38;5;21m",
        "not_applicable" => "\033[0;38;5;117m",
        "not_reviewed" => "\033[0;38;5;214m",
      }.freeze

      # Groovy UTF-8 characters for everyone else...
      # ...even though they probably only work on Mac
      INDICATORS = {
        "failed" => "×",
        "skipped" => "↺",
        "passed" => "✔",
        "unknown" => "?",
        "error" => "ERR",
        "not_applicable" => "N/A",
        "not_reviewed" => "N/R",
      }.freeze
    end

    MULTI_TEST_CONTROL_SUMMARY_MAX_LEN = 60

    def render
      @src_extent_map = {}
      run_data[:profiles].each do |profile|
        if profile[:status] == "skipped"
          platform = run_data[:platform]
          output("Skipping profile: '#{profile[:name]}' on unsupported platform: '#{platform[:name]}/#{platform[:release]}'.")
          next
        end
        read_control_source(profile)
        @control_count = 0
        output("")
        print_profile_header(profile)
        print_standard_control_results(profile)
        print_anonymous_control_results(profile)
        if @control_count == 0
          output(format_message(
            indentation: 5,
            message: "No tests executed."
          ))
        end
      end

      output("")
      if enhanced_outcomes
        print_control_outcomes_summary
      else
        print_profile_summary
      end
      print_tests_summary
    end

    private

    def print_profile_header(profile)
      header = {
        "Profile" => format_profile_name(profile),
        "Version" => profile[:version] || "(not specified)",
      }
      header["Failure Message"] = profile[:status_message] if profile[:status] == "failed"
      header["Target"] = run_data[:platform][:target] unless run_data[:platform][:target].nil?
      header["Target ID"] = run_data[:platform][:target_id] || ""

      pad = header.keys.max_by(&:length).length + 1
      header.each do |title, value|
        output(format("%-#{pad}s %s", title + ":", value))
      end
      output("")
    end

    def print_standard_control_results(profile)
      standard_controls_from_profile(profile).each do |control_from_profile|
        control = Control.new(control_from_profile)
        control.enhanced_outcomes = enhanced_outcomes
        next if control.results.nil?

        output(format_control_header(control))
        output(format_control_source(control)) if Inspec::Config.cached[:reporter_include_source]
        control.results.each do |result|
          output(format_result(control, result, :standard))
          @control_count += 1
        end
      end
      output("") if @control_count > 0
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
        (profile[:name] || "unknown").to_s
      else
        "#{profile[:title]} (#{profile[:name] || "unknown"})"
      end
    end

    def format_control_header(control)
      impact = enhanced_outcomes ? control.impact_string_for_enhanced_outcomes : control.impact_string
      format_message(
        color: impact,
        indicator: impact,
        message: control.title_for_report
      )
    end

    def format_control_source(control)
      src = @control_source[control.id]
      message  = "Control Source from #{src[:path]}:#{src[:start]}..#{src[:end]}\n"
      message += src[:content]
      format_message(
        color: "skipped",
        indentation: 5,
        message: message
      )
    end

    def read_control_source(profile)
      return unless Inspec::Config.cached[:reporter_include_source]

      @control_source = {}
      src_extent_map = {}

      # First pass: build map of paths => ids => [start]
      all_unique_controls.each do |control|
        id = control[:id]
        path = control[:source_location][:ref]
        start = control[:source_location][:line]
        next if path.nil? || start.nil?

        src_extent_map[path] ||= []
        src_extent_map[path] << { start: start, id: id }
      end

      # Now sort the controls by their starting line in their control file
      src_extent_map.values.each do |extent_list|
        extent_list.sort! { |a, b| a[:start] <=> b[:start] }
      end

      # Third pass: Read in files and split into lines
      src_extent_map.keys.each do |path|
        control_file_lines = File.read(path).lines # TODO error handling
        last_line_in_file = control_file_lines.count
        extent_list = src_extent_map[path]
        extent_list.each_with_index do |extent, idx|
          if idx == extent_list.count - 1 # Last entry
            extent[:end] = last_line_in_file
          else
            extent[:end] = extent_list[idx + 1][:start] - 1
          end

          @control_source[extent[:id]] =
            {
              path: path,
              start: extent[:start],
              end: extent[:end],
              content: control_file_lines.slice(extent[:start] - 1, extent[:end] - extent[:start] + 1).join(""),
            }
        end
      end
    end

    def format_result(control, result, type)
      impact = control.impact_string_for_result(result)

      message = if result[:status] == "skipped"
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
        message: message
      )
    end

    def format_message(message_info)
      indicator = message_info[:indicator]
      color = message_info[:color]
      indentation = message_info.fetch(:indentation, 2)
      message = message_info[:message]

      message_to_format = ""
      message_to_format += "#{INDICATORS[indicator]}  " unless indicator.nil?
      message_to_format += message.to_s.lstrip.force_encoding(Encoding::UTF_8)

      format_with_color(color, indent_lines(message_to_format, indentation))
    end

    def format_with_color(color_name, text)
      return text if defined?(RSpec.configuration) && !RSpec.configuration.color
      return text unless COLORS.key?(color_name)

      "#{COLORS[color_name]}#{text}#{COLORS["reset"]}"
    end

    def all_unique_controls
      @unique_controls ||= begin # rubocop:disable Style/RedundantBegin
                             run_data[:profiles].flat_map do |profile|
                               profile[:controls]
                             end.uniq
                           end
    end

    def profile_summary
      failed = 0
      skipped = 0
      passed = 0

      all_unique_controls.each do |control|
        next if control[:id].start_with? "(generated from "
        next unless control[:results]

        if control[:results].any? { |r| r[:status] == "failed" }
          failed += 1
        elsif control[:results].any? { |r| r[:status] == "skipped" }
          skipped += 1
        else
          passed += 1
        end
      end

      total = failed + passed + skipped

      {
        "total" => total,
        "failed" => failed,
        "skipped" => skipped,
        "passed" => passed,
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
          if result[:status] == "failed"
            failed += 1
          elsif result[:status] == "skipped"
            skipped += 1
          else
            passed += 1
          end
        end
      end

      {
        "total" => total,
        "failed" => failed,
        "skipped" => skipped,
        "passed" => passed,
      }
    end

    def control_outcomes_summary
      failed = 0
      passed = 0
      error = 0
      not_reviewed = 0
      not_applicable = 0

      all_unique_controls.each do |control|
        next if control[:status].empty?

        if control[:status] == "failed"
          failed += 1
        elsif control[:status] == "error"
          error += 1
        elsif control[:status] == "not_reviewed"
          not_reviewed += 1
        elsif control[:status] == "not_applicable"
          not_applicable += 1
        else
          passed += 1
        end
      end

      total = failed + passed + error + not_reviewed + not_applicable

      {
        "total" => total,
        "failed" => failed,
        "passed" => passed,
        "error" => error,
        "not_reviewed" => not_reviewed,
        "not_applicable" => not_applicable,
      }
    end

    def print_control_outcomes_summary
      summary = control_outcomes_summary
      return unless summary["total"] > 0

      success_str = summary["passed"] == 1 ? "1 successful control" : "#{summary["passed"]} successful controls"
      failed_str  = summary["failed"] == 1 ? "1 control failure" : "#{summary["failed"]} control failures"
      error_str = summary["error"] == 1 ? "1 control has error" : "#{summary["error"]} controls have error"
      not_rev_str = summary["not_reviewed"] == 1 ? "1 control not reviewed" : "#{summary["not_reviewed"]} controls not reviewed"
      not_app_str = summary["not_applicable"] == 1 ? "1 control not applicable" : "#{summary["not_applicable"]} controls not applicable"

      success_color = summary["passed"] > 0 ? "passed" : "no_color"
      failed_color = summary["failed"] > 0 ? "failed" : "no_color"
      error_color = summary["error"] > 0 ? "error" : "no_color"
      not_rev_color = summary["not_reviewed"] > 0 ? "not_reviewed" : "no_color"
      not_app_color = summary["not_applicable"] > 0 ? "not_applicable" : "no_color"

      s = format(
        "Profile Summary: %s, %s, %s, %s, %s",
        format_with_color(success_color, success_str),
        format_with_color(failed_color, failed_str),
        format_with_color(not_rev_color, not_rev_str),
        format_with_color(not_app_color, not_app_str),
        format_with_color(error_color, error_str)
      )
      output(s) if summary["total"] > 0
    end

    def print_profile_summary
      summary = profile_summary
      return unless summary["total"] > 0

      success_str = summary["passed"] == 1 ? "1 successful control" : "#{summary["passed"]} successful controls"
      failed_str  = summary["failed"] == 1 ? "1 control failure" : "#{summary["failed"]} control failures"
      skipped_str = summary["skipped"] == 1 ? "1 control skipped" : "#{summary["skipped"]} controls skipped"

      success_color = summary["passed"] > 0 ? "passed" : "no_color"
      failed_color = summary["failed"] > 0 ? "failed" : "no_color"
      skipped_color = summary["skipped"] > 0 ? "skipped" : "no_color"

      s = format(
        "Profile Summary: %s, %s, %s",
        format_with_color(success_color, success_str),
        format_with_color(failed_color, failed_str),
        format_with_color(skipped_color, skipped_str)
      )
      output(s) if summary["total"] > 0
    end

    def print_tests_summary
      summary = tests_summary

      failed_str = summary["failed"] == 1 ? "1 failure" : "#{summary["failed"]} failures"

      success_color = summary["passed"] > 0 ? "passed" : "no_color"
      failed_color = summary["failed"] > 0 ? "failed" : "no_color"
      skipped_color = summary["skipped"] > 0 ? "skipped" : "no_color"

      s = format(
        "Test Summary: %s, %s, %s",
        format_with_color(success_color, "#{summary["passed"]} successful"),
        format_with_color(failed_color, failed_str),
        format_with_color(skipped_color, "#{summary["skipped"]} skipped")
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
      control[:id].start_with?("(generated from ")
    end

    def indent_lines(message, indentation)
      message.lines.map { |line| " " * indentation + line }.join
    end

    class Control
      attr_reader :data
      attr_accessor :enhanced_outcomes

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

      def source_location
        data[:source_location]
      end

      def anonymous?
        id.start_with?("(generated from ")
      end

      def status
        data[:status]
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

      def impact_string_for_enhanced_outcomes
        if impact.nil?
          "unknown"
        else
          status
        end
      end

      def impact_string
        if anonymous?
          nil
        elsif impact.nil?
          "unknown"
        elsif results&.find { |r| r[:status] == "skipped" }
          "skipped"
        elsif results.nil? || results.empty? || results.all? { |r| r[:status] == "passed" }
          "passed"
        else
          "failed"
        end
      end

      def impact_string_for_result(result)
        if result[:status] == "skipped"
          "skipped"
        elsif result[:status] == "passed"
          "passed"
        elsif impact.nil?
          "unknown"
        else
          "failed"
        end
      end

      def failure_count
        results.select { |r| r[:status] == "failed" }.size
      end

      def skipped_count
        results.select { |r| r[:status] == "skipped" }.size
      end
    end
  end
end
