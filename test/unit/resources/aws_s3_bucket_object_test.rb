require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_s3_bucket_object'

require 'resource_support/aws'
require 'resources/aws/aws_s3_bucket_object'

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
    assert_raises(ArgumentError) { AwsS3BucketObject.new(bla: 'NonExistingBucket') }
  end

  def test_constructor_reject_bucket_not_given
    assert_raises(ArgumentError) { AwsS3BucketObject.new(key: 'public_file.jpg') }
  end
  
  def test_constructor_reject_key_not_given
    assert_raises(ArgumentError) { AwsS3BucketObject.new(bucket_name: 'Public Bucket') }
  end
end

#=============================================================================#
#                               Recall
#=============================================================================#

class AwsS3BucketObjectRecallTest < Minitest::Test
  def setup
    AwsS3BucketObject::BackendFactory.select(AwsMSBOSB::Basic)
  end

  def test_searching
    assert(AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg').exists?)
    refute(AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'NonExistingObject').exists?)
    refute(AwsS3BucketObject.new(bucket_name: 'NonExistingBucket', key: 'public_file.jpg').exists?)
  end
end

#=============================================================================#
#                               Properties
#=============================================================================#

class AwsS3BucketTestProperties < Minitest::Test
  def setup
    AwsS3BucketObject::BackendFactory.select(AwsMSBOSB::Basic)
  end

  #---------------------Bucket Name----------------------------#  
  def test_property_bucket_name
    assert_equal('Public Bucket', AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg').bucket_name)
  end

  #--------------------- Key ----------------------------#  
  def test_property_key
    assert_equal('public_file.jpg', AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg').key)
  end

  #---------------------- object_acl -------------------------------#
  def test_property_object_acl_structure
    object_acl = AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg').object_acl

    assert_kind_of(Array, object_acl)
    assert(object_acl.size > 0)
    assert(object_acl.all? { |g| g.respond_to?(:permission)})
    assert(object_acl.all? { |g| g.respond_to?(:grantee)})
    assert(object_acl.all? { |g| g.grantee.respond_to?(:type)})
  end

  def test_property_object_acl_public
    bucket_acl = AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg').object_acl
    
    public_grants = bucket_acl.select do |g|
      g.grantee.type == 'Group' && g.grantee.uri =~ /AllUsers/
    end
    refute_empty(public_grants)
  end

  def test_property_object_acl_private
    bucket_acl = AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'private_file.jpg').object_acl

    public_grants = bucket_acl.select do |g|
      g.grantee.type == 'Group' && g.grantee.uri =~ /AllUsers/
    end
    assert_empty(public_grants)
    
    auth_users_grants = bucket_acl.select do |g|
      g.grantee.type == 'Group' && g.grantee.uri =~ /AuthenticatedUsers/
    end
    assert_empty(auth_users_grants)
  end
end

#=============================================================================#
#                               Matchers
#=============================================================================#

class AwsS3BucketMatchersTest < Minitest::Test
  def setup
    AwsS3BucketObject::BackendFactory.select(AwsMSBOSB::Basic)
  end
  
  def test_matcher_public
    assert_equal(true, AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'public_file.jpg').public?)
    assert_equal(false, AwsS3BucketObject.new(bucket_name: 'Public Bucket', key: 'private_file.jpg').public?)
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMSBOSB
  class Basic < AwsBackendBase
    def get_object_acl(query)
      buckets = {
        'Public Bucket' => OpenStruct.new({
          'public_file.jpg' => OpenStruct.new({
            :grants => [
              OpenStruct.new({
                'grantee' => OpenStruct.new({
                  type: 'CanonicalUser',
                }),
                permission: 'FULL_CONTROL',
              }),
              OpenStruct.new({
                'grantee' => OpenStruct.new({
                  type: 'AmazonCustomerByEmail',
                }),
                permission: 'READ',
              }),
              OpenStruct.new({
                'grantee' => OpenStruct.new({
                  type: 'Group',
                  uri: 'http://acs.amazonaws.com/groups/global/AllUsers'
                }),
                permission: 'READ',
              }),
            ]
          }),
          'private_file.jpg' => OpenStruct.new({
            :grants => [
              OpenStruct.new({
                'grantee' => OpenStruct.new({
                  type: 'CanonicalUser',
                }),
                permission: 'FULL_CONTROL',
              }),
            ]
          }),
        })
      }
      buckets[query[:bucket]][query[:key]]
    end
    
    def get_object(query)
      buckets = {
        'Public Bucket' => OpenStruct.new({
          'public_file.jpg' => OpenStruct.new({
          }),
          'private_file.jpg' => OpenStruct.new({
          }),
        })
      }
      bucket = buckets[query[:bucket]]
      raise Aws::S3::Errors::NoSuchBucket.new(Seahorse::Client::Http::Request, "Bucket does not exist") if bucket.nil?
      object = bucket[query[:key]]
      raise Aws::S3::Errors::NoSuchKey.new(Seahorse::Client::Http::Request, "Key does not exist") if object.nil?
      object
    end
  end
end
