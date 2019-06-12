fixtures = {}
[
  'aws_account_id',
].each do |fixture_name|
  fixtures[fixture_name] = input(
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

#---------- Property - has_virtual_mfa_enabled ----------#
# Negative test in 'minimal' test set.
control "aws_iam_root_user has_virtual_mfa_enabled property" do
  describe aws_iam_root_user do
    it { should have_virtual_mfa_enabled }
  end
end

#------------- Property - has_access_key -------------#
# Positive test in 'minimal' test set
control "aws_iam_root_user has_access_key property" do
  describe aws_iam_root_user do
    it { should_not have_access_key }
  end
end
