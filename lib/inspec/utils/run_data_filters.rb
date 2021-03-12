module Inspec
  module Utils
    #   RunDataFilters is a mixin for core Reporters and plugin reporters.
    # The methods operate on the run_data Hash (prior to any conversion to a
    # full RunData object).
    #   All methods here operate using the run_data accessor and modify
    # its contents in place (if needed).
    module RunDataFilters

      # Long name, but we want to be clear this operates on the Hash
      # This is the only method that client libraries need to call; any future
      # feature growth should be handled internally here.
      def apply_run_data_filters_to_hash
        @config[:runtime_config] = Inspec::Config.cached || {}
        apply_report_resize_options
        filter_empty_profiles
        redact_sensitive_inputs
        suppress_diff_output
        sort_controls
      end

      # Apply options such as message and code_desc truncation, and removal of backtraces
      def apply_report_resize_options
        runtime_config = @config[:runtime_config]

        message_truncation = runtime_config[:reporter_message_truncation] || "ALL"
        @trunc = message_truncation == "ALL" ? -1 : message_truncation.to_i
        include_backtrace = runtime_config[:reporter_backtrace_inclusion].nil? ? true : runtime_config[:reporter_backtrace_inclusion]

        @run_data[:profiles]&.each do |p|
          p[:controls].each do |c|
            c[:results]&.map! do |r|
              r.delete(:backtrace) unless include_backtrace
              process_truncation(r)
            end
          end
        end
      end

      # Filters profiles from report which don't have controls in it.
      def filter_empty_profiles
        runtime_config = @config[:runtime_config]
        if runtime_config[:filter_empty_profiles] && @run_data[:profiles].count > 1
          @run_data[:profiles].delete_if { |p| p[:controls].empty? }
        end
      end

      # Find any inputs with :sensitive = true and replace their values with "***"
      def redact_sensitive_inputs
        @run_data[:profiles]&.each do |p|
          p[:inputs]&.each do |i|
            next unless i[:options][:sensitive]

            i[:options][:value] = "***"
          end
        end
      end

      # Optionally suppress diff output in the message field
      def suppress_diff_output
        return if @config[:runtime_config][:diff]

        @run_data[:profiles]&.each do |p|
          p[:controls]&.each do |c|
            c[:results]&.each do |r|
              next unless r[:message] # :message only set on failure

              pos = r[:message].index("\n\nDiff:")
              next unless pos # Only textual tests get Diffs

              r[:message] = r[:message].slice(0, pos)
            end
          end
        end
      end

      # Optionally sort controls within each profile in report
      def sort_controls
        sort_type = @config[:runtime_config][:sort_results_by]
        return unless sort_type
        return if sort_type == "none"

        @run_data[:profiles]&.each do |p|
          p[:controls] ||= []
          p[:groups] ||= []

          case sort_type
          when "control"
            p[:controls].sort_by! { |c| c[:id] }
          when "random"
            p[:controls].shuffle!
          when "file"
            # Sort the controls by file, but preserve order within the file.
            # Files are called "groups" in the run_data, and the filename is in the id.
            sorted_control_ids = p[:groups].sort_by { |g| g[:id] }.map { |g| g[:controls] }.flatten
            controls_by_id = {}
            p[:controls].each { |c| controls_by_id[c[:id]] = c }
            p[:controls] = sorted_control_ids.map { |cid| controls_by_id[cid] }
          end
        end
      end

      private

      def process_truncation(result)
        %i{code_desc message}.each do |field|
          if result.key?(field) && result[field] != "" && @trunc > -1 && result[field].length > @trunc
            result[field] = result[field][0...@trunc] + "[Truncated to #{@trunc} characters]"
          end
        end
        result
      end
    end
  end
end
