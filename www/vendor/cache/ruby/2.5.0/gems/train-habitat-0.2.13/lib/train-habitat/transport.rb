require "train"
require "train/plugins"
require "train-habitat/connection"

module TrainPlugins
  module Habitat
    class Transport < Train.plugin(1)
      name "habitat"

      # The train-habitat plugins is a chimeric plugin, meaning it uses
      # multiple ways of connecting to its target. A user must specifiy
      # at least one set, but they can use multiple sets of connecting
      # information to get a full experience.

      # For service listings and health, specify supervisor api options.
      # https://www.habitat.sh/docs/using-habitat/#monitor-services-through-the-http-api
      option :api_url, required: false, desc: "The url at which a Habitat Supervisor exposes its HTTP Gateway API"
      option :api_auth_token, required: false, desc: "A bearer token which may be used to authenticate to the Supervisor HTTP Gateway"

      def self.cli_transport_prefixes
        {
          # add transports here, prefix => transport name
          cli_ssh: :ssh,
        }
      end

      # inspec -t habitat://credset
      def connection(_instance_opts = nil)
        @connection ||= TrainPlugins::Habitat::Connection.new(@options)
      end
    end
  end
end
