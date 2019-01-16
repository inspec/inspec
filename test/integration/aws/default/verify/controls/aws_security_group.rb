fixtures = {}
%w{
  ec2_security_group_default_vpc_id
  ec2_security_group_default_group_id
  ec2_security_group_alpha_group_id
  ec2_security_group_beta_group_id
  ec2_security_group_gamma_group_id
  ec2_security_group_alpha_group_name
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: "See ../build/ec2.tf"
  )
end

control "aws_security_group recall of default VPC" do

  describe aws_security_group(fixtures["ec2_security_group_default_group_id"]) do
    it { should exist }
  end

  describe aws_security_group(group_name: "default", vpc_id: fixtures["ec2_security_group_default_vpc_id"]) do
    it { should exist }
  end

  describe aws_security_group(group_name: "no-such-security-group") do
    it { should_not exist }
  end
end

control "aws_security_group properties" do
  # You should be able to find the default security group's ID.
  describe aws_security_group(fixtures["ec2_security_group_default_group_id"]) do
    its("group_id") { should cmp fixtures["ec2_security_group_default_group_id"] }
  end

  describe aws_security_group(fixtures["ec2_security_group_alpha_group_id"]) do
    its("group_name") { should cmp fixtures["ec2_security_group_alpha_group_name"] }
    its("vpc_id") { should cmp  fixtures["ec2_security_group_default_vpc_id"] }
    its("description") { should cmp "SG alpha" }
    its("inbound_rules") { should be_a_kind_of(Array) }
    its("inbound_rules.first") { should be_a_kind_of(Hash) }
    its("inbound_rules.count") { should cmp 3 } # 3 explicit, one implicit
    its("inbound_rules_count") { should cmp 4 }
    its("outbound_rules") { should be_a_kind_of(Array) }
    its("outbound_rules.first") { should be_a_kind_of(Hash) }
    its("outbound_rules.count") { should cmp 1 } # 1 explicit
    its("outbound_rules_count") { should cmp 3 } # 3 CIDR blocks specified
  end
end

control "aws_security_group matchers" do
  describe aws_security_group(fixtures["ec2_security_group_alpha_group_id"]) do
    it { should allow_in(port: 22) }
    it { should_not allow_in(port: 631, ipv4_range: "0.0.0.0/0") }
    it { should allow_in(ipv4_range: "0.0.0.0/0", port: 80) }
    it { should_not allow_in(ipv4_range: "0.0.0.0/0", port: 22) }
    it { should allow_in(ipv4_range: "10.1.2.0/24", port: 22) }
    it { should allow_in(ipv4_range: ["10.1.2.0/24"], port: 22) }
    it { should allow_in(ipv6_range: ["2001:db8::/122"], port: 22) }

    it { should allow_in({ ipv4_range: "10.1.2.32/32", position: 2 }) }
    it { should_not allow_in_only({ ipv4_range: "10.1.2.32/32", position: 2 }) }
    it { should allow_in_only({ ipv4_range: "10.1.2.0/24", position: 2 }) }

    # Fixture allows out 6000-6007, with one rule
    it { should allow_out(port: 6003) }
    it { should_not allow_out_only(port: 6003) }
    it { should allow_out_only(from_port: 6000, to_port: 6007) }

    it { should allow_out(ipv4_range: ["10.1.2.0/24", "10.3.2.0/24"]) }
    it { should allow_out(ipv4_range: ["10.1.2.0/24", "10.3.2.0/24"], from_port: 6000, to_port: 6007) }
    it { should allow_out(ipv4_range: ["10.1.2.0/24", "10.3.2.0/24"], from_port: 6000, to_port: 6007, position: 1) }

    it { should allow_out(ipv6_range: ["2001:db8::/122"]) }
    it { should allow_out(ipv6_range: ["2001:db8::/122"], from_port: 6000, to_port: 6007) }
  end
  describe aws_security_group(fixtures["ec2_security_group_beta_group_id"]) do
    it { should allow_in(port: 22, security_group: fixtures["ec2_security_group_alpha_group_id"]) }
    it { should allow_in(security_group: fixtures["ec2_security_group_gamma_group_id"]) }
  end
  describe aws_security_group(fixtures["ec2_security_group_gamma_group_id"]) do
    it { should allow_in_only(port: 22, security_group: fixtures["ec2_security_group_alpha_group_id"]) }
  end
end
