fixtures = {}
%w{
  iam_user_with_access_key
  iam_user_without_access_key
  iam_user_recall_miss
  iam_access_key_recall_hit
  iam_access_key_recall_miss
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: "See ../build/iam.tf"
  )
end

#======================================================#
#               IAM Access Key - Singular
#======================================================#

#-------------------  Recall / Miss -------------------#

control "aws_iam_access_key recall" do
  # Neither user nor access key ID exist
  describe aws_iam_access_key(username: fixtures["iam_user_recall_miss"], id: fixtures["iam_access_key_recall_miss"]) do
    it { should_not exist }
  end

  # User exists but has no keys
  describe aws_iam_access_key(username: fixtures["iam_user_without_access_key"], id: fixtures["iam_access_key_recall_miss"]) do
    it { should_not exist }
  end

  # User exists and has an access key
  describe aws_iam_access_key(username: fixtures["iam_user_with_access_key"], id: fixtures["iam_access_key_recall_hit"]) do
    it { should exist }
  end
end

#------------- Property - create_date -------------#
# TODO: create_date tests

#------------- Property - last_used_date -------------#
# TODO: last_used_date tests
