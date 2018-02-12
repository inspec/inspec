fixtures = {}
[
  's3_bucket_public_for_objects',
  's3_bucket_object_inspec_logo_public',
  's3_bucket_object_inspec_logo_private',
].each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: 'See ../build/s3.tf',
  )
end

control 'aws_s3_bucket_object recall tests' do
  #------------------- Exists -------------------#
  describe aws_s3_bucket_object(bucket_name: fixtures['s3_bucket_public_for_objects'], key: fixtures['s3_bucket_object_inspec_logo_public']) do
    it { should exist }
  end
  
  describe aws_s3_bucket_object(bucket_name: fixtures['s3_bucket_public_for_objects'], key: fixtures['s3_bucket_object_inspec_logo_private']) do
    it { should exist }
  end

  #------------------- Does Not Exist -------------------#
  describe aws_s3_bucket_object(bucket_name: 'inspec-testing-NonExistentBucket.chef.io', key: fixtures['s3_bucket_object_inspec_logo_public']) do
    it { should_not exist }
  end
  
  describe aws_s3_bucket_object(bucket_name: fixtures['s3_bucket_public_for_objects'], key: 'NonExistentBucketObject') do
    it { should_not exist }
  end
end

control 'aws_s3_bucket_object properties tests' do
  #------------------- object_acl -------------------#
  describe "Object Object ACL: Public grants on a public bucket object" do
    subject do
      aws_s3_bucket_object(bucket_name: fixtures['s3_bucket_public_for_objects'], key: fixtures['s3_bucket_object_inspec_logo_public']).object_acl.select do |g|
        g.grantee.type == 'Group' && g.grantee.uri =~ /AllUsers/
      end
    end
    it { should_not be_empty }
  end
  
  describe "Bucket Object ACL: Public grants on a private bucket object" do
    subject do
      aws_s3_bucket_object(bucket_name: fixtures['s3_bucket_public_for_objects'], key: fixtures['s3_bucket_object_inspec_logo_private']).object_acl.select do |g|
        g.grantee.type == 'Group' && g.grantee.uri =~ /AllUsers/
      end
    end
    it { should be_empty }
  end

  describe "Bucket Object ACL: AuthUser grants on a private bucket object" do
    subject do
      aws_s3_bucket_object(bucket_name: fixtures['s3_bucket_public_for_objects'], key: fixtures['s3_bucket_object_inspec_logo_private']).object_acl.select do |g|
        g.grantee.type == 'Group' && g.grantee.uri =~ /AuthenticatedUsers/
      end
    end
    it { should be_empty }
  end
end

control 'aws_s3_bucket_object matchers test' do
  
  #------------------------  be_public --------------------------#  
  describe aws_s3_bucket_object(bucket_name: fixtures['s3_bucket_public_for_objects'], key: fixtures['s3_bucket_object_inspec_logo_public']) do
    it { should be_public }
  end
  describe aws_s3_bucket_object(bucket_name: fixtures['s3_bucket_public_for_objects'], key: fixtures['s3_bucket_object_inspec_logo_private']) do
    it { should_not be_public }
  end
end
