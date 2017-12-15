
fixtures = {}
[
  'iam_user_recall_hit',
  'iam_user_recall_miss',
  'iam_user_no_mfa_enabled',
  'iam_user_has_console_password',
  'iam_user_with_access_key',
].each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/iam.tf',
  )
end

#-------------------  Recall / Miss -------------------#
describe aws_iam_user(username: fixtures['iam_user_recall_hit']) do
  it { should exist }
end

describe aws_iam_user(username: fixtures['iam_user_recall_miss']) do
  it { should_not exist }
end

#------------- Property - has_mfa_enabled -------------#

# TODO: fixture and test for has_mfa_enabled

describe aws_iam_user(username: fixtures['iam_user_no_mfa_enabled']) do
  it { should_not have_mfa_enabled }
  it { should_not have_console_password } # TODO: this is working by accident, we should have a dedicated fixture
end

#---------- Property - has_console_password -----------#

describe aws_iam_user(username: fixtures['iam_user_has_console_password']) do
  it { should have_console_password }
end

#------------- Property - access_keys -------------#

aws_iam_user(username: fixtures['iam_user_with_access_key']).access_keys.each { |access_key|
  describe access_key do
   its('status') { should eq 'Active' }
  end
}
