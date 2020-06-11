
require "train"
require "train/plugins"
require "aws-sdk-core"

# Train Plugins v1 are usually declared under the TrainPlugins namespace.
# Each plugin has three components: Transport, Connection, and Platform.
# We'll only define the Transport here, but we'll refer to the others.
require_relative "connection"

module TrainPlugins
  module Aws
    class Transport < Train.plugin(1)
      name "aws"

      # Pass ENV vars in using a block to `option`.  This causes `
      # option to lazy-evaluate the block to provide a default value.`
      # Otherwise, we would read the ENV var (and set the default)
      # once at compile time, which would make testing difficult.
      # TODO: convert to thor-style defaults
      option(:region, required: true) { ENV["AWS_REGION"] }
      option(:access_key_id) { ENV["AWS_ACCESS_KEY_ID"] }
      option(:secret_access_key) { ENV["AWS_SECRET_ACCESS_KEY"] }
      option(:session_token) { ENV["AWS_SESSION_TOKEN"] }

      # This can provide the access key id and secret access key
      option(:profile) { ENV["AWS_PROFILE"] }

      # The only thing you MUST do in a transport is a define a
      # connection() method that returns a instance that is a
      # subclass of BaseConnection.

      # The options passed to this are undocumented and rarely used.
      def connection(_instance_opts = nil)
        # Typical practice is to cache the connection as an instance variable.
        # Do what makes sense for your platform.
        # @options here is the parsed options that the calling
        # app handed to us at process invocation. See the Connection class
        # for more details.
        @connection ||= TrainPlugins::Aws::Connection.new(@options)
      end
    end
  end
end
