require "inspec/resources/command"

module Inspec
  module Utils
    module Podman
      def podman_running?
        inspec.command("podman version").exit_status == 0
      end

      # Generates the template in this format using labels hash: "\"id\": {{json .ID}}, \"name\": {{json .Name}}",
      def generate_go_template(labels)
        (labels.map { |k, v| "\"#{k}\": {{json .#{v}}}" }).join(", ")
      end

      def parse_command_output(output)
        require "json" unless defined?(JSON)
        JSON.parse(output)
      rescue JSON::ParserError => _e
        warn "Could not parse the command output"
        {}
      end
    end
  end
end