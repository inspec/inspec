require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_security_group'

require 'resource_support/aws'
require 'resources/aws/aws_security_group'

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

  def test_property_inbound_rules_count
    assert_equal(0, AwsSecurityGroup.new('sg-aaaabbbb').inbound_rules_count)
    count = AwsSecurityGroup.new('sg-12345678').inbound_rules_count
    assert_equal(7, count)
    assert_kind_of(Numeric, count)
  end

  def test_property_outbound_rules_count
    assert_equal(0, AwsSecurityGroup.new('sg-aaaabbbb').outbound_rules_count)
    count = AwsSecurityGroup.new('sg-12345678').outbound_rules_count
    assert_equal(2, count)
    assert_kind_of(Numeric, count)
  end
end

#=============================================================================#
#                               Matchers
#=============================================================================#

class AwsSGSMatchers < Minitest::Test
  def setup
    AwsSecurityGroup::BackendFactory.select(AwsMESGSB::Basic)
  end

  def test_matcher_allow_criteria_validation
    sg = AwsSecurityGroup.new('sg-aaaabbbb')
    rules = sg.inbound_rules
    assert_raises(ArgumentError, "allow should reject unrecognized criteria") { sg.allow_in?(shoe_size: 9) }
    [
      :from_port,
      :ipv4_range,
      :port,
      :position,
      :protocol,
      :to_port,
      :security_group,
    ].each do |criterion|
      # No errors here
      sg.allow_in?(criterion => 'dummy')
    end
  end

  def test_matcher_allow_inbound_empty
    sg = AwsSecurityGroup.new('sg-aaaabbbb')
    rules = sg.inbound_rules
    assert_equal(0, rules.count)
    refute(sg.allow_in?()) # Should we test this - "open" criteria?
  end

  def test_matcher_allow_inbound_complex
    sg = AwsSecurityGroup.new('sg-12345678')
    assert_equal(3, sg.inbound_rules.count, "count the number of rules for 3-rule group")

    # Position pinning
    assert(sg.allow_in?(ipv4_range: "10.1.4.0/24", position: 2), "use numeric position")
    assert(sg.allow_in?(ipv4_range: "10.1.4.0/24", position: "2"), "use string position")
    assert(sg.allow_in?(ipv4_range: "10.2.0.0/16", position: :last), "use :last position")
    assert(sg.allow_in?(port: 22, position: :first), "use :first position")

    # Port
    assert(sg.allow_in?(port: 22), "match on a numeric port")
    assert(sg.allow_in?(port: "22"), "match on a string port")
    assert(sg.allow_in?(to_port: "22", from_port: "22"), "match on to/from port")
    assert(sg.allow_in?(port: 9002, position: 3), "range matching on port with allow_in")
    refute(sg.allow_in_only?(port: 9002, position: 3), "no range matching on port with allow_in_only")
    assert(sg.allow_in_only?(from_port: 9001, to_port: 9003, position: 3), "exact range matching on port with allow_in_only")

    # Protocol
    assert(sg.allow_in?(protocol: 'tcp'), "match on tcp protocol, unpinned")
    assert(sg.allow_in?(protocol: 'tcp', position: 1), "match on tcp protocol")
    assert(sg.allow_in?(protocol: 'any', position: 2), "match on our 'any' alias protocol")
    assert(sg.allow_in?(protocol: '-1', position: 2), "match on AWS spec '-1 for any' protocol")

    # IPv4 range testing
    assert(sg.allow_in?(ipv4_range: ["10.1.4.0/24"]), "match on 1 ipv4 range as array")
    assert(sg.allow_in?(ipv4_range: ["10.1.4.33/32"]), "match on 1 ipv4 range subnet membership")
    assert(sg.allow_in?(ipv4_range: ["10.1.4.33/32", "10.1.4.82/32"]), "match on 2 addrs ipv4 range subnet membership")
    assert(sg.allow_in?(ipv4_range: ["10.1.4.0/25", "10.1.4.128/25"]), "match on 2 subnets ipv4 range subnet membership")
    assert(sg.allow_in_only?(ipv4_range: "10.1.4.0/24", position: 2), "exact match on 1 ipv4 range with _only")
    refute(sg.allow_in_only?(ipv4_range: "10.1.4.33/32", position: 2), "no range membership ipv4 range with _only")
    assert(sg.allow_in?(ipv4_range: "10.1.2.0/24"), "match on a list ipv4 range when providing only one value (first)")
    assert(sg.allow_in?(ipv4_range: "10.1.3.0/24"), "match on a list ipv4 range when providing only one value (last)")
    assert(sg.allow_in?(ipv4_range: ["10.1.2.33/32", "10.1.3.33/32"]), "match on a list of single IPs against a list of subnets")
    assert(sg.allow_in?(ipv4_range: ["10.1.2.0/24", "10.1.3.0/24"]))
    refute(sg.allow_in?(ipv4_range: ["10.1.22.0/24", "10.1.33.0/24"]))
    assert(sg.allow_in?(ipv4_range: ["10.1.3.0/24", "10.1.2.0/24"])) # Order is ignored
    assert(sg.allow_in_only?(ipv4_range: ["10.1.2.0/24", "10.1.3.0/24"], position: 1))
    refute(sg.allow_in_only?(ipv4_range: ["10.1.2.0/24"], position: 1))
    refute(sg.allow_in_only?(ipv4_range: ["10.1.3.0/24"], position: 1))

    # IPv6 range testing
    assert(sg.allow_in?(ipv6_range: ["2001:db8::/122"]), "match on 1 ipv6 range as array")
    assert(sg.allow_in?(ipv6_range: ["2001:db8::20/128"]), "match on 1 ipv6 range subnet membership")
    assert(sg.allow_in?(ipv6_range: ["2001:db8::20/128", "2001:db8::3f/128"]), "match on 2 addrs ipv6 range subnet membership")
    assert(sg.allow_in?(ipv6_range: ["2001:db8::/128", "1968:db8::/124"]), "match on 2 subnets ipv6 range subnet membership")
    assert(sg.allow_in_only?(ipv6_range: "2018:db8::/122", position: 2), "exact match on 1 ipv6 range with _only")
    refute(sg.allow_in_only?(ipv6_range: "2001:db8::20/128", position: 2), "no range membership ipv6 range with _only")

    # Test _only with a 3-rule group, but omitting position
    refute(sg.allow_in_only?(port: 22), "_only will fail a multi-rule SG even if it has matching criteria")
    refute(sg.allow_in_only?(), "_only will fail a multi-rule SG even if it has match-any criteria")

    # Test _only with a single rule group (ie, omitting position)
    sg = AwsSecurityGroup.new('sg-22223333')
    assert_equal(1, sg.inbound_rules.count, "count the number of rules for 1-rule group")
    assert_equal(1, sg.inbound_rules_count, "Count the number of rule variants for 1-rule group")
    assert(sg.allow_in_only?(ipv4_range: "0.0.0.0/0"), "Match IP range using _only on 1-rule group")
    assert(sg.allow_in_only?(protocol: 'any'), "Match protocol using _only on 1-rule group")
    refute(sg.allow_in_only?(port: 22), "no match port using _only on 1-rule group")

    # Test _only with a single rule group for IPv6
    sg = AwsSecurityGroup.new('sg-33334444')
    assert_equal(1, sg.inbound_rules.count, "count the number of rules for 1-rule ipv6 group")
    assert_equal(1, sg.inbound_rules_count, "Count the number of rule variants for 1-rule ipv6 group")
    assert(sg.allow_in_only?(ipv6_range: "::/0"), "Match IP range using _only on 1-rule ipv6 group")
    assert(sg.allow_in_only?(protocol: 'any'), "Match protocol using _only on 1-rule ipv6 group")
    refute(sg.allow_in_only?(port: 22), "no match port using _only on 1-rule ipv6 group")

    # security-group
    sg = AwsSecurityGroup.new('sg-55556666')
    assert(sg.allow_in?(security_group: "sg-33334441"), "match on group-id")
    assert(sg.allow_in?(security_group: "sg-33334441", port: 22), "match on group-id, numeric port")
    assert(sg.allow_in?(security_group: "sg-33334441", port: "22"), "match on group-id, string port")
    assert(sg.allow_in?(security_group: "sg-33334441", to_port: "22", from_port: "22"), "match on group-id, to/from port")
    assert(sg.allow_in?(port: 9002, position: 3), "range matching on port with allow_in")
    refute(sg.allow_in_only?(port: 9002, position: 3), "no range matching on port with allow_in_only")
    refute(sg.allow_in_only?(security_group: "sg-33334441",), "no matching on group with allow_in_only when multiple group rules")
    assert(sg.allow_in_only?(from_port: 9001, to_port: 9003, position: 3), "exact range matching on port with allow_in_only")

    # Test _only with a single rule group for security-group
    sg = AwsSecurityGroup.new('sg-33334441')
    assert_equal(1, sg.inbound_rules.count, "count the number of rules for 1-rule security-group")
    assert_equal(1, sg.inbound_rules_count, "Count the number of rule variants for 1-rule security-group")
    assert(sg.allow_in_only?(security_group: "sg-33334444"), "Match security-group using _only on 1-rule security-group")
    assert(sg.allow_in_only?(protocol: 'any',security_group: "sg-33334444"), "Match protocol using _only on 1-rule security-group")
    refute(sg.allow_in_only?(port: 22, security_group: "sg-33334444"), "no match port using _only on 1-rule security-group")

    # Test _only with a single rule group for security-group with position pinning
    sg = AwsSecurityGroup.new('sg-33334442')
    assert(sg.allow_in_only?(security_group: "sg-33334444", position: 2), "Match security-group using _only with numerical position")
    assert(sg.allow_in_only?(protocol: 'any',security_group: "sg-33334444", position: 2), "Match protocol using _only on 1-rule security-group with numerical position")
    refute(sg.allow_in_only?(port: 22, security_group: "sg-33334444", position: 2), "no match port using _only on 1-rule security-group with numerical position")
    assert(sg.allow_in_only?(security_group: "sg-33334444", position: "2"), "Match security-group using _only with string position")
    assert(sg.allow_in_only?(security_group: "sg-33334444", position: :last), "Match security-group using _only with last position")
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
                # Apparently AWS returns these as plain hashes,
                # nested in two levels of Structs.
                {cidr_ip:"10.1.2.0/24"},
                {cidr_ip:"10.1.3.0/24"},
              ],
              ipv_6_ranges: [
                {cidr_ipv_6:"2001:db8::/122"},
                {cidr_ipv_6:"1968:db8::/124"},
              ],
            }),
            OpenStruct.new({
              from_port: nil,
              to_port: nil,
              ip_protocol: "-1",
              ip_ranges: [
                {cidr_ip:"10.1.4.0/24"},
              ],
              ipv_6_ranges: [
                {cidr_ipv_6:"2018:db8::/122"}
              ]
            }),
            OpenStruct.new({
              from_port: 9001,
              to_port: 9003,
              ip_protocol: "udp",
              ip_ranges: [
                {cidr_ip:"10.2.0.0/16"},
              ]
            }),
          ],
          ip_permissions_egress: [
            OpenStruct.new({
              from_port: 123,
              to_port: 123,
              ip_protocol: "udp",
              ip_ranges: [
                {cidr_ip:"128.138.140.44/32"},
              ],
              ipv_6_ranges: [
                {cidr_ipv_6:"2001:db8::/122"}
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
                {cidr_ip:"0.0.0.0/0"},
              ]
            }),
          ],
          ip_permissions_egress: [],
        }),
        OpenStruct.new({
          description: 'Open Group',
          group_id: 'sg-33334444',
          group_name: 'delta',
          vpc_id: 'vpc-12345678',
          ip_permissions: [
            OpenStruct.new({
              from_port: nil,
              to_port: nil,
              ip_protocol: "-1",
              ipv_6_ranges: [
                {cidr_ipv_6:"::/0"},
              ]
            }),
          ],
          ip_permissions_egress: [],
        }),
        OpenStruct.new({
          description: 'Open for group one group rule second position',
          group_id: 'sg-33334442',
          group_name: 'etha',
          vpc_id: 'vpc-12345678',
          ip_permissions: [
            OpenStruct.new({
              from_port: nil,
              to_port: nil,
              ip_protocol: "-1",
              ipv_6_ranges: [
                {cidr_ipv_6:"::/0"},
              ]
            }),
            OpenStruct.new({
              from_port: nil,
              to_port: nil,
              ip_protocol: "-1",
              user_id_group_pairs: [
                OpenStruct.new({
                  description: 'Open for group one rule second position',
                  group_id: 'sg-33334444',
                  group_name: 'delta',
                  peering_status: "",
                  user_id: "123456789012",
                  vpc_id: "",
                  vpc_peering_connection_id: ""
                }),
              ]
            }),
          ],
          ip_permissions_egress: [],
        }),
        OpenStruct.new({
          description: 'Open for group one rule',
          group_id: 'sg-33334441',
          group_name: 'zeta',
          vpc_id: 'vpc-12345678',
          ip_permissions: [
            OpenStruct.new({
              from_port: nil,
              to_port: nil,
              ip_protocol: "-1",
              user_id_group_pairs: [
                OpenStruct.new({
                  description: 'Open for group one rule',
                  group_id: 'sg-33334444',
                  group_name: 'delta',
                  peering_status: "",
                  user_id: '123456789012',
                  vpc_id: "",
                  vpc_peering_connection_id: ""
                }),
              ]
            }),
          ],
          ip_permissions_egress: [],
        }),
        OpenStruct.new({
          description: 'Open for group',
          group_id: 'sg-55556666',
          group_name: 'epsilon',
          vpc_id: 'vpc-12345678',
          ip_permissions: [
            OpenStruct.new({
              from_port: 80,
              to_port: 443,
              ip_protocol: "-1",
              ip_ranges: [
                {cidr_ip:"0.0.0.0/0"},
              ]
            }),
            OpenStruct.new({
              from_port: 22,
              to_port: 22,
              ip_protocol: "-1",
              user_id_group_pairs: [
                OpenStruct.new({
                  description: 'Open for group rule 2',
                  group_id: 'sg-33334441',
                  group_name: 'zeta',
                  peering_status: "",
                  user_id: '123456789012',
                  vpc_id: "",
                  vpc_peering_connection_id: ""
                }),
              ]
            }),
            OpenStruct.new({
              from_port: 9001,
              to_port: 9003,
              ip_protocol: "-1",
              user_id_group_pairs: [
                OpenStruct.new({
                  description: 'Open for group rule 3',
                  group_id: 'sg-33334441',
                  group_name: 'zeta',
                  peering_status: "",
                  user_id: '123456789012',
                  vpc_id: "",
                  vpc_peering_connection_id: ""
                }),
              ]
            }),
            OpenStruct.new({
              from_port: nil,
              to_port: nil,
              ip_protocol: "-1",
              user_id_group_pairs: [
                OpenStruct.new({
                  description: 'allow all from multiple sg',
                  group_id: 'sg-33334441',
                  group_name: 'zeta',
                  peering_status: "",
                  user_id: '123456789012',
                  vpc_id: "",
                  vpc_peering_connection_id: ""
                }),
                OpenStruct.new({
                  description: 'allow all from multiple sg[2]',
                  group_id: 'sg-33334442',
                  group_name: 'etha',
                  peering_status: "",
                  user_id: '123456789012',
                  vpc_id: "",
                  vpc_peering_connection_id: ""
                }),
                OpenStruct.new({
                  description: 'allow all from multiple sg[3]',
                  group_id: 'sg-11112222',
                  group_name: 'theta',
                  peering_status: "",
                  user_id: '123456789012',
                  vpc_id: "",
                  vpc_peering_connection_id: ""
                }),
              ]
            }),
          ],
          ip_permissions_egress: [],
        }),      ]

      selected = fixtures.select do |sg|
        query[:filters].all? do |filter|
          filter[:values].include?(sg[filter[:name].tr('-','_')])
        end
      end

      OpenStruct.new({ security_groups: selected })
    end
  end

end
