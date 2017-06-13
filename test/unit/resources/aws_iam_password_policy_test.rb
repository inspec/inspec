require 'helper'
require 'aws_iam_password_policy'
require 'aws-sdk'
require 'json'

class AwsIamPasswordPolicyTest < Minitest::Test
  def setup
    @mockConn = Minitest::Mock.new
    @mockResource = Minitest::Mock.new
    @mockPolicy = Minitest::Mock.new

    @mockConn.expect :iam_resource, @mockResource
  end

  def test_policy_exists_when_policy_exists
    @mockResource.expect :account_password_policy, true

    assert_equal true, AwsIamPasswordPolicy.new(@mockConn).exists?
  end

  def test_policy_does_not_exists_when_no_policy
    @mockResource.expect :account_password_policy, nil do |args|
      raise Aws::IAM::Errors::NoSuchEntity.new nil, nil
    end

    assert_equal false, AwsIamPasswordPolicy.new(@mockConn).exists?
  end

  def test_throws_when_password_age_0
    @mockPolicy.expect :expire_passwords, false
    @mockResource.expect :account_password_policy, @mockPolicy

    e = assert_raises Exception do
      AwsIamPasswordPolicy.new(@mockConn).max_password_age
    end

    assert_equal e.message, 'this policy does not expire passwords'
  end

  def test_prevents_password_reuse_returns_true_when_not_nil
    configure_policy_password_reuse_prevention(value: Object.new)

    assert AwsIamPasswordPolicy.new(@mockConn).prevents_password_reuse?
  end

  def test_prevents_password_reuse_returns_false_when_nil
    configure_policy_password_reuse_prevention(value: nil)

    refute AwsIamPasswordPolicy.new(@mockConn).prevents_password_reuse?
  end

  def test_number_of_passwords_to_remember_throws_when_nil
    configure_policy_password_reuse_prevention(value: nil)

    e = assert_raises Exception do
      AwsIamPasswordPolicy.new(@mockConn).number_of_passwords_to_remember
    end

    assert_equal e.message, 'this policy does not prevent password reuse'
  end

  def test_number_of_passwords_to_remember_returns_configured_value
    expectedValue = 5
    configure_policy_password_reuse_prevention(value: expectedValue, n: 2)

    assert_equal expectedValue, AwsIamPasswordPolicy.new(@mockConn).number_of_passwords_to_remember
  end

  private 

  def configure_policy_password_reuse_prevention(value: value, n: 1)
    n.times { @mockPolicy.expect :password_reuse_prevention, value }
    @mockResource.expect :account_password_policy, @mockPolicy
  end
end
