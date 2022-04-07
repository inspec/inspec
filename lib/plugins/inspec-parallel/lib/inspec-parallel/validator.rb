require "inspec/cli"
module InspecPlugins
  module Parallel
    class Validator
      attr_accessor :parsed_options, :sub_cmd, :thor_options_for_sub_cmd, :aliases_mapping

      def initialize(parsed_options, sub_cmd = "exec")
        @parsed_options = parsed_options
        @sub_cmd = sub_cmd
        @thor_options_for_sub_cmd = Inspec::InspecCLI.commands[sub_cmd].options
        @aliases_mapping = create_aliases_mapping
        @logger = Inspec::Log
        @validation_error_each_line = ""
      end

      def validate!
        validation_passed = true
        parsed_options.each.with_index(1) do |opts, index|
          @validation_error_each_line = ""
          each_line_opts = get_options(opts)
          validate_options(each_line_opts)
          check_for_required_fields(each_line_opts)

          @validation_error_each_line.split("|").each do |error_message|
            validation_passed = false
            @logger.error "Line#{index}: " + error_message
          end
        end
        validation_passed
      end

      private

      def create_aliases_mapping
        alias_mapping = {}
        thor_options_for_sub_cmd.each do |_, sub_cmd_option|
          aliases = sub_cmd_option.aliases
          unless aliases.empty?
            alias_mapping[aliases[0]] = sub_cmd_option.name
          end
        end
        alias_mapping
      end

      def validate_options(each_line_opts)
        invalid_options = []
        each_line_opts.each do |option_name|
          if thor_options_for_sub_cmd[option_name.to_sym].nil? && aliases_mapping[option_name.to_sym].nil?
            invalid_options << option_name
          end
        end
        @validation_error_each_line += "Invalid options: #{invalid_options} |" unless invalid_options.empty?
      end

      def check_for_required_fields(each_line_opts)
        required_fields = thor_options_for_sub_cmd.collect { |_, thor_option| thor_option.name if thor_option.required }.compact
        option_keys = each_line_opts
        each_line_opts.map { |key| option_keys.push(aliases_mapping[key.to_sym]) if aliases_mapping[key.to_sym] }
        if !required_fields.empty? && (option_keys & required_fields).empty?
          @validation_error_each_line += "No value provided for required options: #{required_fields} |"
        end
      end

      ## Utility functions

      def get_options(option_line)
        splitted_result = option_line.split(" ")
        splitted_result = splitted_result.select { |res| res.start_with?("-") }
        splitted_result.map do |res|
          to_replace = if res.start_with?("--")
                         res.start_with?("--no-") ? "--no-" : "--"
                       else
                         "-"
                       end
          res.delete_prefix(to_replace).gsub("-", "_")
        end
      end
    end
  end
end