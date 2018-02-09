require 'helper'

# Maiusb = Mock AwsIamUsers::BackendFactory
# Abbreviation not used outside of this file

class AwsIamUsersTestConstructor < Minitest::Test
  def setup
    AwsIamUsers::BackendFactory.select(Maiusb::Empty)
  end

  def test_users_no_params_does_not_explode
    AwsIamUsers.new
  end

  def test_users_all_params_rejected
    assert_raises(ArgumentError) { AwsIamUsers.new(something: 'somevalue') }
  end
end

class AwsIamUsersTestFilterCriteria < Minitest::Test
  def setup
    # Reset to empty, that's harmless
    AwsIamUsers::BackendFactory.select(Maiusb::Empty)
  end

  #------------------------------------------#
  #                 Open Filter
  #------------------------------------------#
  def test_users_empty_result_when_no_users_no_criteria
    users = AwsIamUsers.new.where {}
    assert users.entries.empty?
  end

  def test_users_all_returned_when_some_users_no_criteria
    AwsIamUsers::BackendFactory.select(Maiusb::Basic)
    users = AwsIamUsers.new.where {}
    assert(3, users.entries.count)
  end

  #------------------------------------------#
  #           has_mfa_enabled?
  #------------------------------------------#
  def test_users_criteria_has_mfa_enabled
    AwsIamUsers::BackendFactory.select(Maiusb::Basic)
    users = AwsIamUsers.new.where { has_mfa_enabled }
    assert(1, users.entries.count)
    assert_includes users.entries.map{ |u| u[:user_name] }, 'carol'
    refute_includes users.entries.map{ |u| u[:user_name] }, 'alice'
  end

  #------------------------------------------#
  #           has_console_password?
  #------------------------------------------#
  def test_users_criteria_has_console_password?
    AwsIamUsers::BackendFactory.select(Maiusb::Basic)
    users = AwsIamUsers.new.where { has_console_password }
    assert(2, users.entries.count)
    assert_includes users.entries.map{ |u| u[:user_name] }, 'carol'
    refute_includes users.entries.map{ |u| u[:user_name] }, 'alice'
  end

  #------------------------------------------#
  #           password_ever_used?
  #------------------------------------------#
  def test_users_criteria_password_ever_used?
    AwsIamUsers::BackendFactory.select(Maiusb::Basic)
    users = AwsIamUsers.new.where { password_ever_used? }
    assert(2, users.entries.count)
    assert_includes users.entries.map{ |u| u[:user_name] }, 'carol'
    refute_includes users.entries.map{ |u| u[:user_name] }, 'alice'
  end

  #------------------------------------------#
  #           password_never_used?
  #------------------------------------------#
  def test_users_criteria_password_never_used?
    AwsIamUsers::BackendFactory.select(Maiusb::Basic)
    users = AwsIamUsers.new.where { password_never_used? }
    assert(1, users.entries.count)
    assert_includes users.entries.map{ |u| u[:user_name] }, 'alice'
    refute_includes users.entries.map{ |u| u[:user_name] }, 'carol'
  end

  #------------------------------------------#
  #        password_last_used_days_ago
  #------------------------------------------#
  def test_users_criteria_has_password_last_used_days_ago_10
    AwsIamUsers::BackendFactory.select(Maiusb::Basic)
    users = AwsIamUsers.new.where(password_last_used_days_ago: 10)
    puts users
    assert(1, users.entries.count)
    assert_includes users.entries.map{ |u| u[:user_name] }, 'bob'
    refute_includes users.entries.map{ |u| u[:user_name] }, 'alice'
  end
end

#=============================================================================#
#                        Test Fixture Classes
#=============================================================================#
module Maiusb

  # --------------------------------
  #       Empty - No users
  # --------------------------------
  class Empty < AwsBackendBase
    def list_users
      OpenStruct.new({
        users: []
      })
    end

    def get_login_profile(criteria)
      raise Aws::IAM::Errors::NoSuchEntity.new("No login profile for #{criteria[:user_name]}", 'Nope')
    end

    def list_mfa_devices(_criteria)
      OpenStruct.new({
        mfa_devices: []
      })
    end
  end

  # --------------------------------
  #      Basic - 3 Users
  # --------------------------------
  # Alice has no password or MFA device
  # Bob has a password but no MFA device
  # Carol has a password and MFA device
  class Basic < AwsBackendBase
    # arn, path, user_id omitted
    def list_users
      OpenStruct.new({
        users: [
          OpenStruct.new({
            user_name: 'alice',
            create_date: DateTime.parse('2017-10-10T16:19:30Z'),
            # Password last used is absent, never logged in w/ password
          }),
          OpenStruct.new({
            user_name: 'bob',
            create_date: DateTime.parse('2017-11-06T16:19:30Z'),
            password_last_used: Time.now - 10*24*60*60,
            }),
          OpenStruct.new({
            user_name: 'carol',
            create_date: DateTime.parse('2017-10-10T16:19:30Z'),
            password_last_used: Time.now - 91*24*60*60,
          }),
        ]
      })
    end

    def get_login_profile(criteria)
      if ['bob', 'carol'].include?(criteria[:user_name])
        OpenStruct.new({
          login_profile: OpenStruct.new({
            user_name: criteria[:user_name],
            created_date: DateTime.parse('2017-10-10T16:19:30Z')
          })
        })
      else
        raise Aws::IAM::Errors::NoSuchEntity.new("No login profile for #{criteria[:user_name]}", 'Nope')
      end
    end

    def list_mfa_devices(criteria)
      if ['carol'].include?(criteria[:user_name])
        OpenStruct.new({
          mfa_devices: [
            OpenStruct.new({
              user_name: criteria[:user_name],
              serial_number: '1234567890',
              enable_date: DateTime.parse('2017-10-10T16:19:30Z'),
            })
          ]
        })
      else
        OpenStruct.new({
          mfa_devices: []
        })
      end
    end
  end
end
