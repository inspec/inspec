fixtures = {}
%w{
  s3_bucket_public_name
  s3_bucket_private_name
  s3_bucket_auth_name
  s3_bucket_private_acl_public_policy_name
  s3_bucket_public_region
  s3_bucket_default_encryption_enabled_name
  s3_bucket_default_encryption_not_enabled_name
  s3_bucket_access_logging_enabled_name
  s3_bucket_access_logging_not_enabled_name
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: "See ../build/s3.tf"
  )
end

control "aws_s3_bucket recall tests" do
  #------------------- Exists -------------------#
  describe aws_s3_bucket(bucket_name: fixtures["s3_bucket_public_name"]) do
    it { should exist }
  end

  #------------------- Does Not Exist -------------------#
  describe aws_s3_bucket(bucket_name: "inspec-testing-NonExistentBucket.chef.io") do
    it { should_not exist }
  end
end

control "aws_s3_bucket properties tests" do
  #--------------------------- Region --------------------------#
  describe aws_s3_bucket(bucket_name: fixtures["s3_bucket_public_name"]) do
    its("region") { should eq fixtures["s3_bucket_public_region"] }
  end

  #------------------- bucket_acl -------------------#
  describe "Bucket ACL: Public grants on a public bucket" do
    subject do
      aws_s3_bucket(bucket_name: fixtures["s3_bucket_public_name"]).bucket_acl.select do |g|
        g.grantee.type == "Group" && g.grantee.uri =~ /AllUsers/
      end
    end
    it { should_not be_empty }
  end

  describe "Bucket ACL: Public grants on a private bucket" do
    subject do
      aws_s3_bucket(bucket_name: fixtures["s3_bucket_private_name"]).bucket_acl.select do |g|
        g.grantee.type == "Group" && g.grantee.uri =~ /AllUsers/
      end
    end
    it { should be_empty }
  end

  describe "Bucket ACL: AuthUser grants on a private bucket" do
    subject do
      aws_s3_bucket(bucket_name: fixtures["s3_bucket_private_name"]).bucket_acl.select do |g|
        g.grantee.type == "Group" && g.grantee.uri =~ /AuthenticatedUsers/
      end
    end
    it { should be_empty }
  end

  describe "Bucket ACL: AuthUser grants on an AuthUser bucket" do
    subject do
      aws_s3_bucket(bucket_name: fixtures["s3_bucket_auth_name"]).bucket_acl.select do |g|
        g.grantee.type == "Group" && g.grantee.uri =~ /AuthenticatedUsers/
      end
    end
    it { should_not be_empty }
  end

  #------------------- bucket_policy -------------------#
  describe "Bucket Policy: Allow GetObject Statement For Everyone on public" do
    subject do
      bucket_policy = aws_s3_bucket(bucket_name: fixtures["s3_bucket_public_name"]).bucket_policy
      allow_all = bucket_policy.select { |s| s.effect == "Allow" && s.principal == "*" }
      allow_all.count
    end
    it { should == 1 }
  end

  describe "Bucket Policy: Allow GetObject Statement For Everyone on private" do
    subject do
      bucket_policy = aws_s3_bucket(bucket_name: fixtures["s3_bucket_private_name"]).bucket_policy
      allow_all = bucket_policy.select { |s| s.effect == "Allow" && s.principal == "*" }
      allow_all.count
    end
    it { should be_zero }
  end

  describe "Bucket Policy: Empty policy on auth" do
    subject do
      aws_s3_bucket(bucket_name: fixtures["s3_bucket_auth_name"]).bucket_policy
    end
    it { should be_empty }
  end
end

control "aws_s3_bucket matchers test" do

  #------------------------  be_public --------------------------#
  describe aws_s3_bucket(bucket_name: fixtures["s3_bucket_public_name"]) do
    it { should be_public }
  end
  describe aws_s3_bucket(bucket_name: fixtures["s3_bucket_auth_name"]) do
    it { should be_public }
  end
  describe aws_s3_bucket(bucket_name: fixtures["s3_bucket_private_name"]) do
    it { should_not be_public }
  end
  describe aws_s3_bucket(bucket_name: fixtures["s3_bucket_private_acl_public_policy_name"]) do
    it { should be_public }
  end

  #-----------------  have_default_encryption_enabled -----------------#
  describe aws_s3_bucket(bucket_name: fixtures["s3_bucket_default_encryption_enabled_name"]) do
    it { should have_default_encryption_enabled }
  end
  describe aws_s3_bucket(bucket_name: fixtures["s3_bucket_default_encryption_not_enabled_name"]) do
    it { should_not have_default_encryption_enabled }
  end

  #-----------------  have_access_logging_enabled -----------------#
  describe aws_s3_bucket(bucket_name: fixtures["s3_bucket_access_logging_enabled_name"]) do
    it { should have_access_logging_enabled }
  end
  describe aws_s3_bucket(bucket_name: fixtures["s3_bucket_access_logging_not_enabled_name"]) do
    it { should_not have_access_logging_enabled }
  end
end
