require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_vpc'

require 'resource_support/aws'
require 'resources/aws/aws_vpc'

# MAVSB = MockAwsVpcSingularBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsVpcConstructorTest < Minitest::Test

  def setup
    AwsVpc::BackendFactory.select(MAVSB::Empty)
  end

  def test_empty_params_ok
    AwsVpc.new
  end

  def test_accepts_vpc_id_as_scalar_eight_sign
    AwsVpc.new('vpc-12345678')
  end

  def test_accepts_vpc_id_as_scalar
    AwsVpc.new('vpc-12345678987654321')
  end

  def test_accepts_vpc_id_as_hash_eight_sign
    AwsVpc.new(vpc_id: 'vpc-1234abcd')
  end

  def test_accepts_vpc_id_as_hash
    AwsVpc.new(vpc_id: 'vpc-abcd123454321dcba')
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsVpc.new(shoe_size: 9) }
  end

  def test_rejects_invalid_vpc_id
    assert_raises(ArgumentError) { AwsVpc.new('vpc-rofl') }
  end
end


#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsVpcRecallTest < Minitest::Test

  def setup
    AwsVpc::BackendFactory.select(MAVSB::Basic)
  end

  def test_search_hit_via_default_works
    assert AwsVpc.new.exists?
  end

  def test_search_hit_via_scalar_works
    assert AwsVpc.new('vpc-12344321').exists?
  end

  def test_search_hit_via_hash_works
    assert AwsVpc.new(vpc_id: 'vpc-12344321').exists?
  end

  def test_search_miss_is_not_an_exception_eight_sign
    refute AwsVpc.new(vpc_id: 'vpc-00000000').exists?
  end

  def test_search_miss_is_not_an_exception
    refute AwsVpc.new(vpc_id: 'vpc-00000000000000000').exists?
  end
end

#=============================================================================#
#                               Properties
#=============================================================================#
class AwsVpcPropertiesTest < Minitest::Test

  def setup
    AwsVpc::BackendFactory.select(MAVSB::Basic)
  end

  def test_property_vpc_id
    assert_equal('vpc-aaaabbbb', AwsVpc.new('vpc-aaaabbbb').vpc_id)
    # Even on a miss, identifiers should be preserved
    assert_equal('vpc-00000000', AwsVpc.new(vpc_id: 'vpc-00000000').vpc_id)
  end

  def test_property_cidr_block
    assert_equal('10.0.0.0/16', AwsVpc.new('vpc-aaaabbbb').cidr_block)
    assert_nil(AwsVpc.new('vpc-00000000').cidr_block)
  end

  def test_property_dhcp_options_id
    assert_equal('dopt-aaaabbbb', AwsVpc.new('vpc-aaaabbbb').dhcp_options_id)
    assert_nil(AwsVpc.new('vpc-00000000').dhcp_options_id)
  end

  def test_property_state
    assert_equal('available', AwsVpc.new('vpc-12344321').state)
    assert_nil(AwsVpc.new('vpc-00000000').state)
  end

  def test_property_instance_tenancy
    assert_equal('default', AwsVpc.new('vpc-12344321').instance_tenancy)
    assert_nil(AwsVpc.new('vpc-00000000').instance_tenancy)
  end
end


#=============================================================================#
#                               Matchers
#=============================================================================#
class AwsVpcMatchersTest < Minitest::Test

  def setup
    AwsVpc::BackendFactory.select(MAVSB::Basic)
  end

  def test_matcher_default_positive
    assert AwsVpc.new('vpc-aaaabbbb').default?
  end

  def test_matcher_default_negative
    refute AwsVpc.new('vpc-12344321').default?
  end

end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MAVSB
  class Empty < AwsBackendBase
    def describe_vpcs(query)
      OpenStruct.new(vpcs: [])
    end
  end

  class Basic < AwsBackendBase
    def describe_vpcs(query)
      fixtures = [
        OpenStruct.new({
          cidr_block: '10.0.0.0/16',
          dhcp_options_id: 'dopt-aaaabbbb',
          state: 'available',
          vpc_id: 'vpc-aaaabbbb',
          instance_tenancy: 'default',
          is_default: true
        }),
        OpenStruct.new({
          cidr_block: '10.1.0.0/16',
          dhcp_options_id: 'dopt-43211234',
          state: 'available',
          vpc_id: 'vpc-12344321',
          instance_tenancy: 'default',
          is_default: false
        }),
      ]

      selected = fixtures.select do |vpc|
        query[:filters].all? do |filter|
          if filter[:name].eql? "isDefault"
            filter[:name] = "is_default"
          end
          filter[:values].include?(vpc[filter[:name].tr('-','_')].to_s)
        end
      end

      OpenStruct.new({ vpcs: selected })
    end
  end

end
