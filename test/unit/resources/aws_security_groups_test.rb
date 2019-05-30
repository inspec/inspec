require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_security_groups'

require 'resource_support/aws'
require 'resources/aws/aws_security_groups'

# MESGB = MockSecurityGroupBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsSGConstructor < Minitest::Test
  def setup
    AwsSecurityGroups::BackendFactory.select(AwsMESGB::Empty)
  end
  
  def test_constructor_no_args_ok
    AwsSecurityGroups.new
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsSecurityGroups.new(beep: 'boop') }
  end
end

#=============================================================================#
#                            Filter Criteria
#=============================================================================#
class AwsSGFilterCriteria < Minitest::Test
  def setup
    AwsSecurityGroups::BackendFactory.select(AwsMESGB::Basic)
  end
  
  def test_filter_vpc_id
    hit = AwsSecurityGroups.new.where(vpc_id: 'vpc-12345678')
    assert(hit.exists?)

    miss = AwsSecurityGroups.new.where(vpc_id: 'vpc-87654321')
    refute(miss.exists?)
  end

  def test_filter_group_name
    hit = AwsSecurityGroups.new.where(group_name: 'alpha')
    assert(hit.exists?)

    miss = AwsSecurityGroups.new.where(group_name: 'nonesuch')
    refute(miss.exists?)
  end

end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsSGProperties < Minitest::Test
  def setup
    AwsSecurityGroups::BackendFactory.select(AwsMESGB::Basic)
  end
  
  def test_property_group_ids
    basic = AwsSecurityGroups.new
    assert_kind_of(Array, basic.group_ids)
    assert(basic.group_ids.include?('sg-aaaabbbb'))
    refute(basic.group_ids.include?(nil))
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMESGB
  class Empty < AwsBackendBase
    def describe_security_groups(_query)
      OpenStruct.new({
        security_groups: [],
      })
    end
  end

  class Basic < AwsBackendBase
    def describe_security_groups(query)
      fixtures = [
        OpenStruct.new({
          group_id: 'sg-aaaabbbb',
          group_name: 'alpha',
          vpc_id: 'vpc-aaaabbbb',
        }),
        OpenStruct.new({
          group_id: 'sg-12345678',
          group_name: 'beta',
          vpc_id: 'vpc-12345678',
        }),
      ]

      selected = fixtures.select do |sg|
        query.keys.all? do |criterion|
          query[criterion] == sg[criterion]
        end
      end

      OpenStruct.new({ security_groups: selected })
    end
  end
end
