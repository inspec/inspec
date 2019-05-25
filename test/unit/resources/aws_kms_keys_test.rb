require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_kms_keys'

require 'resource_support/aws'
require 'resources/aws/aws_kms_keys'

# MAKKPB = MockAwsKmsKeysPluralBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsKmsKeysConstructorTest < Minitest::Test

  def setup
    AwsKmsKeys::BackendFactory.select(MAKKPB::Empty)
  end

  def test_empty_params_ok
    AwsKmsKeys.new
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsKmsKeys.new(shoe_size: 9) }
  end
end


#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsKmsKeysRecallEmptyTest < Minitest::Test

  def setup
    AwsKmsKeys::BackendFactory.select(MAKKPB::Empty)
  end

  def test_search_miss_key_empty_kms_key_list
    refute AwsKmsKeys.new.exists?
  end
end

class AwsKmsKeysRecallBasicTest < Minitest::Test

  def setup
    AwsKmsKeys::BackendFactory.select(MAKKPB::Basic)
  end

  def test_search_hit_via_empty_filter
    assert AwsKmsKeys.new.exists?
  end
end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsKmsKeysProperties < Minitest::Test
  def setup
    AwsKmsKeys::BackendFactory.select(MAKKPB::Basic)
  end
  
  def test_property_key_ids
    basic = AwsKmsKeys.new
    assert_kind_of(Array, basic.key_ids)
    assert(basic.key_ids.include?('012026a4-b657-42bf-99ae-111111111111'))
    refute(basic.key_ids.include?(nil))
  end

  def test_property_key_arns
    basic = AwsKmsKeys.new
    assert_kind_of(Array, basic.key_arns)
    assert(basic.key_arns.include?('arn:aws:kms:us-east-1::key/012026a4-b657-42bf-99ae-111111111111'))
    refute(basic.key_arns.include?(nil))
  end
end
#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MAKKPB
  class Empty < AwsBackendBase
    def list_keys(query = {})
      OpenStruct.new({ keys: [] })
    end
  end

  class Basic < AwsBackendBase
    def list_keys(query = {})
      fixtures = [
        OpenStruct.new({
          key_id: '012026a4-b657-42bf-99ae-111111111111',
          key_arn: 'arn:aws:kms:us-east-1::key/012026a4-b657-42bf-99ae-111111111111',
        }),
        OpenStruct.new({
          key_id: '012026a4-b657-42bf-99ae-222222222222',
          key_arn: 'arn:aws:kms:us-east-1::key/012026a4-b657-42bf-99ae-222222222222',
        }),
        OpenStruct.new({
          key_id: '012026a4-b657-42bf-99ae-333333333333',
          key_arn: 'arn:aws:kms:us-east-1::key/012026a4-b657-42bf-99ae-333333333333',
        }),
      ]

      OpenStruct.new({ keys: fixtures })
    end
  end
end
