require 'helper'
require 'aws_vpcs'

# MAVPB = MockAwsVpcsPluralBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsVpcsConstructorTest < Minitest::Test

  def setup
    AwsVpcs::BackendFactory.select(MAVPB::Empty)
  end

  def test_empty_params_ok
    AwsVpcs.new
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsVpcs.new(shoe_size: 9) }
  end
end


#=============================================================================#
#                               Search / Recall
#=============================================================================#
class AwsVpcsRecallEmptyTest < Minitest::Test

  def setup
    AwsVpcs::BackendFactory.select(MAVPB::Empty)
  end

  def test_search_miss_via_empty_vpcs
    refute AwsVpcs.new.exists?
  end
end

class AwsVpcsRecallBasicTest < Minitest::Test

  def setup
    AwsVpcs::BackendFactory.select(MAVPB::Basic)
  end

  def test_search_hit_via_empty_filter
    assert AwsVpcs.new.exists?
  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#
module MAVPB
  class Empty < AwsBackendBase
    def describe_vpcs(query = {})
      OpenStruct.new({ vpcs: [] })
    end
  end

  class Basic < AwsBackendBase
    def describe_vpcs(query = {})
      fixtures = [
        OpenStruct.new({
          cidr_block: '10.0.0.0/16',
          dhcp_options_id: 'dopt-aaaabbbb',
          state: 'available',
          vpc_id: 'vpc-aaaabbbb',
          instance_tenancy: 'default',
          is_default: true
        }),
        OpenStruct.new({
          cidr_block: '10.1.0.0/16',
          dhcp_options_id: 'dopt-43211234',
          state: 'available',
          vpc_id: 'vpc-12344321',
          instance_tenancy: 'default',
          is_default: false
        }),
      ]

      query[:filters] = [] if query[:filters].nil?

      selected = fixtures.select do |vpc|
        query[:filters].all? do |filter|
          if filter[:name].eql? "isDefault"
            filter[:name] = "is_default"
          end
          filter[:values].include?(vpc[filter[:name].tr('-','_')].to_s)
        end
      end

      OpenStruct.new({ vpcs: selected })
    end
  end
end
