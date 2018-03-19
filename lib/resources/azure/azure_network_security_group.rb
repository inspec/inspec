# encoding: utf-8

require 'resources/azure/azure_backend'

module Inspec::Resources
  class AzureNetworkSecurityGroup < AzureResourceBase
    name 'azure_network_security_group'

    desc 'Inspec Resource to test Azure Network Security Group settings (NSG)'
    example "
    describe azure_network_security_group(group_name: 'Inspec-Azure', name: 'Inspec-NSG') do

      # should have security rules defined.
      it { should have_security_rules }

      # Should have a rule by specified name
      its('security_rules') { should include 'SSH-22' }

      # Should not have a RDP rule configured
      its('security_rules') { should_not include 'RDP' }

      # NSG should have network interfaces attached to it
      it {should have_subnets }

      # NSG should have network interfaces , at least one or more
      its('subnets_count?') { should be > 0 }

      # NGG should have one subnet associated with it
      its('subnets_count?') { should eq 1 }

      # NSG should contain a subnet wit the name InSpec-Subnet
      its('subnet_names') { should include 'Inspec-Subnet' }
    end
    "

    supports platform: 'azure'

    # Constructor for the resource. This calls the parent constructor to
    # get the generic resource for the specified machine. This will provide
    # static methods that are documented
    #
    # @author Russell Seymour
    def initialize(opts = {})
      # The generic resource needs to pass back a Microsoft.Network/networkSecurityGroups object so force it
      opts[:type] = 'Microsoft.Network/networkSecurityGroups'
      super(opts)

      # Find the network security groups
      resources

      create_tag_methods
    end

    # Method to catch calls that are not explicitly defined.
    # This allows the simple attributes of the virtual machine to be read without having
    # to define each one in turn.
    #
    # @param symobl method_id The symbol of the method that has been called
    #
    # @return Value of attribute that has been called
    def method_missing(method_id)
      # Depending on the method that has been called, determine what value should be returned
      # These are set as camel case methods to comply with rubocop
      security_rules_attrs = %w{name protocol direction}
      network_interaces_attrs = %{id}
      subnet_attrs = %w{id}
      # determine the method name to call by converting the snake_case to camelCase
      # method_name = self.camel_case(method_id.to_s)
      method_name = method_id.to_s.split('_').inject([]) { |buffer, e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
      method_name.end_with?('Gb') ? method_name.gsub!(/Gb/, &:upcase) : false

      if security_rules_attrs.include?(method_id.to_s)
        properties.securityRules.send(method_name)
      elsif network_interaces_attrs.include?(method_id.to_s)
        properties.networkInterfaces.send(method_name)
      elsif subnet_attrs.include?(method_id.to_s)
        properties.subnets.send(method_name)
      end
    end

    # Return the name of the os security group
    #
    # @return string Name of the network security group
    def name
      name
    end

    # Determine if the NSG has security rules
    #
    # This allows the use of
    #    it { should have_security_rules }
    # or ensure it does not have a rule
    #    it { should_not have_security_rules }
    # within the Inspec Profile
    # @return boolean
    def has_security_rules?
      defined?(properties.securityRules)
    end

    # Return an array of the security rules define in this NSG
    #
    # @return array Array of rule names
    def security_rules
      rule_names = []
      properties.securityRules.each do |rule|
        rule_names << rule.id.split(%r{/}).last
      end
      rule_names
    end

    # Does NSG have subnets attached to it
    # can use as it {should have_subnets }
    # @return boolean
    def has_subnets?
      defined?(properties.subnets)
    end

    # Determine subnet count
    #
    # @return boolean
    def subnets_count?
      if defined?(properties.subnets)
        properties.subnets.count
      end
    end

    # Get an array of subnet names
    #
    # @return string Array of names
    def subnet_names
      subnet_names = []
      properties.subnets.each do |subnet|
        subnet_names << subnet.id.split(%r{/}).last
      end
      subnet_names
    end
  end
end
