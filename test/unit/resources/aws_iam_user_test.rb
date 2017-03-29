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
    @mock_user_provider.expect :get_user, {has_mfa_enabled?: true}, [Username]
    assert AwsIamUser.new(Username, @mock_user_provider).has_mfa_enabled?
  end

  def test_that_MFA_enable_returns_false_if_MFA_is_not_Enabled
    @mock_user_provider.expect :get_user, {has_mfa_enabled?: false}, [Username]
    assert !AwsIamUser.new(Username, @mock_user_provider).has_mfa_enabled?
  end

  def test_that_console_Password_returns_true_if_console_Password_has_been_set
    @mock_user_provider.expect :get_user, {has_console_password?: true}, [Username]
    assert AwsIamUser.new(Username, @mock_user_provider).has_console_password?
  end

  def test_that_console_Password_returns_false_if_console_Password_has_not_been_set
    @mock_user_provider.expect :get_user, {has_console_password?: false}, [Username]
    assert !AwsIamUser.new(Username, @mock_user_provider).has_console_password?
  end
end