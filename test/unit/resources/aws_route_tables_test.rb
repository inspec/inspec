require 'helper'

class EmptyAwsRouteTablesTest < Minitest::Test
  def setup
    AwsRouteTables::BackendFactory.select(AwsMRtbB::Empty)
  end

  def test_constructor_no_args_ok
    AwsRouteTables.new
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsRouteTables.new(bla: 'blabla') }
  end
end

class BasicAwsRouteTablesTest2 < Minitest::Test
  def setup
    AwsRouteTables::BackendFactory.select(AwsMRtbB::Basic)
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
    assert(basic.route_table_ids.include?('rtb-2c60ec44'))
    assert(basic.route_table_ids.include?('rtb-58508630'))
    refute(basic.route_table_ids.include?(nil))
  end
end

# MRtbB = Mock Routetable Backend
module AwsMRtbB
  class Empty < AwsBackendBase
    def describe_route_tables(query)
      OpenStruct.new(route_tables: [])
    end
  end

  class Basic < AwsBackendBase
    def describe_route_tables(query)
      fixtures = [
        OpenStruct.new({associations: [],
                          propagating_vgws: [],
                          route_table_id: 'rtb-2c60ec44',
                          routes: [
                            {destination_cidr_block: '172.32.1.0/24', gateway_id: 'igw-4fb9e626', origin: 'CreateRoute', state: 'active'},
                            {destination_cidr_block: '172.31.0.0/16', gateway_id: 'local', origin: 'CreateRouteTable', state: 'active'}
                          ],
                          tags: [{key: 'Name', value: 'InSpec'}],
                          vpc_id: 'vpc-169f777e'
        }),
        OpenStruct.new({associations: [],
                          propagating_vgws: [],
                          route_table_id: 'rtb-58508630',
                          routes: [
                            {destination_cidr_block: '172.33.0.0/16', gateway_id: 'local', origin: 'CreateRouteTable', state: 'active'},
                            {destination_cidr_block: '0.0.0.0/0', gateway_id: 'igw-4fb9e626', origin: 'CreateRoute', state: 'active'}
                          ],
                          tags: [{key: 'Name', value: 'InSpec'}],
                          vpc_id: 'vpc-169f777d'
        })
      ]
      OpenStruct.new({ route_tables: fixtures })
    end
  end
end
