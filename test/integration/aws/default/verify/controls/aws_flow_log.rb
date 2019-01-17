fixtures = {}
%w{flow_log_alpha_vpc_log_id flow_log_alpha_subnet_log_id
   flow_log_alpha_subnet_id flow_log_vpc_id}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: "See ../build/flow_log.tf"
  )
end

control "aws_flow_log exists" do
  describe aws_flow_log(fixtures["flow_log_alpha_vpc_log_id"]) do
    it { should exist }
  end
end

control "aws_flow_log should not exist" do
  describe aws_flow_log(flow_log_id: "fl-1122aabb") do
    it { should_not exist }
  end
end

control "aws_flow_log search by flow_log_id exists" do
  describe aws_flow_log(flow_log_id: fixtures["flow_log_alpha_vpc_log_id"]) do
    it { should exist }
    it { should be_attached_to_vpc }
    its("flow_log_id") { should cmp fixtures["flow_log_alpha_vpc_log_id"] }
    its("log_group_name") { should cmp "flow_log_alpha_log_group" }
    its("resource_id") { should cmp fixtures["flow_log_vpc_id"] }
    its("resource_type") { should cmp "vpc" }
  end
end

control "aws_flow_log search by subnet exists" do
  describe aws_flow_log(subnet_id: fixtures["flow_log_alpha_subnet_id"]) do
    it { should exist }
    it { should be_attached_to_subnet }
    its("flow_log_id") { should cmp fixtures["flow_log_alpha_subnet_log_id"] }
    its("log_group_name") { should cmp "flow_log_alpha_log_group" }
    its("resource_id") { should cmp fixtures["flow_log_alpha_subnet_id"] }
    its("resource_type") { should cmp "subnet" }
  end
end

control "aws_flow_log search by vpc exists" do
  describe aws_flow_log(vpc_id: fixtures["flow_log_vpc_id"]) do
    it { should exist }
  end
end
