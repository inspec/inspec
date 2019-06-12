fixtures = {}
[
  'iam_group_administrators',
].each do |fixture_name|
  fixtures[fixture_name] = input(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/iam.tf',
  )
end

control "aws_iam_groups search" do
  describe aws_iam_groups do
    it { should exist }
  end

  describe aws_iam_groups.where(group_name: fixtures['iam_group_administrators']) do
    it { should exist }
    its('count') { should cmp 1 }
  end

  describe aws_iam_groups.where(group_name: /fakegroup/) do
    it { should_not exist }
  end
end

control "aws_iam_groups properties test" do
  describe aws_iam_groups do
    its('group_names') { should include fixtures['iam_group_administrators'] }
  end
end
