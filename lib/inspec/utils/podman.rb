require "inspec/resources/command"

module Inspec
  module Utils
    module Podman
      def podman_running?
        inspec.command("podman version").exit_status == 0
      end

      def generate_go_template(labels)
        (labels.map { |k, v| "\"#{k}\": {{json .#{v}}}" }).join(", ")
      end

      def inspect_command(subcommand)
        inspce.command("podman #{subcommand}")
      end

      def parse_command_output(output)
        require "json" unless defined?(JSON)
        JSON.parse(output)
      rescue JSON::ParserError => _e
        warn "Could not parse `podman image inspect` output"
        {}
      end
    end
  end
end