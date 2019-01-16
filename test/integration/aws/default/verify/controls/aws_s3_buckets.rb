fixtures = {}
%w{
  s3_bucket_public_name
  s3_bucket_private_name
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
    fixture_name,
    default: "default.#{fixture_name}",
    description: "See ../build/s3.tf"
  )
end

control "aws_s3_buckets recall" do

  # You should be able to test if there are any buckets
  describe aws_s3_buckets do
    it { should exist }
  end
end

control "aws_s3_buckets properties" do
  # you should be able to test the cidr_block of a subnet
  describe aws_s3_buckets do
    its("bucket_names") { should include fixtures["s3_bucket_public_name"], fixtures["s3_bucket_private_name"] }
    its("bucket_names") { should_not include "i_dont_exist" }
  end
end
