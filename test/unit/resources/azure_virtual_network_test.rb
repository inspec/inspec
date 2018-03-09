require 'helper'
require 'resources/azure/azure_backend'
# AzureBB = MockAzureVirtualNetworkSingularBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AzureVirtualNetworkConstructorTest < Minitest::Test

  def setup
    Inspec::Resources::AzureVirtualNetwork.select(AzureBB::Empty)
  end

  def test_empty_params_ok
    AzureVNet.new
  end

end


#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AzureVirtualNetworkRecallTest < Minitest::Test

  def setup
    AzureVNet.select(AzureBB::Basic)
  end

  def test_search_hit_via_default_works
    assert AzureVNet.new.exists?
  end
end

#=============================================================================#
#                               Properties
#=============================================================================#
class AzureVirtualNetworkPropertiesTest < Minitest::Test

  def setup
    AzureVNet.select(AzureBB::Basic)
  end

  def test_property_subnets_count
    assert_equal(2, AzureVNet.new('/subscriptions/dbbc2e47-bbbb-4b8b-a35a-35a7adc3e293/resourceGroups/spfarmstaging/providers/Microsoft.Network/virtualNetworks/spfarm_staging_network').subnets_count)
    assert_nil(AzureVNet.new('12344321').subnets_count)
  end

end


#=============================================================================#
#                               Matchers
#=============================================================================#
class AzureVirtualNetworkMatchersTest < Minitest::Test

  def setup
    AzureVNet.select(AzureBB::Basic)
  end

  # def test_matcher_default_positive
  #   assert AwsVpc.new('vpc-aaaabbbb').default?
  # end

  # def test_matcher_default_negative
  #   refute AwsVpc.new('vpc-12344321').default?
  # end

end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module AzureBB
  class Empty < AzureResourceProbe
    def describe_vnets(query)
      OpenStruct.new(name:{},type:'',location:'',count:0,vnets: [])
    end
  end

  class Basic < AzureResourceProbe
    def describe_vnets(query)
      fixtures = [
        OpenStruct.new({
          name:'GoodVirtualNetwork',
          location:'westus',
          address_prefixes: '10.10.0.0/16',
          type: 'Microsoft.Compute/virtualNetworks',
          id: '/subscriptions/dbbc2e47-bbbb-4b8b-a35a-35a7adc3e293/resourceGroups/spfarmstaging/providers/Microsoft.Network/virtualNetworks/spfarm_staging_network',
          subnets: [
            {
              "name": "spfarm-subnet-public-b",
              "id": "/subscriptions/dbbc2e47-bae1-4b8b-a35a-35a7adc3e293/resourceGroups/spfarmstaging/providers/Microsoft.Network/virtualNetworks/spfarm_staging_network/subnets/spfarm-subnet-public-b",
              "etag": "W/\"d6a35ee0-34b6-4d26-b53c-db660c79f2f9\"",
              "properties": {
                "provisioningState": "Succeeded",
                "addressPrefix": "10.10.2.0/24",
                "ipConfigurations": [
                  {
                    "id": "/subscriptions/dbbc2e47-bae1-4b8b-a35a-35a7adc3e293/resourceGroups/spfarmstaging/providers/Microsoft.Network/networkInterfaces/network-interface-spfarm-ad1/ipConfigurations/AD1-ipconfiguration"
                  },
                  {
                    "id": "/subscriptions/dbbc2e47-bae1-4b8b-a35a-35a7adc3e293/resourceGroups/spfarmstaging/providers/Microsoft.Network/networkInterfaces/network-interface-spfarm-db1/ipConfigurations/db1-ipconfiguration"
                  }
                ]
              }
            },
            {
              "name": "spfarm-subnet-public-a",
              "id": "/subscriptions/dbbc2e47-bae1-4b8b-a35a-35a7adc3e293/resourceGroups/spfarmstaging/providers/Microsoft.Network/virtualNetworks/spfarm_staging_network/subnets/spfarm-subnet-public-a",
              "etag": "W/\"d6a35ee0-34b6-4d26-b53c-db660c79f2f9\"",
              "properties": {
                "provisioningState": "Succeeded",
                "addressPrefix": "10.10.1.0/24",
                "ipConfigurations": [
                  {
                    "id": "/subscriptions/dbbc2e47-bae1-4b8b-a35a-35a7adc3e293/resourceGroups/spfarmstaging/providers/Microsoft.Network/networkInterfaces/network-interface-spfarm-wfe1/ipConfigurations/wfe1-ipconfiguration"
                  },
                  {
                    "id": "/subscriptions/dbbc2e47-bae1-4b8b-a35a-35a7adc3e293/resourceGroups/spfarmstaging/providers/Microsoft.Network/networkInterfaces/network-interface-spfarm-appserver1/ipConfigurations/appserver1-ipconfiguration"
                  }
                ]
              }
            }
          ],
          is_default: true
        }),
        OpenStruct.new({
          name:'BadVirtualNetwork',
          location:'westus',
          address_prefixes: '10.0.0.0/16',
          type: 'Microsoft.Compute',
          id: '12344321',
          subnets:[],
          is_default: false
        }),
      ]

      selected = fixtures.select do |vnet|
        query[:filters].all? do |filter|
          if filter[:name].eql? "isDefault"
            filter[:name] = "is_default"
          end
          filter[:values].include?(vnet[filter[:name].tr('-','_')].to_s)
        end
      end

      OpenStruct.new({ vnets: selected })
    end
  end

end
