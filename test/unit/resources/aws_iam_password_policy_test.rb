require 'helper'
require 'aws_iam_password_policy'
require 'aws-sdk'
require 'json'

class AwsIamPasswordPolicyTest < Minitest::Test
  def setup
    @mockConn = Minitest::Mock.new
    @mockResource = Minitest::Mock.new

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
    policyObject = Minitest::Mock.new
    policyObject.expect :expire_passwords, false

    @mockResource.expect :account_password_policy, policyObject

    e = assert_raises Exception do
      AwsIamPasswordPolicy.new(@mockConn).max_password_age
    end

    assert_equal e.message, 'this policy does not expire passwords'
  end
end
