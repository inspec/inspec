# encoding: utf-8
require 'ostruct'
require 'helper'
require 'aws_s3_bucket_object'

# MSBOSB = MockS3BucketObjectSingleBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsS3BucketObjectConstructor < Minitest::Test
  def setup
    AwsS3BucketObject::BackendFactory.select(AwsMSBOSB::Basic)
  end

  def test_constructor_no_args_raises
    assert_raises(ArgumentError) { AwsS3BucketObject.new }
  end

  def test_constructor_no_bucket_name_arg_raises
    assert_raises(ArgumentError) { AwsS3BucketObject.new(:key, 'key') }
  end

  def test_constructor_no_key_arg_raises
    assert_raises(ArgumentError) { AwsS3BucketObject.new(:bucket_name, 'bucket') }
  end

  def test_constructor_expected_well_formed_args
    AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg')
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsS3BucketObject.new(bla: 'blabla') }
  end

  def test_constructor_reject_bucket_doesntexist
    assert_raises(ArgumentError) { AwsS3BucketObject.new(bla: 'blabla') }
  end
end

#=============================================================================#
#                               Recall
#=============================================================================#

class AwsS3BucketRecallTest < Minitest::Test
  def setup
    AwsS3BucketObject::BackendFactory.select(AwsMSBOSB::Basic)
  end

  def test_searching
    AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg')
    assert_equal(false, AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'NonExistingObject').exists?)
    assert_equal(false, AwsS3BucketObject.new(bucket_name: 'NonExistingBucket', key: 'public_file.jpg').exists?)
  end
end

#=============================================================================#
#                               Properties
#=============================================================================#

class AwsS3BucketTestProperties < Minitest::Test
  def setup
    AwsS3BucketObject::BackendFactory.select(AwsMSBOSB::Basic)
  end

  #-----------------------------------------------------#
  # Testing Properties of a public object
  #-----------------------------------------------------#
  def test_property_permissions_public_object
    assert_equal(['FULL_CONTROL'], AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg').permissions.owner)
    assert_equal(['READ'], AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg').permissions.authUsers)
    assert_equal(['READ'], AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg').permissions.everyone)
  end

  #-----------------------------------------------------#
  # Testing Properties of a private object
  #-----------------------------------------------------#
  def test_property_permissions_private_object
    assert_equal(['FULL_CONTROL'], AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'private_file.jpg').permissions.owner)
    assert_equal([], AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'private_file.jpg').permissions.authUsers)
    assert_equal([], AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'private_file.jpg').permissions.everyone)
  end

end

#=============================================================================#
#                               Matchers
#=============================================================================#

class AwsS3BucketMatchersTest < Minitest::Test
  def setup
    AwsS3BucketObject::BackendFactory.select(AwsMSBOSB::Basic)
  end
  
  def test_property_has_public_files
    assert_equal(true, AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg').public)
    assert_equal(false, AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'private_file.jpg').public)
  end

  def test_property_name
    assert_equal('Public Bucket', AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg').bucket_name)
  end

  def test_property_key
    assert_equal('public_file.jpg', AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg').key)
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMSBOSB
  class Basic < AwsS3BucketObject::Backend
    def get_object_acl(query)
      buckets = {
        'Public Bucket' => OpenStruct.new({
          'public_file.jpg' => OpenStruct.new({
            :grants => [
              OpenStruct.new({
                grantee: {
                  type: 'CanonicalUser',
                },
                permission: 'FULL_CONTROL',
              }),
              OpenStruct.new({
                grantee: {
                  type: 'AmazonCustomerByEmail',
                },
                permission: 'READ',
              }),
              OpenStruct.new({
                grantee: {
                  type: 'Group',
                  uri: 'http://acs.amazonaws.com/groups/global/AllUsers'
                },
                permission: 'READ',
              }),
            ]
          }),
          'private_file.jpg' => OpenStruct.new({
            :grants => [
              OpenStruct.new({
                grantee: {
                  type: 'CanonicalUser',
                },
                permission: 'FULL_CONTROL',
              }),
            ]
          }),
        })
      }
      buckets[query[:bucket]][query[:key]][:grants]
    end
  end
end
