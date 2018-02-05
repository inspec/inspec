fixtures = {}
[
  'iam_user_with_access_key',
  'iam_user_without_access_key',  
  'iam_user_recall_miss',  
  'iam_access_key_recall_hit',
  'iam_access_key_recall_miss',
].each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/iam.tf',
  )
end

#======================================================#
#               IAM Access Key - Singular
#======================================================#

#-------------------  Recall / Miss -------------------#

control "aws_iam_access_key recall" do
  # Neither user nor access key ID exist
  describe aws_iam_access_key(username: fixtures['iam_user_recall_miss'], id: fixtures['iam_access_key_recall_miss']) do
    it { should_not exist }
  end

  # User exists but has no keys
  describe aws_iam_access_key(username: fixtures['iam_user_without_access_key'], id: fixtures['iam_access_key_recall_miss']) do
    it { should_not exist }
  end

  # User exists and has an access key
  describe aws_iam_access_key(username: fixtures['iam_user_with_access_key'], id: fixtures['iam_access_key_recall_hit']) do    
    it { should exist }
  end
end

#------------- Property - create_date -------------#
# TODO: create_date tests

#------------- Property - last_used_date -------------#
# TODO: last_used_date tests

#======================================================#
#               IAM Access Key - Plural
#======================================================#

control 'IAM Access Keys - fetch all' do
  describe aws_iam_access_keys do
    it { should exist }
  end
end

control 'IAM Access Keys - Client-side filtering' do
  all_keys = aws_iam_access_keys
  describe all_keys.where(username: fixtures['iam_user_with_access_key']) do
    its('entries.length') { should be 1 }
    its('access_key_ids.first') { should eq fixtures['iam_access_key_recall_hit'] } 
  end
  describe all_keys.where(created_days_ago: 0) do
    it { should exist }
  end
  describe all_keys.where { active } do
    it { should exist }
  end

  # This would presumably refer to your test-user-last-key-use IAM user
  # This test will fail if you have very recently setup your
  # testing environment
  describe all_keys.where { ever_used }
                   .where { last_used_days_ago > 0 } do
    it { should exist }    
  end
  describe all_keys.where { created_with_user } do
    it { should exist }
  end
end

control 'IAM Access Keys - fetch-time filtering' do
  describe aws_iam_access_keys(username: fixtures['iam_user_with_access_key']) do
    its('entries.length') { should be 1 }
    its('access_key_ids.first') { should eq fixtures['iam_access_key_recall_hit'] } 
  end

  describe aws_iam_access_keys(username: fixtures['iam_user_without_access_key']) do
    it { should_not exist }
  end
end