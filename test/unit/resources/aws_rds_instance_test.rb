require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_rds_instance'

require 'resource_support/aws'
require 'resources/aws/aws_rds_instance'

# MRDSIB = MockRDSInstanceBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsMDBIConstructor < Minitest::Test
  def setup
    AwsRdsInstance::BackendFactory.select(AwsMRDSIB::Empty)
  end

  def test_constructor_no_args_raises
    assert_raises(ArgumentError) { AwsRdsInstance.new }
  end

  def test_constructor_accept_scalar_param
    AwsRdsInstance.new('test-instance-id')
  end

  def test_accepts_db_instance_identifier_as_hash
    AwsRdsInstance.new(db_instance_identifier: 'test-instance-id')
  end

  def test_constructor_reject_malformed_args
    {
      db_instance_identifier: 'no_good',
    }.each do |param, value|
      assert_raises(ArgumentError) { AwsRdsInstance.new(param => value) }
    end
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsRdsInstance.new(beep: 'boop') }
  end
end

#=============================================================================#
#                               Search / Recall
#=============================================================================#

class AwsMDBIRecallTest < Minitest::Test

  def setup
    AwsRdsInstance::BackendFactory.select(AwsMRDSIB::Basic)
  end

  def test_search_hit_via_scalar_works
    assert AwsRdsInstance.new('some-db').exists?
  end

  def test_search_hit_via_hash_works
    assert AwsRdsInstance.new(db_instance_identifier: 'some-db').exists?
  end

  def test_search_miss_is_not_an_exception
    refute AwsRdsInstance.new(db_instance_identifier: 'test-instance-id').exists?
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMRDSIB
  class Empty < AwsBackendBase
    def describe_db_instances(_query)
      raise Aws::RDS::Errors::DBInstanceNotFound.new(nil, nil)
    end
  end

  class Basic < AwsBackendBase
    def describe_db_instances(query)
      fixtures = [
          OpenStruct.new({
                             db_instance_identifier: 'some-db',
                         }),
          OpenStruct.new({
                             db_instance_identifier: 'awesome-db',
                         }),
      ]

      selected = fixtures.select do |db|
        db[:db_instance_identifier].eql? query[:db_instance_identifier]
      end

      if selected.empty?
        raise Aws::RDS::Errors::DBInstanceNotFound.new(nil, nil)
      end

      OpenStruct.new({ db_instances: selected })
    end
  end

end
