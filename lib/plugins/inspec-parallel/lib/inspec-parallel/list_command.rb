require "uri" unless defined?(URI)
module InspecPlugins
  module Parallelism
    class ListCommand

      SUPPORTED_RESOURCES = {
        aws_ecr_images: { property: "image_ids", list_transport: "ecr-image://%s", target_transport: :aws },
      }.freeze

      SUPPORTED_TARGET_TRANSPORTS = {
        aws: { dependency_name: "inspec-aws", dependency_uri: "https://github.com/inspec/inspec-aws.git" },
        azure: { dependency_name: "inspec-azure", dependency_uri: "https://github.com/inspec/inspec-azure.git" },
        gcp: { dependency_name: "inspec-gcp", dependency_uri: "https://github.com/inspec/inspec-gcp.git" },
      }.freeze

      attr_reader :resource_name, :target_uri, :ui
      def initialize(options)
        @ui = Inspec::UI.new

        # Make sure resource is supported
        @resource_name = options[:resource].to_sym
        unless SUPPORTED_RESOURCES.key?(@resource_name)
          ui.error("Unsupported resource '#{resource_name}'. Currently supported resources: #{SUPPORTED_RESOURCES.keys.join(", ")}")
          ui.exit(:usage_error)
        end

        # Make sure transport schema is supported
        @target_uri = options[:target] || "#{SUPPORTED_RESOURCES[resource_name][:target_transport]}://"
        target_transport = URI(target_uri).scheme.to_sym
        unless SUPPORTED_TARGET_TRANSPORTS.key?(target_transport)
          ui.error("Unsupported target transport '#{target_transport}'. Supported transports: #{SUPPORTED_TARGET_TRANSPORTS.keys.join(", ")}")
          ui.exit(:usage_error)
        end
        unless target_transport == SUPPORTED_RESOURCES[resource_name][:target_transport]
          ui.error("Unsupported target transport '#{target_transport}' for resource '#{resource_name}'. Supported transport: '#{SUPPORTED_RESOURCES[resource_name][:target_transport]}'")
          ui.exit(:usage_error)
        end
      end

      def run
        # TODO: Generate profile in cache
        #  Add dep based on transport in inspec.yml
        #  create control file
        #   add plural resource lookup with provided query
        #   add describe block in each loop
        # TODO: Execute with custom reporter
      end
    end
  end
end
