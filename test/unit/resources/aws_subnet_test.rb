require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_subnet'

require 'resource_support/aws'
require 'resources/aws/aws_subnet'

# MVSSB = MockVpcSubnetSingleBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsSubnetConstructorTest < Minitest::Test
  def setup
    AwsSubnet::BackendFactory.select(AwsMVSSB::Basic)
  end

  def test_constructor_no_args_raises
    assert_raises(ArgumentError) { AwsSubnet.new }
  end

  def test_constructor_expected_well_formed_args
    AwsSubnet.new(subnet_id: 'subnet-12345678')
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsSubnet.new(bla: 'blabla') }
  end
end

#=============================================================================#
#                               Recall
#=============================================================================#

class AwsSubnetRecallTest < Minitest::Test
  def setup
    AwsSubnet::BackendFactory.select(AwsMVSSB::Basic)
  end

  def test_search_hit_via_hash_with_vpc_id_and_subnet_id_works
    assert AwsSubnet.new(subnet_id: 'subnet-12345678').exists?
  end

  def test_search_miss_is_not_an_exception
    refute AwsSubnet.new(subnet_id: 'subnet-00000000').exists?
  end
end

#=============================================================================#
#                               properties
#=============================================================================#

class AwsSubnetPropertiesTest < Minitest::Test
  def setup
    AwsSubnet::BackendFactory.select(AwsMVSSB::Basic)
  end

  def test_property_subnet_id
    assert_equal('subnet-12345678', AwsSubnet.new(subnet_id: 'subnet-12345678').subnet_id)
  end

  def test_property_vpc_id
    assert_equal('vpc-12345678', AwsSubnet.new(subnet_id: 'subnet-12345678').vpc_id)
  end

  def test_property_cidr_block
    assert_equal('10.0.1.0/24', AwsSubnet.new(subnet_id: 'subnet-12345678').cidr_block)
    assert_nil(AwsSubnet.new(subnet_id: 'subnet-00000000').cidr_block)
  end

  def test_property_availability_zone
    assert_equal('us-east-1', AwsSubnet.new(subnet_id: 'subnet-12345678').availability_zone)
    assert_nil(AwsSubnet.new(subnet_id: 'subnet-00000000').availability_zone)
  end

  def test_property_available_ip_address_count
    assert_equal(251, AwsSubnet.new(subnet_id: 'subnet-12345678').available_ip_address_count)
    assert_nil(AwsSubnet.new(subnet_id: 'subnet-00000000').available_ip_address_count)
  end

  def test_property_ipv_6_cidr_block_association_set
    assert_equal([], AwsSubnet.new(subnet_id: 'subnet-12345678').ipv_6_cidr_block_association_set)
    assert_nil(AwsSubnet.new(subnet_id: 'subnet-00000000').ipv_6_cidr_block_association_set)
  end
end

#=============================================================================#
#                               Test Matchers
#=============================================================================#
class AwsSubnetPropertiesTest < Minitest::Test
  def test_matcher_assign_ipv_6_address_on_creation
    assert AwsSubnet.new(subnet_id: 'subnet-12345678').assigning_ipv_6_address_on_creation
    refute AwsSubnet.new(subnet_id: 'subnet-87654321').assigning_ipv_6_address_on_creation
  end
  
  def test_matcher_available
    assert AwsSubnet.new(subnet_id: 'subnet-12345678').available?
    refute AwsSubnet.new(subnet_id: 'subnet-87654321').available?
  end
  
  def test_matcher_default_for_az
    assert AwsSubnet.new(subnet_id: 'subnet-12345678').default_for_az?
    refute AwsSubnet.new(subnet_id: 'subnet-87654321').default_for_az?
  end
  
  def test_matcher_map_public_ip_on_launch
    assert AwsSubnet.new(subnet_id: 'subnet-12345678').mapping_public_ip_on_launch
    refute AwsSubnet.new(subnet_id: 'subnet-87654321').mapping_public_ip_on_launch
  end
end


#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMVSSB
  class Basic < AwsBackendBase
    def describe_subnets(query)
      subnets = {
        'subnet-12345678' => OpenStruct.new({
          :subnets => [
            OpenStruct.new({
              availability_zone: "us-east-1",
              available_ip_address_count: 251,
              cidr_block: "10.0.1.0/24",
              default_for_az: true,
              map_public_ip_on_launch: true,
              state: "available",
              subnet_id: "subnet-12345678",
              vpc_id: "vpc-12345678",
              ipv_6_cidr_block_association_set: [],
              assign_ipv_6_address_on_creation: true,
            }),
          ]
        }),
        'subnet-87654321' => OpenStruct.new({
          :subnets => [
            OpenStruct.new({
              availability_zone: "us-east-1",
              available_ip_address_count: 251,
              cidr_block: "10.0.1.0/24",
              default_for_az: false,
              map_public_ip_on_launch: false,
              state: "pending",
              subnet_id: "subnet-87654321",
              vpc_id: "vpc-87654321",
              ipv_6_cidr_block_association_set: [],
              assign_ipv_6_address_on_creation: false,
            }),
          ]
        }),
        'empty' => OpenStruct.new({
          :subnets => []
        })
      }

      return subnets[query[:filters][0][:values][0]] unless subnets[query[:filters][0][:values][0]].nil?
      subnets['empty']
    end
  end
end
