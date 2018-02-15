fixtures = {}
[
  'routetable_rtb_route_table_id',
  'routetable_rtb_route_table_2_id',
  'routetable_rtb_vpc_id',
  'routetable_rtb_route_table_2_id'
].each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/ec2.tf',
  )
end

control "aws_route_tables recall" do
  # You should be able to get a specific subnet given its id
  describe aws_route_tables do
    it { should exist }
  end
end

control "aws_route_tables properties" do
  # you should be able to test the cidr_block of a subnet
  describe aws_route_tables do
    its('vpc_ids') { should include fixtures['routetable_rtb_vpc_id'] }
    its('route_table_ids') { should include fixtures['routetable_rtb_route_table_2_id'], fixtures['routetable_rtb_route_table_id'] }
  end
end