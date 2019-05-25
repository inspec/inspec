require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_cloudtrail_trails'

require 'resource_support/aws'
require 'resources/aws/aws_cloudtrail_trails'

# MACTTPB = MockAwsCloudTrailTrailsPluralBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsCloudTrailTrailsConstructorTest < Minitest::Test

  def setup
    AwsCloudTrailTrails::BackendFactory.select(MACTTPB::Empty)
  end

  def test_empty_params_ok
    AwsCloudTrailTrails.new
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsCloudTrailTrails.new(shoe_size: 9) }
  end
end


#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsCloudTrailTrailsRecallEmptyTest < Minitest::Test

  def setup
    AwsCloudTrailTrails::BackendFactory.select(MACTTPB::Empty)
  end

  def test_search_miss_trail_empty_trail_list
    refute AwsCloudTrailTrails.new.exists?
  end
end

class AwsCloudTrailTrailsRecallBasicTest < Minitest::Test

  def setup
    AwsCloudTrailTrails::BackendFactory.select(MACTTPB::Basic)
  end

  def test_search_hit_via_empty_filter
    assert AwsCloudTrailTrails.new.exists?
  end
end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsCloudTrailTrailsProperties < Minitest::Test
  def setup
    AwsCloudTrailTrails::BackendFactory.select(MACTTPB::Basic)
  end
  
  def test_property_names
    basic = AwsCloudTrailTrails.new
    assert_kind_of(Array, basic.names)
    assert(basic.names.include?('test-trail-1'))
    refute(basic.names.include?(nil))
  end

  def test_property_trail_arns
    basic = AwsCloudTrailTrails.new
    assert_kind_of(Array, basic.trail_arns)
    assert(basic.trail_arns.include?('arn:aws:cloudtrail:us-east-1::trail/test-trail-1'))
    refute(basic.trail_arns.include?(nil))
  end
end
#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MACTTPB
  class Empty < AwsBackendBase
    def describe_trails(query = {})
      OpenStruct.new({ trail_list: [] })
    end
  end

  class Basic < AwsBackendBase
    def describe_trails(query = {})
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

      OpenStruct.new({ trail_list: fixtures })
    end
  end
end
