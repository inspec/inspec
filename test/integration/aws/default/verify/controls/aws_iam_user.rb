fixtures = {}
[
  'iam_user_recall_hit',
  'iam_user_recall_miss',
  'iam_user_no_mfa_enabled',
  'iam_user_has_console_password',
  'iam_user_with_access_key',

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

#-------------------  Recall / Miss -------------------#
control "aws_iam_user recall" do
  describe aws_iam_user(username: fixtures['iam_user_recall_hit']) do
    it { should exist }
  end

  describe aws_iam_user(username: fixtures['iam_user_recall_miss']) do
    it { should_not exist }
  end
end

control "aws_iam_user properties" do
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
    describe access_key.access_key_id do
      subject { access_key }
     its('status') { should eq 'Active' }
    end
  }

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
  #       Inline and Attached Policies
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
  [
    [0,0],
    [1,0],
    [2,0],
    [1,1],
    [0,2],
  ].each do |combo_as_ints|
    inline_count, attached_count = *combo_as_ints
    combo_as_string = "#{inline_count}i_#{attached_count}a"
    describe aws_iam_user(fixtures["iam_user_for_policies_#{combo_as_string}_name"]) do
      # Check inline has flag
      if inline_count > 0
        it { should have_inline_policies }        
      else
        it { should_not have_inline_policies }
      end

      # Check inline count
      its('inline_policy_names.count') { should eq inline_count }

      # Check for expected inline name(s)
      (1..inline_count).each do |idx|
        its('inline_policy_names') { should include "test_#{combo_as_string}_#{idx}"}
      end

      # Check attached has flag
      if attached_count > 0
        it { should have_attached_policies }        
      else
        it { should_not have_attached_policies }
      end

      # Check attached count
      its('attached_policy_names.count') { should eq attached_count }

      # Check for expected attached name(s) and arn(s)
      (1..attached_count).each do |idx|
        its('attached_policy_arns') { should include fixtures["iam_policy_user_attached_#{combo_as_string}_#{idx}_arn"] }
        its('attached_policy_names') { should include fixtures["iam_policy_user_attached_#{combo_as_string}_#{idx}_name"] }
      end
    end
  end
end
