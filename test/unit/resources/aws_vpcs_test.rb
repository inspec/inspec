require 'helper'
require 'ipaddr'

require 'resource_support/aws'
require 'resources/aws/aws_vpcs'

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
#                            Filter Criteria
#=============================================================================#
class AwsVpcsFilterCriteriaTest < Minitest::Test

  def setup
    AwsVpcs::BackendFactory.select(MAVPB::Basic)
  end

  def test_filter_with_no_criteria
    assert AwsVpcs.new.exists?
  end

  def test_filter_with_vpc_id
    hit = AwsVpcs.new.where(:vpc_id => 'vpc-aaaabbbb')
    assert(hit.exists?)

    miss = AwsVpcs.new.where(:vpc_id => 'vpc-09876543')
    refute(miss.exists?)
  end

  def test_filter_with_cidr_block
    hit = AwsVpcs.new.where(:cidr_block => '10.0.0.0/16')
    assert(hit.exists?)

    # This triggers a bug/misfeature in FilterTable - see https://github.com/chef/inspec/issues/2929
    # hit = AwsVpcs.new.where { IPAddr.new('10.0.0.0/8').include? cidr_block }
    hit = AwsVpcs.new.where { cidr_block.start_with? '10' }
    assert(hit.exists?)
    assert_equal(2, hit.entries.count)

    miss = AwsVpcs.new.where(:cidr_block => '11.0.0.0/16')
    refute(miss.exists?)
  end

  def test_filter_with_dhcp_options_id
    hit = AwsVpcs.new.where(:dhcp_options_id => 'dopt-aaaabbbb')
    assert(hit.exists?)

    miss = AwsVpcs.new.where(:dhcp_options_id => 'dopt-12345678')
    refute(miss.exists?)
  end
end

#=============================================================================#
#                            Properties
#=============================================================================#
class AwsVpcsProperties < Minitest::Test

  def setup
    AwsVpcs::BackendFactory.select(MAVPB::Basic)
    @vpcs = AwsVpcs.new
  end

  def test_property_vpc_ids
    assert_includes(@vpcs.vpc_ids, 'vpc-aaaabbbb')
    assert_includes(@vpcs.vpc_ids, 'vpc-12344321')
    refute_includes(@vpcs.vpc_ids, nil)
  end

  def test_property_cidr_blocks
    assert_includes(@vpcs.cidr_blocks, '10.0.0.0/16')
    assert_includes(@vpcs.cidr_blocks, '10.1.0.0/16')    
    refute_includes(@vpcs.cidr_blocks, nil)    
  end

  def test_property_dhcp_options_ids
    assert_includes(@vpcs.dhcp_options_ids, 'dopt-aaaabbbb')
    # Should be de-duplicated
    assert_equal(1, @vpcs.dhcp_options_ids.count)
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
          dhcp_options_id: 'dopt-aaaabbbb', # Same as vpc-aaaabbbb
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
