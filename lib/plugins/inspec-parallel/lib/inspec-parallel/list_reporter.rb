require_relative "list_reporter/resource_formatter"
module InspecPlugins::Parallelism
  class ListReporter < Inspec.plugin(2, :streaming_reporter)
    # Registering these methods with RSpec::Core::Formatters class is mandatory
    RSpec::Core::Formatters.register self, :example_passed, :example_failed

    attr_reader :resource_formatter
    def initialize(output); end

    def example_passed(notification)
      # Encoded as describe block subject
      raw_id = notification.example.metadata[:example_group][:description]

      # Extra data passed through via descriptions
      unless @resource_formatter
        resource_name = notification.example.metadata[:descriptions][:resource_name]
        parameters = notification.example.metadata[:descriptions][:parameters]
        query = notification.example.metadata[:descriptions][:query]

        @resource_formatter = InspecPlugins::Parallelism::ListReporter::ResourceFormatter::Base.formatter_for(resource_name, parameters: parameters, query: query)
      end

      puts "-t " + resource_formatter.format_id_for_list(raw_id)
    end

    def example_failed(notification)
      # TODO - pick apart notification and print an exception to stderr
      # require "byebug"; byebug
    end
  end
end
