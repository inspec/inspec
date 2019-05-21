require 'helper'

require 'resource_support/aws'
require 'resources/aws/aws_kms_key'

# MAKKSB = MockAwsKmsKeyBackend
# Abbreviation not used outside this file

TIME_NOW = Time.now
#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsKmsKeyConstructorTest < Minitest::Test

  def setup
    AwsKmsKey::BackendFactory.select(MAKKSB::Empty)
  end
  
  def test_rejects_empty_params
    assert_raises(ArgumentError) { AwsKmsKey.new }
  end
  
  def test_accepts_key_arn_as_scalar
    AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111')
  end
  
  def test_accepts_key_arn_as_hash
    AwsKmsKey.new(key_id: 'arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111')
  end
  
  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsKmsKey.new(invalid: 9) }
  end
end

#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsKmsKeyRecallTest < Minitest::Test

  def setup
    AwsKmsKey::BackendFactory.select(MAKKSB::Basic)
  end
  
  def test_search_hit_via_scalar_works
    assert AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').exists?
  end
  
  def test_search_hit_via_hash_works
    assert AwsKmsKey.new(key_id: 'arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').exists?
  end
  
  def test_search_miss_is_not_an_exception
    refute AwsKmsKey.new(key_id: 'non-existant').exists?
  end
end

#=============================================================================#
#                               Properties
#=============================================================================#
class AwsKmsKeyPropertiesTest < Minitest::Test

  def setup
    AwsKmsKey::BackendFactory.select(MAKKSB::Basic)
  end

  def test_property_key_id
    assert_equal('7a6950aa-c8e6-4e51-8afc-111111111111', AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').key_id)
  end
  
  def test_property_arn
    assert_equal('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111', AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').arn)
    assert_nil(AwsKmsKey.new(key_id: 'non-existant').arn)
  end
  
  def test_property_creation_date
    assert_equal(TIME_NOW - 10*24*3600, AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').creation_date)
    assert_nil(AwsKmsKey.new(key_id: 'non-existant').creation_date)
  end
  
  def test_property_key_usage
    assert_equal('ENCRYPT_DECRYPT', AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').key_usage)
    assert_nil(AwsKmsKey.new(key_id: 'non-existant').key_usage)
  end
  
  def test_property_key_state
    assert_equal('Enabled', AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').key_state)
    assert_nil(AwsKmsKey.new(key_id: 'non-existant').key_state)
  end
  
  def test_property_description
    assert_equal('test-key-1-desc', AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').description)
    assert_nil(AwsKmsKey.new(key_id: 'non-existant').description)
  end
  
  def test_property_deletion_time
    assert_equal(TIME_NOW + 10*24*3600, AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').deletion_time)
    assert_nil(AwsKmsKey.new(key_id: 'non-existant').deletion_time)
  end
  
  def test_property_invalidation_time
    assert_nil(AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').invalidation_time)
    assert_nil(AwsKmsKey.new(key_id: 'non-existant').invalidation_time)
  end
  
  def test_property_created_days_ago
    assert_equal(10, AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').created_days_ago)
    assert_nil(AwsKmsKey.new(key_id: 'non-existant').created_days_ago)
  end
end

#=============================================================================#
#                               Matchers
#=============================================================================#
class AwsKmsKeyMatchersTest < Minitest::Test

  def setup
    AwsKmsKey::BackendFactory.select(MAKKSB::Basic)
  end
  
  def test_matcher_enabled_positive
    assert AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').enabled?
  end

  def test_matcher_enabled_negative
    refute AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-222222222222').enabled?
  end
  
  def test_matcher_rotation_enabled_positive
    assert AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').has_rotation_enabled?
  end

  def test_matcher_rotation_enabled_negative
    refute AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-222222222222').has_rotation_enabled?
  end
  
  def test_matcher_external_positive
    assert AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-222222222222').external?
  end
  
  def test_matcher_external_negative
    refute AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').external?
  end
  
  def test_matcher_has_key_expiration_positive
    assert AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').has_key_expiration?
  end
  
  def test_matcher_has_key_expiration_negative
    refute AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-222222222222').has_key_expiration?
  end
  
  def test_matcher_has_aws_key_manager_positive
    assert AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111').managed_by_aws?
  end
  
  def test_matcher_has_aws_key_manager_negative
    refute AwsKmsKey.new('arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-222222222222').managed_by_aws?
  end
end


#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MAKKSB
  class Empty < AwsBackendBase
    def describe_key(query)
      raise Aws::KMS::Errors::NotFoundException.new(nil, nil)
    end
  end

  class Basic < AwsBackendBase
    def describe_key(query)
      fixtures = [
       OpenStruct.new({
           key_id: "7a6950aa-c8e6-4e51-8afc-111111111111",
           arn: "arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111",
           creation_date: TIME_NOW - 10*24*3600,
           enabled: true,
           description: "test-key-1-desc",
           key_usage: "ENCRYPT_DECRYPT",
           key_state: "Enabled",
           deletion_date: TIME_NOW + 10*24*3600,
           valid_to: nil,
           origin: "AWS_KMS",
           expiration_model: 'KEY_MATERIAL_EXPIRES',
           key_manager: "AWS"
        }),
        OpenStruct.new({
           key_id: "7a6950aa-c8e6-4e51-8afc-222222222222",
           arn: "arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-222222222222",
           creation_date: TIME_NOW,
           enabled: false,
           description: "test-key-2-desc",
           key_usage: '',
           key_state: "PendingDeletion",
           deletion_date: nil,
           valid_to: nil,
           origin: "EXTERNAL",
           expiration_model: 'KEY_MATERIAL_DOES_NOT_EXPIRE',
           key_manager: "CUSTOMER"
        }),
      ]
      selected = fixtures.detect do |fixture|
        fixture.arn == query[:key_id]
      end
      return OpenStruct.new({ key_metadata: selected }) unless selected.nil?
      raise Aws::KMS::Errors::NotFoundException.new(nil, nil)
    end 

    def get_key_rotation_status(query)
      fixtures = [
       OpenStruct.new({
           arn: "arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-111111111111",
           key_rotation_enabled: true
        }),
        OpenStruct.new({
           arn: "arn:aws:kms:us-east-1::key/7a6950aa-c8e6-4e51-8afc-222222222222",
           key_rotation_enabled: false
        }),
      ]
      selected = fixtures.detect do |fixture|
        fixture.arn == query[:key_id]
      end
      return selected unless selected.nil?
      raise Aws::KMS::Errors::NotFoundException.new(nil, nil)
    end
  end
end
