# author: Simon Varlow
require 'helper'
require 'aws_iam_user'

# MAUIB = MockAwsIamUserBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsIamUserConstructorTest < Minitest::Test

  def setup
    AwsIamUser::BackendFactory.select(MAIUB::Three)
  end

  def test_empty_params_throws_exception
    assert_raises(ArgumentError) { AwsIamUser.new }
  end

  def test_accepts_username_as_scalar
    AwsIamUser.new('erin')
  end

  def test_accepts_username_as_hash
    AwsIamUser.new(username: 'erin')
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsIamUser.new(shoe_size: 9) }
  end
end

#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsIamUserRecallTest < Minitest::Test
  def setup
    AwsIamUser::BackendFactory.select(MAIUB::Three)
  end

  def test_search_miss_is_not_an_exception
    user = AwsIamUser.new('tommy')
    refute user.exists?
  end

  def test_search_hit_via_scalar_works
    user = AwsIamUser.new('erin')
    assert user.exists?
    assert_equal('erin', user.username)
  end

  def test_search_hit_via_hash_works
    user = AwsIamUser.new(username: 'erin')
    assert user.exists?
    assert_equal('erin', user.username)    
  end
end

#=============================================================================#
#                                Properties
#=============================================================================#

class AwsIamUserPropertiesTest < Minitest::Test
  def setup
    AwsIamUser::BackendFactory.select(MAIUB::Three)
  end

  #-----------------------------------------------------#
  # username property
  #-----------------------------------------------------#
  def test_property_username_correct_on_hit
    user = AwsIamUser.new(username: 'erin')
    assert_equal('erin', user.username)
  end

  #-----------------------------------------------------#
  # has_console_password property and predicate
  #-----------------------------------------------------#
  def test_property_password_positive
    user = AwsIamUser.new(username: 'erin')
    assert_equal(true, user.has_console_password)
    assert_equal(true, user.has_console_password?)
  end

  def test_property_password_negative
    user = AwsIamUser.new(username: 'leslie')
    assert_equal(false, user.has_console_password)
    assert_equal(false, user.has_console_password?)
  end

  #-----------------------------------------------------#
  # has_mfa_enabled property and predicate
  #-----------------------------------------------------#
  def test_property_mfa_positive
    user = AwsIamUser.new(username: 'erin')
    assert_equal(true, user.has_mfa_enabled)
    assert_equal(true, user.has_mfa_enabled?)
  end

  def test_property_mfa_negative
    user = AwsIamUser.new(username: 'leslie')
    assert_equal(false, user.has_mfa_enabled)
    assert_equal(false, user.has_mfa_enabled?)
  end
  
  #-----------------------------------------------------#
  # access_keys property
  #-----------------------------------------------------#
  def test_property_access_keys_positive
    keys = AwsIamUser.new(username: 'erin').access_keys
    assert_kind_of(Array, keys)
    assert_equal(keys.length, 2)
    # We don't currently promise that the results 
    # will be Inspec resource objects.
    # assert_kind_of(AwsIamAccessKey, keys.first)    
  end

  def test_property_access_keys_negative
    keys = AwsIamUser.new(username: 'leslie').access_keys
    assert_kind_of(Array, keys)
    assert(keys.empty?)    
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module MAIUB
  class Three < AwsBackendBase
    def get_user(criteria)
      people = {
        'erin' => OpenStruct.new({
          user: OpenStruct.new({
            arn: "arn:aws:iam::123456789012:user/erin", 
            create_date: Time.parse("2016-09-21T23:03:13Z"), 
            path: "/", 
            user_id: "AKIAIOSFODNN7EXAERIN", 
            user_name: "erin", 
          }),
        }),
        'leslie' => OpenStruct.new({
          user: OpenStruct.new({
            arn: "arn:aws:iam::123456789012:user/leslie", 
            create_date: Time.parse("2017-09-21T23:03:13Z"), 
            path: "/", 
            user_id: "AKIAIOSFODNN7EXAERIN", 
            user_name: "leslie", 
          }),
        }),
        'jared' => OpenStruct.new({
          user: OpenStruct.new({
            arn: "arn:aws:iam::123456789012:user/jared", 
            create_date: Time.parse("2017-09-21T23:03:13Z"), 
            path: "/", 
            user_id: "AKIAIOSFODNN7EXAERIN", 
            user_name: "jared", 
          }),
        }),
      }
      raise Aws::IAM::Errors::NoSuchEntity.new(nil, nil) unless people.key?(criteria[:user_name])
      people[criteria[:user_name]]
    end

    def get_login_profile(criteria)
      # Leslie has no password
      # Jared's is expired
      people = {
        'erin' => OpenStruct.new({
          login_profile: OpenStruct.new({
            user_name: 'erin',
            password_reset_required: false,
            create_date: Time.parse("2016-09-21T23:03:13Z"),
          }),
        }),
        'jared' => OpenStruct.new({
          login_profile: OpenStruct.new({
            user_name: 'jared',
            password_reset_required: true,
            create_date: Time.parse("2017-09-21T23:03:13Z"),
          }),
        }),
      }
      raise Aws::IAM::Errors::NoSuchEntity.new(nil, nil) unless people.key?(criteria[:user_name])
      people[criteria[:user_name]]
    end
    def list_mfa_devices(criteria)
      # Erin has 2, one soft and one hw
      # Leslie has none
      # Jared has one soft
      people = {
        'erin' => OpenStruct.new({
          mfa_devices: [
            OpenStruct.new({
              user_name: 'erin',
              serial_number: 'arn:blahblahblah',
              enable_date: Time.parse("2016-09-21T23:03:13Z"),
            }),
            OpenStruct.new({
              user_name: 'erin',
              serial_number: '1234567890',
              enable_date: Time.parse("2016-09-21T23:03:13Z"),
            }),
          ]
        }),
        'leslie' => OpenStruct.new({mfa_devices: []}),
        'jared' => OpenStruct.new({
          mfa_devices: [
            OpenStruct.new({
              user_name: 'jared',
              serial_number: 'arn:blahblahblah',
              enable_date: Time.parse("2016-09-21T23:03:13Z"),
            }),
          ]
        }),
      }
      people[criteria[:user_name]]
    end
    def list_access_keys(criteria)
      # Erin has 2
      # Leslie has none
      # Jared has one
      people = {
        'erin' => OpenStruct.new({
          access_key_metadata: [
            OpenStruct.new({
              user_name: 'erin',
              access_key_id: 'AKIA111111111EXAMPLE',
              create_date: Time.parse("2016-09-21T23:03:13Z"),
              status: 'Active',
            }),
            OpenStruct.new({
              user_name: 'erin',
              access_key_id: 'AKIA222222222EXAMPLE',
              create_date: Time.parse("2016-09-21T23:03:13Z"),
              status: 'Active',
            }),
          ]
        }),
        'leslie' => OpenStruct.new({access_key_metadata: []}),
        'jared' => OpenStruct.new({
          access_key_metadata: [
            OpenStruct.new({
              user_name: 'jared',
              access_key_id: 'AKIA3333333333EXAMPLE',
              create_date: Time.parse("2017-10-21T23:03:13Z"),
              status: 'Active',
            }),
          ]
        }),
      }
      people[criteria[:user_name]]
    end
  end
end