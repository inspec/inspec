require 'helper'

# MASG = MockAutoScalingGroupBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsAutoScalingGroupConstructorTest < Minitest::Test
  def setup
    AwsAutoScalingGroup::BackendFactory.select(AwsMASG::Hit)
  end

  def test_constructor_some_args_required
    assert_raises(ArgumentError) { AwsAutoScalingGroup.new }
  end

  def test_constructor_accepts_scalar_name
    AwsAutoScalingGroup.new('MyAutoScalingGroup')
  end

  def test_constructor_accepts_name_as_hash
    AwsAutoScalingGroup.new(name: 'MyAutoScalingGroup')
  end
  
  def test_constructor_rejects_unrecognized_resource_params
    assert_raises(ArgumentError) { AwsAutoScalingGroup.new(beep: 'boop') }
  end

end

#=============================================================================#
#                               Search
#=============================================================================#
class AwsAutoScalingGroupTest < Minitest::Test
  
  def test_recall_no_match_is_no_exception
    AwsAutoScalingGroup::BackendFactory.select(AwsMASG::Miss)
    asg = AwsAutoScalingGroup.new('IdontExist')
    refute asg.exists?
  end

  def test_recall_match_single_result_works
    AwsAutoScalingGroup::BackendFactory.select(AwsMASG::Hit)
    asg = AwsAutoScalingGroup.new('IExist')
    assert asg.exists?
  end
end

#=============================================================================#
#                                Properties
#=============================================================================#

class AwsAutoScalingGroupPropertiesTest < Minitest::Test
  # No setup here - each test needs to explicitly declare
  # what they want from the backend.

  def test_instance_numbers
    AwsAutoScalingGroup::BackendFactory.select(AwsMASG::Hit)
    asg = AwsAutoScalingGroup.new('IExist')
    assert_equal('IExist', asg.name)
    assert_equal(1, asg.min_size)
    assert_equal(4, asg.max_size)
    assert_equal(2, asg.desired_capacity)
  end

end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMASG

  class Miss < AwsBackendBase
    def get_auto_scaling_group_attributes(criteria)
      OpenStruct.new({
        auto_scaling_groups: []
      })
    end
  end

  class Hit < AwsBackendBase
    def get_auto_scaling_group_attributes(criteria)
      OpenStruct.new({
        'auto_scaling_groups': [
          {
            'auto_scaling_group_arn': "arn:aws:autoscaling:us-west-2:123456789012:autoScalingGroup:930d940e-891e-4781-a11a-7b0acd480f03:autoScalingGroupName/IExist", 
            'auto_scaling_group_name': "IExist", 
            'availability_zones': [
              "us-west-2c", 
            ],
            'default_cooldown': 300, 
            'desired_capacity': 2, 
            'enabled_metrics': [
            ], 
            'health_check_grace_period': 300, 
            'health_check_type': "EC2", 
            'launch_configuration_name': "my-launch-config", 
            'max_size': 4, 
            'min_size': 1, 
            'tags': [
            ], 
            'termination_policies': [
              "Default", 
            ], 
            'vpc_zone_identifier': "subnet-12345678", 
          },
        ]
      })
    end
  end
end