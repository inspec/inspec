require 'helper'

require 'resource_support/aws'
require 'resources/aws/aws_iam_policies'

# MAIPPB = MockAwsIamPoliciesPluralBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsIamPoliciesConstructorTest < Minitest::Test

  def setup
    AwsIamPolicies::BackendFactory.select(MAIPPB::Empty)
  end

  def test_empty_params_ok
    AwsIamPolicies.new
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsIamPolicies.new(shoe_size: 9) }
  end
end


#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsIamPoliciesRecallEmptyTest < Minitest::Test

  def setup
    AwsIamPolicies::BackendFactory.select(MAIPPB::Empty)
  end

  def test_search_miss_policy_empty_policy_list
    refute AwsIamPolicies.new.exists?
  end
end

class AwsIamPoliciesRecallBasicTest < Minitest::Test

  def setup
    AwsIamPolicies::BackendFactory.select(MAIPPB::Basic)
  end

  def test_search_hit_via_empty_filter
    assert AwsIamPolicies.new.exists?
  end
end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsIamPoliciesProperties < Minitest::Test
  def setup
    AwsIamPolicies::BackendFactory.select(MAIPPB::Basic)
  end
  
  def test_property_policy_names
    basic = AwsIamPolicies.new
    assert_kind_of(Array, basic.policy_names)
    assert(basic.policy_names.include?('test-policy-1'))
    refute(basic.policy_names.include?(nil))
  end

  def test_property_arns
    basic = AwsIamPolicies.new
    assert_kind_of(Array, basic.arns)
    assert(basic.arns.include?('arn:aws:iam::aws:policy/test-policy-1'))
    refute(basic.arns.include?(nil))
  end
end
#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MAIPPB
  class Empty < AwsBackendBase
    def list_policies(query = {})
      OpenStruct.new({ policies: [] })
    end
  end

  class Basic < AwsBackendBase
    def list_policies(query = {})
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
  end
end
