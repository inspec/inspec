describe aws_iam_access_key(username: 'not-a-user', 'id': 'not-an-id') do
  it { should_not exist }
end
