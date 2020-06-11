# frozen_string_literal: true

require "net/http"
require "json"
require "train-habitat/httpgateway"
require "train-habitat/platform"
require "train-habitat/transport"

module TrainPlugins
  module Habitat
    class Connection < Train::Plugins::Transport::BaseConnection
      include TrainPlugins::Habitat::Platform

      attr_reader :cli_transport_name, :cli_connection, :cli_transport, :transport_options

      def initialize(options = {})
        @transport_options = options
        validate_transport_options!

        super(transport_options)
        initialize_cli_connection! if cli_options_provided?
        enable_cache :api_call
      end

      def uri
        "habitat://#{@options[:host]}"
      end

      def api_options_provided?
        have_transport_options_with_prefix?("api")
      end

      def cli_options_provided?
        TrainPlugins::Habitat::Transport.cli_transport_prefixes.keys.map(&:to_s).any? do |prefix|
          have_transport_options_with_prefix?(prefix)
        end
      end

      # Use this to execute a `hab` command. Do not include the `hab` executable in the invocation.
      def run_hab_cli(command, _exec_options = {})
        raise CliNotAvailableError(cli_tranport_names) unless cli_options_provided?

        # TODO: - leverage exec_options to add things like JSON parsing, ENV setting, etc.
        cli_connection.run_command(hab_path + " " + command)
      end

      # See #run_command in BaseConnection.
      def run_command_via_connection(*args)
        raise CliNotAvailableError(cli_tranport_names) unless cli_options_provided?

        cli_connection.run_command(*args)
      end

      def hab_path
        "/bin/hab"
      end

      def habitat_api_client
        cached_client(:api_call, :HTTPGateway) do
          # Send all options beginning with api_ to the HTTPGateway, stripping the prefix
          api_options = {}
          transport_options.each do |option_name, option_value|
            next unless option_name.to_s.start_with? "api_"

            api_options[option_name.to_s.sub(/^api_/, "").to_sym] = option_value
          end
          HTTPGateway.new(api_options)
        end
      end

      private

      def validate_transport_options!
        unless api_options_provided? || cli_options_provided?
          raise Train::TransportError, "Habitat connection options that begin with either 'cli' or 'api' required"
        end

        valid_cli_prefixes = TrainPlugins::Habitat::Transport.cli_transport_prefixes.keys.map(&:to_s)
        seen_cli_options = transport_options.keys.map(&:to_s).select { |n| n.start_with?("cli_") }

        # All seen CLI options must start with a recognized prefix
        options_by_prefix = {}
        seen_cli_options.each do |option|
          prefix = valid_cli_prefixes.detect { |p| option.start_with?(p) }
          unless prefix
            raise Train::TransportError, "All Habitat CLI connection options must begin with a recognized prefix (#{valid_cli_prefixes.join(", ")}) - saw #{option}"
          end

          options_by_prefix[prefix] ||= []
          options_by_prefix[prefix] << option
        end

        # Only one prefix may be used (don't mix and match)
        if options_by_prefix.count > 1
          raise Train::TransportError, "Only one set of Habitat CLI connection options may be used - saw #{options_by_prefix.keys.join(", ")}"
        end
      end

      def cli_transport_names
        TrainPlugins::Habitat::Transport.cli_transport_prefixes.values
      end

      def have_transport_options_with_prefix?(prefix)
        transport_options.keys.map(&:to_s).any? { |option_name| option_name.start_with? prefix }
      end

      def initialize_cli_connection! # rubocop:disable Metrics/AbcSize
        return if @cli_connection
        raise CliNotAvailableError(cli_tranport_names) unless cli_options_provided?

        # group cli connection options by prefix
        # Our incoming connection options have prefixes, so we see things like 'cli_ssh_host'.
        # The ssh transport wants just 'host'. So identify which transports we have
        # options for, and trim them down.
        known_prefixes = TrainPlugins::Habitat::Transport.cli_transport_prefixes.keys.map(&:to_s)

        seen_cli_transports = {}
        non_specific_options = {} # Things like :logger, :sudo, etc
        transport_options.each do |xport_option_name, xport_option_value|
          unless xport_option_name.to_s.start_with?("cli_")
            non_specific_options[xport_option_name] = xport_option_value
            next
          end
          known_prefixes.each do |prefix|
            next unless xport_option_name.to_s.start_with?(prefix)

            xport_name = TrainPlugins::Habitat::Transport.cli_transport_prefixes[prefix.to_sym]

            seen_cli_transports[xport_name] ||= {}
            # Remove the prefix from the option and store under transport name
            seen_cli_transports[xport_name][xport_option_name.to_s.sub(/^#{prefix}_/, "").to_sym] = xport_option_value
          end
        end

        raise MultipleCliTransportsError, seen_cli_tranports.keys if seen_cli_transports.count > 1

        # If no specific logger was passed in, re-use ours.
        non_specific_options[:logger] = logger

        @cli_transport_name = seen_cli_transports.keys.first
        final_train_options = seen_cli_transports[cli_transport_name].merge(non_specific_options)
        @cli_transport = Train.create(cli_transport_name, final_train_options)
        @cli_connection = cli_transport.connection
      end
    end
  end
end
