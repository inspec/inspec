# frozen_string_literal: true

module Inspec
  module Utils
    class PamParser
      # Parse PAM configuration file content
      #
      # @param [String] content the raw content of the PAM configuration file
      # @return [Array<Hash>] Collection of PAM rules
      def self.parse(content)
        return [] if content.nil? || content.empty?

        lines = content.split("\n")

        # Handle line continuations
        joined_lines = []
        current_line = ""
        lines.each do |line|
          # Remove comments
          line = line.split("#", 2).first || ""
          line.rstrip!

          if line.end_with?("\\")
            current_line += line[0...-1] + " "
          else
            current_line += line
            joined_lines << current_line unless current_line.strip.empty?
            current_line = ""
          end
        end

        parsed_rules = []
        joined_lines.each do |line|
          line = line.strip
          next if line.empty?

          # Handle Ubuntu Debian-specific @include
          if line.start_with?("@include")
            match = line.match(/^@include\s+(.+)$/)
            if match
              parsed_rules << {
                "type" => "@include",
                "missing_ok" => false,
                "control" => nil,
                "module_path" => match[1].strip,
                "module_arguments" => nil,
                "module_args" => [],
              }
            end
            next
          end

          # Standard PAM rule
          # type [control] module_path [module_args]
          type_match = line.match(/^(\-?\w+)\s+(.+)$/)
          next unless type_match

          type_raw = type_match[1]
          rest = type_match[2]

          type = type_raw.start_with?("-") ? type_raw[1..-1] : type_raw
          missing_ok = type_raw.start_with?("-")

          control = nil
          if rest.start_with?("[")
            ctrl_match = rest.match(/^(\[[^\]]+\])(?:\s+(.*))?$/)
            if ctrl_match
              control = ctrl_match[1]
              rest = ctrl_match[2]
            else
              next # Malformed control syntax
            end
          else
            ctrl_match = rest.match(/^(\S+)(?:\s+(.*))?$/)
            if ctrl_match
              control = ctrl_match[1]
              rest = ctrl_match[2]
            else
              next
            end
          end

          rest = rest.to_s.strip
          next if rest.empty? # module_path is required for standard PAM rules

          mod_match = rest.match(/^(\S+)(?:\s+(.*))?$/)
          if mod_match
            mod_path = mod_match[1]
            mod_args = mod_match[2] || ""

            parsed_rules << {
              "type" => type,
              "missing_ok" => missing_ok,
              "control" => control,
              "module_path" => mod_path,
              "module_args" => mod_args.strip.split(/\s+/),
            }
          end
        end
        parsed_rules
      end
    end
  end
end
