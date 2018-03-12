require 'helper'

# MESGSB = MockEc2SecurityGroupSingleBackend
# Abbreviation not used outside this file

#=============================================================================#
#                            Constructor Tests
#=============================================================================#
class AwsSGSConstructor < Minitest::Test
  def setup
    AwsSecurityGroup::BackendFactory.select(AwsMESGSB::Empty)
  end
  
  def test_constructor_no_args_raises
    assert_raises(ArgumentError) { AwsSecurityGroup.new }
  end

  def test_constructor_accept_scalar_param
    AwsSecurityGroup.new('sg-12345678')
  end

  def test_constructor_expected_well_formed_args
    {
      id: 'sg-1234abcd',
      group_id: 'sg-1234abcd',
      vpc_id: 'vpc-1234abcd',
      group_name: 'some-group',
    }.each do |param, value| 
      AwsSecurityGroup.new(param => value)
    end
  end

  def test_constructor_reject_malformed_args
    {
      id: 'sg-xyz-123',
      group_id: '1234abcd',
      vpc_id: 'vpc_1234abcd',
    }.each do |param, value| 
      assert_raises(ArgumentError) { AwsSecurityGroup.new(param => value) }
    end
  end

  def test_constructor_reject_unknown_resource_params
    assert_raises(ArgumentError) { AwsSecurityGroup.new(beep: 'boop') }
  end
end

#=============================================================================#
#                               Properties
#=============================================================================#

class AwsSGSProperties < Minitest::Test
  def setup
    AwsSecurityGroup::BackendFactory.select(AwsMESGSB::Basic)
  end
  
  def test_property_group_id
    assert_equal('sg-12345678', AwsSecurityGroup.new('sg-12345678').group_id)
    assert_nil(AwsSecurityGroup.new(group_name: 'my-group').group_id)
  end

  def test_property_group_name
    assert_equal('beta', AwsSecurityGroup.new('sg-12345678').group_name)
    assert_nil(AwsSecurityGroup.new('sg-87654321').group_name)
  end

  def test_property_vpc_id
    assert_equal('vpc-aaaabbbb', AwsSecurityGroup.new('sg-aaaabbbb').vpc_id)
    assert_nil(AwsSecurityGroup.new('sg-87654321').vpc_id)
  end

  def test_property_description
    assert_equal('Awesome Group', AwsSecurityGroup.new('sg-12345678').description)
    assert_nil(AwsSecurityGroup.new('sg-87654321').description)
  end

  def test_property_inbound_rules
    assert_empty(AwsSecurityGroup.new('sg-87654321').inbound_rules)
    rules = AwsSecurityGroup.new('sg-12345678').inbound_rules
    assert_kind_of(Array, rules)
    assert_kind_of(Hash, rules[0])
  end

  def test_property_outbound_rules
    assert_empty(AwsSecurityGroup.new('sg-87654321').outbound_rules)
    rules = AwsSecurityGroup.new('sg-12345678').outbound_rules
    assert_kind_of(Array, rules)
    assert_kind_of(Hash, rules[0])
  end
end

#=============================================================================#
#                               Matchers
#=============================================================================#

class AwsSGSProperties < Minitest::Test
  def setup
    AwsSecurityGroup::BackendFactory.select(AwsMESGSB::Basic)
  end

  def test_matcher_allow_inbound_empty
    sg = AwsSecurityGroup.new('sg-aaaabbbb')
    rules = sg.inbound_rules
    assert_equal(0, rules.count)
    refute(sg.allow(rules)) # Should we test this - "open" crieria?
  end

  def test_matcher_allow_inbound_complex
    sg = AwsSecurityGroup.new('sg-12345678')
    rules = sg.inbound_rules
    assert_equal(2, rules.count)
    assert(sg.allow(rules, port: 22))
    assert(sg.allow(rules, port: "22"))
    assert(sg.allow(rules, to_port: "22", from_port: "22"))

    # OK to specifiy a single IP range if the resource actually has exactly one
    assert(sg.allow(rules, ipv4_range: "10.1.4.0/24"))

    # Not OK to specify a single IP range if the resource actually has a list
    refute(sg.allow(rules, ipv4_range: "10.1.2.0/24")) 
    refute(sg.allow(rules, ipv4_range: "10.1.3.0/24")) 
    # List for list is OK
    assert(sg.allow(rules, ipv4_range: ["10.1.2.0/24", "10.1.3.0/24"]))
    refute(sg.allow(rules, ipv4_range: ["10.1.22.0/24", "10.1.33.0/24"]))     
    assert(sg.allow(rules, ipv4_range: ["10.1.3.0/24", "10.1.2.0/24"])) # Order is ignored

    # Position pinning
    assert(sg.allow(rules, ipv4_range: "10.1.4.0/24", position: 2))
    assert(sg.allow(rules, ipv4_range: "10.1.4.0/24", position: "2"))
    assert(sg.allow(rules, ipv4_range: "10.1.4.0/24", position: :last))
    assert(sg.allow(rules, port: 22, position: :first))

    # Protocol
    assert(sg.allow(rules, protocol: 'tcp', position: 1))
    assert(sg.allow(rules, protocol: 'any', position: 2))
    assert(sg.allow(rules, protocol: '-1', position: 2))

  end
end

#=============================================================================#
#                               Test Fixtures
#=============================================================================#

module AwsMESGSB
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
          description: 'Some Group',
          group_id: 'sg-aaaabbbb',
          group_name: 'alpha',
          vpc_id: 'vpc-aaaabbbb',
          ip_permissions: [],
          ip_permissions_egress: [],
        }),
        OpenStruct.new({
          description: 'Awesome Group',
          group_id: 'sg-12345678',
          group_name: 'beta',
          vpc_id: 'vpc-12345678',
          ip_permissions: [
            OpenStruct.new({
              from_port: 22,
              to_port: 22,
              ip_protocol: 'tcp',
              ip_ranges: [
                OpenStruct.new({cidr_ip:"10.1.2.0/24"}),
                OpenStruct.new({cidr_ip:"10.1.3.0/24"}),
              ]
            }),
            OpenStruct.new({
              from_port: nil,
              to_port: nil,
              ip_protocol: "-1",
              ip_ranges: [
                OpenStruct.new({cidr_ip:"10.1.4.0/24"}),
              ]
            }),
          ],
          ip_permissions_egress: [
            OpenStruct.new({
              from_port: 123,
              to_port: 123,
              ip_protocol: "udp",
              ip_ranges: [
                OpenStruct.new({cidr_ip:"128.138.140.44/32"}),
              ]
            }),
          ],          
        }),
        OpenStruct.new({
          description: 'Open Group',
          group_id: 'sg-22223333',
          group_name: 'gamma',
          vpc_id: 'vpc-12345678',
          ip_permissions: [
            OpenStruct.new({
              from_port: nil,
              to_port: nil,
              ip_protocol: "-1",
              ip_ranges: [
                OpenStruct.new({cidr_ip:"0.0.0.0/0"}),
              ]
            }),
          ],
          ip_permissions_egress: [],          
        }),
      ]

      selected = fixtures.select do |sg|
        query[:filters].all? do |filter|
          filter[:values].include?(sg[filter[:name].tr('-','_')])
        end
      end

      OpenStruct.new({ security_groups: selected })
    end
  end

end
