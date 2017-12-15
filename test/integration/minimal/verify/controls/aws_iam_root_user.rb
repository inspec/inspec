
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
# Positive test in 'default' test set
control "aws_iam_root_user has_mfa_enabled property" do
  describe aws_iam_root_user do
    it { should_not have_mfa_enabled }
  end
end

#------------- Property - access_key_count -------------#
# test for = 0 in 'default' test set
control "aws_iam_root_user access_key_count property" do
  describe aws_iam_root_user do
    its('access_key_count') { should be 1 }
  end
end