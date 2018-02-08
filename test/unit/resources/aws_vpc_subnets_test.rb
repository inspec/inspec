require 'ostruct'
require 'helper'
require 'aws_vpc_subnets'

# MVSB = MockVpcSubnetsBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsVpcSubnetsConstructor < Minitest::Test
  def setup
    AwsVpcSubnets::BackendFactory.select(AwsMVSB::Basic)
  end

  def test_constructor_no_args_ok
    AwsVpcSubnets.new
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsVpcSubnets.new(bla: 'blabla') }
  end
end

#=============================================================================#
#                            Filter Criteria
#=============================================================================#
class AwsVpcSubnetsFilterCriteria < Minitest::Test
  def setup
    AwsVpcSubnets::BackendFactory.select(AwsMVSB::Basic)
  end

  def test_filter_vpc_id
    hit = AwsVpcSubnets.new.where(vpc_id: 'vpc-01234567')
    assert(hit.exists?)

    miss = AwsVpcSubnets.new.where(vpc_id: 'vpc-87654321')
    refute(miss.exists?)

  end

  def test_filter_subnet_id
    hit = AwsVpcSubnets.new.where(subnet_id: 'subnet-01234567')
    assert(hit.exists?)

    miss = AwsVpcSubnets.new.where(subnet_id: 'subnet-98765432')
    refute(miss.exists?)
  end

end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsVpcSubnetProperties < Minitest::Test
  def setup
    AwsVpcSubnets::BackendFactory.select(AwsMVSB::Basic)
  end

  def test_property_vpc_ids
    basic = AwsVpcSubnets.new
    assert_kind_of(Array, basic.vpc_ids)
    assert(basic.vpc_ids.include?('vpc-01234567'))
    refute(basic.vpc_ids.include?(nil))
  end

  def test_property_subnet_ids
    basic = AwsVpcSubnets.new
    assert_kind_of(Array, basic.subnet_ids)
    assert(basic.subnet_ids.include?('subnet-01234567'))
    refute(basic.subnet_ids.include?(nil))
  end

  def test_property_cidr_blocks
    basic = AwsVpcSubnets.new
    assert_kind_of(Array, basic.cidr_blocks)
    assert(basic.cidr_blocks.include?('10.0.1.0/24'))
    refute(basic.cidr_blocks.include?(nil))
  end

  def test_property_states
    basic = AwsVpcSubnets.new
    assert_kind_of(Array, basic.states)
    assert(basic.states.include?('available'))
    refute(basic.states.include?(nil))
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module AwsMVSB
  class Basic < AwsBackendBase
    def describe_subnets
      fixtures = [
        OpenStruct.new({
          availability_zone: "us-east-1c",
          available_ip_address_count: 251,
          cidr_block: "10.0.1.0/24",
          default_for_az: false,
          map_public_ip_on_launch: false,
          state: "available",
          subnet_id: "subnet-01234567",
          vpc_id: "vpc-01234567",
        }),
        OpenStruct.new({
          availability_zone: "us-east-1b",
          available_ip_address_count: 251,
          cidr_block: "10.0.2.0/24",
          default_for_az: false,
          map_public_ip_on_launch: false,
          state: "available",
          subnet_id: "subnet-00112233",
          vpc_id: "vpc-00112233",
        }),
      ]
      OpenStruct.new({ subnets: fixtures })
    end
  end
end
