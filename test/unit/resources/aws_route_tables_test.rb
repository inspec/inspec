require 'helper'

require 'resource_support/aws'
require 'resources/aws/aws_route_tables'

class EmptyAwsRouteTablesTest < Minitest::Test
  def setup
    AwsRouteTables::BackendFactory.select(AwsMRtbsB::Empty)
  end

  def test_constructor_no_args_ok
    AwsRouteTables.new
  end
  
  def test_search_miss
    refute AwsRouteTables.new.exists?
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsRouteTables.new(bla: 'blabla') }
  end
end

class BasicAwsRouteTablesTest2 < Minitest::Test
  def setup
    AwsRouteTables::BackendFactory.select(AwsMRtbsB::Basic)
  end

  def test_search_hit
    assert AwsRouteTables.new.exists?
  end

  def test_property_vpc_ids
    basic = AwsRouteTables.new
    assert_kind_of(Array, basic.vpc_ids)
    assert(basic.vpc_ids.include?('vpc-169f777e'))
    assert(basic.vpc_ids.include?('vpc-169f777d'))
    refute(basic.vpc_ids.include?(nil))
  end

  def test_property_route_table_ids
    basic = AwsRouteTables.new
    assert_kind_of(Array, basic.route_table_ids)
    assert(basic.route_table_ids.include?('rtb-05462d2278326a79c'))
    assert(basic.route_table_ids.include?('rtb-58508630'))
    refute(basic.route_table_ids.include?(nil))
  end
end

# MRtbB = Mock Routetable Backend
module AwsMRtbsB
  class Empty < AwsBackendBase
    def describe_route_tables(query)
      OpenStruct.new(route_tables: [])
    end
  end

  class Basic < AwsBackendBase
    def describe_route_tables(query)
      fixtures = [
        OpenStruct.new({
                          route_table_id: 'rtb-05462d2278326a79c',
                          vpc_id: 'vpc-169f777e'
        }),
        OpenStruct.new({
                          route_table_id: 'rtb-58508630',
                          vpc_id: 'vpc-169f777d'
        })
      ]
      OpenStruct.new({ route_tables: fixtures })
    end
  end
end
