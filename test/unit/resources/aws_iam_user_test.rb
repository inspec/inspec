# author: Simon Varlow
require 'aws-sdk'
require 'helper'

require 'aws_iam_user'

class AwsIamUserTest < Minitest::Test
  Username = "test" 
  
  def setup
    @mock_user_provider = Minitest::Mock.new
  end

  def test_that_MFA_enable_returns_true_if_MFA_Enabled
    @mock_user_provider.expect :user, {has_mfa_enabled?: true}, [Username]
    assert AwsIamUser.new(Username, @mock_user_provider).has_mfa_enabled?
  end

  def test_that_MFA_enable_returns_false_if_MFA_is_not_Enabled
    @mock_user_provider.expect :user, {has_mfa_enabled?: false}, [Username]
    refute AwsIamUser.new(Username, @mock_user_provider).has_mfa_enabled?
  end

  def test_that_console_Password_returns_true_if_console_Password_has_been_set
    @mock_user_provider.expect :user, {has_console_password?: true}, [Username]
    assert AwsIamUser.new(Username, @mock_user_provider).has_console_password?
  end

  def test_that_console_Password_returns_false_if_console_Password_has_not_been_set
    @mock_user_provider.expect :user, {has_console_password?: false}, [Username]
    refute AwsIamUser.new(Username, @mock_user_provider).has_console_password?
  end

  def test_that_access_keys_returns_aws_iam_access_key_resources
    stub_aws_access_key = Object.new
    stub_access_key_resource = Object.new
    mock_access_key_factory = Minitest::Mock.new

    @mock_user_provider.expect :user, {access_keys: [stub_aws_access_key]}, [Username]
    mock_access_key_factory.expect :create_access_key, stub_access_key_resource, [stub_aws_access_key]

    assert_equal(stub_access_key_resource,
                 AwsIamUser.new(Username, @mock_user_provider, mock_access_key_factory).access_keys[0])

    mock_access_key_factory.verify
  end

  def test_to_s
    @mock_user_provider.expect :user, {has_mfa_enabled?: true}, [Username]
    expected = "IAM User test"
    test = AwsIamUser.new(Username, @mock_user_provider).to_s
    assert_equal expected, test
  end
end
