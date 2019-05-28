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

#---------- Property - has_virtual_mfa_enabled ----------#
# Positive test in 'default' test set
control "aws_iam_root_user has_virtual_mfa_enabled property" do
  describe aws_iam_root_user do
    it { should_not have_virtual_mfa_enabled }
  end
end

#---------- Property - has_hardware_mfa_enabled ----------#
# Positive test in 'default' test set
control "aws_iam_root_user has_hardware_mfa_enabled property" do
  describe aws_iam_root_user do
    it { should_not have_hardware_mfa_enabled }
  end
end

#------------- Property - has_access_key -------------#
# Negative test in 'default' test set
control "aws_iam_root_user has_access_key property" do
  describe aws_iam_root_user do
    it { should have_access_key }
  end
end