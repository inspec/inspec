access_key_user = attribute(
  'access_key_user',
  default: 'default.access_key_user',
  description: 'Name of IAM user access_key_user')

access_key_id = attribute(
    'access_key_id',
    default: 'AKIA1234567890AZFAKE',
    description: 'Access Key ID of access key of IAM user access_key_user')

describe aws_iam_access_key(username: 'not-a-user', 'id': 'not-an-id') do
  it { should_not exist }
end

describe aws_iam_access_key(username: access_key_user, 'id': access_key_id) do
  it { should exist }
  # TODO - check last used, created, other key metadata
end

control 'IAM Access Keys' do
  title 'Fetch all'
  describe aws_iam_access_keys do
    it { should exist }
  end
end


control 'IAM Access Keys' do
  title 'Client-side filtering'
  all_keys = aws_iam_access_keys
  describe all_keys.where(username: access_key_user) do
    its('entries.length') { should be 1 }
    its('access_key_ids.first') { should eq access_key_id } 
  end
  describe all_keys.where(created_days_ago: 0) do
    it { should exist }
  end
  describe all_keys.where { active } do
    it { should exist }
  end
  describe all_keys.where { ever_used }
                   .where { last_used_days_ago > 0 } do
    it { should exist }    
  end
end

control 'AKS3' do
  title 'Fetch-time filtering'
  describe aws_iam_access_keys(username: access_key_user) do
    its('entries.length') { should be 1 }
    its('access_key_ids.first') { should eq access_key_id } 
  end

  describe aws_iam_access_keys(username: 'i-dont-exist-presumably') do
    it { should_not exist }
  end
end