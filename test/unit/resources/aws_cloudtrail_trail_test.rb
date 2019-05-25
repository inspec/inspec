require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_cloudtrail_trail'

require 'resource_support/aws'
require 'resources/aws/aws_cloudtrail_trail'

# MACTTSB = MockAwsCloudTrailTrailSingularBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsCloudTrailTrailConstructorTest < Minitest::Test

  def setup
    AwsCloudTrailTrail::BackendFactory.select(MACTTSB::Empty)
  end

  def test_rejects_empty_params
    assert_raises(ArgumentError) { AwsCloudTrailTrail.new }
  end

  def test_accepts_trail_name_as_scalar
    AwsCloudTrailTrail.new('test-trail-1')
  end

  def test_accepts_trail_name_as_hash
    AwsCloudTrailTrail.new(trail_name: 'test-trail-1')
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsCloudTrailTrail.new(shoe_size: 9) }
  end
end


#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsCloudTrailTrailRecallTest < Minitest::Test

  def setup
    AwsCloudTrailTrail::BackendFactory.select(MACTTSB::Basic)
  end

  def test_search_hit_via_scalar_works
    assert AwsCloudTrailTrail.new('test-trail-1').exists?
  end

  def test_search_hit_via_hash_works
    assert AwsCloudTrailTrail.new(trail_name: 'test-trail-1').exists?
  end

  def test_search_miss_is_not_an_exception
    refute AwsCloudTrailTrail.new(trail_name: 'non-existant').exists?
  end
end

#=============================================================================#
#                               Properties
#=============================================================================#
class AwsCloudTrailTrailPropertiesTest < Minitest::Test

  def setup
    AwsCloudTrailTrail::BackendFactory.select(MACTTSB::Basic)
  end

  def test_property_s3_bucket_name
    assert_equal('aws-s3-bucket-test-trail-1', AwsCloudTrailTrail.new('test-trail-1').s3_bucket_name)
    assert_nil(AwsCloudTrailTrail.new(trail_name: 'non-existant').s3_bucket_name)
  end

  def test_property_trail_arn
    assert_equal("arn:aws:cloudtrail:us-east-1::trail/test-trail-1", AwsCloudTrailTrail.new('test-trail-1').trail_arn)
    assert_nil(AwsCloudTrailTrail.new(trail_name: 'non-existant').trail_arn)
  end

  def test_property_cloud_watch_logs_role_arn
    assert_equal("arn:aws:iam:::role/CloudTrail_CloudWatchLogs_Role", AwsCloudTrailTrail.new('test-trail-1').cloud_watch_logs_role_arn)
    assert_nil(AwsCloudTrailTrail.new(trail_name: 'non-existant').cloud_watch_logs_role_arn)
  end

  def test_property_cloud_watch_logs_log_group_arn
    assert_equal("arn:aws:logs:us-east-1::log-group:test:*", AwsCloudTrailTrail.new('test-trail-1').cloud_watch_logs_log_group_arn)
    assert_nil(AwsCloudTrailTrail.new(trail_name: 'non-existant').cloud_watch_logs_log_group_arn)
  end

  def test_property_kms_key_id
    assert_equal("arn:aws:kms:us-east-1::key/88197884-041f-4f8e-a801-cf120e4845a8", AwsCloudTrailTrail.new('test-trail-1').kms_key_id)
    assert_nil(AwsCloudTrailTrail.new(trail_name: 'non-existant').kms_key_id)
  end

  def test_property_home_region
    assert_equal("us-east-1", AwsCloudTrailTrail.new('test-trail-1').home_region)
    assert_nil(AwsCloudTrailTrail.new(trail_name: 'non-existant').home_region)
  end
  
  def test_property_delivered_logs_days_ago
    assert_equal(0, AwsCloudTrailTrail.new('test-trail-1').delivered_logs_days_ago)
    assert_nil(AwsCloudTrailTrail.new(trail_name: 'non-existant').delivered_logs_days_ago)
  end
end


#=============================================================================#
#                               Matchers
#=============================================================================#
class AwsCloudTrailTrailMatchersTest < Minitest::Test

  def setup
    AwsCloudTrailTrail::BackendFactory.select(MACTTSB::Basic)
  end

  def test_matcher_encrypted_positive
    assert AwsCloudTrailTrail.new('test-trail-1').encrypted?
  end

  def test_matcher_encrypted_negative
    refute AwsCloudTrailTrail.new('test-trail-2').encrypted?
  end

  def test_matcher_multi_region_trail_positive
    assert AwsCloudTrailTrail.new('test-trail-1').multi_region_trail?
  end

  def test_matcher_multi_region_trail_negative
    refute AwsCloudTrailTrail.new('test-trail-2').multi_region_trail?
  end

  def test_matcher_log_file_validation_enabled_positive
    assert AwsCloudTrailTrail.new('test-trail-1').log_file_validation_enabled?
  end

  def test_matcher_log_file_validation_enabled_negative
    refute AwsCloudTrailTrail.new('test-trail-2').log_file_validation_enabled?
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MACTTSB
  class Empty < AwsBackendBase
    def describe_trails(query)
      OpenStruct.new(trail_list: [])
    end
  end

  class Basic < AwsBackendBase
    def describe_trails(query)
      fixtures = [
        OpenStruct.new({
          name: "test-trail-1",
          s3_bucket_name: "aws-s3-bucket-test-trail-1",
          is_multi_region_trail: true,
          home_region: "us-east-1",
          trail_arn: "arn:aws:cloudtrail:us-east-1::trail/test-trail-1",
          log_file_validation_enabled: true,
          cloud_watch_logs_log_group_arn: "arn:aws:logs:us-east-1::log-group:test:*",
          cloud_watch_logs_role_arn: "arn:aws:iam:::role/CloudTrail_CloudWatchLogs_Role",
          kms_key_id: "arn:aws:kms:us-east-1::key/88197884-041f-4f8e-a801-cf120e4845a8"
        }),
        OpenStruct.new({
          name: "test-trail-2",
          s3_bucket_name: "aws-s3-bucket-test-trail-2",
          home_region: "us-east-1",
          trail_arn: "arn:aws:cloudtrail:us-east-1::trail/test-trail-2",
          cloud_watch_logs_log_group_arn: "arn:aws:logs:us-east-1::log-group:test:*",
          cloud_watch_logs_role_arn: "arn:aws:iam:::role/CloudTrail_CloudWatchLogs_Role",
        }),
      ]

      selected = fixtures.detect do |fixture|
        fixture.name == query[:trail_name_list].first
      end
      OpenStruct.new({ trail_list: [selected] })
    end
    
    def get_trail_status(query)
      fixtures = [
        OpenStruct.new({
          name: "test-trail-1",
          latest_cloud_watch_logs_delivery_time: Time.now
        })
      ]
      
      fixtures.detect { |f| f.name == query[:name] }
    end
  end
end
