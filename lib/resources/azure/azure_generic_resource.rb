
require 'resources/azure/azure_backend'
require 'inspec/utils/filter'

module Inspec::Resources
  class AzureGenericResource < AzureResourceBase
    name 'azure_generic_resource'

    desc '
      InSpec Resource to interrogate any Resource type in Azure
    '

    supports platform: 'azure'

    attr_accessor :filter, :total, :counts, :name, :type, :location, :probes

    def initialize(opts = {})
      Inspec.deprecate(:resource_azure_generic_resource)

      # Call the parent class constructor
      super(opts)

      # Get the resource group
      resource_group

      # Get the resources
      resources

      # Create the tag methods
      create_tag_methods
    end

    # Define the filter table so that it can be interrogated
    @filter = FilterTable.create
    @filter.register_filter_method(:contains)
           .register_column(:type, field: 'type')
           .register_column(:name, field: 'name')
           .register_column(:location, field: 'location')
           .register_column(:properties, field: 'properties')

    @filter.install_filter_methods_on_resource(self, :probes)

    def parse_resource(resource)
      # return a hash of information
      parsed = {
        'location' => resource.location,
        'name' => resource.name,
        'type' => resource.type,
        'exist?' => true,
        'properties' => AzureResourceProbe.new(resource.properties),
      }

      parsed
    end
  end
end
