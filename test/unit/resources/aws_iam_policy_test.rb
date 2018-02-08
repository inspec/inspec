require 'helper'
require 'aws_iam_policy'

# MAIPSB = MockAwsIamPolicySingularBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsIamPolicyConstructorTest < Minitest::Test

  def setup
    AwsIamPolicy::BackendFactory.select(MAIPSB::Empty)
  end

  def test_rejects_empty_params
    assert_raises(ArgumentError) { AwsIamPolicy.new }
  end

  def test_accepts_policy_name_as_scalar
    AwsIamPolicy.new('test-policy-1')
  end

  def test_accepts_policy_name_as_hash
    AwsIamPolicy.new(policy_name: 'test-policy-1')
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsIamPolicy.new(shoe_size: 9) }
  end
end


#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsIamPolicyRecallTest < Minitest::Test

  def setup
    AwsIamPolicy::BackendFactory.select(MAIPSB::Basic)
  end

  def test_search_hit_via_scalar_works
    assert AwsIamPolicy.new('test-policy-1').exists?
  end

  def test_search_hit_via_hash_works
    assert AwsIamPolicy.new(policy_name: 'test-policy-1').exists?
  end

  def test_search_miss_is_not_an_exception
    refute AwsIamPolicy.new(policy_name: 'non-existant').exists?
  end
end

#=============================================================================#
#                               Properties
#=============================================================================#
class AwsIamPolicyPropertiesTest < Minitest::Test

  def setup
    AwsIamPolicy::BackendFactory.select(MAIPSB::Basic)
  end

  def test_property_arn
    assert_equal('arn:aws:iam::aws:policy/test-policy-1', AwsIamPolicy.new('test-policy-1').arn)
    assert_nil(AwsIamPolicy.new(policy_name: 'non-existant').arn)
  end

  def test_property_default_version_id
    assert_equal('v1', AwsIamPolicy.new('test-policy-1').default_version_id)
    assert_nil(AwsIamPolicy.new(policy_name: 'non-existant').default_version_id)
  end

  def test_property_attachment_count
    assert_equal(3, AwsIamPolicy.new('test-policy-1').attachment_count)
    assert_nil(AwsIamPolicy.new(policy_name: 'non-existant').attachment_count)
  end

  def test_property_attached_users
    assert_equal(['test-user'], AwsIamPolicy.new('test-policy-1').attached_users)
    assert_nil(AwsIamPolicy.new(policy_name: 'non-existant').attached_users)
  end

  def test_property_attached_groups
    assert_equal(['test-group'], AwsIamPolicy.new('test-policy-1').attached_groups)
    assert_nil(AwsIamPolicy.new(policy_name: 'non-existant').attached_groups)
  end

  def test_property_attached_roles
    assert_equal(['test-role'], AwsIamPolicy.new('test-policy-1').attached_roles)
    assert_nil(AwsIamPolicy.new(policy_name: 'non-existant').attached_roles)
  end
end


#=============================================================================#
#                               Matchers
#=============================================================================#
class AwsIamPolicyMatchersTest < Minitest::Test

  def setup
    AwsIamPolicy::BackendFactory.select(MAIPSB::Basic)
  end

  def test_matcher_attached_positive
    assert AwsIamPolicy.new('test-policy-1').attached?
  end

  def test_matcher_attached_negative
    refute AwsIamPolicy.new('test-policy-2').attached?
  end
  
  def test_matcher_attached_to_user_positive
    assert AwsIamPolicy.new('test-policy-1').attached_to_user?('test-user')
  end

  def test_matcher_attached_to_user_negative
    refute AwsIamPolicy.new('test-policy-2').attached_to_user?('test-user')
  end
  
  def test_matcher_attached_to_group_positive
    assert AwsIamPolicy.new('test-policy-1').attached_to_group?('test-group')
  end

  def test_matcher_attached_to_group_negative
    refute AwsIamPolicy.new('test-policy-2').attached_to_group?('test-group')
  end

  def test_matcher_attached_to_role_positive
    assert AwsIamPolicy.new('test-policy-1').attached_to_role?('test-role')
  end

  def test_matcher_attached_to_role_negative
    refute AwsIamPolicy.new('test-policy-2').attached_to_role?('test-role')
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MAIPSB
  class Empty < AwsBackendBase
    def list_policies(query)
      OpenStruct.new(policies: [])
    end
  end

  class Basic < AwsBackendBase
    def list_policies(query)
      fixtures = [
        OpenStruct.new({
          policy_name: 'test-policy-1',
          arn: 'arn:aws:iam::aws:policy/test-policy-1',
          default_version_id: 'v1',
          attachment_count: 3,
          is_attachable: true,
        }),
        OpenStruct.new({
          policy_name: 'test-policy-2',
          arn: 'arn:aws:iam::aws:policy/test-policy-2',
          default_version_id: 'v2',
          attachment_count: 0,
          is_attachable: false,
        }),
      ]
      OpenStruct.new({ policies: fixtures })
    end

    def list_entities_for_policy(query)
      policy = {}
      policy['arn:aws:iam::aws:policy/test-policy-1'] =
      {
        policy_groups: [
          OpenStruct.new({
            group_name: 'test-group',
            group_id: 'AIDAIJ3FUBXLZ4VXV34LE',
          }),
        ],
        policy_users: [
          OpenStruct.new({
            user_name: 'test-user',
            user_id: 'AIDAIJ3FUBXLZ4VXV34LE',
          }),
        ],
        policy_roles: [
          OpenStruct.new({
            role_name: 'test-role',
            role_id: 'AIDAIJ3FUBXLZ4VXV34LE',
          }),
        ],
      }
      policy['arn:aws:iam::aws:policy/test-policy-2'] =
      {
        policy_groups: [],
        policy_users: [],
        policy_roles: [],
      }
      OpenStruct.new( policy[query[:policy_arn]] )
    end
  end
end