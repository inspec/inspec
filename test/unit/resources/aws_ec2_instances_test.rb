require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_ec2_instances'

require 'resource_support/aws'
require 'resources/aws/aws_ec2_instances'

# MAEIPB = MockAwsEC2InstancesPluralBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsEc2InstancesConstructorTest < Minitest::Test

  def setup
    AwsEc2Instances::BackendFactory.select(MAEIPB::Empty)
  end

  def test_empty_params_ok
    AwsEc2Instances.new
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsEc2Instances.new(shoe_size: 9) }
  end
end


#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsEc2InstancesRecallEmptyTest < Minitest::Test

  def setup
    AwsEc2Instances::BackendFactory.select(MAEIPB::Empty)
  end

  def test_recall_when_no_instances_exist
    refute AwsEc2Instances.new.exists?
  end
end

class AwsEc2InstancesRecallBasicTest < Minitest::Test

  def setup
    AwsEc2Instances::BackendFactory.select(MAEIPB::Basic)
  end

  def test_recall_when_some_instances_exist
    assert AwsEc2Instances.new.exists?
  end
end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsEc2InstancesProperties < Minitest::Test
  def setup
    AwsEc2Instances::BackendFactory.select(MAEIPB::Basic)
  end
  
  def test_property_instance_ids_when_no_instances_exist
    AwsEc2Instances::BackendFactory.select(MAEIPB::Empty)    
    empty = AwsEc2Instances.new
    assert_kind_of(Array, empty.instance_ids)
    assert_empty(empty.instance_ids)
  end

  def test_property_instance_ids_when_instances_exist
    basic = AwsEc2Instances.new
    assert_kind_of(Array, basic.instance_ids)
    assert(basic.instance_ids.include?('i-deadbeef'))
    assert_equal(3, basic.instance_ids.length)
    assert(basic.instance_ids.include?('i-11112222'))
    refute(basic.instance_ids.include?(nil))
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MAEIPB
  class Empty < AwsBackendBase
    def describe_instances(query = {})
      OpenStruct.new( reservations: [] )
    end
  end

  class Basic < AwsBackendBase
    def describe_instances(query = {})
      Aws::EC2::Types::DescribeInstancesResult.new(
        reservations: [
          Aws::EC2::Types::Reservation.new(
            instances: [
              Aws::EC2::Types::Instance.new(
                # Many, many other properties available here.
                # We're starting with what we support.
                instance_id: 'i-0e8541d718e67e1be'
              ),
              Aws::EC2::Types::Instance.new(
                instance_id: 'i-deadbeef'
              ),
            ],
          ),
          Aws::EC2::Types::Reservation.new(
            instances: [
              Aws::EC2::Types::Instance.new(
                instance_id: 'i-11112222'
              ),
            ],
          ),
        ]
      )
    end
  end
end
