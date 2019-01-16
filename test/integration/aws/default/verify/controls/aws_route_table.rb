fixtures = {}
%w{
  route_table_1_id
  route_table_1_vpc_id
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: "See ../build/route_table.tf"
  )
end

control "aws_route_table exists" do
  describe aws_route_table do
    it { should exist }
  end
end

control "aws_route_table recall" do
  describe aws_route_table(fixtures["route_table_1_id"]) do
    it { should exist }
  end
end

control "aws_route_tables dont exist" do
  describe aws_route_table("rtb-123abcde") do
    it { should_not exist }
  end

  describe aws_route_table(route_table_id: "rtb-123abcde") do
    it { should_not exist }
  end
end
