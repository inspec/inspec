require 'resources/azure/azure_backend'

module Inspec::Resources
  class AzureResourceGroup < AzureResourceBase
    name 'azure_resource_group'

    desc '
      InSpec Resource to get metadata about a specific Resource Group
    '

    supports platform: 'azure'

    attr_reader :name, :location, :id, :total, :counts, :mapping

    # Constructor to get the resource group itself and perform some analysis on the
    # resources that in the resource group.
    #
    # This analysis is defined by the the mapping hashtable which is used to define
    # the 'has_xxx?' methods (see AzureResourceGroup#create_has_methods) and return
    # the counts for each type
    #
    # @author Russell Seymour
    def initialize(opts)
      opts.key?(:name) ? opts[:group_name] = opts[:name] : false
      # Ensure that the opts only have the name of the resource group set
      opts.select! { |k, _v| k == :group_name }
      super(opts)

      # set the mapping for the Azure Resources
      @mapping = {
        nic: 'Microsoft.Network/networkInterfaces',
        vm: 'Microsoft.Compute/virtualMachines',
        extension: 'Microsoft.Compute/virtualMachines/extensions',
        nsg: 'Microsoft.Network/networkSecurityGroups',
        vnet: 'Microsoft.Network/virtualNetworks',
        managed_disk: 'Microsoft.Compute/disks',
        managed_disk_image: 'Microsoft.Compute/images',
        sa: 'Microsoft.Storage/storageAccounts',
        public_ip: 'Microsoft.Network/publicIPAddresses',
      }

      # Get information about the resource group itself
      resource_group

      # Get information about the resources in the resource group
      resources

      # Call method to create the has_xxxx? methods
      create_has_methods

      # Call method to allow access to the tag values
      create_tag_methods
    end

    # Return the provisioning state of the resource group
    #
    # @author Russell Seymour
    def provisioning_state
      properties.provisioningState
    end

    # Analyze the fully qualified id of the resource group to return the subscription id
    # that this resource group is part of
    #
    # The format of the id is
    #   /subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RESOURCE_GROUP_NAME>
    #
    # @author Russell Seymour
    def subscription_id
      id.split(%r{\/}).reject(&:empty?)[1]
    end

    # Method to parse the resources that have been returned
    # This allows the calculations of the amount of resources to be determined
    #
    # @author Russell Seymour
    #
    # @param [Hash] resource A hashtable representing the resource group
    def parse_resource(resource)
      # return a hash of information
      parsed = {
        'name' => resource.name,
        'type' => resource.type,
      }

      parsed
    end

    # This method catches the xxx_count calls that are made on the resource.
    #
    # The method that is called is stripped of '_count' and then compared with the
    # mappings table. If that type exists then the number of those items is returned.
    # However if that type is not in the Resource Group then the method will return
    # a NoMethodError exception
    #
    # @author Russell Seymour
    #
    # @param [Symbol] method_id The name of the method that was called
    def method_missing(method_id)
      # Determine the mapping_key based on the method_id
      mapping_key = method_id.to_s.chomp('_count').to_sym

      if mapping.key?(mapping_key)
        # based on the method id get the
        namespace, type_name = mapping[mapping_key].split(/\./)

        # check that the type_name is defined, if not return 0
        if send(namespace).methods.include?(type_name.to_sym)
          # return the count for the method id
          send(namespace).send(type_name)
        else
          0
        end
      else
        msg = format('undefined method `%s` for %s', method_id, self.class)
        raise NoMethodError, msg
      end
    end

    private

    # For each of the mappings this method creates the has_xxx? method. This allows the use
    # of the following type of test
    #
    #   it { should have_nics }
    #
    # For example, it will create a has_nics? method that returns a boolean to state of the
    # resource group has any nics at all.
    #
    # @author Russell Seymour
    # @private
    def create_has_methods
      return if failed_resource?
      # Create the has methods for each of the mappings
      # This is a quick test to show that the resource group has at least one of these things
      mapping.each do |name, type|
        # Determine the name of the method name
        method_name = format('has_%ss?', name)
        namespace, type_name = type.split(/\./)

        # use the namespace and the type_name to determine if the resource group has this type or not
        result = send(namespace).methods.include?(type_name.to_sym) ? true : false

        define_singleton_method method_name do
          result
        end
      end
    end
  end
end
