require "inspec/cli"
module InspecPlugins
  module Parallelism
    class Validator
      attr_accessor :invocations, :sub_cmd, :thor_options_for_sub_cmd, :aliases_mapping

      def initialize(invocations, sub_cmd = "exec")
        @invocations = invocations
        @sub_cmd = sub_cmd
        @thor_options_for_sub_cmd = Inspec::InspecCLI.commands[sub_cmd].options
        @aliases_mapping = create_aliases_mapping
      end

      def validate
        invocations.each do |invocation_data|
          invocation_data[:validation_errors] = []

          convert_cli_to_thor_options(invocation_data)
          check_for_spurious_options(invocation_data)
          check_for_required_fields(invocation_data)
        end
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

      def check_for_spurious_options(invocation_data)
        invalid_options = []
        invocation_data[:thor_opts].each do |option_name|
          if thor_options_for_sub_cmd[option_name.to_sym].nil? && aliases_mapping[option_name.to_sym].nil?
            invalid_options << option_name
          end
        end
        invocation_data[:validation_errors].push "No such option: #{invalid_options}" unless invalid_options.empty?
      end

      def check_for_required_fields(invocation_data)
        required_fields = thor_options_for_sub_cmd.collect { |_, thor_option| thor_option.name if thor_option.required }.compact
        option_keys = invocation_data[:thor_opts]
        invocation_data[:thor_opts].map { |key| option_keys.push(aliases_mapping[key.to_sym]) if aliases_mapping[key.to_sym] }
        if !required_fields.empty? && (option_keys & required_fields).empty?
          invocation_data[:validation_errors].push "No value provided for required options: #{required_fields}"
        end
      end

      ## Utility functions

      def convert_cli_to_thor_options(invocation_data)
        invocation_string = invocation_data[:value]
        splitted_result = invocation_string.split(" ")
        splitted_result = splitted_result.select { |res| res.start_with?("-") }
        invocation_data[:thor_opts] = splitted_result.map do |res|
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
