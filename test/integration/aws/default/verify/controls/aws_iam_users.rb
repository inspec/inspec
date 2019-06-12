fixtures = {}
[
  # Naming scheme: 1i_1a means one 
  # inline policy, one attached policy, etc
  'iam_user_for_policies_0i_0a_name',
  'iam_user_for_policies_1i_0a_name',
  'iam_user_for_policies_2i_0a_name',
  'iam_user_for_policies_1i_1a_name',
  'iam_user_for_policies_0i_2a_name',
  'iam_policy_user_attached_1i_1a_1_arn',
  'iam_policy_user_attached_1i_1a_1_name',
  'iam_policy_user_attached_0i_2a_1_arn',
  'iam_policy_user_attached_0i_2a_1_name',
  'iam_policy_user_attached_0i_2a_2_arn',
  'iam_policy_user_attached_0i_2a_2_name',
].each do |fixture_name|
  fixtures[fixture_name] = input(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/iam.tf',
  )
end

control "aws_iam_users filtering" do
  describe aws_iam_users.where(has_console_password?: true)
                        .where(has_mfa_enabled?: false) do
    it { should exist }
  end

  describe aws_iam_users.where { user_name =~ /user_for_policies/ }
                        .where(has_inline_policies: true) do
    its('entries.count') { should eq 3 }
    its('usernames') { should include fixtures['iam_user_for_policies_1i_0a_name'] }
    its('usernames') { should include fixtures['iam_user_for_policies_1i_1a_name'] }
    its('usernames') { should_not include fixtures['iam_user_for_policies_0i_2a_name'] }

    its('inline_policy_names.count') { should eq 4 }
    its('inline_policy_names') { should include 'test_1i_0a_1' }
    its('attached_policy_names.count') { should eq 1 }
  end

  describe aws_iam_users.where { user_name =~ /user_for_policies/ }
                        .where(has_attached_policies: true) do
    # We have 2 users from our fixtures
    its('entries.count') { should eq 2 }
    its('usernames') { should include fixtures['iam_user_for_policies_0i_2a_name'] }
    its('usernames') { should include fixtures['iam_user_for_policies_1i_1a_name'] }
    its('usernames') { should_not include fixtures['iam_user_for_policies_1i_0a_name'] }

    its('attached_policy_names.count') { should eq 3 }
    its('attached_policy_names') { should include fixtures['iam_policy_user_attached_1i_1a_1_name'] }
    its('attached_policy_arns.count') { should eq 3 }    
    its('attached_policy_arns') { should include fixtures['iam_policy_user_attached_1i_1a_1_arn'] }
  end
end
