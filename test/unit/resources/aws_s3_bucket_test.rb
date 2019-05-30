require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_s3_bucket'

require 'resource_support/aws'
require 'resources/aws/aws_s3_bucket'

# MSBSB = MockS3BucketSingleBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsS3BucketConstructor < Minitest::Test
  def setup
    AwsS3Bucket::BackendFactory.select(AwsMSBSB::Basic)
  end

  def test_constructor_no_args_raises
    assert_raises(ArgumentError) { AwsS3Bucket.new }
  end

  def test_constructor_accept_scalar_param
    AwsS3Bucket.new('some-bucket')
  end

  def test_constructor_accept_hash
    AwsS3Bucket.new(bucket_name: 'some-bucket')
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsS3Bucket.new(bla: 'blabla') }
  end
end

class AwsS3BucketPropertiesTest < Minitest::Test
  def setup
    AwsS3Bucket::BackendFactory.select(AwsMSBSB::Basic)
  end

  #===========================================================================#
  #                               Search / Recall
  #===========================================================================#
  def test_recall_no_match_is_no_exception
    refute AwsS3Bucket.new('NonExistentBucket').exists?
  end

  def test_recall_match_single_result_works
    assert AwsS3Bucket.new('public').exists?
  end

  # No need to handle multiple hits; S3 bucket names are globally unique.

  #===========================================================================#
  #                               Properties
  #===========================================================================#
  #---------------------Bucket Name----------------------------#  
  def test_property_bucket_name
    assert_equal('public', AwsS3Bucket.new('public').bucket_name)
  end

  #--------------------- Region ----------------------------#  
  def test_property_region
    assert_equal('us-east-2', AwsS3Bucket.new('public').region)
    assert_equal('EU', AwsS3Bucket.new('private').region)    
  end

  #---------------------- bucket_acl -------------------------------#
  def test_property_bucket_acl_structure
    bucket_acl = AwsS3Bucket.new('public').bucket_acl

    assert_kind_of(Array, bucket_acl)
    assert(bucket_acl.size > 0)
    assert(bucket_acl.all? { |g| g.respond_to?(:permission)})
    assert(bucket_acl.all? { |g| g.respond_to?(:grantee)})
    assert(bucket_acl.all? { |g| g.grantee.respond_to?(:type)})
  end

  def test_property_bucket_acl_public
    bucket_acl = AwsS3Bucket.new('public').bucket_acl
    
    public_grants = bucket_acl.select do |g|
      g.grantee.type == 'Group' && g.grantee.uri =~ /AllUsers/
    end
    refute_empty(public_grants)
  end

  def test_property_bucket_acl_private
    bucket_acl = AwsS3Bucket.new('private').bucket_acl

    public_grants = bucket_acl.select do |g|
      g.grantee.type == 'Group' && g.grantee.uri =~ /AllUsers/
    end
    assert_empty(public_grants)
    
    auth_users_grants = bucket_acl.select do |g|
      g.grantee.type == 'Group' && g.grantee.uri =~ /AuthenticatedUsers/
    end
    assert_empty(auth_users_grants)
  end

  def test_property_bucket_acl_auth_users
    bucket_acl = AwsS3Bucket.new('auth-users').bucket_acl

    public_grants = bucket_acl.select do |g|
      g.grantee.type == 'Group' && g.grantee.uri =~ /AllUsers/
    end
    assert_empty(public_grants)
    
    auth_users_grants = bucket_acl.select do |g|
      g.grantee.type == 'Group' && g.grantee.uri =~ /AuthenticatedUsers/
    end
    refute_empty(auth_users_grants)
  end

  #---------------------- bucket_policy -------------------------------#
  def test_property_bucket_policy_structure
    bucket_policy = AwsS3Bucket.new('public').bucket_policy
    assert_kind_of(Array, bucket_policy)
    assert_kind_of(OpenStruct, bucket_policy.first)
    [:effect, :principal, :action, :resource].each do |field|
      assert_respond_to(bucket_policy.first, field)
    end
  end

  def test_property_bucket_policy_public
    bucket_policy = AwsS3Bucket.new('public').bucket_policy
    allow_all = bucket_policy.select { |s| s.effect == 'Allow' && s.principal == '*' }
    assert_equal(1, allow_all.count)
  end

  def test_property_bucket_policy_private
    bucket_policy = AwsS3Bucket.new('private').bucket_policy
    allow_all = bucket_policy.select { |s| s.effect == 'Allow' && s.principal == '*' }
    assert_equal(0, allow_all.count)
  end

  def test_property_bucket_policy_auth
    bucket_policy = AwsS3Bucket.new('auth').bucket_policy
    assert_empty(bucket_policy)
  end

  #===========================================================================#
  #                               Test Matchers
  #===========================================================================#
  def test_be_public_public_acl
    assert(AwsS3Bucket.new('public').public?)
  end
  def test_be_public_auth_acl
    assert(AwsS3Bucket.new('auth-users').public?)
  end
  def test_be_public_private_acl
    refute(AwsS3Bucket.new('private').public?)
  end

  def test_has_access_logging_enabled_positive
    assert(AwsS3Bucket.new('public').has_access_logging_enabled?)
  end

  def test_has_access_logging_enabled_negative
    refute(AwsS3Bucket.new('private').has_access_logging_enabled?)
  end

  def test_has_default_encryption_enabled_positive
    assert(AwsS3Bucket.new('public').has_default_encryption_enabled?)
  end

  def test_has_default_encryption_enabled_negative
    refute(AwsS3Bucket.new('private').has_default_encryption_enabled?)
  end

