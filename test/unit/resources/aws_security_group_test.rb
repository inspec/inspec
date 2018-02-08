require 'ostruct'
require 'helper'
require 'aws_security_group'

# MESGSB = MockEc2SecurityGroupSingleBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsSGSConstructor < Minitest::Test
  def setup
    AwsSecurityGroup::BackendFactory.select(AwsMESGSB::Empty)
  end
  
  def test_constructor_no_args_raises
    assert_raises(ArgumentError) { AwsSecurityGroup.new }
  end

  def test_constructor_accept_scalar_param
    AwsSecurityGroup.new('sg-12345678')
  end

  def test_constructor_expected_well_formed_args
    {
      id: 'sg-1234abcd',
      group_id: 'sg-1234abcd',
      vpc_id: 'vpc-1234abcd',
      group_name: 'some-group',
    }.each do |param, value| 
      AwsSecurityGroup.new(param => value)
    end
  end

  def test_constructor_reject_malformed_args
    {
      id: 'sg-xyz-123',
      group_id: '1234abcd',
      vpc_id: 'vpc_1234abcd',
    }.each do |param, value| 
      assert_raises(ArgumentError) { AwsSecurityGroup.new(param => value) }
    end
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsSecurityGroup.new(beep: 'boop') }
  end
end

#=============================================================================#
#                               Properties
#=============================================================================#

class AwsSGSProperties < Minitest::Test
  def setup
    AwsSecurityGroup::BackendFactory.select(AwsMESGSB::Basic)
  end
  
  def test_property_group_id
    assert_equal('sg-12345678', AwsSecurityGroup.new('sg-12345678').group_id)
    assert_nil(AwsSecurityGroup.new(group_name: 'my-group').group_id)
  end

  def test_property_group_name
    assert_equal('beta', AwsSecurityGroup.new('sg-12345678').group_name)
    assert_nil(AwsSecurityGroup.new('sg-87654321').group_name)
  end

  def test_property_vpc_id
    assert_equal('vpc-aaaabbbb', AwsSecurityGroup.new('sg-aaaabbbb').vpc_id)
    assert_nil(AwsSecurityGroup.new('sg-87654321').vpc_id)
  end

  def test_property_description
    assert_equal('Awesome Group', AwsSecurityGroup.new('sg-12345678').description)
    assert_nil(AwsSecurityGroup.new('sg-87654321').description)
  end

end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMESGSB
  class Empty < AwsBackendBase
    def describe_security_groups(_query)
      OpenStruct.new({
        security_groups: [],
      })
    end
  end

  class Basic < AwsBackendBase
    def describe_security_groups(query)
      fixtures = [
        OpenStruct.new({
          description: 'Some Group',
          group_id: 'sg-aaaabbbb',
          group_name: 'alpha',
          vpc_id: 'vpc-aaaabbbb',
        }),
        OpenStruct.new({
          description: 'Awesome Group',          
          group_id: 'sg-12345678',
          group_name: 'beta',
          vpc_id: 'vpc-12345678',
        }),
      ]

      selected = fixtures.select do |sg|
        query[:filters].all? do |filter|
          filter[:values].include?(sg[filter[:name].tr('-','_')])
        end
      end

      OpenStruct.new({ security_groups: selected })
    end
  end

end
