require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_iam_role'

require 'resource_support/aws'
require 'resources/aws/aws_iam_role'

# MIRB = MockIamRoleBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsIamRoleConstructorTest < Minitest::Test
  def setup
    AwsIamRole::BackendFactory.select(AwsMIRB::Basic)
  end

  def test_constructor_some_args_required
    assert_raises(ArgumentError) { AwsIamRole.new }
  end

  def test_constructor_accepts_scalar_role_name
    AwsIamRole.new('alpha')
  end

  def test_constructor_accepts_role_name_as_hash
    AwsIamRole.new(role_name: 'alpha')    
  end
  
  def test_constructor_rejects_unrecognized_resource_params
    assert_raises(ArgumentError) { AwsIamRole.new(beep: 'boop') }
  end
end

#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsIamRoleRecallTest < Minitest::Test
  # No setup here - each test needs to explicitly declare
  # what they want from the backend.

  def test_recall_no_match_is_no_exception
    AwsIamRole::BackendFactory.select(AwsMIRB::Miss)
    refute AwsIamRole.new('nonesuch').exists?
  end

  def test_recall_match_single_result_works
    AwsIamRole::BackendFactory.select(AwsMIRB::Basic)
    assert AwsIamRole.new('alpha').exists?
  end
end


#=============================================================================#
#                                Properties
#=============================================================================#

class AwsIamRolePropertiesTest < Minitest::Test
  def setup
    AwsIamRole::BackendFactory.select(AwsMIRB::Basic)
  end

  #---------------------------------------
  #       description
  #---------------------------------------
  def test_property_description
    assert_equal('alpha role', AwsIamRole.new('alpha').description)
  end

  def test_prop_conf_sub_count_zero
    assert_empty(AwsIamRole.new('beta').description)    
  end
end


#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module AwsMIRB
  class Miss < AwsBackendBase
    def get_role(query)
      raise Aws::IAM::Errors::NoSuchEntity.new('Nope', 'Nope')
    end
  end

  class Basic < AwsBackendBase
    def get_role(query)
      fixtures = {
        'alpha' => OpenStruct.new({
          role_name: 'alpha',
          description: 'alpha role',
        }),
        'beta' => OpenStruct.new({
          role_name: 'beta',
          description: '',
        }),
      }
      unless fixtures.key?(query[:role_name])
        raise Aws::IAM::Errors::NoSuchEntity.new('Nope', 'Nope')
      end
      OpenStruct.new({
        role: fixtures[query[:role_name]]
      })
    end
  end
end
