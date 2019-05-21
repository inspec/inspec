require 'helper'

require 'resource_support/aws'
require 'resources/aws/aws_iam_password_policy'

class AwsIamPasswordPolicyTest < Minitest::Test
  def setup
    @mock_conn = Minitest::Mock.new
    @mock_resource = Minitest::Mock.new
    @mock_policy = Minitest::Mock.new

    @mock_conn.expect :iam_resource, @mock_resource
  end

  def test_policy_exists_when_policy_exists
    @mock_resource.expect :account_password_policy, true

    assert_equal true, AwsIamPasswordPolicy.new(@mock_conn).exists?
  end

  
  def test_policy_does_not_exists_when_no_policy
    skip "Disabled until fix for issue 2633"
    @mock_resource.expect :account_password_policy, nil do
      raise Aws::IAM::Errors::NoSuchEntity.new nil, nil
    end

    assert_equal false, AwsIamPasswordPolicy.new(@mock_conn).exists?
  end

  def test_throws_when_password_age_0
    @mock_policy.expect :expire_passwords, false
    @mock_resource.expect :account_password_policy, @mock_policy

    e = assert_raises Exception do
      AwsIamPasswordPolicy.new(@mock_conn).max_password_age_in_days
    end

    assert_equal e.message, 'this policy does not expire passwords'
  end

  def test_prevents_password_reuse_returns_true_when_not_nil
    configure_policy_password_reuse_prevention(value: Object.new)

    assert AwsIamPasswordPolicy.new(@mock_conn).prevent_password_reuse?
  end

  def test_prevents_password_reuse_returns_false_when_nil
    configure_policy_password_reuse_prevention(value: nil)

    refute AwsIamPasswordPolicy.new(@mock_conn).prevent_password_reuse?
  end

  def test_number_of_passwords_to_remember_throws_when_nil
    configure_policy_password_reuse_prevention(value: nil)

    e = assert_raises Exception do
      AwsIamPasswordPolicy.new(@mock_conn).number_of_passwords_to_remember
    end

    assert_equal e.message, 'this policy does not prevent password reuse'
  end

  def test_number_of_passwords_to_remember_returns_configured_value
    expected_value = 5
    configure_policy_password_reuse_prevention(value: expected_value, n: 2)

    assert_equal(
      expected_value,
      AwsIamPasswordPolicy.new(@mock_conn).number_of_passwords_to_remember,
    )
  end

  def test_policy_to_s
    configure_policy_password_reuse_prevention(value: Object.new)
    expected_value = 'IAM Password-Policy'
    test = AwsIamPasswordPolicy.new(@mock_conn).to_s
    assert_equal expected_value, test
  end

  private

  def configure_policy_password_reuse_prevention(value: value=nil, n: 1)
    n.times { @mock_policy.expect :password_reuse_prevention, value }
    @mock_resource.expect :account_password_policy, @mock_policy
  end
end
