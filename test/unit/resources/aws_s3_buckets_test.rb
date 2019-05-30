require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_s3_buckets'

require 'resource_support/aws'
require 'resources/aws/aws_s3_buckets'

# MSBB = MockS3BucketsBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsS3BucketsConstructor < Minitest::Test
  def setup
    AwsS3Buckets::BackendFactory.select(AwsMSBB::Basic)
  end

  def test_constructor_no_args_ok
    AwsS3Buckets.new
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsS3Buckets.new(bla: 'blabla') }
  end
end

#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsS3BucketsRecallEmptyTest < Minitest::Test

  def setup
    AwsS3Buckets::BackendFactory.select(AwsMSBB::Empty)
  end

  def test_search_miss_via_empty_vpcs
    refute AwsS3Buckets.new.exists?
  end
end

class AwsS3BucketsRecallBasicTest < Minitest::Test

  def setup
    AwsS3Buckets::BackendFactory.select(AwsMSBB::Basic)
  end

  def test_search_hit_via_empty_filter
    assert AwsS3Buckets.new.exists?
  end
end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsS3bucketsProperties < Minitest::Test
  def setup
    AwsS3Buckets::BackendFactory.select(AwsMSBB::Basic)
  end

  def test_property_bucket_names
    basic = AwsS3Buckets.new
    assert_kind_of(Array, basic.bucket_names)
    assert(basic.bucket_names.include?('bucket-01'))
    assert(!basic.bucket_names.include?('NonExistentBucket'))
    refute(basic.bucket_names.include?(nil))
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module AwsMSBB
  class Empty < AwsBackendBase
    def list_buckets
      OpenStruct.new({ buckets: [] })
    end
  end
  
  class Basic < AwsBackendBase
    def list_buckets
      fixtures = [
        OpenStruct.new({
          name: "bucket-01",          
        }),
        OpenStruct.new({
          name: "bucket-02",
        }),
      ]
      OpenStruct.new({ buckets: fixtures })
    end
  end
end
