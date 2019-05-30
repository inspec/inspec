require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_route_table'

require 'resource_support/aws'
require 'resources/aws/aws_route_table'

class EmptyAwsRouteTableTest < Minitest::Test
  def setup
    AwsRouteTable::BackendFactory.select(AwsMRtbB::Empty)
  end

  def test_search_hit_via_scalar_works_symbol
    refute AwsRouteTable.new(route_table_id: 'rtb-123abcde').exists?
  end

  def test_search_hit_via_scalar_works_string
    refute AwsRouteTable.new('rtb-123abcde').exists?
  end
end

class BasicAwsRouteTableTest2 < Minitest::Test
  def setup
    AwsRouteTable::BackendFactory.select(AwsMRtbB::Basic)
  end

  def test_search_hit
    assert AwsRouteTable.new('rtb-05462d2278326a79c').exists?
    assert AwsRouteTable.new('rtb-58508630').exists?

    # not hexadecimal
    assert_raises(ArgumentError) do
      AwsRouteTable.new('rtb-xyzxyzxy')
    end

    # not within length constraint
    assert_raises(ArgumentError) do
      AwsRouteTable.new('rtb-abcdef012')
    end
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
                          route_table_id: 'rtb-05462d2278326a79c',
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
                          vpc_id: 'vpc-169f777e'
        })
      ]

      selected = fixtures.select do |rtb|
        query[:filters].all? do |filter|
          filter[:values].include?(rtb[filter[:name].tr('-','_')])
        end
      end

      OpenStruct.new({ route_tables: selected })
    end
  end
end