end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMSBSB
  class Basic < AwsBackendBase
    def get_bucket_acl(query)
      owner_full_control = OpenStruct.new(
        grantee: OpenStruct.new(
          type: 'CanonicalUser',
        ),
        permission: 'FULL_CONTROL',
      )

      buckets = {
        'public' => OpenStruct.new(
          :grants => [
            owner_full_control,
            OpenStruct.new(
              grantee: OpenStruct.new(
                type: 'Group',
                uri: 'http://acs.amazonaws.com/groups/global/AllUsers'
              ),
              permission: 'READ',
            ),
          ]
        ),
        'auth-users' => OpenStruct.new(
          :grants => [
            owner_full_control,
            OpenStruct.new(
              grantee: OpenStruct.new(
                type: 'Group',
                uri: 'http://acs.amazonaws.com/groups/global/AuthenticatedUsers'
              ),
              permission: 'READ',
            ),
          ]
        ),
        'private' => OpenStruct.new(:grants => [ owner_full_control ]),
        'private-acl-public-policy' => OpenStruct.new(:grants => [ owner_full_control ]),
      }
      buckets[query[:bucket]]
    end

    def get_bucket_location(query)
      buckets = {
        'public' => OpenStruct.new(location_constraint: 'us-east-2'),
        'private' => OpenStruct.new(location_constraint: 'EU'),
        'auth-users' => OpenStruct.new(location_constraint: 'ap-southeast-1'),
        'private-acl-public-policy' => OpenStruct.new(location_constraint: 'ap-southeast-2'),
      }

      buckets.fetch(query[:bucket]) { raise Aws::S3::Errors::NoSuchBucket.new(nil, nil) }
    end

    def get_bucket_policy(query)
      buckets = {
        'public' => OpenStruct.new(
          policy: StringIO.new(<<'EOP')
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::public/*"
    }
  ]
}
EOP
        ),
        'private' => OpenStruct.new(
          policy: StringIO.new(<<'EOP')          
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyGetObject",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::private/*"
    }
  ]
}
EOP
        ),
        'private-acl-public-policy' => OpenStruct.new(
          policy: StringIO.new(<<'EOP')
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::private-acl-public-policy/*"
    }
  ]
}
EOP
        ),
        # No policies for auth bucket
      }

      buckets.fetch(query[:bucket]) { raise Aws::S3::Errors::NoSuchBucketPolicy.new(nil, nil) }
    end

    def get_bucket_logging(query)
      buckets = {
        'public' => OpenStruct.new(logging_enabled: OpenStruct.new(target_bucket: 'log-bucket')),
        'private' => OpenStruct.new(logging_enabled: nil ),
      }

      buckets.fetch(query[:bucket]) { raise Aws::S3::Errors::NoSuchBucket.new(nil, nil) }
    end

    def get_bucket_encryption(query)
      buckets = {
          'public' => OpenStruct.new(server_side_encryption_configuration: OpenStruct.new(rules: []))
      }
      if query[:bucket].eql? 'private'
        raise Aws::S3::Errors::ServerSideEncryptionConfigurationNotFoundError.new(nil, nil)
      end

      buckets.fetch(query[:bucket]) { raise Aws::S3::Errors::NoSuchBucket.new(nil, nil) }
    end
  end
end
