require 'helper'
require 'iam_password_policy'
require 'aws-sdk'
require 'json'

class IamPasswordPolicyTest < Minitest::Test
  def setup
    @mockConn = Minitest::Mock.new
  end

  def test_policy_exists_when_policy_exists
    @mockResource = Minitest::Mock.new
    @mockResource.expect :account_password_policy, true
    @mockConn.expect :iam_resource, @mockResource
    assert_equal true, IamPasswordPolicy.new(@mockConn).exists?
  end

  def test_policy_does_not_exists_when_no_policy
    @mockResource = Minitest::Mock.new
    @mockResource.expect :account_password_policy, nil do |args|
      raise Aws::IAM::Errors::NoSuchEntity.new nil, nil
    end
    @mockConn.expect :iam_resource, @mockResource
    assert_equal false, IamPasswordPolicy.new(@mockConn).exists?
  end

  def test_throws_when_password_age_0
    @mockResource = Minitest::Mock.new
    @policyObject = Minitest::Mock.new
    @policyObject.expect :expire_passwords, false

    @mockResource.expect :account_password_policy, @policyObject
    @mockConn.expect :iam_resource, @mockResource
    begin
      IamPasswordPolicy.new(@mockConn).max_password_age
      flunk 'Should throw before getting here'
    rescue Exception => e
      assert_equal e.message, 'this policy does not expire passwords'
    end
  end
end