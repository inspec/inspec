fixtures = {}
[
  'rds_db_instance_id',
].each do |fixture_name|
  fixtures[fixture_name] = input(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/rds.tf',
  )
end

control "aws_rds_instance recall of default Instance" do

  describe aws_rds_instance(fixtures['rds_db_instance_id']) do
    it { should exist }
  end

  describe aws_rds_instance('i-dont-exist') do
    it { should_not exist }
  end

end
