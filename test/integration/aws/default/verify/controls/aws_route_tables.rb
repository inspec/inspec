fixtures = {}
%w{
  route_table_1_id
  route_table_2_id
  route_table_1_vpc_id
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: "See ../build/ec2.tf"
  )
end

control "aws_route_tables recall" do
  # Check if at least one route table has been created and test a specific route table was created.
  describe aws_route_tables do
    it { should exist }
    its("route_table_ids") { should include fixtures["route_table_1_id"], fixtures["route_table_2_id"] }
  end
end

control "aws_route_tables properties" do
  # test the vpc ids and route table ids
  describe aws_route_tables do
    its("vpc_ids") { should include fixtures["route_table_1_vpc_id"] }
    its("route_table_ids") { should include fixtures["route_table_1_id"], fixtures["route_table_2_id"] }
  end
end
