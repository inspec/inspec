module InspecPlugins
  module Parallelism
    class ListCommand

      SUPPORTED_RESOURCES = {
        aws_ecr_images: { property: "image_ids", transport: "ecr-image://%s" },
      }

      attr_reader :resource_name, :ui
      def initialize(options)
        @ui = Inspec::UI.new

        # Make sure resource is supported
        @resource_name = options[:resource].to_sym
        unless SUPPORTED_RESOURCES.key?(@resource_name)
          ui.error("Unsupported resource '#{resource_name}'. Currently supported resources: #{SUPPORTED_RESOURCES.keys.join(', ')}")
          ui.exit(:usage_error)
        end

        # TODO: Make sure transport schema is supported
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
