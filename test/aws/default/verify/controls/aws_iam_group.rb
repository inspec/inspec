fixtures = {}
[
  'iam_group_administrators',
].each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/iam.tf',
  )
end

control "aws_iam_group recall" do
  describe aws_iam_group(fixtures['iam_group_administrators']) do
    it { should exist }
  end

  describe aws_iam_group('fakegroup') do
    it { should_not exist }
  end
end