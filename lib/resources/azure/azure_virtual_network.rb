# encoding: utf-8

require 'resources/azure/azure_backend'

module Inspec::Resources
  class AzureVirtualNetwork < AzureResourceBase
    name 'azure_virtual_network'

    desc '
      Inspec Resource to test Azure Virtual Networks
    '

    supports platform: 'azure'

    # Constructor for the resource. This calls the parent constructor to
    # get the generic resource for the specified network. This will provide
    # static methods that are documented
    #
    # @author Russell Seymour
    def initialize(opts = {})
      # The generic resource needs to pass back a Microsoft.Networks/virtualNetworks object so force it
      opts[:type] = 'Microsoft.Network/virtualNetworks'
      super(opts)

      # Find the virtual networks
      resources

      create_tag_methods
    end

    # Method to catch calls that are not explicitly defined.
    # This allows the simple attributes of the virtual network to be read without having
    # to define each one in turn.
    #
    # @param symobl method_id The symbol of the method that has been called
    #
    # @return Value of attribute that has been called
    def method_missing(method_id)
      # Depending on the method that has been called, determine what value should be returned
      # These are set as camel case methods to comply with rubocop
      address_space_attrs = %w{addressPrefixes}
      dhcp_options_attrs = %w{dnsServers}
      subnets_attrs = %w{addressPrefix ipConfigurations id}

      # determine the method name to call by converting the snake_case to camelCase
      # method_name = self.camel_case(method_id.to_s)
      method_name = method_id.to_s.split('_').inject([]) { |buffer, e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
      method_name.end_with?('Gb') ? method_name.gsub!(/Gb/, &:upcase) : false

      if address_space_attrs.include?(method_id.to_s)
        properties.addressSpace.send(method_name)
      elsif dhcp_options_attrs.include?(method_id.to_s)
        properties.dhcpOptions.send(method_name)
      elsif subnets_attrs.include?(method_id.to_s)
        properties.subnets.send(method_name)
      end
    end

    # return the vNet id
    # @return string id of the network.
    def id
      properties.id
    end

    # return the Azure Resource type
    # @return string id of the network.
    def type
      properties.type
    end

    # return the Azure Resource location
    # @return string location of the network.
    def location
      properties.location
    end

    # return the Azure Resource name
    # @return string name of the network.
    def name
      properties.name
    end

    # Return the addressPrefixes
    #
    # @return string properties.addressSpace.addressPrefixes of the vNet
    def address_prefixes
      properties.addressSpace.addressPrefixes
    end

    # Are there any DNS servers configured
    # for this virtual network
    #
    # @return boolean
    def has_dns_servers?
      if defined?(properties.dhcpOptions.dnsServers)
        true
      else
        false
      end
    end

    # How many dns servers does network have configured
    # @return integer
    def dns_servers_count
      properties.dhcpOptions.dnsServers.count
    end

    # Does the vNet have subnets?
    #
    # This allows the use of
    #    it { should have_subnets }
    # within the Inspec Profile
    #
    # @return boolean
    def has_subnets?
      if defined?(properties.subnets)
        properties.subnets.count != 0
      else
        false
      end
    end

    # How many subnets are connected to the network
    #
    # @return integer
    def subnets_count
      if defined?(properties.subnets)
        properties.subnets.count
      else
        0
      end
    end

    # Return an array of the connected subnets
    #
    # @return array Array of subnet names connected to the machine
    def connected_subnets
      subnet_names = []
      properties.subnets.each do |subnet|
        subnet_names << subnet.id.split(%r{/}).last
      end
      subnet_names
    end
  end
end
