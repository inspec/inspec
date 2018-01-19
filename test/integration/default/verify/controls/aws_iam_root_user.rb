fixtures = {}
[
  'aws_account_id',
].each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/iam.tf',
  )
end

#------------- Property - has_mfa_enabled -------------#
# Negative test in 'minimal' test set.  See TESTING_AGAINST_AWS.md
# for fixture instructions.
control "aws_iam_root_user has_mfa_enabled property" do
  describe aws_iam_root_user do
    it { should have_mfa_enabled }
  end
end

#------------- Property - access_key_count -------------#
# test for = 1 in 'minimal' test set
control "aws_iam_root_user access_key_count property" do
  describe aws_iam_root_user do
    its('access_key_count') { should be 0 }
  end
end