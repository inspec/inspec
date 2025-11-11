require_relative "base"
require_relative "../checker"

module InspecPlugins::Suggest
  class SuggToolCommand < Inspec.plugin(2, :cli_command)

    option :fail_fast, type: :boolean, default: false,
      desc: "Stop after any one file has errors."
    option :ignore_errors, type: :boolean, default: false,
      desc: "Continue even if at least one file has errors"
    option :disable_check, type: :array,
      desc: "List of names of checks to disable"

    desc "check SETNAME", "Check suggestion criteria for common problems."
    def check(*requested_sets)
      setup(requested_sets)

      # Option disable-check is handled by Checker
      checker = InspecPlugins::Suggest::Checker.new(cli_options: options, config: @cfg, ui: ui)
      error_count, warning_count, file_count = 0, 0, 0

      with_requested_sets do |set_name, set_cfg|
        with_matching_files(set_cfg) do |control_file_path|
          file_info = {
            full_path: control_file_path,
            rel_path: control_file_path.sub(Inspec.src_root + "/", ""),
            errors: [],
            warnings: [],
            # checks may add fields for message passing
          }

          ui.info("checking #{file_info[:rel_path]}")

          checker.each_check(set_name) do |check|
            # Runs the check and modifies file_info with errors and warnings
            # Returns false if processing should stop
            break unless check.run(file_info)
          end

          file_info[:warnings].each { |warning| ui.warning("#{file_info[:rel_path]}: #{warning}") }
          file_info[:errors].each { |error| ui.error("#{file_info[:rel_path]}: #{error}") }

          error_count += file_info[:errors].count
          warning_count += file_info[:warnings].count
          file_count += 1

          ui.exit(:usage_error) if options[:fail_fast] && !file_info[:errors].empty?
        end # each path
      end # each set

      ui.info("check: Saw #{error_count} error(s), #{warning_count} warning(s) over #{file_count} files")
      ui.exit(:usage_error) unless options[:ignore_errors] || error_count == 0
    end # def check
  end
end
